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
	{ glPLSlices_0 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_1 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_2 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_3 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_4 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_5 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_6 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_7 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_8 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_9 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_10 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_11 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_12 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_13 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_14 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
	{ glPLSlices_15 int 8 regular {array 8100 { 0 0 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "glPLSlices_0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_4", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_5", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_6", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_7", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_8", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_9", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_10", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_11", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_12", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_13", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_14", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_15", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 134
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ glPLSlices_0_address0 sc_out sc_lv 13 signal 0 } 
	{ glPLSlices_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_0_we0 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_0_d0 sc_out sc_lv 8 signal 0 } 
	{ glPLSlices_0_address1 sc_out sc_lv 13 signal 0 } 
	{ glPLSlices_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_0_we1 sc_out sc_logic 1 signal 0 } 
	{ glPLSlices_0_d1 sc_out sc_lv 8 signal 0 } 
	{ glPLSlices_1_address0 sc_out sc_lv 13 signal 1 } 
	{ glPLSlices_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ glPLSlices_1_we0 sc_out sc_logic 1 signal 1 } 
	{ glPLSlices_1_d0 sc_out sc_lv 8 signal 1 } 
	{ glPLSlices_1_address1 sc_out sc_lv 13 signal 1 } 
	{ glPLSlices_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ glPLSlices_1_we1 sc_out sc_logic 1 signal 1 } 
	{ glPLSlices_1_d1 sc_out sc_lv 8 signal 1 } 
	{ glPLSlices_2_address0 sc_out sc_lv 13 signal 2 } 
	{ glPLSlices_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_2_we0 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_2_d0 sc_out sc_lv 8 signal 2 } 
	{ glPLSlices_2_address1 sc_out sc_lv 13 signal 2 } 
	{ glPLSlices_2_ce1 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_2_we1 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_2_d1 sc_out sc_lv 8 signal 2 } 
	{ glPLSlices_3_address0 sc_out sc_lv 13 signal 3 } 
	{ glPLSlices_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_3_we0 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_3_d0 sc_out sc_lv 8 signal 3 } 
	{ glPLSlices_3_address1 sc_out sc_lv 13 signal 3 } 
	{ glPLSlices_3_ce1 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_3_we1 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_3_d1 sc_out sc_lv 8 signal 3 } 
	{ glPLSlices_4_address0 sc_out sc_lv 13 signal 4 } 
	{ glPLSlices_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_4_we0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_4_d0 sc_out sc_lv 8 signal 4 } 
	{ glPLSlices_4_address1 sc_out sc_lv 13 signal 4 } 
	{ glPLSlices_4_ce1 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_4_we1 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_4_d1 sc_out sc_lv 8 signal 4 } 
	{ glPLSlices_5_address0 sc_out sc_lv 13 signal 5 } 
	{ glPLSlices_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ glPLSlices_5_we0 sc_out sc_logic 1 signal 5 } 
	{ glPLSlices_5_d0 sc_out sc_lv 8 signal 5 } 
	{ glPLSlices_5_address1 sc_out sc_lv 13 signal 5 } 
	{ glPLSlices_5_ce1 sc_out sc_logic 1 signal 5 } 
	{ glPLSlices_5_we1 sc_out sc_logic 1 signal 5 } 
	{ glPLSlices_5_d1 sc_out sc_lv 8 signal 5 } 
	{ glPLSlices_6_address0 sc_out sc_lv 13 signal 6 } 
	{ glPLSlices_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ glPLSlices_6_we0 sc_out sc_logic 1 signal 6 } 
	{ glPLSlices_6_d0 sc_out sc_lv 8 signal 6 } 
	{ glPLSlices_6_address1 sc_out sc_lv 13 signal 6 } 
	{ glPLSlices_6_ce1 sc_out sc_logic 1 signal 6 } 
	{ glPLSlices_6_we1 sc_out sc_logic 1 signal 6 } 
	{ glPLSlices_6_d1 sc_out sc_lv 8 signal 6 } 
	{ glPLSlices_7_address0 sc_out sc_lv 13 signal 7 } 
	{ glPLSlices_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ glPLSlices_7_we0 sc_out sc_logic 1 signal 7 } 
	{ glPLSlices_7_d0 sc_out sc_lv 8 signal 7 } 
	{ glPLSlices_7_address1 sc_out sc_lv 13 signal 7 } 
	{ glPLSlices_7_ce1 sc_out sc_logic 1 signal 7 } 
	{ glPLSlices_7_we1 sc_out sc_logic 1 signal 7 } 
	{ glPLSlices_7_d1 sc_out sc_lv 8 signal 7 } 
	{ glPLSlices_8_address0 sc_out sc_lv 13 signal 8 } 
	{ glPLSlices_8_ce0 sc_out sc_logic 1 signal 8 } 
	{ glPLSlices_8_we0 sc_out sc_logic 1 signal 8 } 
	{ glPLSlices_8_d0 sc_out sc_lv 8 signal 8 } 
	{ glPLSlices_8_address1 sc_out sc_lv 13 signal 8 } 
	{ glPLSlices_8_ce1 sc_out sc_logic 1 signal 8 } 
	{ glPLSlices_8_we1 sc_out sc_logic 1 signal 8 } 
	{ glPLSlices_8_d1 sc_out sc_lv 8 signal 8 } 
	{ glPLSlices_9_address0 sc_out sc_lv 13 signal 9 } 
	{ glPLSlices_9_ce0 sc_out sc_logic 1 signal 9 } 
	{ glPLSlices_9_we0 sc_out sc_logic 1 signal 9 } 
	{ glPLSlices_9_d0 sc_out sc_lv 8 signal 9 } 
	{ glPLSlices_9_address1 sc_out sc_lv 13 signal 9 } 
	{ glPLSlices_9_ce1 sc_out sc_logic 1 signal 9 } 
	{ glPLSlices_9_we1 sc_out sc_logic 1 signal 9 } 
	{ glPLSlices_9_d1 sc_out sc_lv 8 signal 9 } 
	{ glPLSlices_10_address0 sc_out sc_lv 13 signal 10 } 
	{ glPLSlices_10_ce0 sc_out sc_logic 1 signal 10 } 
	{ glPLSlices_10_we0 sc_out sc_logic 1 signal 10 } 
	{ glPLSlices_10_d0 sc_out sc_lv 8 signal 10 } 
	{ glPLSlices_10_address1 sc_out sc_lv 13 signal 10 } 
	{ glPLSlices_10_ce1 sc_out sc_logic 1 signal 10 } 
	{ glPLSlices_10_we1 sc_out sc_logic 1 signal 10 } 
	{ glPLSlices_10_d1 sc_out sc_lv 8 signal 10 } 
	{ glPLSlices_11_address0 sc_out sc_lv 13 signal 11 } 
	{ glPLSlices_11_ce0 sc_out sc_logic 1 signal 11 } 
	{ glPLSlices_11_we0 sc_out sc_logic 1 signal 11 } 
	{ glPLSlices_11_d0 sc_out sc_lv 8 signal 11 } 
	{ glPLSlices_11_address1 sc_out sc_lv 13 signal 11 } 
	{ glPLSlices_11_ce1 sc_out sc_logic 1 signal 11 } 
	{ glPLSlices_11_we1 sc_out sc_logic 1 signal 11 } 
	{ glPLSlices_11_d1 sc_out sc_lv 8 signal 11 } 
	{ glPLSlices_12_address0 sc_out sc_lv 13 signal 12 } 
	{ glPLSlices_12_ce0 sc_out sc_logic 1 signal 12 } 
	{ glPLSlices_12_we0 sc_out sc_logic 1 signal 12 } 
	{ glPLSlices_12_d0 sc_out sc_lv 8 signal 12 } 
	{ glPLSlices_12_address1 sc_out sc_lv 13 signal 12 } 
	{ glPLSlices_12_ce1 sc_out sc_logic 1 signal 12 } 
	{ glPLSlices_12_we1 sc_out sc_logic 1 signal 12 } 
	{ glPLSlices_12_d1 sc_out sc_lv 8 signal 12 } 
	{ glPLSlices_13_address0 sc_out sc_lv 13 signal 13 } 
	{ glPLSlices_13_ce0 sc_out sc_logic 1 signal 13 } 
	{ glPLSlices_13_we0 sc_out sc_logic 1 signal 13 } 
	{ glPLSlices_13_d0 sc_out sc_lv 8 signal 13 } 
	{ glPLSlices_13_address1 sc_out sc_lv 13 signal 13 } 
	{ glPLSlices_13_ce1 sc_out sc_logic 1 signal 13 } 
	{ glPLSlices_13_we1 sc_out sc_logic 1 signal 13 } 
	{ glPLSlices_13_d1 sc_out sc_lv 8 signal 13 } 
	{ glPLSlices_14_address0 sc_out sc_lv 13 signal 14 } 
	{ glPLSlices_14_ce0 sc_out sc_logic 1 signal 14 } 
	{ glPLSlices_14_we0 sc_out sc_logic 1 signal 14 } 
	{ glPLSlices_14_d0 sc_out sc_lv 8 signal 14 } 
	{ glPLSlices_14_address1 sc_out sc_lv 13 signal 14 } 
	{ glPLSlices_14_ce1 sc_out sc_logic 1 signal 14 } 
	{ glPLSlices_14_we1 sc_out sc_logic 1 signal 14 } 
	{ glPLSlices_14_d1 sc_out sc_lv 8 signal 14 } 
	{ glPLSlices_15_address0 sc_out sc_lv 13 signal 15 } 
	{ glPLSlices_15_ce0 sc_out sc_logic 1 signal 15 } 
	{ glPLSlices_15_we0 sc_out sc_logic 1 signal 15 } 
	{ glPLSlices_15_d0 sc_out sc_lv 8 signal 15 } 
	{ glPLSlices_15_address1 sc_out sc_lv 13 signal 15 } 
	{ glPLSlices_15_ce1 sc_out sc_logic 1 signal 15 } 
	{ glPLSlices_15_we1 sc_out sc_logic 1 signal 15 } 
	{ glPLSlices_15_d1 sc_out sc_lv 8 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "glPLSlices_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "address0" }} , 
 	{ "name": "glPLSlices_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "ce0" }} , 
 	{ "name": "glPLSlices_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "we0" }} , 
 	{ "name": "glPLSlices_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "d0" }} , 
 	{ "name": "glPLSlices_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "address1" }} , 
 	{ "name": "glPLSlices_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "ce1" }} , 
 	{ "name": "glPLSlices_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "we1" }} , 
 	{ "name": "glPLSlices_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "d1" }} , 
 	{ "name": "glPLSlices_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "address0" }} , 
 	{ "name": "glPLSlices_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "ce0" }} , 
 	{ "name": "glPLSlices_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "we0" }} , 
 	{ "name": "glPLSlices_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "d0" }} , 
 	{ "name": "glPLSlices_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "address1" }} , 
 	{ "name": "glPLSlices_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "ce1" }} , 
 	{ "name": "glPLSlices_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "we1" }} , 
 	{ "name": "glPLSlices_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "d1" }} , 
 	{ "name": "glPLSlices_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "address0" }} , 
 	{ "name": "glPLSlices_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "ce0" }} , 
 	{ "name": "glPLSlices_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "we0" }} , 
 	{ "name": "glPLSlices_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "d0" }} , 
 	{ "name": "glPLSlices_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "address1" }} , 
 	{ "name": "glPLSlices_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "ce1" }} , 
 	{ "name": "glPLSlices_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "we1" }} , 
 	{ "name": "glPLSlices_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "d1" }} , 
 	{ "name": "glPLSlices_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "address0" }} , 
 	{ "name": "glPLSlices_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "ce0" }} , 
 	{ "name": "glPLSlices_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "we0" }} , 
 	{ "name": "glPLSlices_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "d0" }} , 
 	{ "name": "glPLSlices_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "address1" }} , 
 	{ "name": "glPLSlices_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "ce1" }} , 
 	{ "name": "glPLSlices_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "we1" }} , 
 	{ "name": "glPLSlices_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "d1" }} , 
 	{ "name": "glPLSlices_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "address0" }} , 
 	{ "name": "glPLSlices_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "ce0" }} , 
 	{ "name": "glPLSlices_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "we0" }} , 
 	{ "name": "glPLSlices_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "d0" }} , 
 	{ "name": "glPLSlices_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "address1" }} , 
 	{ "name": "glPLSlices_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "ce1" }} , 
 	{ "name": "glPLSlices_4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "we1" }} , 
 	{ "name": "glPLSlices_4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "d1" }} , 
 	{ "name": "glPLSlices_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "address0" }} , 
 	{ "name": "glPLSlices_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "ce0" }} , 
 	{ "name": "glPLSlices_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "we0" }} , 
 	{ "name": "glPLSlices_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "d0" }} , 
 	{ "name": "glPLSlices_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "address1" }} , 
 	{ "name": "glPLSlices_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "ce1" }} , 
 	{ "name": "glPLSlices_5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "we1" }} , 
 	{ "name": "glPLSlices_5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "d1" }} , 
 	{ "name": "glPLSlices_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "address0" }} , 
 	{ "name": "glPLSlices_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "ce0" }} , 
 	{ "name": "glPLSlices_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "we0" }} , 
 	{ "name": "glPLSlices_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "d0" }} , 
 	{ "name": "glPLSlices_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "address1" }} , 
 	{ "name": "glPLSlices_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "ce1" }} , 
 	{ "name": "glPLSlices_6_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "we1" }} , 
 	{ "name": "glPLSlices_6_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "d1" }} , 
 	{ "name": "glPLSlices_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "address0" }} , 
 	{ "name": "glPLSlices_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "ce0" }} , 
 	{ "name": "glPLSlices_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "we0" }} , 
 	{ "name": "glPLSlices_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "d0" }} , 
 	{ "name": "glPLSlices_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "address1" }} , 
 	{ "name": "glPLSlices_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "ce1" }} , 
 	{ "name": "glPLSlices_7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "we1" }} , 
 	{ "name": "glPLSlices_7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "d1" }} , 
 	{ "name": "glPLSlices_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "address0" }} , 
 	{ "name": "glPLSlices_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "ce0" }} , 
 	{ "name": "glPLSlices_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "we0" }} , 
 	{ "name": "glPLSlices_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "d0" }} , 
 	{ "name": "glPLSlices_8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "address1" }} , 
 	{ "name": "glPLSlices_8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "ce1" }} , 
 	{ "name": "glPLSlices_8_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "we1" }} , 
 	{ "name": "glPLSlices_8_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "d1" }} , 
 	{ "name": "glPLSlices_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "address0" }} , 
 	{ "name": "glPLSlices_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "ce0" }} , 
 	{ "name": "glPLSlices_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "we0" }} , 
 	{ "name": "glPLSlices_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "d0" }} , 
 	{ "name": "glPLSlices_9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "address1" }} , 
 	{ "name": "glPLSlices_9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "ce1" }} , 
 	{ "name": "glPLSlices_9_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "we1" }} , 
 	{ "name": "glPLSlices_9_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "d1" }} , 
 	{ "name": "glPLSlices_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "address0" }} , 
 	{ "name": "glPLSlices_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "ce0" }} , 
 	{ "name": "glPLSlices_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "we0" }} , 
 	{ "name": "glPLSlices_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "d0" }} , 
 	{ "name": "glPLSlices_10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "address1" }} , 
 	{ "name": "glPLSlices_10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "ce1" }} , 
 	{ "name": "glPLSlices_10_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "we1" }} , 
 	{ "name": "glPLSlices_10_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "d1" }} , 
 	{ "name": "glPLSlices_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "address0" }} , 
 	{ "name": "glPLSlices_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "ce0" }} , 
 	{ "name": "glPLSlices_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "we0" }} , 
 	{ "name": "glPLSlices_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "d0" }} , 
 	{ "name": "glPLSlices_11_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "address1" }} , 
 	{ "name": "glPLSlices_11_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "ce1" }} , 
 	{ "name": "glPLSlices_11_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "we1" }} , 
 	{ "name": "glPLSlices_11_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "d1" }} , 
 	{ "name": "glPLSlices_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "address0" }} , 
 	{ "name": "glPLSlices_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "ce0" }} , 
 	{ "name": "glPLSlices_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "we0" }} , 
 	{ "name": "glPLSlices_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "d0" }} , 
 	{ "name": "glPLSlices_12_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "address1" }} , 
 	{ "name": "glPLSlices_12_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "ce1" }} , 
 	{ "name": "glPLSlices_12_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "we1" }} , 
 	{ "name": "glPLSlices_12_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "d1" }} , 
 	{ "name": "glPLSlices_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "address0" }} , 
 	{ "name": "glPLSlices_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "ce0" }} , 
 	{ "name": "glPLSlices_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "we0" }} , 
 	{ "name": "glPLSlices_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "d0" }} , 
 	{ "name": "glPLSlices_13_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "address1" }} , 
 	{ "name": "glPLSlices_13_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "ce1" }} , 
 	{ "name": "glPLSlices_13_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "we1" }} , 
 	{ "name": "glPLSlices_13_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "d1" }} , 
 	{ "name": "glPLSlices_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "address0" }} , 
 	{ "name": "glPLSlices_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "ce0" }} , 
 	{ "name": "glPLSlices_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "we0" }} , 
 	{ "name": "glPLSlices_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "d0" }} , 
 	{ "name": "glPLSlices_14_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "address1" }} , 
 	{ "name": "glPLSlices_14_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "ce1" }} , 
 	{ "name": "glPLSlices_14_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "we1" }} , 
 	{ "name": "glPLSlices_14_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "d1" }} , 
 	{ "name": "glPLSlices_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "address0" }} , 
 	{ "name": "glPLSlices_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "ce0" }} , 
 	{ "name": "glPLSlices_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "we0" }} , 
 	{ "name": "glPLSlices_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "d0" }} , 
 	{ "name": "glPLSlices_15_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "address1" }} , 
 	{ "name": "glPLSlices_15_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "ce1" }} , 
 	{ "name": "glPLSlices_15_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "we1" }} , 
 	{ "name": "glPLSlices_15_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "resetCurrentSliceHW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1442", "EstimateLatencyMax" : "1442",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "glPLSlices_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "glPLSlices_15", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	resetCurrentSliceHW {
		glPLSlices_0 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_1 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_2 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_3 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_4 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_5 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_6 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_7 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_8 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_9 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_10 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_11 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_12 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_13 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_14 {Type O LastRead -1 FirstWrite 1}
		glPLSlices_15 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1442", "Max" : "1442"}
	, {"Name" : "Interval", "Min" : "1442", "Max" : "1442"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	glPLSlices_0 { ap_memory {  { glPLSlices_0_address0 mem_address 1 13 }  { glPLSlices_0_ce0 mem_ce 1 1 }  { glPLSlices_0_we0 mem_we 1 1 }  { glPLSlices_0_d0 mem_din 1 8 }  { glPLSlices_0_address1 mem_address 1 13 }  { glPLSlices_0_ce1 mem_ce 1 1 }  { glPLSlices_0_we1 mem_we 1 1 }  { glPLSlices_0_d1 mem_din 1 8 } } }
	glPLSlices_1 { ap_memory {  { glPLSlices_1_address0 mem_address 1 13 }  { glPLSlices_1_ce0 mem_ce 1 1 }  { glPLSlices_1_we0 mem_we 1 1 }  { glPLSlices_1_d0 mem_din 1 8 }  { glPLSlices_1_address1 mem_address 1 13 }  { glPLSlices_1_ce1 mem_ce 1 1 }  { glPLSlices_1_we1 mem_we 1 1 }  { glPLSlices_1_d1 mem_din 1 8 } } }
	glPLSlices_2 { ap_memory {  { glPLSlices_2_address0 mem_address 1 13 }  { glPLSlices_2_ce0 mem_ce 1 1 }  { glPLSlices_2_we0 mem_we 1 1 }  { glPLSlices_2_d0 mem_din 1 8 }  { glPLSlices_2_address1 mem_address 1 13 }  { glPLSlices_2_ce1 mem_ce 1 1 }  { glPLSlices_2_we1 mem_we 1 1 }  { glPLSlices_2_d1 mem_din 1 8 } } }
	glPLSlices_3 { ap_memory {  { glPLSlices_3_address0 mem_address 1 13 }  { glPLSlices_3_ce0 mem_ce 1 1 }  { glPLSlices_3_we0 mem_we 1 1 }  { glPLSlices_3_d0 mem_din 1 8 }  { glPLSlices_3_address1 mem_address 1 13 }  { glPLSlices_3_ce1 mem_ce 1 1 }  { glPLSlices_3_we1 mem_we 1 1 }  { glPLSlices_3_d1 mem_din 1 8 } } }
	glPLSlices_4 { ap_memory {  { glPLSlices_4_address0 mem_address 1 13 }  { glPLSlices_4_ce0 mem_ce 1 1 }  { glPLSlices_4_we0 mem_we 1 1 }  { glPLSlices_4_d0 mem_din 1 8 }  { glPLSlices_4_address1 mem_address 1 13 }  { glPLSlices_4_ce1 mem_ce 1 1 }  { glPLSlices_4_we1 mem_we 1 1 }  { glPLSlices_4_d1 mem_din 1 8 } } }
	glPLSlices_5 { ap_memory {  { glPLSlices_5_address0 mem_address 1 13 }  { glPLSlices_5_ce0 mem_ce 1 1 }  { glPLSlices_5_we0 mem_we 1 1 }  { glPLSlices_5_d0 mem_din 1 8 }  { glPLSlices_5_address1 mem_address 1 13 }  { glPLSlices_5_ce1 mem_ce 1 1 }  { glPLSlices_5_we1 mem_we 1 1 }  { glPLSlices_5_d1 mem_din 1 8 } } }
	glPLSlices_6 { ap_memory {  { glPLSlices_6_address0 mem_address 1 13 }  { glPLSlices_6_ce0 mem_ce 1 1 }  { glPLSlices_6_we0 mem_we 1 1 }  { glPLSlices_6_d0 mem_din 1 8 }  { glPLSlices_6_address1 mem_address 1 13 }  { glPLSlices_6_ce1 mem_ce 1 1 }  { glPLSlices_6_we1 mem_we 1 1 }  { glPLSlices_6_d1 mem_din 1 8 } } }
	glPLSlices_7 { ap_memory {  { glPLSlices_7_address0 mem_address 1 13 }  { glPLSlices_7_ce0 mem_ce 1 1 }  { glPLSlices_7_we0 mem_we 1 1 }  { glPLSlices_7_d0 mem_din 1 8 }  { glPLSlices_7_address1 mem_address 1 13 }  { glPLSlices_7_ce1 mem_ce 1 1 }  { glPLSlices_7_we1 mem_we 1 1 }  { glPLSlices_7_d1 mem_din 1 8 } } }
	glPLSlices_8 { ap_memory {  { glPLSlices_8_address0 mem_address 1 13 }  { glPLSlices_8_ce0 mem_ce 1 1 }  { glPLSlices_8_we0 mem_we 1 1 }  { glPLSlices_8_d0 mem_din 1 8 }  { glPLSlices_8_address1 mem_address 1 13 }  { glPLSlices_8_ce1 mem_ce 1 1 }  { glPLSlices_8_we1 mem_we 1 1 }  { glPLSlices_8_d1 mem_din 1 8 } } }
	glPLSlices_9 { ap_memory {  { glPLSlices_9_address0 mem_address 1 13 }  { glPLSlices_9_ce0 mem_ce 1 1 }  { glPLSlices_9_we0 mem_we 1 1 }  { glPLSlices_9_d0 mem_din 1 8 }  { glPLSlices_9_address1 mem_address 1 13 }  { glPLSlices_9_ce1 mem_ce 1 1 }  { glPLSlices_9_we1 mem_we 1 1 }  { glPLSlices_9_d1 mem_din 1 8 } } }
	glPLSlices_10 { ap_memory {  { glPLSlices_10_address0 mem_address 1 13 }  { glPLSlices_10_ce0 mem_ce 1 1 }  { glPLSlices_10_we0 mem_we 1 1 }  { glPLSlices_10_d0 mem_din 1 8 }  { glPLSlices_10_address1 mem_address 1 13 }  { glPLSlices_10_ce1 mem_ce 1 1 }  { glPLSlices_10_we1 mem_we 1 1 }  { glPLSlices_10_d1 mem_din 1 8 } } }
	glPLSlices_11 { ap_memory {  { glPLSlices_11_address0 mem_address 1 13 }  { glPLSlices_11_ce0 mem_ce 1 1 }  { glPLSlices_11_we0 mem_we 1 1 }  { glPLSlices_11_d0 mem_din 1 8 }  { glPLSlices_11_address1 mem_address 1 13 }  { glPLSlices_11_ce1 mem_ce 1 1 }  { glPLSlices_11_we1 mem_we 1 1 }  { glPLSlices_11_d1 mem_din 1 8 } } }
	glPLSlices_12 { ap_memory {  { glPLSlices_12_address0 mem_address 1 13 }  { glPLSlices_12_ce0 mem_ce 1 1 }  { glPLSlices_12_we0 mem_we 1 1 }  { glPLSlices_12_d0 mem_din 1 8 }  { glPLSlices_12_address1 mem_address 1 13 }  { glPLSlices_12_ce1 mem_ce 1 1 }  { glPLSlices_12_we1 mem_we 1 1 }  { glPLSlices_12_d1 mem_din 1 8 } } }
	glPLSlices_13 { ap_memory {  { glPLSlices_13_address0 mem_address 1 13 }  { glPLSlices_13_ce0 mem_ce 1 1 }  { glPLSlices_13_we0 mem_we 1 1 }  { glPLSlices_13_d0 mem_din 1 8 }  { glPLSlices_13_address1 mem_address 1 13 }  { glPLSlices_13_ce1 mem_ce 1 1 }  { glPLSlices_13_we1 mem_we 1 1 }  { glPLSlices_13_d1 mem_din 1 8 } } }
	glPLSlices_14 { ap_memory {  { glPLSlices_14_address0 mem_address 1 13 }  { glPLSlices_14_ce0 mem_ce 1 1 }  { glPLSlices_14_we0 mem_we 1 1 }  { glPLSlices_14_d0 mem_din 1 8 }  { glPLSlices_14_address1 mem_address 1 13 }  { glPLSlices_14_ce1 mem_ce 1 1 }  { glPLSlices_14_we1 mem_we 1 1 }  { glPLSlices_14_d1 mem_din 1 8 } } }
	glPLSlices_15 { ap_memory {  { glPLSlices_15_address0 mem_address 1 13 }  { glPLSlices_15_ce0 mem_ce 1 1 }  { glPLSlices_15_we0 mem_we 1 1 }  { glPLSlices_15_d0 mem_din 1 8 }  { glPLSlices_15_address1 mem_address 1 13 }  { glPLSlices_15_ce1 mem_ce 1 1 }  { glPLSlices_15_we1 mem_we 1 1 }  { glPLSlices_15_d1 mem_din 1 8 } } }
}
