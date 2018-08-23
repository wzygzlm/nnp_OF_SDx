set moduleName accumulateHW
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {accumulateHW}
set C_modelType { void 0 }
set C_modelArgList {
	{ x int 16 regular  }
	{ y int 16 regular  }
	{ pol uint 1 regular  }
	{ glPLSlices_0 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_1 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_2 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_3 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_4 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_5 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_6 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_7 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_8 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_9 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_10 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_11 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_12 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_13 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_14 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlices_15 int 8 regular {array 8100 { 2 3 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "pol", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "glPLSlices_0", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_2", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_3", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_4", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_5", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_6", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_7", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_8", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_9", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_10", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_11", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_12", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_13", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_14", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlices_15", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 90
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ x sc_in sc_lv 16 signal 0 } 
	{ y sc_in sc_lv 16 signal 1 } 
	{ pol sc_in sc_logic 1 signal 2 } 
	{ glPLSlices_0_address0 sc_out sc_lv 13 signal 3 } 
	{ glPLSlices_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_0_we0 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_0_d0 sc_out sc_lv 8 signal 3 } 
	{ glPLSlices_0_q0 sc_in sc_lv 8 signal 3 } 
	{ glPLSlices_1_address0 sc_out sc_lv 13 signal 4 } 
	{ glPLSlices_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_1_we0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_1_d0 sc_out sc_lv 8 signal 4 } 
	{ glPLSlices_1_q0 sc_in sc_lv 8 signal 4 } 
	{ glPLSlices_2_address0 sc_out sc_lv 13 signal 5 } 
	{ glPLSlices_2_ce0 sc_out sc_logic 1 signal 5 } 
	{ glPLSlices_2_we0 sc_out sc_logic 1 signal 5 } 
	{ glPLSlices_2_d0 sc_out sc_lv 8 signal 5 } 
	{ glPLSlices_2_q0 sc_in sc_lv 8 signal 5 } 
	{ glPLSlices_3_address0 sc_out sc_lv 13 signal 6 } 
	{ glPLSlices_3_ce0 sc_out sc_logic 1 signal 6 } 
	{ glPLSlices_3_we0 sc_out sc_logic 1 signal 6 } 
	{ glPLSlices_3_d0 sc_out sc_lv 8 signal 6 } 
	{ glPLSlices_3_q0 sc_in sc_lv 8 signal 6 } 
	{ glPLSlices_4_address0 sc_out sc_lv 13 signal 7 } 
	{ glPLSlices_4_ce0 sc_out sc_logic 1 signal 7 } 
	{ glPLSlices_4_we0 sc_out sc_logic 1 signal 7 } 
	{ glPLSlices_4_d0 sc_out sc_lv 8 signal 7 } 
	{ glPLSlices_4_q0 sc_in sc_lv 8 signal 7 } 
	{ glPLSlices_5_address0 sc_out sc_lv 13 signal 8 } 
	{ glPLSlices_5_ce0 sc_out sc_logic 1 signal 8 } 
	{ glPLSlices_5_we0 sc_out sc_logic 1 signal 8 } 
	{ glPLSlices_5_d0 sc_out sc_lv 8 signal 8 } 
	{ glPLSlices_5_q0 sc_in sc_lv 8 signal 8 } 
	{ glPLSlices_6_address0 sc_out sc_lv 13 signal 9 } 
	{ glPLSlices_6_ce0 sc_out sc_logic 1 signal 9 } 
	{ glPLSlices_6_we0 sc_out sc_logic 1 signal 9 } 
	{ glPLSlices_6_d0 sc_out sc_lv 8 signal 9 } 
	{ glPLSlices_6_q0 sc_in sc_lv 8 signal 9 } 
	{ glPLSlices_7_address0 sc_out sc_lv 13 signal 10 } 
	{ glPLSlices_7_ce0 sc_out sc_logic 1 signal 10 } 
	{ glPLSlices_7_we0 sc_out sc_logic 1 signal 10 } 
	{ glPLSlices_7_d0 sc_out sc_lv 8 signal 10 } 
	{ glPLSlices_7_q0 sc_in sc_lv 8 signal 10 } 
	{ glPLSlices_8_address0 sc_out sc_lv 13 signal 11 } 
	{ glPLSlices_8_ce0 sc_out sc_logic 1 signal 11 } 
	{ glPLSlices_8_we0 sc_out sc_logic 1 signal 11 } 
	{ glPLSlices_8_d0 sc_out sc_lv 8 signal 11 } 
	{ glPLSlices_8_q0 sc_in sc_lv 8 signal 11 } 
	{ glPLSlices_9_address0 sc_out sc_lv 13 signal 12 } 
	{ glPLSlices_9_ce0 sc_out sc_logic 1 signal 12 } 
	{ glPLSlices_9_we0 sc_out sc_logic 1 signal 12 } 
	{ glPLSlices_9_d0 sc_out sc_lv 8 signal 12 } 
	{ glPLSlices_9_q0 sc_in sc_lv 8 signal 12 } 
	{ glPLSlices_10_address0 sc_out sc_lv 13 signal 13 } 
	{ glPLSlices_10_ce0 sc_out sc_logic 1 signal 13 } 
	{ glPLSlices_10_we0 sc_out sc_logic 1 signal 13 } 
	{ glPLSlices_10_d0 sc_out sc_lv 8 signal 13 } 
	{ glPLSlices_10_q0 sc_in sc_lv 8 signal 13 } 
	{ glPLSlices_11_address0 sc_out sc_lv 13 signal 14 } 
	{ glPLSlices_11_ce0 sc_out sc_logic 1 signal 14 } 
	{ glPLSlices_11_we0 sc_out sc_logic 1 signal 14 } 
	{ glPLSlices_11_d0 sc_out sc_lv 8 signal 14 } 
	{ glPLSlices_11_q0 sc_in sc_lv 8 signal 14 } 
	{ glPLSlices_12_address0 sc_out sc_lv 13 signal 15 } 
	{ glPLSlices_12_ce0 sc_out sc_logic 1 signal 15 } 
	{ glPLSlices_12_we0 sc_out sc_logic 1 signal 15 } 
	{ glPLSlices_12_d0 sc_out sc_lv 8 signal 15 } 
	{ glPLSlices_12_q0 sc_in sc_lv 8 signal 15 } 
	{ glPLSlices_13_address0 sc_out sc_lv 13 signal 16 } 
	{ glPLSlices_13_ce0 sc_out sc_logic 1 signal 16 } 
	{ glPLSlices_13_we0 sc_out sc_logic 1 signal 16 } 
	{ glPLSlices_13_d0 sc_out sc_lv 8 signal 16 } 
	{ glPLSlices_13_q0 sc_in sc_lv 8 signal 16 } 
	{ glPLSlices_14_address0 sc_out sc_lv 13 signal 17 } 
	{ glPLSlices_14_ce0 sc_out sc_logic 1 signal 17 } 
	{ glPLSlices_14_we0 sc_out sc_logic 1 signal 17 } 
	{ glPLSlices_14_d0 sc_out sc_lv 8 signal 17 } 
	{ glPLSlices_14_q0 sc_in sc_lv 8 signal 17 } 
	{ glPLSlices_15_address0 sc_out sc_lv 13 signal 18 } 
	{ glPLSlices_15_ce0 sc_out sc_logic 1 signal 18 } 
	{ glPLSlices_15_we0 sc_out sc_logic 1 signal 18 } 
	{ glPLSlices_15_d0 sc_out sc_lv 8 signal 18 } 
	{ glPLSlices_15_q0 sc_in sc_lv 8 signal 18 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "x", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x", "role": "default" }} , 
 	{ "name": "y", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "pol", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pol", "role": "default" }} , 
 	{ "name": "glPLSlices_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "address0" }} , 
 	{ "name": "glPLSlices_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "ce0" }} , 
 	{ "name": "glPLSlices_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "we0" }} , 
 	{ "name": "glPLSlices_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "d0" }} , 
 	{ "name": "glPLSlices_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "q0" }} , 
 	{ "name": "glPLSlices_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "address0" }} , 
 	{ "name": "glPLSlices_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "ce0" }} , 
 	{ "name": "glPLSlices_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "we0" }} , 
 	{ "name": "glPLSlices_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "d0" }} , 
 	{ "name": "glPLSlices_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "q0" }} , 
 	{ "name": "glPLSlices_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "address0" }} , 
 	{ "name": "glPLSlices_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "ce0" }} , 
 	{ "name": "glPLSlices_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "we0" }} , 
 	{ "name": "glPLSlices_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "d0" }} , 
 	{ "name": "glPLSlices_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "q0" }} , 
 	{ "name": "glPLSlices_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "address0" }} , 
 	{ "name": "glPLSlices_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "ce0" }} , 
 	{ "name": "glPLSlices_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "we0" }} , 
 	{ "name": "glPLSlices_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "d0" }} , 
 	{ "name": "glPLSlices_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "q0" }} , 
 	{ "name": "glPLSlices_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "address0" }} , 
 	{ "name": "glPLSlices_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "ce0" }} , 
 	{ "name": "glPLSlices_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "we0" }} , 
 	{ "name": "glPLSlices_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "d0" }} , 
 	{ "name": "glPLSlices_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "q0" }} , 
 	{ "name": "glPLSlices_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "address0" }} , 
 	{ "name": "glPLSlices_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "ce0" }} , 
 	{ "name": "glPLSlices_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "we0" }} , 
 	{ "name": "glPLSlices_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "d0" }} , 
 	{ "name": "glPLSlices_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "q0" }} , 
 	{ "name": "glPLSlices_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "address0" }} , 
 	{ "name": "glPLSlices_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "ce0" }} , 
 	{ "name": "glPLSlices_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "we0" }} , 
 	{ "name": "glPLSlices_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "d0" }} , 
 	{ "name": "glPLSlices_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "q0" }} , 
 	{ "name": "glPLSlices_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "address0" }} , 
 	{ "name": "glPLSlices_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "ce0" }} , 
 	{ "name": "glPLSlices_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "we0" }} , 
 	{ "name": "glPLSlices_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "d0" }} , 
 	{ "name": "glPLSlices_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "q0" }} , 
 	{ "name": "glPLSlices_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "address0" }} , 
 	{ "name": "glPLSlices_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "ce0" }} , 
 	{ "name": "glPLSlices_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "we0" }} , 
 	{ "name": "glPLSlices_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "d0" }} , 
 	{ "name": "glPLSlices_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "q0" }} , 
 	{ "name": "glPLSlices_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "address0" }} , 
 	{ "name": "glPLSlices_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "ce0" }} , 
 	{ "name": "glPLSlices_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "we0" }} , 
 	{ "name": "glPLSlices_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "d0" }} , 
 	{ "name": "glPLSlices_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "q0" }} , 
 	{ "name": "glPLSlices_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "address0" }} , 
 	{ "name": "glPLSlices_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "ce0" }} , 
 	{ "name": "glPLSlices_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "we0" }} , 
 	{ "name": "glPLSlices_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "d0" }} , 
 	{ "name": "glPLSlices_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "q0" }} , 
 	{ "name": "glPLSlices_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "address0" }} , 
 	{ "name": "glPLSlices_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "ce0" }} , 
 	{ "name": "glPLSlices_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "we0" }} , 
 	{ "name": "glPLSlices_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "d0" }} , 
 	{ "name": "glPLSlices_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "q0" }} , 
 	{ "name": "glPLSlices_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "address0" }} , 
 	{ "name": "glPLSlices_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "ce0" }} , 
 	{ "name": "glPLSlices_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "we0" }} , 
 	{ "name": "glPLSlices_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "d0" }} , 
 	{ "name": "glPLSlices_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "q0" }} , 
 	{ "name": "glPLSlices_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "address0" }} , 
 	{ "name": "glPLSlices_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "ce0" }} , 
 	{ "name": "glPLSlices_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "we0" }} , 
 	{ "name": "glPLSlices_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "d0" }} , 
 	{ "name": "glPLSlices_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "q0" }} , 
 	{ "name": "glPLSlices_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "address0" }} , 
 	{ "name": "glPLSlices_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "ce0" }} , 
 	{ "name": "glPLSlices_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "we0" }} , 
 	{ "name": "glPLSlices_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "d0" }} , 
 	{ "name": "glPLSlices_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "q0" }} , 
 	{ "name": "glPLSlices_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "address0" }} , 
 	{ "name": "glPLSlices_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "ce0" }} , 
 	{ "name": "glPLSlices_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "we0" }} , 
 	{ "name": "glPLSlices_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "d0" }} , 
 	{ "name": "glPLSlices_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "accumulateHW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "2",
		"VariableLatency" : "0", "ExactLatency" : "20", "EstimateLatencyMin" : "20", "EstimateLatencyMax" : "20",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "y", "Type" : "None", "Direction" : "I"},
			{"Name" : "pol", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLSlices_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlices_15", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_urem_bkb_U17", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_1cud_U18", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mul_mdEe_U19", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	accumulateHW {
		x {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 1 FirstWrite -1}
		pol {Type I LastRead 0 FirstWrite -1}
		glPLSlices_0 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_1 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_2 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_3 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_4 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_5 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_6 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_7 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_8 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_9 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_10 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_11 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_12 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_13 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_14 {Type IO LastRead 19 FirstWrite 20}
		glPLSlices_15 {Type IO LastRead 19 FirstWrite 20}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20", "Max" : "20"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	x { ap_none {  { x in_data 0 16 } } }
	y { ap_none {  { y in_data 0 16 } } }
	pol { ap_none {  { pol in_data 0 1 } } }
	glPLSlices_0 { ap_memory {  { glPLSlices_0_address0 mem_address 1 13 }  { glPLSlices_0_ce0 mem_ce 1 1 }  { glPLSlices_0_we0 mem_we 1 1 }  { glPLSlices_0_d0 mem_din 1 8 }  { glPLSlices_0_q0 mem_dout 0 8 } } }
	glPLSlices_1 { ap_memory {  { glPLSlices_1_address0 mem_address 1 13 }  { glPLSlices_1_ce0 mem_ce 1 1 }  { glPLSlices_1_we0 mem_we 1 1 }  { glPLSlices_1_d0 mem_din 1 8 }  { glPLSlices_1_q0 mem_dout 0 8 } } }
	glPLSlices_2 { ap_memory {  { glPLSlices_2_address0 mem_address 1 13 }  { glPLSlices_2_ce0 mem_ce 1 1 }  { glPLSlices_2_we0 mem_we 1 1 }  { glPLSlices_2_d0 mem_din 1 8 }  { glPLSlices_2_q0 mem_dout 0 8 } } }
	glPLSlices_3 { ap_memory {  { glPLSlices_3_address0 mem_address 1 13 }  { glPLSlices_3_ce0 mem_ce 1 1 }  { glPLSlices_3_we0 mem_we 1 1 }  { glPLSlices_3_d0 mem_din 1 8 }  { glPLSlices_3_q0 mem_dout 0 8 } } }
	glPLSlices_4 { ap_memory {  { glPLSlices_4_address0 mem_address 1 13 }  { glPLSlices_4_ce0 mem_ce 1 1 }  { glPLSlices_4_we0 mem_we 1 1 }  { glPLSlices_4_d0 mem_din 1 8 }  { glPLSlices_4_q0 mem_dout 0 8 } } }
	glPLSlices_5 { ap_memory {  { glPLSlices_5_address0 mem_address 1 13 }  { glPLSlices_5_ce0 mem_ce 1 1 }  { glPLSlices_5_we0 mem_we 1 1 }  { glPLSlices_5_d0 mem_din 1 8 }  { glPLSlices_5_q0 mem_dout 0 8 } } }
	glPLSlices_6 { ap_memory {  { glPLSlices_6_address0 mem_address 1 13 }  { glPLSlices_6_ce0 mem_ce 1 1 }  { glPLSlices_6_we0 mem_we 1 1 }  { glPLSlices_6_d0 mem_din 1 8 }  { glPLSlices_6_q0 mem_dout 0 8 } } }
	glPLSlices_7 { ap_memory {  { glPLSlices_7_address0 mem_address 1 13 }  { glPLSlices_7_ce0 mem_ce 1 1 }  { glPLSlices_7_we0 mem_we 1 1 }  { glPLSlices_7_d0 mem_din 1 8 }  { glPLSlices_7_q0 mem_dout 0 8 } } }
	glPLSlices_8 { ap_memory {  { glPLSlices_8_address0 mem_address 1 13 }  { glPLSlices_8_ce0 mem_ce 1 1 }  { glPLSlices_8_we0 mem_we 1 1 }  { glPLSlices_8_d0 mem_din 1 8 }  { glPLSlices_8_q0 mem_dout 0 8 } } }
	glPLSlices_9 { ap_memory {  { glPLSlices_9_address0 mem_address 1 13 }  { glPLSlices_9_ce0 mem_ce 1 1 }  { glPLSlices_9_we0 mem_we 1 1 }  { glPLSlices_9_d0 mem_din 1 8 }  { glPLSlices_9_q0 mem_dout 0 8 } } }
	glPLSlices_10 { ap_memory {  { glPLSlices_10_address0 mem_address 1 13 }  { glPLSlices_10_ce0 mem_ce 1 1 }  { glPLSlices_10_we0 mem_we 1 1 }  { glPLSlices_10_d0 mem_din 1 8 }  { glPLSlices_10_q0 mem_dout 0 8 } } }
	glPLSlices_11 { ap_memory {  { glPLSlices_11_address0 mem_address 1 13 }  { glPLSlices_11_ce0 mem_ce 1 1 }  { glPLSlices_11_we0 mem_we 1 1 }  { glPLSlices_11_d0 mem_din 1 8 }  { glPLSlices_11_q0 mem_dout 0 8 } } }
	glPLSlices_12 { ap_memory {  { glPLSlices_12_address0 mem_address 1 13 }  { glPLSlices_12_ce0 mem_ce 1 1 }  { glPLSlices_12_we0 mem_we 1 1 }  { glPLSlices_12_d0 mem_din 1 8 }  { glPLSlices_12_q0 mem_dout 0 8 } } }
	glPLSlices_13 { ap_memory {  { glPLSlices_13_address0 mem_address 1 13 }  { glPLSlices_13_ce0 mem_ce 1 1 }  { glPLSlices_13_we0 mem_we 1 1 }  { glPLSlices_13_d0 mem_din 1 8 }  { glPLSlices_13_q0 mem_dout 0 8 } } }
	glPLSlices_14 { ap_memory {  { glPLSlices_14_address0 mem_address 1 13 }  { glPLSlices_14_ce0 mem_ce 1 1 }  { glPLSlices_14_we0 mem_we 1 1 }  { glPLSlices_14_d0 mem_din 1 8 }  { glPLSlices_14_q0 mem_dout 0 8 } } }
	glPLSlices_15 { ap_memory {  { glPLSlices_15_address0 mem_address 1 13 }  { glPLSlices_15_ce0 mem_ce 1 1 }  { glPLSlices_15_we0 mem_we 1 1 }  { glPLSlices_15_d0 mem_din 1 8 }  { glPLSlices_15_q0 mem_dout 0 8 } } }
}
