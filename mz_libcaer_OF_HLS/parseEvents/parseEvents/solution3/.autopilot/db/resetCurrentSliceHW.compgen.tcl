# This script segment is generated automatically by AutoPilot

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
    id 1 \
    name glPLSlices_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename glPLSlices_0 \
    op interface \
    ports { glPLSlices_0_address0 { O 15 vector } glPLSlices_0_ce0 { O 1 bit } glPLSlices_0_we0 { O 1 bit } glPLSlices_0_d0 { O 8 vector } glPLSlices_0_address1 { O 15 vector } glPLSlices_0_ce1 { O 1 bit } glPLSlices_0_we1 { O 1 bit } glPLSlices_0_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2 \
    name glPLSlices_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename glPLSlices_1 \
    op interface \
    ports { glPLSlices_1_address0 { O 15 vector } glPLSlices_1_ce0 { O 1 bit } glPLSlices_1_we0 { O 1 bit } glPLSlices_1_d0 { O 8 vector } glPLSlices_1_address1 { O 15 vector } glPLSlices_1_ce1 { O 1 bit } glPLSlices_1_we1 { O 1 bit } glPLSlices_1_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3 \
    name glPLSlices_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename glPLSlices_2 \
    op interface \
    ports { glPLSlices_2_address0 { O 15 vector } glPLSlices_2_ce0 { O 1 bit } glPLSlices_2_we0 { O 1 bit } glPLSlices_2_d0 { O 8 vector } glPLSlices_2_address1 { O 15 vector } glPLSlices_2_ce1 { O 1 bit } glPLSlices_2_we1 { O 1 bit } glPLSlices_2_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4 \
    name glPLSlices_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename glPLSlices_3 \
    op interface \
    ports { glPLSlices_3_address0 { O 15 vector } glPLSlices_3_ce0 { O 1 bit } glPLSlices_3_we0 { O 1 bit } glPLSlices_3_d0 { O 8 vector } glPLSlices_3_address1 { O 15 vector } glPLSlices_3_ce1 { O 1 bit } glPLSlices_3_we1 { O 1 bit } glPLSlices_3_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_3'"
}
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


