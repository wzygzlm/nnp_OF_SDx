set moduleName copyToPS
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {copyToPS}
set C_modelType { void 0 }
set C_modelArgList {
	{ eventSlice int 8 regular {axi_master 1}  }
	{ eventSlice_offset int 32 regular  }
	{ glPLSlices_0 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_1 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_2 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_3 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_4 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_5 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_6 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_7 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_8 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_9 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_10 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_11 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_12 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_13 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_14 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
	{ glPLSlices_15 int 8 regular {array 8100 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "eventSlice", "interface" : "axi_master", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "eventSlice_offset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "glPLSlices_0", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_2", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_3", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_4", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_5", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_6", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_7", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_8", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_9", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_10", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_11", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_12", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_13", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_14", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_15", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 100
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_eventSlice_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_eventSlice_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_AWLEN sc_out sc_lv 32 signal 0 } 
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
	{ m_axi_eventSlice_WDATA sc_out sc_lv 8 signal 0 } 
	{ m_axi_eventSlice_WSTRB sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_eventSlice_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_ARLEN sc_out sc_lv 32 signal 0 } 
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
	{ m_axi_eventSlice_RDATA sc_in sc_lv 8 signal 0 } 
	{ m_axi_eventSlice_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_eventSlice_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_eventSlice_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_eventSlice_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_eventSlice_BUSER sc_in sc_lv 1 signal 0 } 
	{ eventSlice_offset sc_in sc_lv 32 signal 1 } 
	{ glPLSlices_0_address0 sc_out sc_lv 13 signal 2 } 
	{ glPLSlices_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ glPLSlices_0_q0 sc_in sc_lv 8 signal 2 } 
	{ glPLSlices_1_address0 sc_out sc_lv 13 signal 3 } 
	{ glPLSlices_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ glPLSlices_1_q0 sc_in sc_lv 8 signal 3 } 
	{ glPLSlices_2_address0 sc_out sc_lv 13 signal 4 } 
	{ glPLSlices_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_2_q0 sc_in sc_lv 8 signal 4 } 
	{ glPLSlices_3_address0 sc_out sc_lv 13 signal 5 } 
	{ glPLSlices_3_ce0 sc_out sc_logic 1 signal 5 } 
	{ glPLSlices_3_q0 sc_in sc_lv 8 signal 5 } 
	{ glPLSlices_4_address0 sc_out sc_lv 13 signal 6 } 
	{ glPLSlices_4_ce0 sc_out sc_logic 1 signal 6 } 
	{ glPLSlices_4_q0 sc_in sc_lv 8 signal 6 } 
	{ glPLSlices_5_address0 sc_out sc_lv 13 signal 7 } 
	{ glPLSlices_5_ce0 sc_out sc_logic 1 signal 7 } 
	{ glPLSlices_5_q0 sc_in sc_lv 8 signal 7 } 
	{ glPLSlices_6_address0 sc_out sc_lv 13 signal 8 } 
	{ glPLSlices_6_ce0 sc_out sc_logic 1 signal 8 } 
	{ glPLSlices_6_q0 sc_in sc_lv 8 signal 8 } 
	{ glPLSlices_7_address0 sc_out sc_lv 13 signal 9 } 
	{ glPLSlices_7_ce0 sc_out sc_logic 1 signal 9 } 
	{ glPLSlices_7_q0 sc_in sc_lv 8 signal 9 } 
	{ glPLSlices_8_address0 sc_out sc_lv 13 signal 10 } 
	{ glPLSlices_8_ce0 sc_out sc_logic 1 signal 10 } 
	{ glPLSlices_8_q0 sc_in sc_lv 8 signal 10 } 
	{ glPLSlices_9_address0 sc_out sc_lv 13 signal 11 } 
	{ glPLSlices_9_ce0 sc_out sc_logic 1 signal 11 } 
	{ glPLSlices_9_q0 sc_in sc_lv 8 signal 11 } 
	{ glPLSlices_10_address0 sc_out sc_lv 13 signal 12 } 
	{ glPLSlices_10_ce0 sc_out sc_logic 1 signal 12 } 
	{ glPLSlices_10_q0 sc_in sc_lv 8 signal 12 } 
	{ glPLSlices_11_address0 sc_out sc_lv 13 signal 13 } 
	{ glPLSlices_11_ce0 sc_out sc_logic 1 signal 13 } 
	{ glPLSlices_11_q0 sc_in sc_lv 8 signal 13 } 
	{ glPLSlices_12_address0 sc_out sc_lv 13 signal 14 } 
	{ glPLSlices_12_ce0 sc_out sc_logic 1 signal 14 } 
	{ glPLSlices_12_q0 sc_in sc_lv 8 signal 14 } 
	{ glPLSlices_13_address0 sc_out sc_lv 13 signal 15 } 
	{ glPLSlices_13_ce0 sc_out sc_logic 1 signal 15 } 
	{ glPLSlices_13_q0 sc_in sc_lv 8 signal 15 } 
	{ glPLSlices_14_address0 sc_out sc_lv 13 signal 16 } 
	{ glPLSlices_14_ce0 sc_out sc_logic 1 signal 16 } 
	{ glPLSlices_14_q0 sc_in sc_lv 8 signal 16 } 
	{ glPLSlices_15_address0 sc_out sc_lv 13 signal 17 } 
	{ glPLSlices_15_ce0 sc_out sc_logic 1 signal 17 } 
	{ glPLSlices_15_q0 sc_in sc_lv 8 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_eventSlice_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWVALID" }} , 
 	{ "name": "m_axi_eventSlice_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWREADY" }} , 
 	{ "name": "m_axi_eventSlice_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWADDR" }} , 
 	{ "name": "m_axi_eventSlice_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWID" }} , 
 	{ "name": "m_axi_eventSlice_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_eventSlice_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "eventSlice", "role": "WDATA" }} , 
 	{ "name": "m_axi_eventSlice_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WSTRB" }} , 
 	{ "name": "m_axi_eventSlice_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WLAST" }} , 
 	{ "name": "m_axi_eventSlice_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WID" }} , 
 	{ "name": "m_axi_eventSlice_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "WUSER" }} , 
 	{ "name": "m_axi_eventSlice_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARVALID" }} , 
 	{ "name": "m_axi_eventSlice_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARREADY" }} , 
 	{ "name": "m_axi_eventSlice_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARADDR" }} , 
 	{ "name": "m_axi_eventSlice_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARID" }} , 
 	{ "name": "m_axi_eventSlice_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_eventSlice_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "eventSlice", "role": "RDATA" }} , 
 	{ "name": "m_axi_eventSlice_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "RLAST" }} , 
 	{ "name": "m_axi_eventSlice_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "RID" }} , 
 	{ "name": "m_axi_eventSlice_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "RUSER" }} , 
 	{ "name": "m_axi_eventSlice_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "eventSlice", "role": "RRESP" }} , 
 	{ "name": "m_axi_eventSlice_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "BVALID" }} , 
 	{ "name": "m_axi_eventSlice_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "BREADY" }} , 
 	{ "name": "m_axi_eventSlice_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "eventSlice", "role": "BRESP" }} , 
 	{ "name": "m_axi_eventSlice_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "BID" }} , 
 	{ "name": "m_axi_eventSlice_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "BUSER" }} , 
 	{ "name": "eventSlice_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice_offset", "role": "default" }} , 
 	{ "name": "glPLSlices_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "address0" }} , 
 	{ "name": "glPLSlices_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "ce0" }} , 
 	{ "name": "glPLSlices_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_0", "role": "q0" }} , 
 	{ "name": "glPLSlices_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "address0" }} , 
 	{ "name": "glPLSlices_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "ce0" }} , 
 	{ "name": "glPLSlices_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_1", "role": "q0" }} , 
 	{ "name": "glPLSlices_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "address0" }} , 
 	{ "name": "glPLSlices_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "ce0" }} , 
 	{ "name": "glPLSlices_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_2", "role": "q0" }} , 
 	{ "name": "glPLSlices_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "address0" }} , 
 	{ "name": "glPLSlices_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "ce0" }} , 
 	{ "name": "glPLSlices_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_3", "role": "q0" }} , 
 	{ "name": "glPLSlices_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "address0" }} , 
 	{ "name": "glPLSlices_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "ce0" }} , 
 	{ "name": "glPLSlices_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_4", "role": "q0" }} , 
 	{ "name": "glPLSlices_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "address0" }} , 
 	{ "name": "glPLSlices_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "ce0" }} , 
 	{ "name": "glPLSlices_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_5", "role": "q0" }} , 
 	{ "name": "glPLSlices_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "address0" }} , 
 	{ "name": "glPLSlices_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "ce0" }} , 
 	{ "name": "glPLSlices_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_6", "role": "q0" }} , 
 	{ "name": "glPLSlices_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "address0" }} , 
 	{ "name": "glPLSlices_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "ce0" }} , 
 	{ "name": "glPLSlices_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_7", "role": "q0" }} , 
 	{ "name": "glPLSlices_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "address0" }} , 
 	{ "name": "glPLSlices_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "ce0" }} , 
 	{ "name": "glPLSlices_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_8", "role": "q0" }} , 
 	{ "name": "glPLSlices_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "address0" }} , 
 	{ "name": "glPLSlices_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "ce0" }} , 
 	{ "name": "glPLSlices_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_9", "role": "q0" }} , 
 	{ "name": "glPLSlices_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "address0" }} , 
 	{ "name": "glPLSlices_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "ce0" }} , 
 	{ "name": "glPLSlices_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_10", "role": "q0" }} , 
 	{ "name": "glPLSlices_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "address0" }} , 
 	{ "name": "glPLSlices_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "ce0" }} , 
 	{ "name": "glPLSlices_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_11", "role": "q0" }} , 
 	{ "name": "glPLSlices_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "address0" }} , 
 	{ "name": "glPLSlices_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "ce0" }} , 
 	{ "name": "glPLSlices_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_12", "role": "q0" }} , 
 	{ "name": "glPLSlices_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "address0" }} , 
 	{ "name": "glPLSlices_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "ce0" }} , 
 	{ "name": "glPLSlices_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_13", "role": "q0" }} , 
 	{ "name": "glPLSlices_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "address0" }} , 
 	{ "name": "glPLSlices_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "ce0" }} , 
 	{ "name": "glPLSlices_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_14", "role": "q0" }} , 
 	{ "name": "glPLSlices_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "address0" }} , 
 	{ "name": "glPLSlices_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "ce0" }} , 
 	{ "name": "glPLSlices_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "glPLSlices_15", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
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
			{"Name" : "glPLSlices_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "glPLSlices_15", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_urem_eOg_U42", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_urem_fYi_U43", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_urem_fYi_U44", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_1cud_U45", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	copyToPS {
		eventSlice {Type O LastRead 23 FirstWrite 22}
		eventSlice_offset {Type I LastRead 0 FirstWrite -1}
		glPLSlices_0 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_1 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_2 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_3 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_4 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_5 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_6 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_7 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_8 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_9 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_10 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_11 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_12 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_13 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_14 {Type I LastRead 13 FirstWrite -1}
		glPLSlices_15 {Type I LastRead 13 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "43227", "Max" : "43227"}
	, {"Name" : "Interval", "Min" : "43227", "Max" : "43227"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	eventSlice { m_axi {  { m_axi_eventSlice_AWVALID VALID 1 1 }  { m_axi_eventSlice_AWREADY READY 0 1 }  { m_axi_eventSlice_AWADDR ADDR 1 32 }  { m_axi_eventSlice_AWID ID 1 1 }  { m_axi_eventSlice_AWLEN LEN 1 32 }  { m_axi_eventSlice_AWSIZE SIZE 1 3 }  { m_axi_eventSlice_AWBURST BURST 1 2 }  { m_axi_eventSlice_AWLOCK LOCK 1 2 }  { m_axi_eventSlice_AWCACHE CACHE 1 4 }  { m_axi_eventSlice_AWPROT PROT 1 3 }  { m_axi_eventSlice_AWQOS QOS 1 4 }  { m_axi_eventSlice_AWREGION REGION 1 4 }  { m_axi_eventSlice_AWUSER USER 1 1 }  { m_axi_eventSlice_WVALID VALID 1 1 }  { m_axi_eventSlice_WREADY READY 0 1 }  { m_axi_eventSlice_WDATA DATA 1 8 }  { m_axi_eventSlice_WSTRB STRB 1 1 }  { m_axi_eventSlice_WLAST LAST 1 1 }  { m_axi_eventSlice_WID ID 1 1 }  { m_axi_eventSlice_WUSER USER 1 1 }  { m_axi_eventSlice_ARVALID VALID 1 1 }  { m_axi_eventSlice_ARREADY READY 0 1 }  { m_axi_eventSlice_ARADDR ADDR 1 32 }  { m_axi_eventSlice_ARID ID 1 1 }  { m_axi_eventSlice_ARLEN LEN 1 32 }  { m_axi_eventSlice_ARSIZE SIZE 1 3 }  { m_axi_eventSlice_ARBURST BURST 1 2 }  { m_axi_eventSlice_ARLOCK LOCK 1 2 }  { m_axi_eventSlice_ARCACHE CACHE 1 4 }  { m_axi_eventSlice_ARPROT PROT 1 3 }  { m_axi_eventSlice_ARQOS QOS 1 4 }  { m_axi_eventSlice_ARREGION REGION 1 4 }  { m_axi_eventSlice_ARUSER USER 1 1 }  { m_axi_eventSlice_RVALID VALID 0 1 }  { m_axi_eventSlice_RREADY READY 1 1 }  { m_axi_eventSlice_RDATA DATA 0 8 }  { m_axi_eventSlice_RLAST LAST 0 1 }  { m_axi_eventSlice_RID ID 0 1 }  { m_axi_eventSlice_RUSER USER 0 1 }  { m_axi_eventSlice_RRESP RESP 0 2 }  { m_axi_eventSlice_BVALID VALID 0 1 }  { m_axi_eventSlice_BREADY READY 1 1 }  { m_axi_eventSlice_BRESP RESP 0 2 }  { m_axi_eventSlice_BID ID 0 1 }  { m_axi_eventSlice_BUSER USER 0 1 } } }
	eventSlice_offset { ap_none {  { eventSlice_offset in_data 0 32 } } }
	glPLSlices_0 { ap_memory {  { glPLSlices_0_address0 mem_address 1 13 }  { glPLSlices_0_ce0 mem_ce 1 1 }  { glPLSlices_0_q0 mem_dout 0 8 } } }
	glPLSlices_1 { ap_memory {  { glPLSlices_1_address0 mem_address 1 13 }  { glPLSlices_1_ce0 mem_ce 1 1 }  { glPLSlices_1_q0 mem_dout 0 8 } } }
	glPLSlices_2 { ap_memory {  { glPLSlices_2_address0 mem_address 1 13 }  { glPLSlices_2_ce0 mem_ce 1 1 }  { glPLSlices_2_q0 mem_dout 0 8 } } }
	glPLSlices_3 { ap_memory {  { glPLSlices_3_address0 mem_address 1 13 }  { glPLSlices_3_ce0 mem_ce 1 1 }  { glPLSlices_3_q0 mem_dout 0 8 } } }
	glPLSlices_4 { ap_memory {  { glPLSlices_4_address0 mem_address 1 13 }  { glPLSlices_4_ce0 mem_ce 1 1 }  { glPLSlices_4_q0 mem_dout 0 8 } } }
	glPLSlices_5 { ap_memory {  { glPLSlices_5_address0 mem_address 1 13 }  { glPLSlices_5_ce0 mem_ce 1 1 }  { glPLSlices_5_q0 mem_dout 0 8 } } }
	glPLSlices_6 { ap_memory {  { glPLSlices_6_address0 mem_address 1 13 }  { glPLSlices_6_ce0 mem_ce 1 1 }  { glPLSlices_6_q0 mem_dout 0 8 } } }
	glPLSlices_7 { ap_memory {  { glPLSlices_7_address0 mem_address 1 13 }  { glPLSlices_7_ce0 mem_ce 1 1 }  { glPLSlices_7_q0 mem_dout 0 8 } } }
	glPLSlices_8 { ap_memory {  { glPLSlices_8_address0 mem_address 1 13 }  { glPLSlices_8_ce0 mem_ce 1 1 }  { glPLSlices_8_q0 mem_dout 0 8 } } }
	glPLSlices_9 { ap_memory {  { glPLSlices_9_address0 mem_address 1 13 }  { glPLSlices_9_ce0 mem_ce 1 1 }  { glPLSlices_9_q0 mem_dout 0 8 } } }
	glPLSlices_10 { ap_memory {  { glPLSlices_10_address0 mem_address 1 13 }  { glPLSlices_10_ce0 mem_ce 1 1 }  { glPLSlices_10_q0 mem_dout 0 8 } } }
	glPLSlices_11 { ap_memory {  { glPLSlices_11_address0 mem_address 1 13 }  { glPLSlices_11_ce0 mem_ce 1 1 }  { glPLSlices_11_q0 mem_dout 0 8 } } }
	glPLSlices_12 { ap_memory {  { glPLSlices_12_address0 mem_address 1 13 }  { glPLSlices_12_ce0 mem_ce 1 1 }  { glPLSlices_12_q0 mem_dout 0 8 } } }
	glPLSlices_13 { ap_memory {  { glPLSlices_13_address0 mem_address 1 13 }  { glPLSlices_13_ce0 mem_ce 1 1 }  { glPLSlices_13_q0 mem_dout 0 8 } } }
	glPLSlices_14 { ap_memory {  { glPLSlices_14_address0 mem_address 1 13 }  { glPLSlices_14_ce0 mem_ce 1 1 }  { glPLSlices_14_q0 mem_dout 0 8 } } }
	glPLSlices_15 { ap_memory {  { glPLSlices_15_address0 mem_address 1 13 }  { glPLSlices_15_ce0 mem_ce 1 1 }  { glPLSlices_15_q0 mem_dout 0 8 } } }
}
