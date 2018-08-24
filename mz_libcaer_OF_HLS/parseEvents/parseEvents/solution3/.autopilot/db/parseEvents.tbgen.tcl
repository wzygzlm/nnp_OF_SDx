set C_TypeInfoList {{ 
"parseEvents" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"data": [[],{ "pointer": "0"}] }, {"eventsArraySize": [[],"1"] }, {"eventSlice": [[],{ "pointer": "2"}] }],[],""], 
"0": [ "uint32_t", {"typedef": [[[], {"scalar": "unsigned int"}],""]}], 
"1": [ "int32_t", {"typedef": [[[], {"scalar": "int"}],""]}], 
"2": [ "int8_t", {"typedef": [[[], {"scalar": "signed char"}],""]}]
}}
set moduleName parseEvents
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {parseEvents}
set C_modelType { void 0 }
set C_modelArgList {
	{ eventSlice int 8 regular {axi_master 1}  }
	{ data int 32 regular {fifo 0 volatile }  }
	{ eventsArraySize int 32 regular  }
	{ eventSlice_offset int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "eventSlice", "interface" : "axi_master", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "eventSlice","cData": "signed char","bit_use": { "low": 0,"up": 7},"offset": { "type": "dynamic","port_name": "eventSlice_offset"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "data", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "data","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "eventsArraySize", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "eventsArraySize","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "eventSlice_offset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 56
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_eventSlice_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_eventSlice_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_eventSlice_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_eventSlice_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_eventSlice_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_eventSlice_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_eventSlice_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_eventSlice_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_eventSlice_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_eventSlice_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_eventSlice_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_eventSlice_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_eventSlice_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_eventSlice_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_eventSlice_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_eventSlice_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_eventSlice_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_eventSlice_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_eventSlice_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_eventSlice_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_eventSlice_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_eventSlice_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_eventSlice_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_eventSlice_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_BUSER sc_in sc_lv 1 signal 0 } 
	{ data_dout sc_in sc_lv 32 signal 1 } 
	{ data_empty_n sc_in sc_logic 1 signal 1 } 
	{ data_read sc_out sc_logic 1 signal 1 } 
	{ eventsArraySize sc_in sc_lv 32 signal 2 } 
	{ eventSlice_offset sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_eventSlice_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWVALID" }} , 
 	{ "name": "m_axi_eventSlice_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWREADY" }} , 
 	{ "name": "m_axi_eventSlice_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWADDR" }} , 
 	{ "name": "m_axi_eventSlice_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWID" }} , 
 	{ "name": "m_axi_eventSlice_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWLEN" }} , 
 	{ "name": "m_axi_eventSlice_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_eventSlice_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWBURST" }} , 
 	{ "name": "m_axi_eventSlice_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_eventSlice_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_eventSlice_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWPROT" }} , 
 	{ "name": "m_axi_eventSlice_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWQOS" }} , 
 	{ "name": "m_axi_eventSlice_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWREGION" }} , 
 	{ "name": "m_axi_eventSlice_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWUSER" }} , 
 	{ "name": "m_axi_eventSlice_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WVALID" }} , 
 	{ "name": "m_axi_eventSlice_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WREADY" }} , 
 	{ "name": "m_axi_eventSlice_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "WDATA" }} , 
 	{ "name": "m_axi_eventSlice_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "eventSlice", "role": "WSTRB" }} , 
 	{ "name": "m_axi_eventSlice_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WLAST" }} , 
 	{ "name": "m_axi_eventSlice_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WID" }} , 
 	{ "name": "m_axi_eventSlice_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WUSER" }} , 
 	{ "name": "m_axi_eventSlice_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARVALID" }} , 
 	{ "name": "m_axi_eventSlice_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARREADY" }} , 
 	{ "name": "m_axi_eventSlice_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARADDR" }} , 
 	{ "name": "m_axi_eventSlice_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARID" }} , 
 	{ "name": "m_axi_eventSlice_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARLEN" }} , 
 	{ "name": "m_axi_eventSlice_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_eventSlice_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARBURST" }} , 
 	{ "name": "m_axi_eventSlice_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_eventSlice_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_eventSlice_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARPROT" }} , 
 	{ "name": "m_axi_eventSlice_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARQOS" }} , 
 	{ "name": "m_axi_eventSlice_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARREGION" }} , 
 	{ "name": "m_axi_eventSlice_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARUSER" }} , 
 	{ "name": "m_axi_eventSlice_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "RVALID" }} , 
 	{ "name": "m_axi_eventSlice_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "RREADY" }} , 
 	{ "name": "m_axi_eventSlice_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "RDATA" }} , 
 	{ "name": "m_axi_eventSlice_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "RLAST" }} , 
 	{ "name": "m_axi_eventSlice_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "RID" }} , 
 	{ "name": "m_axi_eventSlice_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "RUSER" }} , 
 	{ "name": "m_axi_eventSlice_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "eventSlice", "role": "RRESP" }} , 
 	{ "name": "m_axi_eventSlice_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "BVALID" }} , 
 	{ "name": "m_axi_eventSlice_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "BREADY" }} , 
 	{ "name": "m_axi_eventSlice_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "eventSlice", "role": "BRESP" }} , 
 	{ "name": "m_axi_eventSlice_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "BID" }} , 
 	{ "name": "m_axi_eventSlice_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "BUSER" }} , 
 	{ "name": "data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "dout" }} , 
 	{ "name": "data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "empty_n" }} , 
 	{ "name": "data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "read" }} , 
 	{ "name": "eventsArraySize", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventsArraySize", "role": "default" }} , 
 	{ "name": "eventSlice_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice_offset", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "11", "12", "13", "14"],
		"CDFG" : "parseEvents",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "48633", "EstimateLatencyMax" : "68653",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state27", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_copyToPS_fu_202"},
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_resetCurrentSliceHW_fu_217"}],
		"Port" : [
			{"Name" : "eventSlice", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copyToPS_fu_202", "Port" : "eventSlice"}]},
			{"Name" : "data", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "eventsArraySize", "Type" : "None", "Direction" : "I"},
			{"Name" : "eventSlice_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLSlices_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copyToPS_fu_202", "Port" : "glPLSlices_0"},
					{"ID" : "11", "SubInstance" : "grp_resetCurrentSliceHW_fu_217", "Port" : "glPLSlices_0"}]},
			{"Name" : "glPLSlices_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copyToPS_fu_202", "Port" : "glPLSlices_1"},
					{"ID" : "11", "SubInstance" : "grp_resetCurrentSliceHW_fu_217", "Port" : "glPLSlices_1"}]},
			{"Name" : "glPLSlices_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copyToPS_fu_202", "Port" : "glPLSlices_2"},
					{"ID" : "11", "SubInstance" : "grp_resetCurrentSliceHW_fu_217", "Port" : "glPLSlices_2"}]},
			{"Name" : "glPLSlices_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copyToPS_fu_202", "Port" : "glPLSlices_3"},
					{"ID" : "11", "SubInstance" : "grp_resetCurrentSliceHW_fu_217", "Port" : "glPLSlices_3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlices_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlices_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlices_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlices_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_eventSlice_m_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_copyToPS_fu_202", "Parent" : "0", "Child" : ["7", "8", "9", "10"],
		"CDFG" : "copyToPS",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "43227", "EstimateLatencyMax" : "43227",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "eventSlice", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "eventSlice_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "eventSlice_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "eventSlice_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "eventSlice_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLSlices_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_3", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_copyToPS_fu_202.parseEvents_urem_bkb_U5", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_copyToPS_fu_202.parseEvents_urem_cud_U6", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_copyToPS_fu_202.parseEvents_urem_cud_U7", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_copyToPS_fu_202.parseEvents_mux_4dEe_U8", "Parent" : "6"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_resetCurrentSliceHW_fu_217", "Parent" : "0",
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
			{"Name" : "glPLSlices_3", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_urem_ibs_U18", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_4dEe_U19", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mul_mjbC_U20", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	parseEvents {
		eventSlice {Type O LastRead 23 FirstWrite 22}
		data {Type I LastRead 3 FirstWrite -1}
		eventsArraySize {Type I LastRead 1 FirstWrite -1}
		eventSlice_offset {Type I LastRead 1 FirstWrite -1}
		glPLSlices_0 {Type IO LastRead -1 FirstWrite -1}
		glPLSlices_1 {Type IO LastRead -1 FirstWrite -1}
		glPLSlices_2 {Type IO LastRead -1 FirstWrite -1}
		glPLSlices_3 {Type IO LastRead -1 FirstWrite -1}}
	copyToPS {
		eventSlice {Type O LastRead 23 FirstWrite 22}
		eventSlice_offset {Type I LastRead 0 FirstWrite -1}
		glPLSlices_0 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_1 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_2 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_3 {Type I LastRead 13 FirstWrite -1}}
	resetCurrentSliceHW {
		glPLSlices_0 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_1 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_2 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_3 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "48633", "Max" : "68653"}
	, {"Name" : "Interval", "Min" : "48634", "Max" : "68654"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	eventSlice { m_axi {  { m_axi_eventSlice_AWVALID VALID 1 1 }  { m_axi_eventSlice_AWREADY READY 0 1 }  { m_axi_eventSlice_AWADDR ADDR 1 32 }  { m_axi_eventSlice_AWID ID 1 1 }  { m_axi_eventSlice_AWLEN LEN 1 8 }  { m_axi_eventSlice_AWSIZE SIZE 1 3 }  { m_axi_eventSlice_AWBURST BURST 1 2 }  { m_axi_eventSlice_AWLOCK LOCK 1 2 }  { m_axi_eventSlice_AWCACHE CACHE 1 4 }  { m_axi_eventSlice_AWPROT PROT 1 3 }  { m_axi_eventSlice_AWQOS QOS 1 4 }  { m_axi_eventSlice_AWREGION REGION 1 4 }  { m_axi_eventSlice_AWUSER USER 1 1 }  { m_axi_eventSlice_WVALID VALID 1 1 }  { m_axi_eventSlice_WREADY READY 0 1 }  { m_axi_eventSlice_WDATA DATA 1 32 }  { m_axi_eventSlice_WSTRB STRB 1 4 }  { m_axi_eventSlice_WLAST LAST 1 1 }  { m_axi_eventSlice_WID ID 1 1 }  { m_axi_eventSlice_WUSER USER 1 1 }  { m_axi_eventSlice_ARVALID VALID 1 1 }  { m_axi_eventSlice_ARREADY READY 0 1 }  { m_axi_eventSlice_ARADDR ADDR 1 32 }  { m_axi_eventSlice_ARID ID 1 1 }  { m_axi_eventSlice_ARLEN LEN 1 8 }  { m_axi_eventSlice_ARSIZE SIZE 1 3 }  { m_axi_eventSlice_ARBURST BURST 1 2 }  { m_axi_eventSlice_ARLOCK LOCK 1 2 }  { m_axi_eventSlice_ARCACHE CACHE 1 4 }  { m_axi_eventSlice_ARPROT PROT 1 3 }  { m_axi_eventSlice_ARQOS QOS 1 4 }  { m_axi_eventSlice_ARREGION REGION 1 4 }  { m_axi_eventSlice_ARUSER USER 1 1 }  { m_axi_eventSlice_RVALID VALID 0 1 }  { m_axi_eventSlice_RREADY READY 1 1 }  { m_axi_eventSlice_RDATA DATA 0 32 }  { m_axi_eventSlice_RLAST LAST 0 1 }  { m_axi_eventSlice_RID ID 0 1 }  { m_axi_eventSlice_RUSER USER 0 1 }  { m_axi_eventSlice_RRESP RESP 0 2 }  { m_axi_eventSlice_BVALID VALID 0 1 }  { m_axi_eventSlice_BREADY READY 1 1 }  { m_axi_eventSlice_BRESP RESP 0 2 }  { m_axi_eventSlice_BID ID 0 1 }  { m_axi_eventSlice_BUSER USER 0 1 } } }
	data { ap_fifo {  { data_dout fifo_data 0 32 }  { data_empty_n fifo_status 0 1 }  { data_read fifo_update 1 1 } } }
	eventsArraySize { ap_none {  { eventsArraySize in_data 0 32 } } }
	eventSlice_offset { ap_none {  { eventSlice_offset in_data 0 32 } } }
}

set busDeadlockParameterList { 
	{ eventSlice { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	data { fifo_read 1 no_conditional }
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ eventSlice 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ eventSlice 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
