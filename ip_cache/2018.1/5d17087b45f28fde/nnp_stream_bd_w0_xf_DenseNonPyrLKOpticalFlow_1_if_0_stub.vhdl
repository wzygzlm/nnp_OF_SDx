-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Aug 11 00:16:57 2018
-- Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ nnp_stream_bd_w0_xf_DenseNonPyrLKOpticalFlow_1_if_0_stub.vhdl
-- Design      : nnp_stream_bd_w0_xf_DenseNonPyrLKOpticalFlow_1_if_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z100ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    acc_aclk : in STD_LOGIC;
    acc_aresetn : in STD_LOGIC;
    ap_resetn : out STD_LOGIC;
    ap_clk : out STD_LOGIC;
    ap_start : out STD_LOGIC;
    ap_idle : in STD_LOGIC;
    ap_done : in STD_LOGIC;
    ap_ready : in STD_LOGIC;
    ap_continue : out STD_LOGIC;
    ap_iscalar_0_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_iscalar_1_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_2_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_3_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_4_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_iscalar_5_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_6_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_7_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_8_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_iscalar_9_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_10_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_11_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_12_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_iscalar_13_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_14_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iscalar_15_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_fifo_0_aclk : in STD_LOGIC;
    s_axis_fifo_0_aresetn : in STD_LOGIC;
    s_axis_fifo_0_tlast : in STD_LOGIC;
    s_axis_fifo_0_tvalid : in STD_LOGIC;
    s_axis_fifo_0_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_fifo_0_tstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_fifo_0_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_fifo_0_tready : out STD_LOGIC;
    ap_fifo_iarg_0_empty_n : out STD_LOGIC;
    ap_fifo_iarg_0_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_fifo_iarg_0_read : in STD_LOGIC;
    s_axis_fifo_1_aclk : in STD_LOGIC;
    s_axis_fifo_1_aresetn : in STD_LOGIC;
    s_axis_fifo_1_tlast : in STD_LOGIC;
    s_axis_fifo_1_tvalid : in STD_LOGIC;
    s_axis_fifo_1_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_fifo_1_tstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_fifo_1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_fifo_1_tready : out STD_LOGIC;
    ap_fifo_iarg_1_empty_n : out STD_LOGIC;
    ap_fifo_iarg_1_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_fifo_iarg_1_read : in STD_LOGIC;
    m_axis_fifo_0_aclk : in STD_LOGIC;
    m_axis_fifo_0_aresetn : in STD_LOGIC;
    m_axis_fifo_0_tlast : out STD_LOGIC;
    m_axis_fifo_0_tvalid : out STD_LOGIC;
    m_axis_fifo_0_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_fifo_0_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_fifo_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_fifo_0_tready : in STD_LOGIC;
    ap_fifo_oarg_0_full_n : out STD_LOGIC;
    ap_fifo_oarg_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_fifo_oarg_0_write : in STD_LOGIC;
    m_axis_fifo_1_aclk : in STD_LOGIC;
    m_axis_fifo_1_aresetn : in STD_LOGIC;
    m_axis_fifo_1_tlast : out STD_LOGIC;
    m_axis_fifo_1_tvalid : out STD_LOGIC;
    m_axis_fifo_1_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_fifo_1_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_fifo_1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_fifo_1_tready : in STD_LOGIC;
    ap_fifo_oarg_1_full_n : out STD_LOGIC;
    ap_fifo_oarg_1_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_fifo_oarg_1_write : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_aclk,s_axi_aresetn,S_AXI_AWADDR[31:0],S_AXI_AWPROT[2:0],S_AXI_AWVALID,S_AXI_AWREADY,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WVALID,S_AXI_WREADY,S_AXI_BRESP[1:0],S_AXI_BVALID,S_AXI_BREADY,S_AXI_ARADDR[31:0],S_AXI_ARPROT[2:0],S_AXI_ARVALID,S_AXI_ARREADY,S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RVALID,S_AXI_RREADY,acc_aclk,acc_aresetn,ap_resetn,ap_clk,ap_start,ap_idle,ap_done,ap_ready,ap_continue,ap_iscalar_0_dout[7:0],ap_iscalar_1_dout[31:0],ap_iscalar_2_dout[31:0],ap_iscalar_3_dout[31:0],ap_iscalar_4_dout[7:0],ap_iscalar_5_dout[31:0],ap_iscalar_6_dout[31:0],ap_iscalar_7_dout[31:0],ap_iscalar_8_dout[7:0],ap_iscalar_9_dout[31:0],ap_iscalar_10_dout[31:0],ap_iscalar_11_dout[31:0],ap_iscalar_12_dout[7:0],ap_iscalar_13_dout[31:0],ap_iscalar_14_dout[31:0],ap_iscalar_15_dout[31:0],s_axis_fifo_0_aclk,s_axis_fifo_0_aresetn,s_axis_fifo_0_tlast,s_axis_fifo_0_tvalid,s_axis_fifo_0_tkeep[7:0],s_axis_fifo_0_tstrb[7:0],s_axis_fifo_0_tdata[63:0],s_axis_fifo_0_tready,ap_fifo_iarg_0_empty_n,ap_fifo_iarg_0_dout[7:0],ap_fifo_iarg_0_read,s_axis_fifo_1_aclk,s_axis_fifo_1_aresetn,s_axis_fifo_1_tlast,s_axis_fifo_1_tvalid,s_axis_fifo_1_tkeep[7:0],s_axis_fifo_1_tstrb[7:0],s_axis_fifo_1_tdata[63:0],s_axis_fifo_1_tready,ap_fifo_iarg_1_empty_n,ap_fifo_iarg_1_dout[7:0],ap_fifo_iarg_1_read,m_axis_fifo_0_aclk,m_axis_fifo_0_aresetn,m_axis_fifo_0_tlast,m_axis_fifo_0_tvalid,m_axis_fifo_0_tkeep[7:0],m_axis_fifo_0_tstrb[7:0],m_axis_fifo_0_tdata[63:0],m_axis_fifo_0_tready,ap_fifo_oarg_0_full_n,ap_fifo_oarg_0_din[31:0],ap_fifo_oarg_0_write,m_axis_fifo_1_aclk,m_axis_fifo_1_aresetn,m_axis_fifo_1_tlast,m_axis_fifo_1_tvalid,m_axis_fifo_1_tkeep[7:0],m_axis_fifo_1_tstrb[7:0],m_axis_fifo_1_tdata[63:0],m_axis_fifo_1_tready,ap_fifo_oarg_1_full_n,ap_fifo_oarg_1_din[31:0],ap_fifo_oarg_1_write";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "top,Vivado 2018.1";
begin
end;
