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
	{ glPLSlices_0 int 8 regular {array 32400 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_1 int 8 regular {array 32400 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_2 int 8 regular {array 32400 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_3 int 8 regular {array 32400 { 0 0 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "glPLSlices_0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ glPLSlices_0_address0 sc_out sc_lv 15 signal 0 } 
	{ glPLSlices_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_0_we0 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_0_d0 sc_out sc_lv 8 signal 0 } 
	{ glPLSlices_0_address1 sc_out sc_lv 15 signal 0 } 
	{ glPLSlices_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_0_we1 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_0_d1 sc_out sc_lv 8 signal 0 } 
	{ glPLSlices_1_address0 sc_out sc_lv 15 signal 1 } 
	{ glPLSlices_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ glPLSlices_1_we0 sc_out sc_logic 1 signal 1 } 
	{ glPLSlices_1_d0 sc_out sc_lv 8 signal 1 } 
	{ glPLSlices_1_address1 sc_out sc_lv 15 signal 1 } 
	{ glPLSlices_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ glPLSlices_1_we1 sc_out sc_logic 1 signal 1 } 
	{ glPLSlices_1_d1 sc_out sc_lv 8 signal 1 } 
	{ glPLSlices_2_address0 sc_out sc_lv 15 signal 2 } 
	{ glPLSlices_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_2_we0 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_2_d0 sc_out sc_lv 8 signal 2 } 
	{ glPLSlices_2_address1 sc_out sc_lv 15 signal 2 } 
	{ glPLSlices_2_ce1 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_2_we1 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_2_d1 sc_out sc_lv 8 signal 2 } 
	{ glPLSlices_3_address0 sc_out sc_lv 15 signal 3 } 
	{ glPLSlices_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_3_we0 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_3_d0 sc_out sc_lv 8 signal 3 } 
	{ glPLSlices_3_address1 sc_out sc_lv 15 signal 3 } 
	{ glPLSlices_3_ce1 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_3_we1 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_3_d1 sc_out sc_lv 8 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "glPLSlices_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "address0" }} , 
 	{ "name": "glPLSlices_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "ce0" }} , 
 	{ "name": "glPLSlices_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "we0" }} , 
 	{ "name": "glPLSlices_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "d0" }} , 
 	{ "name": "glPLSlices_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "address1" }} , 
 	{ "name": "glPLSlices_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "ce1" }} , 
 	{ "name": "glPLSlices_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "we1" }} , 
 	{ "name": "glPLSlices_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "d1" }} , 
 	{ "name": "glPLSlices_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "address0" }} , 
 	{ "name": "glPLSlices_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "ce0" }} , 
 	{ "name": "glPLSlices_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "we0" }} , 
 	{ "name": "glPLSlices_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "d0" }} , 
 	{ "name": "glPLSlices_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "address1" }} , 
 	{ "name": "glPLSlices_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "ce1" }} , 
 	{ "name": "glPLSlices_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "we1" }} , 
 	{ "name": "glPLSlices_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "d1" }} , 
 	{ "name": "glPLSlices_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "address0" }} , 
 	{ "name": "glPLSlices_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "ce0" }} , 
 	{ "name": "glPLSlices_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "we0" }} , 
 	{ "name": "glPLSlices_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "d0" }} , 
 	{ "name": "glPLSlices_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "address1" }} , 
 	{ "name": "glPLSlices_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "ce1" }} , 
 	{ "name": "glPLSlices_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "we1" }} , 
 	{ "name": "glPLSlices_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "d1" }} , 
 	{ "name": "glPLSlices_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "address0" }} , 
 	{ "name": "glPLSlices_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "ce0" }} , 
 	{ "name": "glPLSlices_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "we0" }} , 
 	{ "name": "glPLSlices_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "d0" }} , 
 	{ "name": "glPLSlices_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "address1" }} , 
 	{ "name": "glPLSlices_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "ce1" }} , 
 	{ "name": "glPLSlices_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "we1" }} , 
 	{ "name": "glPLSlices_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "resetCurrentSliceHW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5402", "EstimateLatencyMax" : "5402",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "glPLSlices_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_3", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	resetCurrentSliceHW {
		glPLSlices_0 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_1 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_2 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_3 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5402", "Max" : "5402"}
	, {"Name" : "Interval", "Min" : "5402", "Max" : "5402"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	glPLSlices_0 { ap_memory {  { glPLSlices_0_address0 mem_address 1 15 }  { glPLSlices_0_ce0 mem_ce 1 1 }  { glPLSlices_0_we0 mem_we 1 1 }  { glPLSlices_0_d0 mem_din 1 8 }  { glPLSlices_0_address1 mem_address 1 15 }  { glPLSlices_0_ce1 mem_ce 1 1 }  { glPLSlices_0_we1 mem_we 1 1 }  { glPLSlices_0_d1 mem_din 1 8 } } }
	glPLSlices_1 { ap_memory {  { glPLSlices_1_address0 mem_address 1 15 }  { glPLSlices_1_ce0 mem_ce 1 1 }  { glPLSlices_1_we0 mem_we 1 1 }  { glPLSlices_1_d0 mem_din 1 8 }  { glPLSlices_1_address1 mem_address 1 15 }  { glPLSlices_1_ce1 mem_ce 1 1 }  { glPLSlices_1_we1 mem_we 1 1 }  { glPLSlices_1_d1 mem_din 1 8 } } }
	glPLSlices_2 { ap_memory {  { glPLSlices_2_address0 mem_address 1 15 }  { glPLSlices_2_ce0 mem_ce 1 1 }  { glPLSlices_2_we0 mem_we 1 1 }  { glPLSlices_2_d0 mem_din 1 8 }  { glPLSlices_2_address1 mem_address 1 15 }  { glPLSlices_2_ce1 mem_ce 1 1 }  { glPLSlices_2_we1 mem_we 1 1 }  { glPLSlices_2_d1 mem_din 1 8 } } }
	glPLSlices_3 { ap_memory {  { glPLSlices_3_address0 mem_address 1 15 }  { glPLSlices_3_ce0 mem_ce 1 1 }  { glPLSlices_3_we0 mem_we 1 1 }  { glPLSlices_3_d0 mem_din 1 8 }  { glPLSlices_3_address1 mem_address 1 15 }  { glPLSlices_3_ce1 mem_ce 1 1 }  { glPLSlices_3_we1 mem_we 1 1 }  { glPLSlices_3_d1 mem_din 1 8 } } }
}
