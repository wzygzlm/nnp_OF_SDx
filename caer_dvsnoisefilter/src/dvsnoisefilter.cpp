#include "caer-sdk/mainloop.h"

#include <libcaer/events/polarity.h>
#include <libcaer/filters/dvs_noise.h>

static void caerDVSNoiseFilterConfigInit(sshsNode moduleNode);
static bool caerDVSNoiseFilterInit(caerModuleData moduleData);
static void caerDVSNoiseFilterRun(
	caerModuleData moduleData, caerEventPacketContainer in, caerEventPacketContainer *out);
static void caerDVSNoiseFilterConfig(caerModuleData moduleData);
static void caerDVSNoiseFilterExit(caerModuleData moduleData);
static void caerDVSNoiseFilterReset(caerModuleData moduleData, int16_t resetCallSourceID);

static void statisticsPassthrough(
	void *userData, const char *key, enum sshs_node_attr_value_type type, union sshs_node_attr_value *value);
static void caerDVSNoiseFilterConfigCustom(sshsNode node, void *userData, enum sshs_node_attribute_events event,
	const char *changeKey, enum sshs_node_attr_value_type changeType, union sshs_node_attr_value changeValue);

static const struct caer_module_functions DVSNoiseFilterFunctions = {
	moduleConfigInit : &caerDVSNoiseFilterConfigInit,
	moduleInit       : &caerDVSNoiseFilterInit,
	moduleRun        : &caerDVSNoiseFilterRun,
	moduleConfig     : &caerDVSNoiseFilterConfig,
	moduleExit       : &caerDVSNoiseFilterExit,
	moduleReset      : &caerDVSNoiseFilterReset,
};

static const struct caer_event_stream_in DVSNoiseFilterInputs[]
	= {{type : POLARITY_EVENT, number : 1, readOnly : false}};

static const struct caer_module_info DVSNoiseFilterInfo = {
	version           : 1,
	name              : "DVSNoiseFilter",
	description       : "Filters out noise from DVS change events.",
	type              : CAER_MODULE_PROCESSOR,
	memSize           : 0,
	functions         : &DVSNoiseFilterFunctions,
	inputStreamsSize  : CAER_EVENT_STREAM_IN_SIZE(DVSNoiseFilterInputs),
	inputStreams      : DVSNoiseFilterInputs,
	outputStreamsSize : 0,
	outputStreams     : NULL,
};

caerModuleInfo caerModuleGetInfo(void) {
	return (&DVSNoiseFilterInfo);
}

static void caerDVSNoiseFilterConfigInit(sshsNode moduleNode) {
	sshsNodeCreateBool(moduleNode, "hotPixelLearn", false, SSHS_FLAGS_NOTIFY_ONLY,
		"Learn the position of current hot (abnormally active) pixels, so they can be filtered out.");
	sshsNodeCreateInt(moduleNode, "hotPixelTime", 1000000, 0, 30000000, SSHS_FLAGS_NORMAL,
		"Time in µs to accumulate events for learning new hot pixels.");
	sshsNodeCreateInt(moduleNode, "hotPixelCount", 10000, 0, 10000000, SSHS_FLAGS_NORMAL,
		"Number of events needed in a learning time period for a pixel to be considered hot.");

	sshsNodeCreateBool(moduleNode, "hotPixelEnable", false, SSHS_FLAGS_NORMAL, "Enable the hot pixel filter.");
	sshsNodeCreateLong(moduleNode, "hotPixelFiltered", 0, 0, INT64_MAX, SSHS_FLAGS_READ_ONLY | SSHS_FLAGS_NO_EXPORT,
		"Number of events filtered out by the hot pixel filter.");
	sshsNodeCreateAttributePollTime(moduleNode, "hotPixelFiltered", SSHS_LONG, 2);

	sshsNodeCreateBool(
		moduleNode, "backgroundActivityEnable", true, SSHS_FLAGS_NORMAL, "Enable the background activity filter.");
	sshsNodeCreateBool(moduleNode, "backgroundActivityTwoLevels", false, SSHS_FLAGS_NORMAL,
		"Use two-level background activity filtering.");
	sshsNodeCreateBool(moduleNode, "backgroundActivityCheckPolarity", false, SSHS_FLAGS_NORMAL,
		"Consider polarity when filtering background activity.");
	sshsNodeCreateByte(moduleNode, "backgroundActivitySupportMin", 1, 1, 8, SSHS_FLAGS_NORMAL,
		"Minimum number of direct neighbor pixels that must support this pixel for it to be valid.");
	sshsNodeCreateByte(moduleNode, "backgroundActivitySupportMax", 8, 1, 8, SSHS_FLAGS_NORMAL,
		"Maximum number of direct neighbor pixels that can support this pixel for it to be valid.");
	sshsNodeCreateInt(moduleNode, "backgroundActivityTime", 2000, 0, 10000000, SSHS_FLAGS_NORMAL,
		"Maximum time difference in µs for events to be considered correlated and not be filtered out.");
	sshsNodeCreateLong(moduleNode, "backgroundActivityFiltered", 0, 0, INT64_MAX,
		SSHS_FLAGS_READ_ONLY | SSHS_FLAGS_NO_EXPORT,
		"Number of events filtered out by the background activity filter.");
	sshsNodeCreateAttributePollTime(moduleNode, "backgroundActivityFiltered", SSHS_LONG, 2);

	sshsNodeCreateBool(
		moduleNode, "refractoryPeriodEnable", true, SSHS_FLAGS_NORMAL, "Enable the refractory period filter.");
	sshsNodeCreateInt(moduleNode, "refractoryPeriodTime", 100, 0, 10000000, SSHS_FLAGS_NORMAL,
		"Minimum time between events to not be filtered out.");
	sshsNodeCreateLong(moduleNode, "refractoryPeriodFiltered", 0, 0, INT64_MAX,
		SSHS_FLAGS_READ_ONLY | SSHS_FLAGS_NO_EXPORT, "Number of events filtered out by the refractory period filter.");
	sshsNodeCreateAttributePollTime(moduleNode, "refractoryPeriodFiltered", SSHS_LONG, 2);
}

static void statisticsPassthrough(
	void *userData, const char *key, enum sshs_node_attr_value_type type, union sshs_node_attr_value *value) {
	UNUSED_ARGUMENT(type); // We know all statistics are always LONG.

	caerFilterDVSNoise state = (caer_filter_dvs_noise *)userData;

	uint64_t statisticValue = 0;

	if (caerStrEquals(key, "hotPixelFiltered")) {
		caerFilterDVSNoiseConfigGet(state, CAER_FILTER_DVS_HOTPIXEL_STATISTICS, &statisticValue);
	}
	else if (caerStrEquals(key, "backgroundActivityFiltered")) {
		caerFilterDVSNoiseConfigGet(state, CAER_FILTER_DVS_BACKGROUND_ACTIVITY_STATISTICS, &statisticValue);
	}
	else if (caerStrEquals(key, "refractoryPeriodFiltered")) {
		caerFilterDVSNoiseConfigGet(state, CAER_FILTER_DVS_REFRACTORY_PERIOD_STATISTICS, &statisticValue);
	}

	value->ilong = I64T(statisticValue);
}

static bool caerDVSNoiseFilterInit(caerModuleData moduleData) {
	// Wait for input to be ready. All inputs, once they are up and running, will
	// have a valid sourceInfo node to query, especially if dealing with data.
	// Allocate map using info from sourceInfo.
	sshsNode sourceInfo = caerMainloopModuleGetSourceInfoForInput(moduleData->moduleID, 0);
	if (sourceInfo == NULL) {
		return (false);
	}

	int16_t sizeX = sshsNodeGetShort(sourceInfo, "polaritySizeX");
	int16_t sizeY = sshsNodeGetShort(sourceInfo, "polaritySizeY");

	moduleData->moduleState = caerFilterDVSNoiseInitialize(U16T(sizeX), U16T(sizeY));
	if (moduleData->moduleState == NULL) {
		caerModuleLog(moduleData, CAER_LOG_ERROR, "Failed to initialize DVS Noise filter.");
		return (false);
	}

	caerDVSNoiseFilterConfig(moduleData);

	caerFilterDVSNoiseConfigSet(
		(caerFilterDVSNoise)moduleData->moduleState, CAER_FILTER_DVS_LOG_LEVEL, atomic_load(&moduleData->moduleLogLevel));

	// Add read passthrough modifiers, they need access to moduleState.
	sshsNodeAddAttributeReadModifier(
		moduleData->moduleNode, "hotPixelFiltered", SSHS_LONG, moduleData->moduleState, &statisticsPassthrough);
	sshsNodeAddAttributeReadModifier(moduleData->moduleNode, "backgroundActivityFiltered", SSHS_LONG,
		moduleData->moduleState, &statisticsPassthrough);
	sshsNodeAddAttributeReadModifier(
		moduleData->moduleNode, "refractoryPeriodFiltered", SSHS_LONG, moduleData->moduleState, &statisticsPassthrough);

	// Add config listeners last, to avoid having them dangling if Init doesn't succeed.
	sshsNodeAddAttributeListener(moduleData->moduleNode, moduleData, &caerModuleConfigDefaultListener);
	sshsNodeAddAttributeListener(moduleData->moduleNode, moduleData->moduleState, &caerDVSNoiseFilterConfigCustom);

	// Nothing that can fail here.
	return (true);
}

static void caerDVSNoiseFilterRun(
	caerModuleData moduleData, caerEventPacketContainer in, caerEventPacketContainer *out) {
	UNUSED_ARGUMENT(out);

	caerPolarityEventPacket polarity
		= (caerPolarityEventPacket) caerEventPacketContainerFindEventPacketByType(in, POLARITY_EVENT);

	caerFilterDVSNoiseApply((caerFilterDVSNoise)moduleData->moduleState, polarity);
}

static void caerDVSNoiseFilterConfig(caerModuleData moduleData) {
	caerFilterDVSNoise state = (caerFilterDVSNoise)moduleData->moduleState;

	caerFilterDVSNoiseConfigSet(
		state, CAER_FILTER_DVS_HOTPIXEL_TIME, U32T(sshsNodeGetInt(moduleData->moduleNode, "hotPixelTime")));
	caerFilterDVSNoiseConfigSet(
		state, CAER_FILTER_DVS_HOTPIXEL_COUNT, U32T(sshsNodeGetInt(moduleData->moduleNode, "hotPixelCount")));

	caerFilterDVSNoiseConfigSet(
		state, CAER_FILTER_DVS_HOTPIXEL_ENABLE, sshsNodeGetBool(moduleData->moduleNode, "hotPixelEnable"));

	caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_BACKGROUND_ACTIVITY_ENABLE,
		sshsNodeGetBool(moduleData->moduleNode, "backgroundActivityEnable"));
	caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_BACKGROUND_ACTIVITY_TWO_LEVELS,
		sshsNodeGetBool(moduleData->moduleNode, "backgroundActivityTwoLevels"));
	caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_BACKGROUND_ACTIVITY_CHECK_POLARITY,
		sshsNodeGetBool(moduleData->moduleNode, "backgroundActivityCheckPolarity"));
	caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_BACKGROUND_ACTIVITY_SUPPORT_MIN,
		U8T(sshsNodeGetByte(moduleData->moduleNode, "backgroundActivitySupportMin")));
	caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_BACKGROUND_ACTIVITY_SUPPORT_MAX,
		U8T(sshsNodeGetByte(moduleData->moduleNode, "backgroundActivitySupportMax")));
	caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_BACKGROUND_ACTIVITY_TIME,
		U32T(sshsNodeGetInt(moduleData->moduleNode, "backgroundActivityTime")));

	caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_REFRACTORY_PERIOD_ENABLE,
		sshsNodeGetBool(moduleData->moduleNode, "refractoryPeriodEnable"));
	caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_REFRACTORY_PERIOD_TIME,
		U32T(sshsNodeGetInt(moduleData->moduleNode, "refractoryPeriodTime")));

	caerFilterDVSNoiseConfigSet(
		state, CAER_FILTER_DVS_LOG_LEVEL, U8T(sshsNodeGetByte(moduleData->moduleNode, "logLevel")));
}

static void caerDVSNoiseFilterConfigCustom(sshsNode node, void *userData, enum sshs_node_attribute_events event,
	const char *changeKey, enum sshs_node_attr_value_type changeType, union sshs_node_attr_value changeValue) {
	UNUSED_ARGUMENT(node);
	UNUSED_ARGUMENT(changeValue);

	caerFilterDVSNoise state = (caerFilterDVSNoise)userData;

	if (event == SSHS_ATTRIBUTE_MODIFIED && changeType == SSHS_BOOL && caerStrEquals(changeKey, "hotPixelLearn")
		&& changeValue.boolean) {
		// Button-like, NOTIFY_ONLY SSHS configuration parameters need special
		// handling as only the change is delivered, so we have to listen for
		// it directly. The usual Config mechanism doesn't work, as Get()
		// would always return false.
		caerFilterDVSNoiseConfigSet(state, CAER_FILTER_DVS_HOTPIXEL_LEARN, true);
	}
}

static void caerDVSNoiseFilterExit(caerModuleData moduleData) {
	// Remove listener, which can reference invalid memory in userData.
	sshsNodeRemoveAttributeListener(moduleData->moduleNode, moduleData, &caerModuleConfigDefaultListener);
	sshsNodeRemoveAttributeListener(moduleData->moduleNode, moduleData->moduleState, &caerDVSNoiseFilterConfigCustom);

	sshsNodeRemoveAllAttributeReadModifiers(moduleData->moduleNode);

	caerFilterDVSNoiseDestroy((caerFilterDVSNoise)moduleData->moduleState);
}

static void caerDVSNoiseFilterReset(caerModuleData moduleData, int16_t resetCallSourceID) {
	UNUSED_ARGUMENT(resetCallSourceID);

	caerFilterDVSNoiseConfigSet((caerFilterDVSNoise)moduleData->moduleState, CAER_FILTER_DVS_RESET, true);
}
