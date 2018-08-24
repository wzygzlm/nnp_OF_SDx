; ModuleID = 'E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution3/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i386-w64-mingw32"

@parseEvents_str = internal unnamed_addr constant [12 x i8] c"parseEvents\00"
@glPLSlices_3 = internal global [32400 x i8] zeroinitializer
@glPLSlices_2 = internal global [32400 x i8] zeroinitializer
@glPLSlices_1 = internal global [32400 x i8] zeroinitializer
@glPLSlices_0 = internal global [32400 x i8] zeroinitializer
@copyToPSLoop_copyToP = internal unnamed_addr constant [29 x i8] c"copyToPSLoop_copyToPS_label2\00"
@p_str9 = private unnamed_addr constant [7 x i8] c"direct\00", align 1
@p_str8 = private unnamed_addr constant [11 x i8] c"eventSlice\00", align 1
@p_str7 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1
@p_str6 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1
@p_str4 = private unnamed_addr constant [15 x i8] c"resetSliceLoop\00", align 1
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str10 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1
@p_str1 = private unnamed_addr constant [16 x i8] c"copyToPS_label2\00", align 1

define internal fastcc void @resetCurrentSliceHW() nounwind {
  br label %1

; <label>:1                                       ; preds = %2, %0
  %i = phi i8 [ 0, %0 ], [ %i_1, %2 ]
  %exitcond1 = icmp eq i8 %i, -76
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 180, i64 180, i64 180)
  %i_1 = add i8 %i, 1
  br i1 %exitcond1, label %3, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([15 x i8]* @p_str4) nounwind
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([15 x i8]* @p_str4) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %i, i6 0)
  %p_shl_cast = zext i14 %tmp to i15
  %tmp_2 = call i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8 %i, i2 0)
  %p_shl1_cast = zext i10 %tmp_2 to i15
  %tmp_3 = sub i15 %p_shl_cast, %p_shl1_cast
  %tmp_3_cast1 = sext i15 %tmp_3 to i16
  %tmp_3_cast = sext i15 %tmp_3 to i32
  %glPLSlices_0_addr = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_3_cast
  %tmp_4 = or i16 %tmp_3_cast1, 1
  %tmp_4_cast = zext i16 %tmp_4 to i32
  %glPLSlices_0_addr_1 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_4_cast
  %tmp_5 = or i15 %tmp_3, 2
  %tmp_5_cast = sext i15 %tmp_5 to i32
  %glPLSlices_0_addr_2 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_5_cast
  %tmp_6 = or i15 %tmp_3, 3
  %tmp_6_cast = sext i15 %tmp_6 to i32
  %glPLSlices_0_addr_3 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_6_cast
  %tmp_7 = add i16 %tmp_3_cast1, 4
  %tmp_7_cast = sext i16 %tmp_7 to i32
  %glPLSlices_0_addr_4 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_7_cast
  %tmp_8 = add i16 %tmp_3_cast1, 5
  %tmp_8_cast = sext i16 %tmp_8 to i32
  %glPLSlices_0_addr_5 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_8_cast
  %tmp_9 = add i16 %tmp_3_cast1, 6
  %tmp_9_cast = sext i16 %tmp_9 to i32
  %glPLSlices_0_addr_6 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_9_cast
  %tmp_s = add i16 %tmp_3_cast1, 7
  %tmp_10_cast = sext i16 %tmp_s to i32
  %glPLSlices_0_addr_7 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_10_cast
  %tmp_10 = add i16 %tmp_3_cast1, 8
  %tmp_11_cast = sext i16 %tmp_10 to i32
  %glPLSlices_0_addr_8 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_11_cast
  %tmp_11 = add i16 %tmp_3_cast1, 9
  %tmp_12_cast = sext i16 %tmp_11 to i32
  %glPLSlices_0_addr_9 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_12_cast
  %tmp_12 = add i16 %tmp_3_cast1, 10
  %tmp_13_cast = sext i16 %tmp_12 to i32
  %glPLSlices_0_addr_10 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_13_cast
  %tmp_13 = add i16 %tmp_3_cast1, 11
  %tmp_14_cast = sext i16 %tmp_13 to i32
  %glPLSlices_0_addr_11 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_14_cast
  %tmp_14 = add i16 %tmp_3_cast1, 12
  %tmp_15_cast = sext i16 %tmp_14 to i32
  %glPLSlices_0_addr_12 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_15_cast
  %tmp_15 = add i16 %tmp_3_cast1, 13
  %tmp_16_cast = sext i16 %tmp_15 to i32
  %glPLSlices_0_addr_13 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_16_cast
  %tmp_16 = add i16 %tmp_3_cast1, 14
  %tmp_17_cast = sext i16 %tmp_16 to i32
  %glPLSlices_0_addr_14 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_17_cast
  %tmp_17 = add i16 %tmp_3_cast1, 15
  %tmp_18_cast = sext i16 %tmp_17 to i32
  %glPLSlices_0_addr_15 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_18_cast
  %tmp_18 = add i16 %tmp_3_cast1, 16
  %tmp_19_cast = sext i16 %tmp_18 to i32
  %glPLSlices_0_addr_16 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_19_cast
  %tmp_19 = add i16 %tmp_3_cast1, 17
  %tmp_20_cast = sext i16 %tmp_19 to i32
  %glPLSlices_0_addr_17 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_20_cast
  %tmp_20 = add i16 %tmp_3_cast1, 18
  %tmp_21_cast = sext i16 %tmp_20 to i32
  %glPLSlices_0_addr_18 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_21_cast
  %tmp_21 = add i16 %tmp_3_cast1, 19
  %tmp_22_cast = sext i16 %tmp_21 to i32
  %glPLSlices_0_addr_19 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_22_cast
  %tmp_22 = add i16 %tmp_3_cast1, 20
  %tmp_23_cast = sext i16 %tmp_22 to i32
  %glPLSlices_0_addr_20 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_23_cast
  %tmp_23 = add i16 %tmp_3_cast1, 21
  %tmp_24_cast = sext i16 %tmp_23 to i32
  %glPLSlices_0_addr_21 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_24_cast
  %tmp_24 = add i16 %tmp_3_cast1, 22
  %tmp_25_cast = sext i16 %tmp_24 to i32
  %glPLSlices_0_addr_22 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_25_cast
  %tmp_25 = add i16 %tmp_3_cast1, 23
  %tmp_26_cast = sext i16 %tmp_25 to i32
  %glPLSlices_0_addr_23 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_26_cast
  %tmp_26 = add i16 %tmp_3_cast1, 24
  %tmp_27_cast = sext i16 %tmp_26 to i32
  %glPLSlices_0_addr_24 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_27_cast
  %tmp_27 = add i16 %tmp_3_cast1, 25
  %tmp_28_cast = sext i16 %tmp_27 to i32
  %glPLSlices_0_addr_25 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_28_cast
  %tmp_28 = add i16 %tmp_3_cast1, 26
  %tmp_29_cast = sext i16 %tmp_28 to i32
  %glPLSlices_0_addr_26 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_29_cast
  %tmp_29 = add i16 %tmp_3_cast1, 27
  %tmp_30_cast = sext i16 %tmp_29 to i32
  %glPLSlices_0_addr_27 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_30_cast
  %tmp_30 = add i16 %tmp_3_cast1, 28
  %tmp_31_cast = sext i16 %tmp_30 to i32
  %glPLSlices_0_addr_28 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_31_cast
  %tmp_31 = add i16 %tmp_3_cast1, 29
  %tmp_32_cast = sext i16 %tmp_31 to i32
  %glPLSlices_0_addr_29 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_32_cast
  %tmp_32 = add i16 %tmp_3_cast1, 30
  %tmp_33_cast = sext i16 %tmp_32 to i32
  %glPLSlices_0_addr_30 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_33_cast
  %tmp_33 = add i16 %tmp_3_cast1, 31
  %tmp_34_cast = sext i16 %tmp_33 to i32
  %glPLSlices_0_addr_31 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_34_cast
  %tmp_34 = add i16 %tmp_3_cast1, 32
  %tmp_35_cast = sext i16 %tmp_34 to i32
  %glPLSlices_0_addr_32 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_35_cast
  %tmp_35 = add i16 %tmp_3_cast1, 33
  %tmp_36_cast = sext i16 %tmp_35 to i32
  %glPLSlices_0_addr_33 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_36_cast
  %tmp_36 = add i16 %tmp_3_cast1, 34
  %tmp_37_cast = sext i16 %tmp_36 to i32
  %glPLSlices_0_addr_34 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_37_cast
  %tmp_37 = add i16 %tmp_3_cast1, 35
  %tmp_38_cast = sext i16 %tmp_37 to i32
  %glPLSlices_0_addr_35 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_38_cast
  %tmp_38 = add i16 %tmp_3_cast1, 36
  %tmp_39_cast = sext i16 %tmp_38 to i32
  %glPLSlices_0_addr_36 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_39_cast
  %tmp_39 = add i16 %tmp_3_cast1, 37
  %tmp_40_cast = sext i16 %tmp_39 to i32
  %glPLSlices_0_addr_37 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_40_cast
  %tmp_40 = add i16 %tmp_3_cast1, 38
  %tmp_41_cast = sext i16 %tmp_40 to i32
  %glPLSlices_0_addr_38 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_41_cast
  %tmp_41 = add i16 %tmp_3_cast1, 39
  %tmp_42_cast = sext i16 %tmp_41 to i32
  %glPLSlices_0_addr_39 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_42_cast
  %tmp_42 = add i16 %tmp_3_cast1, 40
  %tmp_43_cast = sext i16 %tmp_42 to i32
  %glPLSlices_0_addr_40 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_43_cast
  %tmp_43 = add i16 %tmp_3_cast1, 41
  %tmp_44_cast = sext i16 %tmp_43 to i32
  %glPLSlices_0_addr_41 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_44_cast
  %tmp_44 = add i16 %tmp_3_cast1, 42
  %tmp_45_cast = sext i16 %tmp_44 to i32
  %glPLSlices_0_addr_42 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_45_cast
  %tmp_45 = add i16 %tmp_3_cast1, 43
  %tmp_46_cast = sext i16 %tmp_45 to i32
  %glPLSlices_0_addr_43 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_46_cast
  %tmp_46 = add i16 %tmp_3_cast1, 44
  %tmp_47_cast = sext i16 %tmp_46 to i32
  %glPLSlices_0_addr_44 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_47_cast
  %tmp_47 = add i16 %tmp_3_cast1, 45
  %tmp_48_cast = sext i16 %tmp_47 to i32
  %glPLSlices_0_addr_45 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_48_cast
  %tmp_48 = add i16 %tmp_3_cast1, 46
  %tmp_49_cast = sext i16 %tmp_48 to i32
  %glPLSlices_0_addr_46 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_49_cast
  %tmp_49 = add i16 %tmp_3_cast1, 47
  %tmp_50_cast = sext i16 %tmp_49 to i32
  %glPLSlices_0_addr_47 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_50_cast
  %tmp_50 = add i16 %tmp_3_cast1, 48
  %tmp_51_cast = sext i16 %tmp_50 to i32
  %glPLSlices_0_addr_48 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_51_cast
  %tmp_51 = add i16 %tmp_3_cast1, 49
  %tmp_52_cast = sext i16 %tmp_51 to i32
  %glPLSlices_0_addr_49 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_52_cast
  %tmp_52 = add i16 %tmp_3_cast1, 50
  %tmp_53_cast = sext i16 %tmp_52 to i32
  %glPLSlices_0_addr_50 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_53_cast
  %tmp_53 = add i16 %tmp_3_cast1, 51
  %tmp_54_cast = sext i16 %tmp_53 to i32
  %glPLSlices_0_addr_51 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_54_cast
  %tmp_54 = add i16 %tmp_3_cast1, 52
  %tmp_55_cast = sext i16 %tmp_54 to i32
  %glPLSlices_0_addr_52 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_55_cast
  %tmp_55 = add i16 %tmp_3_cast1, 53
  %tmp_56_cast = sext i16 %tmp_55 to i32
  %glPLSlices_0_addr_53 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_56_cast
  %tmp_56 = add i16 %tmp_3_cast1, 54
  %tmp_57_cast = sext i16 %tmp_56 to i32
  %glPLSlices_0_addr_54 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_57_cast
  %tmp_57 = add i16 %tmp_3_cast1, 55
  %tmp_58_cast = sext i16 %tmp_57 to i32
  %glPLSlices_0_addr_55 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_58_cast
  %tmp_58 = add i16 %tmp_3_cast1, 56
  %tmp_59_cast = sext i16 %tmp_58 to i32
  %glPLSlices_0_addr_56 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_59_cast
  %tmp_59 = add i16 %tmp_3_cast1, 57
  %tmp_60_cast = sext i16 %tmp_59 to i32
  %glPLSlices_0_addr_57 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_60_cast
  %tmp_60 = add i16 %tmp_3_cast1, 58
  %tmp_61_cast = sext i16 %tmp_60 to i32
  %glPLSlices_0_addr_58 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_61_cast
  %tmp_61 = add i16 %tmp_3_cast1, 59
  %tmp_62_cast = sext i16 %tmp_61 to i32
  %glPLSlices_0_addr_59 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_62_cast
  %glPLSlices_1_addr = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_3_cast
  %glPLSlices_1_addr_1 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_4_cast
  %glPLSlices_1_addr_2 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_5_cast
  %glPLSlices_1_addr_3 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_6_cast
  %glPLSlices_1_addr_4 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_7_cast
  %glPLSlices_1_addr_5 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_8_cast
  %glPLSlices_1_addr_6 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_9_cast
  %glPLSlices_1_addr_7 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_10_cast
  %glPLSlices_1_addr_8 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_11_cast
  %glPLSlices_1_addr_9 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_12_cast
  %glPLSlices_1_addr_10 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_13_cast
  %glPLSlices_1_addr_11 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_14_cast
  %glPLSlices_1_addr_12 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_15_cast
  %glPLSlices_1_addr_13 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_16_cast
  %glPLSlices_1_addr_14 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_17_cast
  %glPLSlices_1_addr_15 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_18_cast
  %glPLSlices_1_addr_16 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_19_cast
  %glPLSlices_1_addr_17 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_20_cast
  %glPLSlices_1_addr_18 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_21_cast
  %glPLSlices_1_addr_19 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_22_cast
  %glPLSlices_1_addr_20 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_23_cast
  %glPLSlices_1_addr_21 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_24_cast
  %glPLSlices_1_addr_22 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_25_cast
  %glPLSlices_1_addr_23 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_26_cast
  %glPLSlices_1_addr_24 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_27_cast
  %glPLSlices_1_addr_25 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_28_cast
  %glPLSlices_1_addr_26 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_29_cast
  %glPLSlices_1_addr_27 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_30_cast
  %glPLSlices_1_addr_28 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_31_cast
  %glPLSlices_1_addr_29 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_32_cast
  %glPLSlices_1_addr_30 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_33_cast
  %glPLSlices_1_addr_31 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_34_cast
  %glPLSlices_1_addr_32 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_35_cast
  %glPLSlices_1_addr_33 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_36_cast
  %glPLSlices_1_addr_34 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_37_cast
  %glPLSlices_1_addr_35 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_38_cast
  %glPLSlices_1_addr_36 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_39_cast
  %glPLSlices_1_addr_37 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_40_cast
  %glPLSlices_1_addr_38 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_41_cast
  %glPLSlices_1_addr_39 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_42_cast
  %glPLSlices_1_addr_40 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_43_cast
  %glPLSlices_1_addr_41 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_44_cast
  %glPLSlices_1_addr_42 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_45_cast
  %glPLSlices_1_addr_43 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_46_cast
  %glPLSlices_1_addr_44 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_47_cast
  %glPLSlices_1_addr_45 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_48_cast
  %glPLSlices_1_addr_46 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_49_cast
  %glPLSlices_1_addr_47 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_50_cast
  %glPLSlices_1_addr_48 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_51_cast
  %glPLSlices_1_addr_49 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_52_cast
  %glPLSlices_1_addr_50 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_53_cast
  %glPLSlices_1_addr_51 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_54_cast
  %glPLSlices_1_addr_52 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_55_cast
  %glPLSlices_1_addr_53 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_56_cast
  %glPLSlices_1_addr_54 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_57_cast
  %glPLSlices_1_addr_55 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_58_cast
  %glPLSlices_1_addr_56 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_59_cast
  %glPLSlices_1_addr_57 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_60_cast
  %glPLSlices_1_addr_58 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_61_cast
  %glPLSlices_1_addr_59 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_62_cast
  %glPLSlices_2_addr = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_3_cast
  %glPLSlices_2_addr_1 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_4_cast
  %glPLSlices_2_addr_2 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_5_cast
  %glPLSlices_2_addr_3 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_6_cast
  %glPLSlices_2_addr_4 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_7_cast
  %glPLSlices_2_addr_5 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_8_cast
  %glPLSlices_2_addr_6 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_9_cast
  %glPLSlices_2_addr_7 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_10_cast
  %glPLSlices_2_addr_8 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_11_cast
  %glPLSlices_2_addr_9 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_12_cast
  %glPLSlices_2_addr_10 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_13_cast
  %glPLSlices_2_addr_11 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_14_cast
  %glPLSlices_2_addr_12 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_15_cast
  %glPLSlices_2_addr_13 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_16_cast
  %glPLSlices_2_addr_14 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_17_cast
  %glPLSlices_2_addr_15 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_18_cast
  %glPLSlices_2_addr_16 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_19_cast
  %glPLSlices_2_addr_17 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_20_cast
  %glPLSlices_2_addr_18 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_21_cast
  %glPLSlices_2_addr_19 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_22_cast
  %glPLSlices_2_addr_20 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_23_cast
  %glPLSlices_2_addr_21 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_24_cast
  %glPLSlices_2_addr_22 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_25_cast
  %glPLSlices_2_addr_23 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_26_cast
  %glPLSlices_2_addr_24 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_27_cast
  %glPLSlices_2_addr_25 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_28_cast
  %glPLSlices_2_addr_26 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_29_cast
  %glPLSlices_2_addr_27 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_30_cast
  %glPLSlices_2_addr_28 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_31_cast
  %glPLSlices_2_addr_29 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_32_cast
  %glPLSlices_2_addr_30 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_33_cast
  %glPLSlices_2_addr_31 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_34_cast
  %glPLSlices_2_addr_32 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_35_cast
  %glPLSlices_2_addr_33 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_36_cast
  %glPLSlices_2_addr_34 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_37_cast
  %glPLSlices_2_addr_35 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_38_cast
  %glPLSlices_2_addr_36 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_39_cast
  %glPLSlices_2_addr_37 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_40_cast
  %glPLSlices_2_addr_38 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_41_cast
  %glPLSlices_2_addr_39 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_42_cast
  %glPLSlices_2_addr_40 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_43_cast
  %glPLSlices_2_addr_41 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_44_cast
  %glPLSlices_2_addr_42 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_45_cast
  %glPLSlices_2_addr_43 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_46_cast
  %glPLSlices_2_addr_44 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_47_cast
  %glPLSlices_2_addr_45 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_48_cast
  %glPLSlices_2_addr_46 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_49_cast
  %glPLSlices_2_addr_47 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_50_cast
  %glPLSlices_2_addr_48 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_51_cast
  %glPLSlices_2_addr_49 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_52_cast
  %glPLSlices_2_addr_50 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_53_cast
  %glPLSlices_2_addr_51 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_54_cast
  %glPLSlices_2_addr_52 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_55_cast
  %glPLSlices_2_addr_53 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_56_cast
  %glPLSlices_2_addr_54 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_57_cast
  %glPLSlices_2_addr_55 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_58_cast
  %glPLSlices_2_addr_56 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_59_cast
  %glPLSlices_2_addr_57 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_60_cast
  %glPLSlices_2_addr_58 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_61_cast
  %glPLSlices_2_addr_59 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_62_cast
  %glPLSlices_3_addr = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_3_cast
  %glPLSlices_3_addr_1 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_4_cast
  %glPLSlices_3_addr_2 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_5_cast
  %glPLSlices_3_addr_3 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_6_cast
  %glPLSlices_3_addr_4 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_7_cast
  %glPLSlices_3_addr_5 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_8_cast
  %glPLSlices_3_addr_6 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_9_cast
  %glPLSlices_3_addr_7 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_10_cast
  %glPLSlices_3_addr_8 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_11_cast
  %glPLSlices_3_addr_9 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_12_cast
  %glPLSlices_3_addr_10 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_13_cast
  %glPLSlices_3_addr_11 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_14_cast
  %glPLSlices_3_addr_12 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_15_cast
  %glPLSlices_3_addr_13 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_16_cast
  %glPLSlices_3_addr_14 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_17_cast
  %glPLSlices_3_addr_15 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_18_cast
  %glPLSlices_3_addr_16 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_19_cast
  %glPLSlices_3_addr_17 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_20_cast
  %glPLSlices_3_addr_18 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_21_cast
  %glPLSlices_3_addr_19 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_22_cast
  %glPLSlices_3_addr_20 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_23_cast
  %glPLSlices_3_addr_21 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_24_cast
  %glPLSlices_3_addr_22 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_25_cast
  %glPLSlices_3_addr_23 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_26_cast
  %glPLSlices_3_addr_24 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_27_cast
  %glPLSlices_3_addr_25 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_28_cast
  %glPLSlices_3_addr_26 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_29_cast
  %glPLSlices_3_addr_27 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_30_cast
  %glPLSlices_3_addr_28 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_31_cast
  %glPLSlices_3_addr_29 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_32_cast
  %glPLSlices_3_addr_30 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_33_cast
  %glPLSlices_3_addr_31 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_34_cast
  %glPLSlices_3_addr_32 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_35_cast
  %glPLSlices_3_addr_33 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_36_cast
  %glPLSlices_3_addr_34 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_37_cast
  %glPLSlices_3_addr_35 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_38_cast
  %glPLSlices_3_addr_36 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_39_cast
  %glPLSlices_3_addr_37 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_40_cast
  %glPLSlices_3_addr_38 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_41_cast
  %glPLSlices_3_addr_39 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_42_cast
  %glPLSlices_3_addr_40 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_43_cast
  %glPLSlices_3_addr_41 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_44_cast
  %glPLSlices_3_addr_42 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_45_cast
  %glPLSlices_3_addr_43 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_46_cast
  %glPLSlices_3_addr_44 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_47_cast
  %glPLSlices_3_addr_45 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_48_cast
  %glPLSlices_3_addr_46 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_49_cast
  %glPLSlices_3_addr_47 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_50_cast
  %glPLSlices_3_addr_48 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_51_cast
  %glPLSlices_3_addr_49 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_52_cast
  %glPLSlices_3_addr_50 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_53_cast
  %glPLSlices_3_addr_51 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_54_cast
  %glPLSlices_3_addr_52 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_55_cast
  %glPLSlices_3_addr_53 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_56_cast
  %glPLSlices_3_addr_54 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_57_cast
  %glPLSlices_3_addr_55 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_58_cast
  %glPLSlices_3_addr_56 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_59_cast
  %glPLSlices_3_addr_57 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_60_cast
  %glPLSlices_3_addr_58 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_61_cast
  %glPLSlices_3_addr_59 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_62_cast
  store i8 0, i8* %glPLSlices_0_addr, align 4
  store i8 0, i8* %glPLSlices_0_addr_1, align 1
  store i8 0, i8* %glPLSlices_0_addr_2, align 2
  store i8 0, i8* %glPLSlices_0_addr_3, align 1
  store i8 0, i8* %glPLSlices_0_addr_4, align 4
  store i8 0, i8* %glPLSlices_0_addr_5, align 1
  store i8 0, i8* %glPLSlices_0_addr_6, align 2
  store i8 0, i8* %glPLSlices_0_addr_7, align 1
  store i8 0, i8* %glPLSlices_0_addr_8, align 4
  store i8 0, i8* %glPLSlices_0_addr_9, align 1
  store i8 0, i8* %glPLSlices_0_addr_10, align 2
  store i8 0, i8* %glPLSlices_0_addr_11, align 1
  store i8 0, i8* %glPLSlices_0_addr_12, align 4
  store i8 0, i8* %glPLSlices_0_addr_13, align 1
  store i8 0, i8* %glPLSlices_0_addr_14, align 2
  store i8 0, i8* %glPLSlices_0_addr_15, align 1
  store i8 0, i8* %glPLSlices_0_addr_16, align 4
  store i8 0, i8* %glPLSlices_0_addr_17, align 1
  store i8 0, i8* %glPLSlices_0_addr_18, align 2
  store i8 0, i8* %glPLSlices_0_addr_19, align 1
  store i8 0, i8* %glPLSlices_0_addr_20, align 4
  store i8 0, i8* %glPLSlices_0_addr_21, align 1
  store i8 0, i8* %glPLSlices_0_addr_22, align 2
  store i8 0, i8* %glPLSlices_0_addr_23, align 1
  store i8 0, i8* %glPLSlices_0_addr_24, align 4
  store i8 0, i8* %glPLSlices_0_addr_25, align 1
  store i8 0, i8* %glPLSlices_0_addr_26, align 2
  store i8 0, i8* %glPLSlices_0_addr_27, align 1
  store i8 0, i8* %glPLSlices_0_addr_28, align 4
  store i8 0, i8* %glPLSlices_0_addr_29, align 1
  store i8 0, i8* %glPLSlices_0_addr_30, align 2
  store i8 0, i8* %glPLSlices_0_addr_31, align 1
  store i8 0, i8* %glPLSlices_0_addr_32, align 4
  store i8 0, i8* %glPLSlices_0_addr_33, align 1
  store i8 0, i8* %glPLSlices_0_addr_34, align 2
  store i8 0, i8* %glPLSlices_0_addr_35, align 1
  store i8 0, i8* %glPLSlices_0_addr_36, align 4
  store i8 0, i8* %glPLSlices_0_addr_37, align 1
  store i8 0, i8* %glPLSlices_0_addr_38, align 2
  store i8 0, i8* %glPLSlices_0_addr_39, align 1
  store i8 0, i8* %glPLSlices_0_addr_40, align 4
  store i8 0, i8* %glPLSlices_0_addr_41, align 1
  store i8 0, i8* %glPLSlices_0_addr_42, align 2
  store i8 0, i8* %glPLSlices_0_addr_43, align 1
  store i8 0, i8* %glPLSlices_0_addr_44, align 4
  store i8 0, i8* %glPLSlices_0_addr_45, align 1
  store i8 0, i8* %glPLSlices_0_addr_46, align 2
  store i8 0, i8* %glPLSlices_0_addr_47, align 1
  store i8 0, i8* %glPLSlices_0_addr_48, align 4
  store i8 0, i8* %glPLSlices_0_addr_49, align 1
  store i8 0, i8* %glPLSlices_0_addr_50, align 2
  store i8 0, i8* %glPLSlices_0_addr_51, align 1
  store i8 0, i8* %glPLSlices_0_addr_52, align 4
  store i8 0, i8* %glPLSlices_0_addr_53, align 1
  store i8 0, i8* %glPLSlices_0_addr_54, align 2
  store i8 0, i8* %glPLSlices_0_addr_55, align 1
  store i8 0, i8* %glPLSlices_0_addr_56, align 4
  store i8 0, i8* %glPLSlices_0_addr_57, align 1
  store i8 0, i8* %glPLSlices_0_addr_58, align 2
  store i8 0, i8* %glPLSlices_0_addr_59, align 1
  store i8 0, i8* %glPLSlices_1_addr, align 4
  store i8 0, i8* %glPLSlices_1_addr_1, align 1
  store i8 0, i8* %glPLSlices_1_addr_2, align 2
  store i8 0, i8* %glPLSlices_1_addr_3, align 1
  store i8 0, i8* %glPLSlices_1_addr_4, align 4
  store i8 0, i8* %glPLSlices_1_addr_5, align 1
  store i8 0, i8* %glPLSlices_1_addr_6, align 2
  store i8 0, i8* %glPLSlices_1_addr_7, align 1
  store i8 0, i8* %glPLSlices_1_addr_8, align 4
  store i8 0, i8* %glPLSlices_1_addr_9, align 1
  store i8 0, i8* %glPLSlices_1_addr_10, align 2
  store i8 0, i8* %glPLSlices_1_addr_11, align 1
  store i8 0, i8* %glPLSlices_1_addr_12, align 4
  store i8 0, i8* %glPLSlices_1_addr_13, align 1
  store i8 0, i8* %glPLSlices_1_addr_14, align 2
  store i8 0, i8* %glPLSlices_1_addr_15, align 1
  store i8 0, i8* %glPLSlices_1_addr_16, align 4
  store i8 0, i8* %glPLSlices_1_addr_17, align 1
  store i8 0, i8* %glPLSlices_1_addr_18, align 2
  store i8 0, i8* %glPLSlices_1_addr_19, align 1
  store i8 0, i8* %glPLSlices_1_addr_20, align 4
  store i8 0, i8* %glPLSlices_1_addr_21, align 1
  store i8 0, i8* %glPLSlices_1_addr_22, align 2
  store i8 0, i8* %glPLSlices_1_addr_23, align 1
  store i8 0, i8* %glPLSlices_1_addr_24, align 4
  store i8 0, i8* %glPLSlices_1_addr_25, align 1
  store i8 0, i8* %glPLSlices_1_addr_26, align 2
  store i8 0, i8* %glPLSlices_1_addr_27, align 1
  store i8 0, i8* %glPLSlices_1_addr_28, align 4
  store i8 0, i8* %glPLSlices_1_addr_29, align 1
  store i8 0, i8* %glPLSlices_1_addr_30, align 2
  store i8 0, i8* %glPLSlices_1_addr_31, align 1
  store i8 0, i8* %glPLSlices_1_addr_32, align 4
  store i8 0, i8* %glPLSlices_1_addr_33, align 1
  store i8 0, i8* %glPLSlices_1_addr_34, align 2
  store i8 0, i8* %glPLSlices_1_addr_35, align 1
  store i8 0, i8* %glPLSlices_1_addr_36, align 4
  store i8 0, i8* %glPLSlices_1_addr_37, align 1
  store i8 0, i8* %glPLSlices_1_addr_38, align 2
  store i8 0, i8* %glPLSlices_1_addr_39, align 1
  store i8 0, i8* %glPLSlices_1_addr_40, align 4
  store i8 0, i8* %glPLSlices_1_addr_41, align 1
  store i8 0, i8* %glPLSlices_1_addr_42, align 2
  store i8 0, i8* %glPLSlices_1_addr_43, align 1
  store i8 0, i8* %glPLSlices_1_addr_44, align 4
  store i8 0, i8* %glPLSlices_1_addr_45, align 1
  store i8 0, i8* %glPLSlices_1_addr_46, align 2
  store i8 0, i8* %glPLSlices_1_addr_47, align 1
  store i8 0, i8* %glPLSlices_1_addr_48, align 4
  store i8 0, i8* %glPLSlices_1_addr_49, align 1
  store i8 0, i8* %glPLSlices_1_addr_50, align 2
  store i8 0, i8* %glPLSlices_1_addr_51, align 1
  store i8 0, i8* %glPLSlices_1_addr_52, align 4
  store i8 0, i8* %glPLSlices_1_addr_53, align 1
  store i8 0, i8* %glPLSlices_1_addr_54, align 2
  store i8 0, i8* %glPLSlices_1_addr_55, align 1
  store i8 0, i8* %glPLSlices_1_addr_56, align 4
  store i8 0, i8* %glPLSlices_1_addr_57, align 1
  store i8 0, i8* %glPLSlices_1_addr_58, align 2
  store i8 0, i8* %glPLSlices_1_addr_59, align 1
  store i8 0, i8* %glPLSlices_2_addr, align 4
  store i8 0, i8* %glPLSlices_2_addr_1, align 1
  store i8 0, i8* %glPLSlices_2_addr_2, align 2
  store i8 0, i8* %glPLSlices_2_addr_3, align 1
  store i8 0, i8* %glPLSlices_2_addr_4, align 4
  store i8 0, i8* %glPLSlices_2_addr_5, align 1
  store i8 0, i8* %glPLSlices_2_addr_6, align 2
  store i8 0, i8* %glPLSlices_2_addr_7, align 1
  store i8 0, i8* %glPLSlices_2_addr_8, align 4
  store i8 0, i8* %glPLSlices_2_addr_9, align 1
  store i8 0, i8* %glPLSlices_2_addr_10, align 2
  store i8 0, i8* %glPLSlices_2_addr_11, align 1
  store i8 0, i8* %glPLSlices_2_addr_12, align 4
  store i8 0, i8* %glPLSlices_2_addr_13, align 1
  store i8 0, i8* %glPLSlices_2_addr_14, align 2
  store i8 0, i8* %glPLSlices_2_addr_15, align 1
  store i8 0, i8* %glPLSlices_2_addr_16, align 4
  store i8 0, i8* %glPLSlices_2_addr_17, align 1
  store i8 0, i8* %glPLSlices_2_addr_18, align 2
  store i8 0, i8* %glPLSlices_2_addr_19, align 1
  store i8 0, i8* %glPLSlices_2_addr_20, align 4
  store i8 0, i8* %glPLSlices_2_addr_21, align 1
  store i8 0, i8* %glPLSlices_2_addr_22, align 2
  store i8 0, i8* %glPLSlices_2_addr_23, align 1
  store i8 0, i8* %glPLSlices_2_addr_24, align 4
  store i8 0, i8* %glPLSlices_2_addr_25, align 1
  store i8 0, i8* %glPLSlices_2_addr_26, align 2
  store i8 0, i8* %glPLSlices_2_addr_27, align 1
  store i8 0, i8* %glPLSlices_2_addr_28, align 4
  store i8 0, i8* %glPLSlices_2_addr_29, align 1
  store i8 0, i8* %glPLSlices_2_addr_30, align 2
  store i8 0, i8* %glPLSlices_2_addr_31, align 1
  store i8 0, i8* %glPLSlices_2_addr_32, align 4
  store i8 0, i8* %glPLSlices_2_addr_33, align 1
  store i8 0, i8* %glPLSlices_2_addr_34, align 2
  store i8 0, i8* %glPLSlices_2_addr_35, align 1
  store i8 0, i8* %glPLSlices_2_addr_36, align 4
  store i8 0, i8* %glPLSlices_2_addr_37, align 1
  store i8 0, i8* %glPLSlices_2_addr_38, align 2
  store i8 0, i8* %glPLSlices_2_addr_39, align 1
  store i8 0, i8* %glPLSlices_2_addr_40, align 4
  store i8 0, i8* %glPLSlices_2_addr_41, align 1
  store i8 0, i8* %glPLSlices_2_addr_42, align 2
  store i8 0, i8* %glPLSlices_2_addr_43, align 1
  store i8 0, i8* %glPLSlices_2_addr_44, align 4
  store i8 0, i8* %glPLSlices_2_addr_45, align 1
  store i8 0, i8* %glPLSlices_2_addr_46, align 2
  store i8 0, i8* %glPLSlices_2_addr_47, align 1
  store i8 0, i8* %glPLSlices_2_addr_48, align 4
  store i8 0, i8* %glPLSlices_2_addr_49, align 1
  store i8 0, i8* %glPLSlices_2_addr_50, align 2
  store i8 0, i8* %glPLSlices_2_addr_51, align 1
  store i8 0, i8* %glPLSlices_2_addr_52, align 4
  store i8 0, i8* %glPLSlices_2_addr_53, align 1
  store i8 0, i8* %glPLSlices_2_addr_54, align 2
  store i8 0, i8* %glPLSlices_2_addr_55, align 1
  store i8 0, i8* %glPLSlices_2_addr_56, align 4
  store i8 0, i8* %glPLSlices_2_addr_57, align 1
  store i8 0, i8* %glPLSlices_2_addr_58, align 2
  store i8 0, i8* %glPLSlices_2_addr_59, align 1
  store i8 0, i8* %glPLSlices_3_addr, align 4
  store i8 0, i8* %glPLSlices_3_addr_1, align 1
  store i8 0, i8* %glPLSlices_3_addr_2, align 2
  store i8 0, i8* %glPLSlices_3_addr_3, align 1
  store i8 0, i8* %glPLSlices_3_addr_4, align 4
  store i8 0, i8* %glPLSlices_3_addr_5, align 1
  store i8 0, i8* %glPLSlices_3_addr_6, align 2
  store i8 0, i8* %glPLSlices_3_addr_7, align 1
  store i8 0, i8* %glPLSlices_3_addr_8, align 4
  store i8 0, i8* %glPLSlices_3_addr_9, align 1
  store i8 0, i8* %glPLSlices_3_addr_10, align 2
  store i8 0, i8* %glPLSlices_3_addr_11, align 1
  store i8 0, i8* %glPLSlices_3_addr_12, align 4
  store i8 0, i8* %glPLSlices_3_addr_13, align 1
  store i8 0, i8* %glPLSlices_3_addr_14, align 2
  store i8 0, i8* %glPLSlices_3_addr_15, align 1
  store i8 0, i8* %glPLSlices_3_addr_16, align 4
  store i8 0, i8* %glPLSlices_3_addr_17, align 1
  store i8 0, i8* %glPLSlices_3_addr_18, align 2
  store i8 0, i8* %glPLSlices_3_addr_19, align 1
  store i8 0, i8* %glPLSlices_3_addr_20, align 4
  store i8 0, i8* %glPLSlices_3_addr_21, align 1
  store i8 0, i8* %glPLSlices_3_addr_22, align 2
  store i8 0, i8* %glPLSlices_3_addr_23, align 1
  store i8 0, i8* %glPLSlices_3_addr_24, align 4
  store i8 0, i8* %glPLSlices_3_addr_25, align 1
  store i8 0, i8* %glPLSlices_3_addr_26, align 2
  store i8 0, i8* %glPLSlices_3_addr_27, align 1
  store i8 0, i8* %glPLSlices_3_addr_28, align 4
  store i8 0, i8* %glPLSlices_3_addr_29, align 1
  store i8 0, i8* %glPLSlices_3_addr_30, align 2
  store i8 0, i8* %glPLSlices_3_addr_31, align 1
  store i8 0, i8* %glPLSlices_3_addr_32, align 4
  store i8 0, i8* %glPLSlices_3_addr_33, align 1
  store i8 0, i8* %glPLSlices_3_addr_34, align 2
  store i8 0, i8* %glPLSlices_3_addr_35, align 1
  store i8 0, i8* %glPLSlices_3_addr_36, align 4
  store i8 0, i8* %glPLSlices_3_addr_37, align 1
  store i8 0, i8* %glPLSlices_3_addr_38, align 2
  store i8 0, i8* %glPLSlices_3_addr_39, align 1
  store i8 0, i8* %glPLSlices_3_addr_40, align 4
  store i8 0, i8* %glPLSlices_3_addr_41, align 1
  store i8 0, i8* %glPLSlices_3_addr_42, align 2
  store i8 0, i8* %glPLSlices_3_addr_43, align 1
  store i8 0, i8* %glPLSlices_3_addr_44, align 4
  store i8 0, i8* %glPLSlices_3_addr_45, align 1
  store i8 0, i8* %glPLSlices_3_addr_46, align 2
  store i8 0, i8* %glPLSlices_3_addr_47, align 1
  store i8 0, i8* %glPLSlices_3_addr_48, align 4
  store i8 0, i8* %glPLSlices_3_addr_49, align 1
  store i8 0, i8* %glPLSlices_3_addr_50, align 2
  store i8 0, i8* %glPLSlices_3_addr_51, align 1
  store i8 0, i8* %glPLSlices_3_addr_52, align 4
  store i8 0, i8* %glPLSlices_3_addr_53, align 1
  store i8 0, i8* %glPLSlices_3_addr_54, align 2
  store i8 0, i8* %glPLSlices_3_addr_55, align 1
  store i8 0, i8* %glPLSlices_3_addr_56, align 4
  store i8 0, i8* %glPLSlices_3_addr_57, align 1
  store i8 0, i8* %glPLSlices_3_addr_58, align 2
  store i8 0, i8* %glPLSlices_3_addr_59, align 1
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([15 x i8]* @p_str4, i32 %tmp_1) nounwind
  br label %1

; <label>:3                                       ; preds = %1
  ret void
}

define void @parseEvents(i8* %eventSlice, i32* %data, i32 %eventsArraySize, i32 %eventSlice_offset) {
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %eventSlice), !map !26
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %data) nounwind, !map !32
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %eventsArraySize) nounwind, !map !36
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @parseEvents_str) nounwind
  %eventSlice_offset_re = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventSlice_offset)
  %eventsArraySize_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventsArraySize)
  call void (...)* @_ssdm_op_SpecInterface(i32* %data, [8 x i8]* @p_str6, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str8, [7 x i8]* @p_str9, [1 x i8]* @p_str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind
  call fastcc void @resetCurrentSliceHW()
  %tmp = shl i32 %eventsArraySize_read, 1
  %tmp_3 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %eventsArraySize_read, i32 30)
  %tmp_op_op9 = or i32 %tmp, 1
  %tmp_4 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_op_op9, i32 31)
  %p_neg = xor i32 %tmp, -1
  %p_lshr = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %p_neg, i32 1, i32 31)
  %p_neg_t = sub i31 0, %p_lshr
  %tmp_5 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %tmp_op_op9, i32 1, i32 31)
  %tmp_6 = select i1 %tmp_4, i31 %p_neg_t, i31 %tmp_5
  %tmp_7 = select i1 %tmp_3, i31 0, i31 %tmp_6
  %tmp_8 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %tmp_7, i1 false)
  br label %1

; <label>:1                                       ; preds = %accumulateHW.exit, %0
  %i = phi i32 [ 0, %0 ], [ %i_2, %accumulateHW.exit ]
  %tmp_9 = icmp eq i32 %i, %tmp_8
  br i1 %tmp_9, label %5, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str10) nounwind
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %data_read = call i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32* %data)
  %x_cast = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %data_read, i32 17, i32 31)
  %tmp_10 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %data_read, i32 1)
  br i1 %tmp_10, label %3, label %accumulateHW.exit

; <label>:3                                       ; preds = %2
  %tmp_11 = call i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32 %data_read, i32 2, i32 11)
  %p_shl_cast = call i16 @_ssdm_op_BitConcatenate.i16.i10.i6(i10 %tmp_11, i6 0)
  %tmp_12 = call i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32 %data_read, i32 2, i32 15)
  %p_shl3_cast = call i16 @_ssdm_op_BitConcatenate.i16.i14.i2(i14 %tmp_12, i2 0)
  %tmp_s = sub i16 %p_shl_cast, %p_shl3_cast
  %zext_cast = zext i15 %x_cast to i32
  %mul = mul i32 %zext_cast, 34953
  %tmp_13 = call i11 @_ssdm_op_PartSelect.i11.i32.i32.i32(i32 %mul, i32 21, i32 31)
  %arrayNo_i = sext i11 %tmp_13 to i15
  %arrayNo_i_cast = zext i15 %arrayNo_i to i16
  %newIndex_i = urem i15 %x_cast, 60
  %newIndex1_i_cast = zext i15 %newIndex_i to i16
  %tmp_62 = add i16 %newIndex1_i_cast, %tmp_s
  %tmp_69_cast = sext i16 %tmp_62 to i32
  %glPLSlices_0_addr = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_69_cast
  %glPLSlices_1_addr = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_69_cast
  %glPLSlices_2_addr = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_69_cast
  %glPLSlices_3_addr = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_69_cast
  %glPLSlices_0_load = load i8* %glPLSlices_0_addr, align 1
  %glPLSlices_1_load = load i8* %glPLSlices_1_addr, align 1
  %glPLSlices_2_load = load i8* %glPLSlices_2_addr, align 1
  %glPLSlices_3_load = load i8* %glPLSlices_3_addr, align 1
  %tmp_1 = call i8 @_ssdm_op_Mux.ap_auto.4i8.i16(i8 %glPLSlices_0_load, i8 %glPLSlices_1_load, i8 %glPLSlices_2_load, i8 %glPLSlices_3_load, i16 %arrayNo_i_cast) nounwind
  %tmp_3_i = add i8 %tmp_1, 1
  switch i15 %arrayNo_i, label %branch3.i [
    i15 0, label %branch0.i
    i15 1, label %branch1.i
    i15 2, label %branch2.i
  ]

; <label>:4                                       ; preds = %branch3.i, %branch2.i, %branch1.i, %branch0.i
  br label %accumulateHW.exit

branch0.i:                                        ; preds = %3
  store i8 %tmp_3_i, i8* %glPLSlices_0_addr, align 1
  br label %4

branch1.i:                                        ; preds = %3
  store i8 %tmp_3_i, i8* %glPLSlices_1_addr, align 1
  br label %4

branch2.i:                                        ; preds = %3
  store i8 %tmp_3_i, i8* %glPLSlices_2_addr, align 1
  br label %4

branch3.i:                                        ; preds = %3
  store i8 %tmp_3_i, i8* %glPLSlices_3_addr, align 1
  br label %4

accumulateHW.exit:                                ; preds = %2, %4
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @p_str10, i32 %tmp_2) nounwind
  %i_2 = add nsw i32 %i, 2
  br label %1

; <label>:5                                       ; preds = %1
  call fastcc void @copyToPS(i8* %eventSlice, i32 %eventSlice_offset_re)
  ret void
}

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare i18 @llvm.part.select.i18(i18, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define internal fastcc void @copyToPS(i8* %eventSlice, i32 %eventSlice_offset) {
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str8, [7 x i8]* @p_str9, [1 x i8]* @p_str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  %eventSlice_offset_re = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventSlice_offset)
  br label %1

; <label>:1                                       ; preds = %BurstBB35, %0
  %indvar_flatten = phi i16 [ 0, %0 ], [ %indvar_flatten_next, %BurstBB35 ]
  %i = phi i8 [ 0, %0 ], [ %tmp_mid2_v, %BurstBB35 ]
  %j = phi i8 [ 0, %0 ], [ %j_1, %BurstBB35 ]
  %p_shl = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %i, i8 0)
  %p_shl_cast = zext i16 %p_shl to i17
  %p_shl1 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %i, i4 0)
  %p_shl1_cast = zext i12 %p_shl1 to i17
  %tmp_s = sub i17 %p_shl_cast, %p_shl1_cast
  %exitcond_flatten = icmp eq i16 %indvar_flatten, -22336
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 43200, i64 43200, i64 43200)
  %indvar_flatten_next = add i16 %indvar_flatten, 1
  br i1 %exitcond_flatten, label %2, label %.reset

.reset:                                           ; preds = %1
  %i_3 = add i8 %i, 1
  call void (...)* @_ssdm_op_SpecLoopName([29 x i8]* @copyToPSLoop_copyToP)
  %exitcond = icmp eq i8 %j, -16
  %j_mid2 = select i1 %exitcond, i8 0, i8 %j
  %tmp_mid2_v = select i1 %exitcond, i8 %i_3, i8 %i
  %tmp = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %tmp_mid2_v, i6 0)
  %p_shl4_cast = zext i14 %tmp to i15
  %tmp_63 = call i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8 %tmp_mid2_v, i2 0)
  %p_shl5_cast = zext i10 %tmp_63 to i15
  %tmp_64 = sub i15 %p_shl4_cast, %p_shl5_cast
  %tmp_71_cast = sext i15 %tmp_64 to i16
  %p_shl_mid1 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %i_3, i8 0)
  %p_shl_cast_mid1 = zext i16 %p_shl_mid1 to i17
  %p_shl1_mid1 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %i_3, i4 0)
  %p_shl1_cast_mid1 = zext i12 %p_shl1_mid1 to i17
  %tmp_mid1 = sub i17 %p_shl_cast_mid1, %p_shl1_cast_mid1
  %tmp_mid2 = select i1 %exitcond, i17 %tmp_mid1, i17 %tmp_s
  %tmp_7_mid2 = sext i17 %tmp_mid2 to i32
  call void (...)* @_ssdm_op_SpecLoopName([16 x i8]* @p_str1) nounwind
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([16 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %zext_cast = zext i8 %j_mid2 to i18
  %mul = mul i18 %zext_cast, 274
  %tmp_14 = call i4 @_ssdm_op_PartSelect.i4.i18.i32.i32(i18 %mul, i32 14, i32 17)
  %arrayNo = sext i4 %tmp_14 to i8
  %arrayNo_cast = zext i8 %arrayNo to i16
  %newIndex = urem i8 %j_mid2, 60
  %newIndex2_cast = zext i8 %newIndex to i16
  %tmp_65 = add i16 %tmp_71_cast, %newIndex2_cast
  %tmp_72_cast = sext i16 %tmp_65 to i32
  %glPLSlices_0_addr = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_72_cast
  %glPLSlices_1_addr = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_72_cast
  %glPLSlices_2_addr = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_72_cast
  %glPLSlices_3_addr = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_72_cast
  %glPLSlices_0_load = load i8* %glPLSlices_0_addr, align 1
  %glPLSlices_1_load = load i8* %glPLSlices_1_addr, align 1
  %glPLSlices_2_load = load i8* %glPLSlices_2_addr, align 1
  %glPLSlices_3_load = load i8* %glPLSlices_3_addr, align 1
  %tmp_8 = call i8 @_ssdm_op_Mux.ap_auto.4i8.i16(i8 %glPLSlices_0_load, i8 %glPLSlices_1_load, i8 %glPLSlices_2_load, i8 %glPLSlices_3_load, i16 %arrayNo_cast) nounwind
  %sum2 = add i32 %eventSlice_offset_re, %tmp_7_mid2
  %eventSlice_addr = getelementptr i8* %eventSlice, i32 %sum2
  %tmp_15 = urem i16 %indvar_flatten, 240
  %tmp_16 = icmp eq i16 %tmp_15, 0
  br i1 %tmp_16, label %ReqBB, label %BurstBB

ReqBB:                                            ; preds = %.reset
  %eventSlice_addr_1_wr = call i1 @_ssdm_op_WriteReq.m_axi.i8P(i8* %eventSlice_addr, i32 240)
  br label %BurstBB

BurstBB:                                          ; preds = %ReqBB, %.reset
  call void @_ssdm_op_Write.m_axi.i8P(i8* %eventSlice_addr, i8 %tmp_8, i1 true)
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([16 x i8]* @p_str1, i32 %tmp_4) nounwind
  %j_1 = add i8 %j_mid2, 1
  %tmp_17 = urem i16 %indvar_flatten_next, 240
  %tmp_18 = icmp eq i16 %tmp_17, 0
  br i1 %tmp_18, label %RespBB, label %BurstBB35

RespBB:                                           ; preds = %BurstBB
  %eventSlice_addr_1_wr_1 = call i1 @_ssdm_op_WriteResp.m_axi.i8P(i8* %eventSlice_addr)
  br label %BurstBB35

BurstBB35:                                        ; preds = %RespBB, %BurstBB
  br label %1

; <label>:2                                       ; preds = %1
  ret void
}

define weak i1 @_ssdm_op_WriteResp.m_axi.i8P(i8*) {
entry:
  ret i1 true
}

define weak i1 @_ssdm_op_WriteReq.m_axi.i8P(i8*, i32) {
entry:
  ret i1 true
}

define weak void @_ssdm_op_Write.m_axi.i8P(i8*, i8, i1) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLoopTripCount(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLatency(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32*) {
entry:
  %empty = call i32 @_autotb_FifoRead_i32(i32* %0)
  ret i32 %empty
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i4 @_ssdm_op_PartSelect.i4.i18.i32.i32(i18, i32, i32) nounwind readnone {
entry:
  %empty = call i18 @llvm.part.select.i18(i18 %0, i32 %1, i32 %2)
  %empty_6 = trunc i18 %empty to i4
  ret i4 %empty_6
}

define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_7 = trunc i32 %empty to i31
  ret i31 %empty_7
}

define weak i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_8 = trunc i32 %empty to i15
  ret i15 %empty_8
}

define weak i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_9 = trunc i32 %empty to i14
  ret i14 %empty_9
}

define weak i11 @_ssdm_op_PartSelect.i11.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_10 = trunc i32 %empty to i11
  ret i11 %empty_10
}

define weak i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_11 = trunc i32 %empty to i10
  ret i10 %empty_11
}

define weak i8 @_ssdm_op_Mux.ap_auto.4i8.i16(i8, i8, i8, i8, i16) {
entry:
  switch i16 %4, label %case3 [
    i16 0, label %case0
    i16 1, label %case1
    i16 2, label %case2
  ]

case0:                                            ; preds = %case3, %case2, %case1, %entry
  %merge = phi i8 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ]
  ret i8 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_12 = and i32 %0, %empty
  %empty_13 = icmp ne i32 %empty_12, 0
  ret i1 %empty_13
}

define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2
  %empty_14 = shl i2 1, %empty
  %empty_15 = and i2 %0, %empty_14
  %empty_16 = icmp ne i2 %empty_15, 0
  ret i1 %empty_16
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone {
entry:
  %empty = zext i31 %0 to i32
  %empty_17 = zext i1 %1 to i32
  %empty_18 = shl i32 %empty, 1
  %empty_19 = or i32 %empty_18, %empty_17
  ret i32 %empty_19
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %0 to i16
  %empty_20 = zext i8 %1 to i16
  %empty_21 = shl i16 %empty, 8
  %empty_22 = or i16 %empty_21, %empty_20
  ret i16 %empty_22
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i14.i2(i14, i2) nounwind readnone {
entry:
  %empty = zext i14 %0 to i16
  %empty_23 = zext i2 %1 to i16
  %empty_24 = shl i16 %empty, 2
  %empty_25 = or i16 %empty_24, %empty_23
  ret i16 %empty_25
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i10.i6(i10, i6) nounwind readnone {
entry:
  %empty = zext i10 %0 to i16
  %empty_26 = zext i6 %1 to i16
  %empty_27 = shl i16 %empty, 6
  %empty_28 = or i16 %empty_27, %empty_26
  ret i16 %empty_28
}

define weak i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8, i6) nounwind readnone {
entry:
  %empty = zext i8 %0 to i14
  %empty_29 = zext i6 %1 to i14
  %empty_30 = shl i14 %empty, 6
  %empty_31 = or i14 %empty_30, %empty_29
  ret i14 %empty_31
}

define weak i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8, i4) nounwind readnone {
entry:
  %empty = zext i8 %0 to i12
  %empty_32 = zext i4 %1 to i12
  %empty_33 = shl i12 %empty, 4
  %empty_34 = or i12 %empty_33, %empty_32
  ret i12 %empty_34
}

define weak i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8, i2) nounwind readnone {
entry:
  %empty = zext i8 %0 to i10
  %empty_35 = zext i2 %1 to i10
  %empty_36 = shl i10 %empty, 2
  %empty_37 = or i10 %empty_36, %empty_35
  ret i10 %empty_37
}

declare i32 @_autotb_FifoRead_i32(i32*)

!opencl.kernels = !{!0, !7, !13, !19}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}
!axi4.master.portmap = !{!25}
!axi4.slave.bundlemap = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t", metadata !"_Bool", metadata !"int64_t"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"pol", metadata !"ts"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"int8_t*"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"eventSlice"}
!13 = metadata !{void ()* @resetCurrentSliceHW, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space"}
!15 = metadata !{metadata !"kernel_arg_access_qual"}
!16 = metadata !{metadata !"kernel_arg_type"}
!17 = metadata !{metadata !"kernel_arg_type_qual"}
!18 = metadata !{metadata !"kernel_arg_name"}
!19 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t*", metadata !"int32_t", metadata !"int8_t*"}
!23 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"", metadata !""}
!24 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"eventsArraySize", metadata !"eventSlice"}
!25 = metadata !{metadata !"eventSlice", metadata !"eventSlice_offset", metadata !"WRITEONLY"}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 0, i32 7, metadata !28}
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !"eventSlice", metadata !30, metadata !"signed char", i32 0, i32 7}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 0, i32 1}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0, i32 31, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"data", metadata !30, metadata !"unsigned int", i32 0, i32 31}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 31, metadata !38}
!38 = metadata !{metadata !39}
!39 = metadata !{metadata !"eventsArraySize", metadata !40, metadata !"int", i32 0, i32 31}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 0, i32 0, i32 0}
