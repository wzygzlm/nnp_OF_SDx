set moduleName resetCurrentSliceHW
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {resetCurrentSliceHW}
set C_modelType { void 0 }
set C_modelArgList {
	{ glPLSlices int 8 regular {array 129600 { 0 0 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "glPLSlices", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ glPLSlices_address0 sc_out sc_lv 17 signal 0 } 
	{ glPLSlices_ce0 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_we0 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_d0 sc_out sc_lv 8 signal 0 } 
	{ glPLSlices_address1 sc_out sc_lv 17 signal 0 } 
	{ glPLSlices_ce1 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_we1 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_d1 sc_out sc_lv 8 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "glPLSlices_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "glPLSlices", "role": "address0" }} , 
 	{ "name": "glPLSlices_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices", "role": "ce0" }} , 
 	{ "name": "glPLSlices_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices", "role": "we0" }} , 
 	{ "name": "glPLSlices_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices", "role": "d0" }} , 
 	{ "name": "glPLSlices_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "glPLSlices", "role": "address1" }} , 
 	{ "name": "glPLSlices_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices", "role": "ce1" }} , 
 	{ "name": "glPLSlices_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices", "role": "we1" }} , 
 	{ "name": "glPLSlices_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "resetCurrentSliceHW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "21602", "EstimateLatencyMax" : "21602",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "glPLSlices", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	resetCurrentSliceHW {
		glPLSlices {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "21602", "Max" : "21602"}
	, {"Name" : "Interval", "Min" : "21602", "Max" : "21602"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	glPLSlices { ap_memory {  { glPLSlices_address0 mem_address 1 17 }  { glPLSlices_ce0 mem_ce 1 1 }  { glPLSlices_we0 mem_we 1 1 }  { glPLSlices_d0 mem_din 1 8 }  { glPLSlices_address1 mem_address 1 17 }  { glPLSlices_ce1 mem_ce 1 1 }  { glPLSlices_we1 mem_we 1 1 }  { glPLSlices_d1 mem_din 1 8 } } }
}
