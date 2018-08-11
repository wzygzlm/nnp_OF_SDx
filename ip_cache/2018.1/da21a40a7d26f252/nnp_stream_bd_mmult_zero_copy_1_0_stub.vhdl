-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Aug 11 00:16:17 2018
-- Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ nnp_stream_bd_mmult_zero_copy_1_0_stub.vhdl
-- Design      : nnp_stream_bd_mmult_zero_copy_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z100ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    m_axi_in1_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_in1_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_in1_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_in1_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in1_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in1_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in1_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in1_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_in1_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in1_AWVALID : out STD_LOGIC;
    m_axi_in1_AWREADY : in STD_LOGIC;
    m_axi_in1_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_in1_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in1_WLAST : out STD_LOGIC;
    m_axi_in1_WVALID : out STD_LOGIC;
    m_axi_in1_WREADY : in STD_LOGIC;
    m_axi_in1_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in1_BVALID : in STD_LOGIC;
    m_axi_in1_BREADY : out STD_LOGIC;
    m_axi_in1_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_in1_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_in1_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_in1_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in1_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in1_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in1_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in1_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_in1_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in1_ARVALID : out STD_LOGIC;
    m_axi_in1_ARREADY : in STD_LOGIC;
    m_axi_in1_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_in1_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in1_RLAST : in STD_LOGIC;
    m_axi_in1_RVALID : in STD_LOGIC;
    m_axi_in1_RREADY : out STD_LOGIC;
    m_axi_in2_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_in2_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_in2_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_in2_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in2_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in2_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in2_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in2_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_in2_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in2_AWVALID : out STD_LOGIC;
    m_axi_in2_AWREADY : in STD_LOGIC;
    m_axi_in2_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_in2_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in2_WLAST : out STD_LOGIC;
    m_axi_in2_WVALID : out STD_LOGIC;
    m_axi_in2_WREADY : in STD_LOGIC;
    m_axi_in2_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in2_BVALID : in STD_LOGIC;
    m_axi_in2_BREADY : out STD_LOGIC;
    m_axi_in2_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_in2_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_in2_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_in2_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in2_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in2_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in2_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in2_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_in2_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_in2_ARVALID : out STD_LOGIC;
    m_axi_in2_ARREADY : in STD_LOGIC;
    m_axi_in2_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_in2_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_in2_RLAST : in STD_LOGIC;
    m_axi_in2_RVALID : in STD_LOGIC;
    m_axi_in2_RREADY : out STD_LOGIC;
    m_axi_out_r_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_out_r_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_out_r_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_out_r_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_out_r_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_out_r_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_out_r_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_out_r_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_out_r_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_out_r_AWVALID : out STD_LOGIC;
    m_axi_out_r_AWREADY : in STD_LOGIC;
    m_axi_out_r_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_out_r_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_out_r_WLAST : out STD_LOGIC;
    m_axi_out_r_WVALID : out STD_LOGIC;
    m_axi_out_r_WREADY : in STD_LOGIC;
    m_axi_out_r_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_out_r_BVALID : in STD_LOGIC;
    m_axi_out_r_BREADY : out STD_LOGIC;
    m_axi_out_r_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_out_r_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_out_r_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_out_r_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_out_r_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_out_r_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_out_r_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_out_r_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_out_r_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_out_r_ARVALID : out STD_LOGIC;
    m_axi_out_r_ARREADY : in STD_LOGIC;
    m_axi_out_r_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_out_r_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_out_r_RLAST : in STD_LOGIC;
    m_axi_out_r_RVALID : in STD_LOGIC;
    m_axi_out_r_RREADY : out STD_LOGIC;
    in1_offset : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in2_offset : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_offset : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dim : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,m_axi_in1_AWADDR[31:0],m_axi_in1_AWLEN[7:0],m_axi_in1_AWSIZE[2:0],m_axi_in1_AWBURST[1:0],m_axi_in1_AWLOCK[1:0],m_axi_in1_AWREGION[3:0],m_axi_in1_AWCACHE[3:0],m_axi_in1_AWPROT[2:0],m_axi_in1_AWQOS[3:0],m_axi_in1_AWVALID,m_axi_in1_AWREADY,m_axi_in1_WDATA[31:0],m_axi_in1_WSTRB[3:0],m_axi_in1_WLAST,m_axi_in1_WVALID,m_axi_in1_WREADY,m_axi_in1_BRESP[1:0],m_axi_in1_BVALID,m_axi_in1_BREADY,m_axi_in1_ARADDR[31:0],m_axi_in1_ARLEN[7:0],m_axi_in1_ARSIZE[2:0],m_axi_in1_ARBURST[1:0],m_axi_in1_ARLOCK[1:0],m_axi_in1_ARREGION[3:0],m_axi_in1_ARCACHE[3:0],m_axi_in1_ARPROT[2:0],m_axi_in1_ARQOS[3:0],m_axi_in1_ARVALID,m_axi_in1_ARREADY,m_axi_in1_RDATA[31:0],m_axi_in1_RRESP[1:0],m_axi_in1_RLAST,m_axi_in1_RVALID,m_axi_in1_RREADY,m_axi_in2_AWADDR[31:0],m_axi_in2_AWLEN[7:0],m_axi_in2_AWSIZE[2:0],m_axi_in2_AWBURST[1:0],m_axi_in2_AWLOCK[1:0],m_axi_in2_AWREGION[3:0],m_axi_in2_AWCACHE[3:0],m_axi_in2_AWPROT[2:0],m_axi_in2_AWQOS[3:0],m_axi_in2_AWVALID,m_axi_in2_AWREADY,m_axi_in2_WDATA[31:0],m_axi_in2_WSTRB[3:0],m_axi_in2_WLAST,m_axi_in2_WVALID,m_axi_in2_WREADY,m_axi_in2_BRESP[1:0],m_axi_in2_BVALID,m_axi_in2_BREADY,m_axi_in2_ARADDR[31:0],m_axi_in2_ARLEN[7:0],m_axi_in2_ARSIZE[2:0],m_axi_in2_ARBURST[1:0],m_axi_in2_ARLOCK[1:0],m_axi_in2_ARREGION[3:0],m_axi_in2_ARCACHE[3:0],m_axi_in2_ARPROT[2:0],m_axi_in2_ARQOS[3:0],m_axi_in2_ARVALID,m_axi_in2_ARREADY,m_axi_in2_RDATA[31:0],m_axi_in2_RRESP[1:0],m_axi_in2_RLAST,m_axi_in2_RVALID,m_axi_in2_RREADY,m_axi_out_r_AWADDR[31:0],m_axi_out_r_AWLEN[7:0],m_axi_out_r_AWSIZE[2:0],m_axi_out_r_AWBURST[1:0],m_axi_out_r_AWLOCK[1:0],m_axi_out_r_AWREGION[3:0],m_axi_out_r_AWCACHE[3:0],m_axi_out_r_AWPROT[2:0],m_axi_out_r_AWQOS[3:0],m_axi_out_r_AWVALID,m_axi_out_r_AWREADY,m_axi_out_r_WDATA[31:0],m_axi_out_r_WSTRB[3:0],m_axi_out_r_WLAST,m_axi_out_r_WVALID,m_axi_out_r_WREADY,m_axi_out_r_BRESP[1:0],m_axi_out_r_BVALID,m_axi_out_r_BREADY,m_axi_out_r_ARADDR[31:0],m_axi_out_r_ARLEN[7:0],m_axi_out_r_ARSIZE[2:0],m_axi_out_r_ARBURST[1:0],m_axi_out_r_ARLOCK[1:0],m_axi_out_r_ARREGION[3:0],m_axi_out_r_ARCACHE[3:0],m_axi_out_r_ARPROT[2:0],m_axi_out_r_ARQOS[3:0],m_axi_out_r_ARVALID,m_axi_out_r_ARREADY,m_axi_out_r_RDATA[31:0],m_axi_out_r_RRESP[1:0],m_axi_out_r_RLAST,m_axi_out_r_RVALID,m_axi_out_r_RREADY,in1_offset[31:0],in2_offset[31:0],out_offset[31:0],dim[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "a1_mmult_zero_copy,Vivado 2018.1";
begin
end;
