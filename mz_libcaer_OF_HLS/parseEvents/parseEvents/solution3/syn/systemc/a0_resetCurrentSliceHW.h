// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _a0_resetCurrentSliceHW_HH_
#define _a0_resetCurrentSliceHW_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct a0_resetCurrentSliceHW : public sc_module {
    // Port declarations 38
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_lv<15> > glPLSlices_0_address0;
    sc_out< sc_logic > glPLSlices_0_ce0;
    sc_out< sc_logic > glPLSlices_0_we0;
    sc_out< sc_lv<8> > glPLSlices_0_d0;
    sc_out< sc_lv<15> > glPLSlices_0_address1;
    sc_out< sc_logic > glPLSlices_0_ce1;
    sc_out< sc_logic > glPLSlices_0_we1;
    sc_out< sc_lv<8> > glPLSlices_0_d1;
    sc_out< sc_lv<15> > glPLSlices_1_address0;
    sc_out< sc_logic > glPLSlices_1_ce0;
    sc_out< sc_logic > glPLSlices_1_we0;
    sc_out< sc_lv<8> > glPLSlices_1_d0;
    sc_out< sc_lv<15> > glPLSlices_1_address1;
    sc_out< sc_logic > glPLSlices_1_ce1;
    sc_out< sc_logic > glPLSlices_1_we1;
    sc_out< sc_lv<8> > glPLSlices_1_d1;
    sc_out< sc_lv<15> > glPLSlices_2_address0;
    sc_out< sc_logic > glPLSlices_2_ce0;
    sc_out< sc_logic > glPLSlices_2_we0;
    sc_out< sc_lv<8> > glPLSlices_2_d0;
    sc_out< sc_lv<15> > glPLSlices_2_address1;
    sc_out< sc_logic > glPLSlices_2_ce1;
    sc_out< sc_logic > glPLSlices_2_we1;
    sc_out< sc_lv<8> > glPLSlices_2_d1;
    sc_out< sc_lv<15> > glPLSlices_3_address0;
    sc_out< sc_logic > glPLSlices_3_ce0;
    sc_out< sc_logic > glPLSlices_3_we0;
    sc_out< sc_lv<8> > glPLSlices_3_d0;
    sc_out< sc_lv<15> > glPLSlices_3_address1;
    sc_out< sc_logic > glPLSlices_3_ce1;
    sc_out< sc_logic > glPLSlices_3_we1;
    sc_out< sc_lv<8> > glPLSlices_3_d1;


    // Module declarations
    a0_resetCurrentSliceHW(sc_module_name name);
    SC_HAS_PROCESS(a0_resetCurrentSliceHW);

    ~a0_resetCurrentSliceHW();

    sc_trace_file* mVcdFile;

    sc_signal< sc_lv<32> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<8> > i_1_fu_2135_p2;
    sc_signal< sc_lv<8> > i_1_reg_2954;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_lv<15> > tmp_3_fu_2165_p2;
    sc_signal< sc_lv<15> > tmp_3_reg_2959;
    sc_signal< sc_lv<1> > exitcond1_fu_2129_p2;
    sc_signal< sc_lv<16> > tmp_3_cast1_fu_2171_p1;
    sc_signal< sc_lv<16> > tmp_3_cast1_reg_2965;
    sc_signal< sc_lv<8> > i_reg_2118;
    sc_signal< sc_logic > ap_CS_fsm_state31;
    sc_signal< sc_lv<32> > tmp_3_cast_fu_2175_p1;
    sc_signal< sc_lv<32> > tmp_4_cast_fu_2189_p1;
    sc_signal< sc_lv<32> > tmp_5_cast_fu_2202_p1;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_lv<32> > tmp_6_cast_fu_2215_p1;
    sc_signal< sc_lv<32> > tmp_7_cast_fu_2228_p1;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<32> > tmp_8_cast_fu_2241_p1;
    sc_signal< sc_lv<32> > tmp_9_cast_fu_2254_p1;
    sc_signal< sc_logic > ap_CS_fsm_state5;
    sc_signal< sc_lv<32> > tmp_10_cast_fu_2267_p1;
    sc_signal< sc_lv<32> > tmp_11_cast_fu_2280_p1;
    sc_signal< sc_logic > ap_CS_fsm_state6;
    sc_signal< sc_lv<32> > tmp_12_cast_fu_2293_p1;
    sc_signal< sc_lv<32> > tmp_13_cast_fu_2306_p1;
    sc_signal< sc_logic > ap_CS_fsm_state7;
    sc_signal< sc_lv<32> > tmp_14_cast_fu_2319_p1;
    sc_signal< sc_lv<32> > tmp_15_cast_fu_2332_p1;
    sc_signal< sc_logic > ap_CS_fsm_state8;
    sc_signal< sc_lv<32> > tmp_16_cast_fu_2345_p1;
    sc_signal< sc_lv<32> > tmp_17_cast_fu_2358_p1;
    sc_signal< sc_logic > ap_CS_fsm_state9;
    sc_signal< sc_lv<32> > tmp_18_cast_fu_2371_p1;
    sc_signal< sc_lv<32> > tmp_19_cast_fu_2384_p1;
    sc_signal< sc_logic > ap_CS_fsm_state10;
    sc_signal< sc_lv<32> > tmp_20_cast_fu_2397_p1;
    sc_signal< sc_lv<32> > tmp_21_cast_fu_2410_p1;
    sc_signal< sc_logic > ap_CS_fsm_state11;
    sc_signal< sc_lv<32> > tmp_22_cast_fu_2423_p1;
    sc_signal< sc_lv<32> > tmp_23_cast_fu_2436_p1;
    sc_signal< sc_logic > ap_CS_fsm_state12;
    sc_signal< sc_lv<32> > tmp_24_cast_fu_2449_p1;
    sc_signal< sc_lv<32> > tmp_25_cast_fu_2462_p1;
    sc_signal< sc_logic > ap_CS_fsm_state13;
    sc_signal< sc_lv<32> > tmp_26_cast_fu_2475_p1;
    sc_signal< sc_lv<32> > tmp_27_cast_fu_2488_p1;
    sc_signal< sc_logic > ap_CS_fsm_state14;
    sc_signal< sc_lv<32> > tmp_28_cast_fu_2501_p1;
    sc_signal< sc_lv<32> > tmp_29_cast_fu_2514_p1;
    sc_signal< sc_logic > ap_CS_fsm_state15;
    sc_signal< sc_lv<32> > tmp_30_cast_fu_2527_p1;
    sc_signal< sc_lv<32> > tmp_31_cast_fu_2540_p1;
    sc_signal< sc_logic > ap_CS_fsm_state16;
    sc_signal< sc_lv<32> > tmp_32_cast_fu_2553_p1;
    sc_signal< sc_lv<32> > tmp_33_cast_fu_2566_p1;
    sc_signal< sc_logic > ap_CS_fsm_state17;
    sc_signal< sc_lv<32> > tmp_34_cast_fu_2579_p1;
    sc_signal< sc_lv<32> > tmp_35_cast_fu_2592_p1;
    sc_signal< sc_logic > ap_CS_fsm_state18;
    sc_signal< sc_lv<32> > tmp_36_cast_fu_2605_p1;
    sc_signal< sc_lv<32> > tmp_37_cast_fu_2618_p1;
    sc_signal< sc_logic > ap_CS_fsm_state19;
    sc_signal< sc_lv<32> > tmp_38_cast_fu_2631_p1;
    sc_signal< sc_lv<32> > tmp_39_cast_fu_2644_p1;
    sc_signal< sc_logic > ap_CS_fsm_state20;
    sc_signal< sc_lv<32> > tmp_40_cast_fu_2657_p1;
    sc_signal< sc_lv<32> > tmp_41_cast_fu_2670_p1;
    sc_signal< sc_logic > ap_CS_fsm_state21;
    sc_signal< sc_lv<32> > tmp_42_cast_fu_2683_p1;
    sc_signal< sc_lv<32> > tmp_43_cast_fu_2696_p1;
    sc_signal< sc_logic > ap_CS_fsm_state22;
    sc_signal< sc_lv<32> > tmp_44_cast_fu_2709_p1;
    sc_signal< sc_lv<32> > tmp_45_cast_fu_2722_p1;
    sc_signal< sc_logic > ap_CS_fsm_state23;
    sc_signal< sc_lv<32> > tmp_46_cast_fu_2735_p1;
    sc_signal< sc_lv<32> > tmp_47_cast_fu_2748_p1;
    sc_signal< sc_logic > ap_CS_fsm_state24;
    sc_signal< sc_lv<32> > tmp_48_cast_fu_2761_p1;
    sc_signal< sc_lv<32> > tmp_49_cast_fu_2774_p1;
    sc_signal< sc_logic > ap_CS_fsm_state25;
    sc_signal< sc_lv<32> > tmp_50_cast_fu_2787_p1;
    sc_signal< sc_lv<32> > tmp_51_cast_fu_2800_p1;
    sc_signal< sc_logic > ap_CS_fsm_state26;
    sc_signal< sc_lv<32> > tmp_52_cast_fu_2813_p1;
    sc_signal< sc_lv<32> > tmp_53_cast_fu_2826_p1;
    sc_signal< sc_logic > ap_CS_fsm_state27;
    sc_signal< sc_lv<32> > tmp_54_cast_fu_2839_p1;
    sc_signal< sc_lv<32> > tmp_55_cast_fu_2852_p1;
    sc_signal< sc_logic > ap_CS_fsm_state28;
    sc_signal< sc_lv<32> > tmp_56_cast_fu_2865_p1;
    sc_signal< sc_lv<32> > tmp_57_cast_fu_2878_p1;
    sc_signal< sc_logic > ap_CS_fsm_state29;
    sc_signal< sc_lv<32> > tmp_58_cast_fu_2891_p1;
    sc_signal< sc_lv<32> > tmp_59_cast_fu_2904_p1;
    sc_signal< sc_logic > ap_CS_fsm_state30;
    sc_signal< sc_lv<32> > tmp_60_cast_fu_2917_p1;
    sc_signal< sc_lv<32> > tmp_61_cast_fu_2930_p1;
    sc_signal< sc_lv<32> > tmp_62_cast_fu_2943_p1;
    sc_signal< sc_lv<14> > tmp_fu_2141_p3;
    sc_signal< sc_lv<10> > tmp_2_fu_2153_p3;
    sc_signal< sc_lv<15> > p_shl_cast_fu_2149_p1;
    sc_signal< sc_lv<15> > p_shl1_cast_fu_2161_p1;
    sc_signal< sc_lv<16> > tmp_4_fu_2183_p2;
    sc_signal< sc_lv<15> > tmp_5_fu_2197_p2;
    sc_signal< sc_lv<15> > tmp_6_fu_2210_p2;
    sc_signal< sc_lv<16> > tmp_7_fu_2223_p2;
    sc_signal< sc_lv<16> > tmp_8_fu_2236_p2;
    sc_signal< sc_lv<16> > tmp_9_fu_2249_p2;
    sc_signal< sc_lv<16> > tmp_s_fu_2262_p2;
    sc_signal< sc_lv<16> > tmp_10_fu_2275_p2;
    sc_signal< sc_lv<16> > tmp_11_fu_2288_p2;
    sc_signal< sc_lv<16> > tmp_12_fu_2301_p2;
    sc_signal< sc_lv<16> > tmp_13_fu_2314_p2;
    sc_signal< sc_lv<16> > tmp_14_fu_2327_p2;
    sc_signal< sc_lv<16> > tmp_15_fu_2340_p2;
    sc_signal< sc_lv<16> > tmp_16_fu_2353_p2;
    sc_signal< sc_lv<16> > tmp_17_fu_2366_p2;
    sc_signal< sc_lv<16> > tmp_18_fu_2379_p2;
    sc_signal< sc_lv<16> > tmp_19_fu_2392_p2;
    sc_signal< sc_lv<16> > tmp_20_fu_2405_p2;
    sc_signal< sc_lv<16> > tmp_21_fu_2418_p2;
    sc_signal< sc_lv<16> > tmp_22_fu_2431_p2;
    sc_signal< sc_lv<16> > tmp_23_fu_2444_p2;
    sc_signal< sc_lv<16> > tmp_24_fu_2457_p2;
    sc_signal< sc_lv<16> > tmp_25_fu_2470_p2;
    sc_signal< sc_lv<16> > tmp_26_fu_2483_p2;
    sc_signal< sc_lv<16> > tmp_27_fu_2496_p2;
    sc_signal< sc_lv<16> > tmp_28_fu_2509_p2;
    sc_signal< sc_lv<16> > tmp_29_fu_2522_p2;
    sc_signal< sc_lv<16> > tmp_30_fu_2535_p2;
    sc_signal< sc_lv<16> > tmp_31_fu_2548_p2;
    sc_signal< sc_lv<16> > tmp_32_fu_2561_p2;
    sc_signal< sc_lv<16> > tmp_33_fu_2574_p2;
    sc_signal< sc_lv<16> > tmp_34_fu_2587_p2;
    sc_signal< sc_lv<16> > tmp_35_fu_2600_p2;
    sc_signal< sc_lv<16> > tmp_36_fu_2613_p2;
    sc_signal< sc_lv<16> > tmp_37_fu_2626_p2;
    sc_signal< sc_lv<16> > tmp_38_fu_2639_p2;
    sc_signal< sc_lv<16> > tmp_39_fu_2652_p2;
    sc_signal< sc_lv<16> > tmp_40_fu_2665_p2;
    sc_signal< sc_lv<16> > tmp_41_fu_2678_p2;
    sc_signal< sc_lv<16> > tmp_42_fu_2691_p2;
    sc_signal< sc_lv<16> > tmp_43_fu_2704_p2;
    sc_signal< sc_lv<16> > tmp_44_fu_2717_p2;
    sc_signal< sc_lv<16> > tmp_45_fu_2730_p2;
    sc_signal< sc_lv<16> > tmp_46_fu_2743_p2;
    sc_signal< sc_lv<16> > tmp_47_fu_2756_p2;
    sc_signal< sc_lv<16> > tmp_48_fu_2769_p2;
    sc_signal< sc_lv<16> > tmp_49_fu_2782_p2;
    sc_signal< sc_lv<16> > tmp_50_fu_2795_p2;
    sc_signal< sc_lv<16> > tmp_51_fu_2808_p2;
    sc_signal< sc_lv<16> > tmp_52_fu_2821_p2;
    sc_signal< sc_lv<16> > tmp_53_fu_2834_p2;
    sc_signal< sc_lv<16> > tmp_54_fu_2847_p2;
    sc_signal< sc_lv<16> > tmp_55_fu_2860_p2;
    sc_signal< sc_lv<16> > tmp_56_fu_2873_p2;
    sc_signal< sc_lv<16> > tmp_57_fu_2886_p2;
    sc_signal< sc_lv<16> > tmp_58_fu_2899_p2;
    sc_signal< sc_lv<16> > tmp_59_fu_2912_p2;
    sc_signal< sc_lv<16> > tmp_60_fu_2925_p2;
    sc_signal< sc_lv<16> > tmp_61_fu_2938_p2;
    sc_signal< sc_logic > ap_CS_fsm_state32;
    sc_signal< sc_lv<32> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<32> ap_ST_fsm_state1;
    static const sc_lv<32> ap_ST_fsm_state2;
    static const sc_lv<32> ap_ST_fsm_state3;
    static const sc_lv<32> ap_ST_fsm_state4;
    static const sc_lv<32> ap_ST_fsm_state5;
    static const sc_lv<32> ap_ST_fsm_state6;
    static const sc_lv<32> ap_ST_fsm_state7;
    static const sc_lv<32> ap_ST_fsm_state8;
    static const sc_lv<32> ap_ST_fsm_state9;
    static const sc_lv<32> ap_ST_fsm_state10;
    static const sc_lv<32> ap_ST_fsm_state11;
    static const sc_lv<32> ap_ST_fsm_state12;
    static const sc_lv<32> ap_ST_fsm_state13;
    static const sc_lv<32> ap_ST_fsm_state14;
    static const sc_lv<32> ap_ST_fsm_state15;
    static const sc_lv<32> ap_ST_fsm_state16;
    static const sc_lv<32> ap_ST_fsm_state17;
    static const sc_lv<32> ap_ST_fsm_state18;
    static const sc_lv<32> ap_ST_fsm_state19;
    static const sc_lv<32> ap_ST_fsm_state20;
    static const sc_lv<32> ap_ST_fsm_state21;
    static const sc_lv<32> ap_ST_fsm_state22;
    static const sc_lv<32> ap_ST_fsm_state23;
    static const sc_lv<32> ap_ST_fsm_state24;
    static const sc_lv<32> ap_ST_fsm_state25;
    static const sc_lv<32> ap_ST_fsm_state26;
    static const sc_lv<32> ap_ST_fsm_state27;
    static const sc_lv<32> ap_ST_fsm_state28;
    static const sc_lv<32> ap_ST_fsm_state29;
    static const sc_lv<32> ap_ST_fsm_state30;
    static const sc_lv<32> ap_ST_fsm_state31;
    static const sc_lv<32> ap_ST_fsm_state32;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<8> ap_const_lv8_0;
    static const sc_lv<32> ap_const_lv32_1E;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_lv<32> ap_const_lv32_6;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<32> ap_const_lv32_A;
    static const sc_lv<32> ap_const_lv32_B;
    static const sc_lv<32> ap_const_lv32_C;
    static const sc_lv<32> ap_const_lv32_D;
    static const sc_lv<32> ap_const_lv32_E;
    static const sc_lv<32> ap_const_lv32_F;
    static const sc_lv<32> ap_const_lv32_10;
    static const sc_lv<32> ap_const_lv32_11;
    static const sc_lv<32> ap_const_lv32_12;
    static const sc_lv<32> ap_const_lv32_13;
    static const sc_lv<32> ap_const_lv32_14;
    static const sc_lv<32> ap_const_lv32_15;
    static const sc_lv<32> ap_const_lv32_16;
    static const sc_lv<32> ap_const_lv32_17;
    static const sc_lv<32> ap_const_lv32_18;
    static const sc_lv<32> ap_const_lv32_19;
    static const sc_lv<32> ap_const_lv32_1A;
    static const sc_lv<32> ap_const_lv32_1B;
    static const sc_lv<32> ap_const_lv32_1C;
    static const sc_lv<32> ap_const_lv32_1D;
    static const sc_lv<8> ap_const_lv8_B4;
    static const sc_lv<8> ap_const_lv8_1;
    static const sc_lv<6> ap_const_lv6_0;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<16> ap_const_lv16_1;
    static const sc_lv<15> ap_const_lv15_2;
    static const sc_lv<15> ap_const_lv15_3;
    static const sc_lv<16> ap_const_lv16_4;
    static const sc_lv<16> ap_const_lv16_5;
    static const sc_lv<16> ap_const_lv16_6;
    static const sc_lv<16> ap_const_lv16_7;
    static const sc_lv<16> ap_const_lv16_8;
    static const sc_lv<16> ap_const_lv16_9;
    static const sc_lv<16> ap_const_lv16_A;
    static const sc_lv<16> ap_const_lv16_B;
    static const sc_lv<16> ap_const_lv16_C;
    static const sc_lv<16> ap_const_lv16_D;
    static const sc_lv<16> ap_const_lv16_E;
    static const sc_lv<16> ap_const_lv16_F;
    static const sc_lv<16> ap_const_lv16_10;
    static const sc_lv<16> ap_const_lv16_11;
    static const sc_lv<16> ap_const_lv16_12;
    static const sc_lv<16> ap_const_lv16_13;
    static const sc_lv<16> ap_const_lv16_14;
    static const sc_lv<16> ap_const_lv16_15;
    static const sc_lv<16> ap_const_lv16_16;
    static const sc_lv<16> ap_const_lv16_17;
    static const sc_lv<16> ap_const_lv16_18;
    static const sc_lv<16> ap_const_lv16_19;
    static const sc_lv<16> ap_const_lv16_1A;
    static const sc_lv<16> ap_const_lv16_1B;
    static const sc_lv<16> ap_const_lv16_1C;
    static const sc_lv<16> ap_const_lv16_1D;
    static const sc_lv<16> ap_const_lv16_1E;
    static const sc_lv<16> ap_const_lv16_1F;
    static const sc_lv<16> ap_const_lv16_20;
    static const sc_lv<16> ap_const_lv16_21;
    static const sc_lv<16> ap_const_lv16_22;
    static const sc_lv<16> ap_const_lv16_23;
    static const sc_lv<16> ap_const_lv16_24;
    static const sc_lv<16> ap_const_lv16_25;
    static const sc_lv<16> ap_const_lv16_26;
    static const sc_lv<16> ap_const_lv16_27;
    static const sc_lv<16> ap_const_lv16_28;
    static const sc_lv<16> ap_const_lv16_29;
    static const sc_lv<16> ap_const_lv16_2A;
    static const sc_lv<16> ap_const_lv16_2B;
    static const sc_lv<16> ap_const_lv16_2C;
    static const sc_lv<16> ap_const_lv16_2D;
    static const sc_lv<16> ap_const_lv16_2E;
    static const sc_lv<16> ap_const_lv16_2F;
    static const sc_lv<16> ap_const_lv16_30;
    static const sc_lv<16> ap_const_lv16_31;
    static const sc_lv<16> ap_const_lv16_32;
    static const sc_lv<16> ap_const_lv16_33;
    static const sc_lv<16> ap_const_lv16_34;
    static const sc_lv<16> ap_const_lv16_35;
    static const sc_lv<16> ap_const_lv16_36;
    static const sc_lv<16> ap_const_lv16_37;
    static const sc_lv<16> ap_const_lv16_38;
    static const sc_lv<16> ap_const_lv16_39;
    static const sc_lv<16> ap_const_lv16_3A;
    static const sc_lv<16> ap_const_lv16_3B;
    static const sc_lv<32> ap_const_lv32_1F;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state10();
    void thread_ap_CS_fsm_state11();
    void thread_ap_CS_fsm_state12();
    void thread_ap_CS_fsm_state13();
    void thread_ap_CS_fsm_state14();
    void thread_ap_CS_fsm_state15();
    void thread_ap_CS_fsm_state16();
    void thread_ap_CS_fsm_state17();
    void thread_ap_CS_fsm_state18();
    void thread_ap_CS_fsm_state19();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state20();
    void thread_ap_CS_fsm_state21();
    void thread_ap_CS_fsm_state22();
    void thread_ap_CS_fsm_state23();
    void thread_ap_CS_fsm_state24();
    void thread_ap_CS_fsm_state25();
    void thread_ap_CS_fsm_state26();
    void thread_ap_CS_fsm_state27();
    void thread_ap_CS_fsm_state28();
    void thread_ap_CS_fsm_state29();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state30();
    void thread_ap_CS_fsm_state31();
    void thread_ap_CS_fsm_state32();
    void thread_ap_CS_fsm_state4();
    void thread_ap_CS_fsm_state5();
    void thread_ap_CS_fsm_state6();
    void thread_ap_CS_fsm_state7();
    void thread_ap_CS_fsm_state8();
    void thread_ap_CS_fsm_state9();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_exitcond1_fu_2129_p2();
    void thread_glPLSlices_0_address0();
    void thread_glPLSlices_0_address1();
    void thread_glPLSlices_0_ce0();
    void thread_glPLSlices_0_ce1();
    void thread_glPLSlices_0_d0();
    void thread_glPLSlices_0_d1();
    void thread_glPLSlices_0_we0();
    void thread_glPLSlices_0_we1();
    void thread_glPLSlices_1_address0();
    void thread_glPLSlices_1_address1();
    void thread_glPLSlices_1_ce0();
    void thread_glPLSlices_1_ce1();
    void thread_glPLSlices_1_d0();
    void thread_glPLSlices_1_d1();
    void thread_glPLSlices_1_we0();
    void thread_glPLSlices_1_we1();
    void thread_glPLSlices_2_address0();
    void thread_glPLSlices_2_address1();
    void thread_glPLSlices_2_ce0();
    void thread_glPLSlices_2_ce1();
    void thread_glPLSlices_2_d0();
    void thread_glPLSlices_2_d1();
    void thread_glPLSlices_2_we0();
    void thread_glPLSlices_2_we1();
    void thread_glPLSlices_3_address0();
    void thread_glPLSlices_3_address1();
    void thread_glPLSlices_3_ce0();
    void thread_glPLSlices_3_ce1();
    void thread_glPLSlices_3_d0();
    void thread_glPLSlices_3_d1();
    void thread_glPLSlices_3_we0();
    void thread_glPLSlices_3_we1();
    void thread_i_1_fu_2135_p2();
    void thread_p_shl1_cast_fu_2161_p1();
    void thread_p_shl_cast_fu_2149_p1();
    void thread_tmp_10_cast_fu_2267_p1();
    void thread_tmp_10_fu_2275_p2();
    void thread_tmp_11_cast_fu_2280_p1();
    void thread_tmp_11_fu_2288_p2();
    void thread_tmp_12_cast_fu_2293_p1();
    void thread_tmp_12_fu_2301_p2();
    void thread_tmp_13_cast_fu_2306_p1();
    void thread_tmp_13_fu_2314_p2();
    void thread_tmp_14_cast_fu_2319_p1();
    void thread_tmp_14_fu_2327_p2();
    void thread_tmp_15_cast_fu_2332_p1();
    void thread_tmp_15_fu_2340_p2();
    void thread_tmp_16_cast_fu_2345_p1();
    void thread_tmp_16_fu_2353_p2();
    void thread_tmp_17_cast_fu_2358_p1();
    void thread_tmp_17_fu_2366_p2();
    void thread_tmp_18_cast_fu_2371_p1();
    void thread_tmp_18_fu_2379_p2();
    void thread_tmp_19_cast_fu_2384_p1();
    void thread_tmp_19_fu_2392_p2();
    void thread_tmp_20_cast_fu_2397_p1();
    void thread_tmp_20_fu_2405_p2();
    void thread_tmp_21_cast_fu_2410_p1();
    void thread_tmp_21_fu_2418_p2();
    void thread_tmp_22_cast_fu_2423_p1();
    void thread_tmp_22_fu_2431_p2();
    void thread_tmp_23_cast_fu_2436_p1();
    void thread_tmp_23_fu_2444_p2();
    void thread_tmp_24_cast_fu_2449_p1();
    void thread_tmp_24_fu_2457_p2();
    void thread_tmp_25_cast_fu_2462_p1();
    void thread_tmp_25_fu_2470_p2();
    void thread_tmp_26_cast_fu_2475_p1();
    void thread_tmp_26_fu_2483_p2();
    void thread_tmp_27_cast_fu_2488_p1();
    void thread_tmp_27_fu_2496_p2();
    void thread_tmp_28_cast_fu_2501_p1();
    void thread_tmp_28_fu_2509_p2();
    void thread_tmp_29_cast_fu_2514_p1();
    void thread_tmp_29_fu_2522_p2();
    void thread_tmp_2_fu_2153_p3();
    void thread_tmp_30_cast_fu_2527_p1();
    void thread_tmp_30_fu_2535_p2();
    void thread_tmp_31_cast_fu_2540_p1();
    void thread_tmp_31_fu_2548_p2();
    void thread_tmp_32_cast_fu_2553_p1();
    void thread_tmp_32_fu_2561_p2();
    void thread_tmp_33_cast_fu_2566_p1();
    void thread_tmp_33_fu_2574_p2();
    void thread_tmp_34_cast_fu_2579_p1();
    void thread_tmp_34_fu_2587_p2();
    void thread_tmp_35_cast_fu_2592_p1();
    void thread_tmp_35_fu_2600_p2();
    void thread_tmp_36_cast_fu_2605_p1();
    void thread_tmp_36_fu_2613_p2();
    void thread_tmp_37_cast_fu_2618_p1();
    void thread_tmp_37_fu_2626_p2();
    void thread_tmp_38_cast_fu_2631_p1();
    void thread_tmp_38_fu_2639_p2();
    void thread_tmp_39_cast_fu_2644_p1();
    void thread_tmp_39_fu_2652_p2();
    void thread_tmp_3_cast1_fu_2171_p1();
    void thread_tmp_3_cast_fu_2175_p1();
    void thread_tmp_3_fu_2165_p2();
    void thread_tmp_40_cast_fu_2657_p1();
    void thread_tmp_40_fu_2665_p2();
    void thread_tmp_41_cast_fu_2670_p1();
    void thread_tmp_41_fu_2678_p2();
    void thread_tmp_42_cast_fu_2683_p1();
    void thread_tmp_42_fu_2691_p2();
    void thread_tmp_43_cast_fu_2696_p1();
    void thread_tmp_43_fu_2704_p2();
    void thread_tmp_44_cast_fu_2709_p1();
    void thread_tmp_44_fu_2717_p2();
    void thread_tmp_45_cast_fu_2722_p1();
    void thread_tmp_45_fu_2730_p2();
    void thread_tmp_46_cast_fu_2735_p1();
    void thread_tmp_46_fu_2743_p2();
    void thread_tmp_47_cast_fu_2748_p1();
    void thread_tmp_47_fu_2756_p2();
    void thread_tmp_48_cast_fu_2761_p1();
    void thread_tmp_48_fu_2769_p2();
    void thread_tmp_49_cast_fu_2774_p1();
    void thread_tmp_49_fu_2782_p2();
    void thread_tmp_4_cast_fu_2189_p1();
    void thread_tmp_4_fu_2183_p2();
    void thread_tmp_50_cast_fu_2787_p1();
    void thread_tmp_50_fu_2795_p2();
    void thread_tmp_51_cast_fu_2800_p1();
    void thread_tmp_51_fu_2808_p2();
    void thread_tmp_52_cast_fu_2813_p1();
    void thread_tmp_52_fu_2821_p2();
    void thread_tmp_53_cast_fu_2826_p1();
    void thread_tmp_53_fu_2834_p2();
    void thread_tmp_54_cast_fu_2839_p1();
    void thread_tmp_54_fu_2847_p2();
    void thread_tmp_55_cast_fu_2852_p1();
    void thread_tmp_55_fu_2860_p2();
    void thread_tmp_56_cast_fu_2865_p1();
    void thread_tmp_56_fu_2873_p2();
    void thread_tmp_57_cast_fu_2878_p1();
    void thread_tmp_57_fu_2886_p2();
    void thread_tmp_58_cast_fu_2891_p1();
    void thread_tmp_58_fu_2899_p2();
    void thread_tmp_59_cast_fu_2904_p1();
    void thread_tmp_59_fu_2912_p2();
    void thread_tmp_5_cast_fu_2202_p1();
    void thread_tmp_5_fu_2197_p2();
    void thread_tmp_60_cast_fu_2917_p1();
    void thread_tmp_60_fu_2925_p2();
    void thread_tmp_61_cast_fu_2930_p1();
    void thread_tmp_61_fu_2938_p2();
    void thread_tmp_62_cast_fu_2943_p1();
    void thread_tmp_6_cast_fu_2215_p1();
    void thread_tmp_6_fu_2210_p2();
    void thread_tmp_7_cast_fu_2228_p1();
    void thread_tmp_7_fu_2223_p2();
    void thread_tmp_8_cast_fu_2241_p1();
    void thread_tmp_8_fu_2236_p2();
    void thread_tmp_9_cast_fu_2254_p1();
    void thread_tmp_9_fu_2249_p2();
    void thread_tmp_fu_2141_p3();
    void thread_tmp_s_fu_2262_p2();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif