-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Aug 11 00:20:50 2018
-- Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ nnp_stream_bd_w0_xf_DenseNonPyrLKOpticalFlow_1_0_stub.vhdl
-- Design      : nnp_stream_bd_w0_xf_DenseNonPyrLKOpticalFlow_1_0
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
    frame0_allocatedFlag : in STD_LOGIC_VECTOR ( 7 downto 0 );
    frame0_rows : in STD_LOGIC_VECTOR ( 31 downto 0 );
    frame0_cols : in STD_LOGIC_VECTOR ( 31 downto 0 );
    frame0_size : in STD_LOGIC_VECTOR ( 31 downto 0 );
    frame0_data_V_dout : in STD_LOGIC_VECTOR ( 7 downto 0 );
    frame0_data_V_empty_n : in STD_LOGIC;
    frame0_data_V_read : out STD_LOGIC;
    frame1_allocatedFlag : in STD_LOGIC_VECTOR ( 7 downto 0 );
    frame1_rows : in STD_LOGIC_VECTOR ( 31 downto 0 );
    frame1_cols : in STD_LOGIC_VECTOR ( 31 downto 0 );
    frame1_size : in STD_LOGIC_VECTOR ( 31 downto 0 );
    frame1_data_V_dout : in STD_LOGIC_VECTOR ( 7 downto 0 );
    frame1_data_V_empty_n : in STD_LOGIC;
    frame1_data_V_read : out STD_LOGIC;
    flowx_allocatedFlag : in STD_LOGIC_VECTOR ( 7 downto 0 );
    flowx_rows : in STD_LOGIC_VECTOR ( 31 downto 0 );
    flowx_cols : in STD_LOGIC_VECTOR ( 31 downto 0 );
    flowx_size : in STD_LOGIC_VECTOR ( 31 downto 0 );
    flowx_data_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    flowx_data_full_n : in STD_LOGIC;
    flowx_data_write : out STD_LOGIC;
    flowy_allocatedFlag : in STD_LOGIC_VECTOR ( 7 downto 0 );
    flowy_rows : in STD_LOGIC_VECTOR ( 31 downto 0 );
    flowy_cols : in STD_LOGIC_VECTOR ( 31 downto 0 );
    flowy_size : in STD_LOGIC_VECTOR ( 31 downto 0 );
    flowy_data_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    flowy_data_full_n : in STD_LOGIC;
    flowy_data_write : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,frame0_allocatedFlag[7:0],frame0_rows[31:0],frame0_cols[31:0],frame0_size[31:0],frame0_data_V_dout[7:0],frame0_data_V_empty_n,frame0_data_V_read,frame1_allocatedFlag[7:0],frame1_rows[31:0],frame1_cols[31:0],frame1_size[31:0],frame1_data_V_dout[7:0],frame1_data_V_empty_n,frame1_data_V_read,flowx_allocatedFlag[7:0],flowx_rows[31:0],flowx_cols[31:0],flowx_size[31:0],flowx_data_din[31:0],flowx_data_full_n,flowx_data_write,flowy_allocatedFlag[7:0],flowy_rows[31:0],flowy_cols[31:0],flowy_size[31:0],flowy_data_din[31:0],flowy_data_full_n,flowy_data_write";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "a0_w0_xf_DenseNonPyrLKOpticalFlow,Vivado 2018.1";
begin
end;
