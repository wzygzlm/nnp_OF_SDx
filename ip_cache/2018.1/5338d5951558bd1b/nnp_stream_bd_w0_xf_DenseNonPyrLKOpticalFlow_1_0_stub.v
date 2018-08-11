// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Aug 11 00:20:50 2018
// Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ nnp_stream_bd_w0_xf_DenseNonPyrLKOpticalFlow_1_0_stub.v
// Design      : nnp_stream_bd_w0_xf_DenseNonPyrLKOpticalFlow_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z100ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "a0_w0_xf_DenseNonPyrLKOpticalFlow,Vivado 2018.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, 
  ap_ready, frame0_allocatedFlag, frame0_rows, frame0_cols, frame0_size, frame0_data_V_dout, 
  frame0_data_V_empty_n, frame0_data_V_read, frame1_allocatedFlag, frame1_rows, 
  frame1_cols, frame1_size, frame1_data_V_dout, frame1_data_V_empty_n, frame1_data_V_read, 
  flowx_allocatedFlag, flowx_rows, flowx_cols, flowx_size, flowx_data_din, flowx_data_full_n, 
  flowx_data_write, flowy_allocatedFlag, flowy_rows, flowy_cols, flowy_size, flowy_data_din, 
  flowy_data_full_n, flowy_data_write)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,frame0_allocatedFlag[7:0],frame0_rows[31:0],frame0_cols[31:0],frame0_size[31:0],frame0_data_V_dout[7:0],frame0_data_V_empty_n,frame0_data_V_read,frame1_allocatedFlag[7:0],frame1_rows[31:0],frame1_cols[31:0],frame1_size[31:0],frame1_data_V_dout[7:0],frame1_data_V_empty_n,frame1_data_V_read,flowx_allocatedFlag[7:0],flowx_rows[31:0],flowx_cols[31:0],flowx_size[31:0],flowx_data_din[31:0],flowx_data_full_n,flowx_data_write,flowy_allocatedFlag[7:0],flowy_rows[31:0],flowy_cols[31:0],flowy_size[31:0],flowy_data_din[31:0],flowy_data_full_n,flowy_data_write" */;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [7:0]frame0_allocatedFlag;
  input [31:0]frame0_rows;
  input [31:0]frame0_cols;
  input [31:0]frame0_size;
  input [7:0]frame0_data_V_dout;
  input frame0_data_V_empty_n;
  output frame0_data_V_read;
  input [7:0]frame1_allocatedFlag;
  input [31:0]frame1_rows;
  input [31:0]frame1_cols;
  input [31:0]frame1_size;
  input [7:0]frame1_data_V_dout;
  input frame1_data_V_empty_n;
  output frame1_data_V_read;
  input [7:0]flowx_allocatedFlag;
  input [31:0]flowx_rows;
  input [31:0]flowx_cols;
  input [31:0]flowx_size;
  output [31:0]flowx_data_din;
  input flowx_data_full_n;
  output flowx_data_write;
  input [7:0]flowy_allocatedFlag;
  input [31:0]flowy_rows;
  input [31:0]flowy_cols;
  input [31:0]flowy_size;
  output [31:0]flowy_data_din;
  input flowy_data_full_n;
  output flowy_data_write;
endmodule
