// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Aug 11 00:16:17 2018
// Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ nnp_stream_bd_mmult_zero_copy_1_0_stub.v
// Design      : nnp_stream_bd_mmult_zero_copy_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z100ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "a1_mmult_zero_copy,Vivado 2018.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, 
  ap_ready, m_axi_in1_AWADDR, m_axi_in1_AWLEN, m_axi_in1_AWSIZE, m_axi_in1_AWBURST, 
  m_axi_in1_AWLOCK, m_axi_in1_AWREGION, m_axi_in1_AWCACHE, m_axi_in1_AWPROT, 
  m_axi_in1_AWQOS, m_axi_in1_AWVALID, m_axi_in1_AWREADY, m_axi_in1_WDATA, m_axi_in1_WSTRB, 
  m_axi_in1_WLAST, m_axi_in1_WVALID, m_axi_in1_WREADY, m_axi_in1_BRESP, m_axi_in1_BVALID, 
  m_axi_in1_BREADY, m_axi_in1_ARADDR, m_axi_in1_ARLEN, m_axi_in1_ARSIZE, m_axi_in1_ARBURST, 
  m_axi_in1_ARLOCK, m_axi_in1_ARREGION, m_axi_in1_ARCACHE, m_axi_in1_ARPROT, 
  m_axi_in1_ARQOS, m_axi_in1_ARVALID, m_axi_in1_ARREADY, m_axi_in1_RDATA, m_axi_in1_RRESP, 
  m_axi_in1_RLAST, m_axi_in1_RVALID, m_axi_in1_RREADY, m_axi_in2_AWADDR, m_axi_in2_AWLEN, 
  m_axi_in2_AWSIZE, m_axi_in2_AWBURST, m_axi_in2_AWLOCK, m_axi_in2_AWREGION, 
  m_axi_in2_AWCACHE, m_axi_in2_AWPROT, m_axi_in2_AWQOS, m_axi_in2_AWVALID, 
  m_axi_in2_AWREADY, m_axi_in2_WDATA, m_axi_in2_WSTRB, m_axi_in2_WLAST, m_axi_in2_WVALID, 
  m_axi_in2_WREADY, m_axi_in2_BRESP, m_axi_in2_BVALID, m_axi_in2_BREADY, m_axi_in2_ARADDR, 
  m_axi_in2_ARLEN, m_axi_in2_ARSIZE, m_axi_in2_ARBURST, m_axi_in2_ARLOCK, 
  m_axi_in2_ARREGION, m_axi_in2_ARCACHE, m_axi_in2_ARPROT, m_axi_in2_ARQOS, 
  m_axi_in2_ARVALID, m_axi_in2_ARREADY, m_axi_in2_RDATA, m_axi_in2_RRESP, m_axi_in2_RLAST, 
  m_axi_in2_RVALID, m_axi_in2_RREADY, m_axi_out_r_AWADDR, m_axi_out_r_AWLEN, 
  m_axi_out_r_AWSIZE, m_axi_out_r_AWBURST, m_axi_out_r_AWLOCK, m_axi_out_r_AWREGION, 
  m_axi_out_r_AWCACHE, m_axi_out_r_AWPROT, m_axi_out_r_AWQOS, m_axi_out_r_AWVALID, 
  m_axi_out_r_AWREADY, m_axi_out_r_WDATA, m_axi_out_r_WSTRB, m_axi_out_r_WLAST, 
  m_axi_out_r_WVALID, m_axi_out_r_WREADY, m_axi_out_r_BRESP, m_axi_out_r_BVALID, 
  m_axi_out_r_BREADY, m_axi_out_r_ARADDR, m_axi_out_r_ARLEN, m_axi_out_r_ARSIZE, 
  m_axi_out_r_ARBURST, m_axi_out_r_ARLOCK, m_axi_out_r_ARREGION, m_axi_out_r_ARCACHE, 
  m_axi_out_r_ARPROT, m_axi_out_r_ARQOS, m_axi_out_r_ARVALID, m_axi_out_r_ARREADY, 
  m_axi_out_r_RDATA, m_axi_out_r_RRESP, m_axi_out_r_RLAST, m_axi_out_r_RVALID, 
  m_axi_out_r_RREADY, in1_offset, in2_offset, out_offset, dim)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,m_axi_in1_AWADDR[31:0],m_axi_in1_AWLEN[7:0],m_axi_in1_AWSIZE[2:0],m_axi_in1_AWBURST[1:0],m_axi_in1_AWLOCK[1:0],m_axi_in1_AWREGION[3:0],m_axi_in1_AWCACHE[3:0],m_axi_in1_AWPROT[2:0],m_axi_in1_AWQOS[3:0],m_axi_in1_AWVALID,m_axi_in1_AWREADY,m_axi_in1_WDATA[31:0],m_axi_in1_WSTRB[3:0],m_axi_in1_WLAST,m_axi_in1_WVALID,m_axi_in1_WREADY,m_axi_in1_BRESP[1:0],m_axi_in1_BVALID,m_axi_in1_BREADY,m_axi_in1_ARADDR[31:0],m_axi_in1_ARLEN[7:0],m_axi_in1_ARSIZE[2:0],m_axi_in1_ARBURST[1:0],m_axi_in1_ARLOCK[1:0],m_axi_in1_ARREGION[3:0],m_axi_in1_ARCACHE[3:0],m_axi_in1_ARPROT[2:0],m_axi_in1_ARQOS[3:0],m_axi_in1_ARVALID,m_axi_in1_ARREADY,m_axi_in1_RDATA[31:0],m_axi_in1_RRESP[1:0],m_axi_in1_RLAST,m_axi_in1_RVALID,m_axi_in1_RREADY,m_axi_in2_AWADDR[31:0],m_axi_in2_AWLEN[7:0],m_axi_in2_AWSIZE[2:0],m_axi_in2_AWBURST[1:0],m_axi_in2_AWLOCK[1:0],m_axi_in2_AWREGION[3:0],m_axi_in2_AWCACHE[3:0],m_axi_in2_AWPROT[2:0],m_axi_in2_AWQOS[3:0],m_axi_in2_AWVALID,m_axi_in2_AWREADY,m_axi_in2_WDATA[31:0],m_axi_in2_WSTRB[3:0],m_axi_in2_WLAST,m_axi_in2_WVALID,m_axi_in2_WREADY,m_axi_in2_BRESP[1:0],m_axi_in2_BVALID,m_axi_in2_BREADY,m_axi_in2_ARADDR[31:0],m_axi_in2_ARLEN[7:0],m_axi_in2_ARSIZE[2:0],m_axi_in2_ARBURST[1:0],m_axi_in2_ARLOCK[1:0],m_axi_in2_ARREGION[3:0],m_axi_in2_ARCACHE[3:0],m_axi_in2_ARPROT[2:0],m_axi_in2_ARQOS[3:0],m_axi_in2_ARVALID,m_axi_in2_ARREADY,m_axi_in2_RDATA[31:0],m_axi_in2_RRESP[1:0],m_axi_in2_RLAST,m_axi_in2_RVALID,m_axi_in2_RREADY,m_axi_out_r_AWADDR[31:0],m_axi_out_r_AWLEN[7:0],m_axi_out_r_AWSIZE[2:0],m_axi_out_r_AWBURST[1:0],m_axi_out_r_AWLOCK[1:0],m_axi_out_r_AWREGION[3:0],m_axi_out_r_AWCACHE[3:0],m_axi_out_r_AWPROT[2:0],m_axi_out_r_AWQOS[3:0],m_axi_out_r_AWVALID,m_axi_out_r_AWREADY,m_axi_out_r_WDATA[31:0],m_axi_out_r_WSTRB[3:0],m_axi_out_r_WLAST,m_axi_out_r_WVALID,m_axi_out_r_WREADY,m_axi_out_r_BRESP[1:0],m_axi_out_r_BVALID,m_axi_out_r_BREADY,m_axi_out_r_ARADDR[31:0],m_axi_out_r_ARLEN[7:0],m_axi_out_r_ARSIZE[2:0],m_axi_out_r_ARBURST[1:0],m_axi_out_r_ARLOCK[1:0],m_axi_out_r_ARREGION[3:0],m_axi_out_r_ARCACHE[3:0],m_axi_out_r_ARPROT[2:0],m_axi_out_r_ARQOS[3:0],m_axi_out_r_ARVALID,m_axi_out_r_ARREADY,m_axi_out_r_RDATA[31:0],m_axi_out_r_RRESP[1:0],m_axi_out_r_RLAST,m_axi_out_r_RVALID,m_axi_out_r_RREADY,in1_offset[31:0],in2_offset[31:0],out_offset[31:0],dim[31:0]" */;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [31:0]m_axi_in1_AWADDR;
  output [7:0]m_axi_in1_AWLEN;
  output [2:0]m_axi_in1_AWSIZE;
  output [1:0]m_axi_in1_AWBURST;
  output [1:0]m_axi_in1_AWLOCK;
  output [3:0]m_axi_in1_AWREGION;
  output [3:0]m_axi_in1_AWCACHE;
  output [2:0]m_axi_in1_AWPROT;
  output [3:0]m_axi_in1_AWQOS;
  output m_axi_in1_AWVALID;
  input m_axi_in1_AWREADY;
  output [31:0]m_axi_in1_WDATA;
  output [3:0]m_axi_in1_WSTRB;
  output m_axi_in1_WLAST;
  output m_axi_in1_WVALID;
  input m_axi_in1_WREADY;
  input [1:0]m_axi_in1_BRESP;
  input m_axi_in1_BVALID;
  output m_axi_in1_BREADY;
  output [31:0]m_axi_in1_ARADDR;
  output [7:0]m_axi_in1_ARLEN;
  output [2:0]m_axi_in1_ARSIZE;
  output [1:0]m_axi_in1_ARBURST;
  output [1:0]m_axi_in1_ARLOCK;
  output [3:0]m_axi_in1_ARREGION;
  output [3:0]m_axi_in1_ARCACHE;
  output [2:0]m_axi_in1_ARPROT;
  output [3:0]m_axi_in1_ARQOS;
  output m_axi_in1_ARVALID;
  input m_axi_in1_ARREADY;
  input [31:0]m_axi_in1_RDATA;
  input [1:0]m_axi_in1_RRESP;
  input m_axi_in1_RLAST;
  input m_axi_in1_RVALID;
  output m_axi_in1_RREADY;
  output [31:0]m_axi_in2_AWADDR;
  output [7:0]m_axi_in2_AWLEN;
  output [2:0]m_axi_in2_AWSIZE;
  output [1:0]m_axi_in2_AWBURST;
  output [1:0]m_axi_in2_AWLOCK;
  output [3:0]m_axi_in2_AWREGION;
  output [3:0]m_axi_in2_AWCACHE;
  output [2:0]m_axi_in2_AWPROT;
  output [3:0]m_axi_in2_AWQOS;
  output m_axi_in2_AWVALID;
  input m_axi_in2_AWREADY;
  output [31:0]m_axi_in2_WDATA;
  output [3:0]m_axi_in2_WSTRB;
  output m_axi_in2_WLAST;
  output m_axi_in2_WVALID;
  input m_axi_in2_WREADY;
  input [1:0]m_axi_in2_BRESP;
  input m_axi_in2_BVALID;
  output m_axi_in2_BREADY;
  output [31:0]m_axi_in2_ARADDR;
  output [7:0]m_axi_in2_ARLEN;
  output [2:0]m_axi_in2_ARSIZE;
  output [1:0]m_axi_in2_ARBURST;
  output [1:0]m_axi_in2_ARLOCK;
  output [3:0]m_axi_in2_ARREGION;
  output [3:0]m_axi_in2_ARCACHE;
  output [2:0]m_axi_in2_ARPROT;
  output [3:0]m_axi_in2_ARQOS;
  output m_axi_in2_ARVALID;
  input m_axi_in2_ARREADY;
  input [31:0]m_axi_in2_RDATA;
  input [1:0]m_axi_in2_RRESP;
  input m_axi_in2_RLAST;
  input m_axi_in2_RVALID;
  output m_axi_in2_RREADY;
  output [31:0]m_axi_out_r_AWADDR;
  output [7:0]m_axi_out_r_AWLEN;
  output [2:0]m_axi_out_r_AWSIZE;
  output [1:0]m_axi_out_r_AWBURST;
  output [1:0]m_axi_out_r_AWLOCK;
  output [3:0]m_axi_out_r_AWREGION;
  output [3:0]m_axi_out_r_AWCACHE;
  output [2:0]m_axi_out_r_AWPROT;
  output [3:0]m_axi_out_r_AWQOS;
  output m_axi_out_r_AWVALID;
  input m_axi_out_r_AWREADY;
  output [31:0]m_axi_out_r_WDATA;
  output [3:0]m_axi_out_r_WSTRB;
  output m_axi_out_r_WLAST;
  output m_axi_out_r_WVALID;
  input m_axi_out_r_WREADY;
  input [1:0]m_axi_out_r_BRESP;
  input m_axi_out_r_BVALID;
  output m_axi_out_r_BREADY;
  output [31:0]m_axi_out_r_ARADDR;
  output [7:0]m_axi_out_r_ARLEN;
  output [2:0]m_axi_out_r_ARSIZE;
  output [1:0]m_axi_out_r_ARBURST;
  output [1:0]m_axi_out_r_ARLOCK;
  output [3:0]m_axi_out_r_ARREGION;
  output [3:0]m_axi_out_r_ARCACHE;
  output [2:0]m_axi_out_r_ARPROT;
  output [3:0]m_axi_out_r_ARQOS;
  output m_axi_out_r_ARVALID;
  input m_axi_out_r_ARREADY;
  input [31:0]m_axi_out_r_RDATA;
  input [1:0]m_axi_out_r_RRESP;
  input m_axi_out_r_RLAST;
  input m_axi_out_r_RVALID;
  output m_axi_out_r_RREADY;
  input [31:0]in1_offset;
  input [31:0]in2_offset;
  input [31:0]out_offset;
  input [31:0]dim;
endmodule
