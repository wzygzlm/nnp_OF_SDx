#include "log.h"
#include "caer-sdk/cross/portable_io.h"
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int CAER_LOG_FILE_FD = -1;

static void caerLogShutDownWriteBack(void);
static void caerLogSSHSLogger(const char *msg);
static void caerLogLevelListener(sshsNode node, void *userData, enum sshs_node_attribute_events event,
	const char *changeKey, enum sshs_node_attr_value_type changeType, union sshs_node_attr_value changeValue);

void caerLogInit(void) {
	sshsNode logNode = sshsGetNode(sshsGetGlobal(), "/caer/logger/");

	// Ensure default log file and value are present.
	// The default path is a file named caer.log inside the program's CWD.
	const char *logFileName = "/caer.log";

	char *logFileDir      = getcwd(NULL, 0);
	char *logFileDirClean = portable_realpath(logFileDir);

	char *logFilePath = (char *)malloc(strlen(logFileDirClean) + strlen(logFileName) + 1); // +1 for terminating NUL byte.
	strcpy(logFilePath, logFileDirClean);
	strcat(logFilePath, logFileName);

	sshsNodeCreateString(logNode, "logFile", logFilePath, 2, PATH_MAX, SSHS_FLAGS_NORMAL,
		"Path to the file where all log messages are written to.");

	free(logFilePath);
	free(logFileDirClean);
	free(logFileDir);

	sshsNodeCreateByte(logNode, "logLevel", CAER_LOG_NOTICE, CAER_LOG_EMERGENCY, CAER_LOG_DEBUG, SSHS_FLAGS_NORMAL,
		"Global log-level.");

	// Try to open the specified file and error out if not possible.
	char *logFile    = sshsNodeGetString(logNode, "logFile");
	CAER_LOG_FILE_FD = open(logFile, O_WRONLY | O_APPEND | O_CREAT, S_IWUSR | S_IRUSR | S_IRGRP);

	if (CAER_LOG_FILE_FD < 0) {
		// Must be able to open log file! _REQUIRED_
		caerLog(CAER_LOG_EMERGENCY, "Logger", "Failed to open log file '%s'. Error: %d.", logFile, errno);
		free(logFile);

		exit(EXIT_FAILURE);
	}

	free(logFile);

	// Send log messages to both stderr and the log file.
	caerLogFileDescriptorsSet(STDERR_FILENO, CAER_LOG_FILE_FD);

	// Make sure log file gets flushed at exit time.
	atexit(&caerLogShutDownWriteBack);

	// Set global log level and install listener for its update.
	uint8_t logLevel = (uint8_t) sshsNodeGetByte(logNode, "logLevel");
	caerLogLevelSet((caer_log_level)logLevel);

	sshsNodeAddAttributeListener(logNode, NULL, &caerLogLevelListener);

	// Now that config is initialized (has to be!) and logging too, we can
	// set the SSHS logger to use our internal logger too.
	sshsSetGlobalErrorLogCallback(&caerLogSSHSLogger);

	// Log sub-system initialized fully and correctly, log this.
	caerLog(CAER_LOG_NOTICE, "Logger", "Initialization successful with log-level %" PRIu8 ".", logLevel);
}

static void caerLogShutDownWriteBack(void) {
	caerLog(CAER_LOG_DEBUG, "Logger", "Shutting down ...");

	// Flush interactive outputs.
	fflush(stdout);
	fflush(stderr);

	// Ensure proper flushing and closing of the log file at shutdown.
	portable_fsync(CAER_LOG_FILE_FD);
	close(CAER_LOG_FILE_FD);
}

static void caerLogSSHSLogger(const char *msg) {
	caerLog(CAER_LOG_EMERGENCY, "SSHS", "%s", msg);
	// SSHS will exit automatically on critical errors.
}

static void caerLogLevelListener(sshsNode node, void *userData, enum sshs_node_attribute_events event,
	const char *changeKey, enum sshs_node_attr_value_type changeType, union sshs_node_attr_value changeValue) {
	UNUSED_ARGUMENT(node);
	UNUSED_ARGUMENT(userData);

	if (event == SSHS_ATTRIBUTE_MODIFIED && changeType == SSHS_BYTE && caerStrEquals(changeKey, "logLevel")) {
		// Update the global log level asynchronously.
		caerLogLevelSet((caer_log_level) changeValue.ibyte);
		caerLog(CAER_LOG_DEBUG, "Logger", "Log-level set to %" PRIi8 ".", changeValue.ibyte);
	}
}
