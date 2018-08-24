# This script segment is generated automatically by AutoPilot

set id 2
set name a0_parseEvents_urem_bkb
set corename simcore_urem
set op urem
set stage_num 20
set max_latency -1
set registered_input 1
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 0
set in1_width 9
set in1_signed 0
set ce_width 1
set ce_signed 0
set out_width 16
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_urem] == "ap_gen_simcore_urem"} {
eval "ap_gen_simcore_urem { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_urem, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op urem
set corename DivnS
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_div] == "::AESL_LIB_VIRTEX::xil_gen_div"} {
eval "::AESL_LIB_VIRTEX::xil_gen_div { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_div, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 7 \
    name glPLSlices \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices \
    op interface \
    ports { glPLSlices_address0 { O 17 vector } glPLSlices_ce0 { O 1 bit } glPLSlices_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name eventSlice \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_eventSlice \
    op interface \
    ports { m_axi_eventSlice_AWVALID { O 1 bit } m_axi_eventSlice_AWREADY { I 1 bit } m_axi_eventSlice_AWADDR { O 32 vector } m_axi_eventSlice_AWID { O 1 vector } m_axi_eventSlice_AWLEN { O 32 vector } m_axi_eventSlice_AWSIZE { O 3 vector } m_axi_eventSlice_AWBURST { O 2 vector } m_axi_eventSlice_AWLOCK { O 2 vector } m_axi_eventSlice_AWCACHE { O 4 vector } m_axi_eventSlice_AWPROT { O 3 vector } m_axi_eventSlice_AWQOS { O 4 vector } m_axi_eventSlice_AWREGION { O 4 vector } m_axi_eventSlice_AWUSER { O 1 vector } m_axi_eventSlice_WVALID { O 1 bit } m_axi_eventSlice_WREADY { I 1 bit } m_axi_eventSlice_WDATA { O 8 vector } m_axi_eventSlice_WSTRB { O 1 vector } m_axi_eventSlice_WLAST { O 1 bit } m_axi_eventSlice_WID { O 1 vector } m_axi_eventSlice_WUSER { O 1 vector } m_axi_eventSlice_ARVALID { O 1 bit } m_axi_eventSlice_ARREADY { I 1 bit } m_axi_eventSlice_ARADDR { O 32 vector } m_axi_eventSlice_ARID { O 1 vector } m_axi_eventSlice_ARLEN { O 32 vector } m_axi_eventSlice_ARSIZE { O 3 vector } m_axi_eventSlice_ARBURST { O 2 vector } m_axi_eventSlice_ARLOCK { O 2 vector } m_axi_eventSlice_ARCACHE { O 4 vector } m_axi_eventSlice_ARPROT { O 3 vector } m_axi_eventSlice_ARQOS { O 4 vector } m_axi_eventSlice_ARREGION { O 4 vector } m_axi_eventSlice_ARUSER { O 1 vector } m_axi_eventSlice_RVALID { I 1 bit } m_axi_eventSlice_RREADY { O 1 bit } m_axi_eventSlice_RDATA { I 8 vector } m_axi_eventSlice_RLAST { I 1 bit } m_axi_eventSlice_RID { I 1 vector } m_axi_eventSlice_RUSER { I 1 vector } m_axi_eventSlice_RRESP { I 2 vector } m_axi_eventSlice_BVALID { I 1 bit } m_axi_eventSlice_BREADY { O 1 bit } m_axi_eventSlice_BRESP { I 2 vector } m_axi_eventSlice_BID { I 1 vector } m_axi_eventSlice_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name eventSlice_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_eventSlice_offset \
    op interface \
    ports { eventSlice_offset { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


