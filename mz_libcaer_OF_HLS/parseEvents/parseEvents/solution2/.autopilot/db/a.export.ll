; ModuleID = 'E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution2/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i386-w64-mingw32"

@parseEvents_str = internal unnamed_addr constant [12 x i8] c"parseEvents\00"
@glPLSlices = internal global [129600 x i8] zeroinitializer
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
  %tmp = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %i, i8 0)
  %p_shl_cast = zext i16 %tmp to i17
  %tmp_2 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %i, i4 0)
  %p_shl1_cast = zext i12 %tmp_2 to i17
  %tmp_3 = sub i17 %p_shl_cast, %p_shl1_cast
  %tmp_3_cast1 = sext i17 %tmp_3 to i18
  %tmp_3_cast = sext i17 %tmp_3 to i32
  %glPLSlices_addr = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_3_cast
  %tmp_4 = or i18 %tmp_3_cast1, 1
  %tmp_4_cast = zext i18 %tmp_4 to i32
  %glPLSlices_addr_1 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_4_cast
  %tmp_5 = or i17 %tmp_3, 2
  %tmp_5_cast = sext i17 %tmp_5 to i32
  %glPLSlices_addr_2 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_5_cast
  %tmp_6 = or i17 %tmp_3, 3
  %tmp_6_cast = sext i17 %tmp_6 to i32
  %glPLSlices_addr_3 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_6_cast
  %tmp_7 = or i17 %tmp_3, 4
  %tmp_7_cast = sext i17 %tmp_7 to i32
  %glPLSlices_addr_4 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_7_cast
  %tmp_8 = or i17 %tmp_3, 5
  %tmp_8_cast = sext i17 %tmp_8 to i32
  %glPLSlices_addr_5 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_8_cast
  %tmp_9 = or i17 %tmp_3, 6
  %tmp_9_cast = sext i17 %tmp_9 to i32
  %glPLSlices_addr_6 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_9_cast
  %tmp_s = or i17 %tmp_3, 7
  %tmp_10_cast = sext i17 %tmp_s to i32
  %glPLSlices_addr_7 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_10_cast
  %tmp_10 = or i17 %tmp_3, 8
  %tmp_11_cast = sext i17 %tmp_10 to i32
  %glPLSlices_addr_8 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_11_cast
  %tmp_11 = or i17 %tmp_3, 9
  %tmp_12_cast = sext i17 %tmp_11 to i32
  %glPLSlices_addr_9 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_12_cast
  %tmp_12 = or i17 %tmp_3, 10
  %tmp_13_cast = sext i17 %tmp_12 to i32
  %glPLSlices_addr_10 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_13_cast
  %tmp_13 = or i17 %tmp_3, 11
  %tmp_14_cast = sext i17 %tmp_13 to i32
  %glPLSlices_addr_11 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_14_cast
  %tmp_14 = or i17 %tmp_3, 12
  %tmp_15_cast = sext i17 %tmp_14 to i32
  %glPLSlices_addr_12 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_15_cast
  %tmp_15 = or i17 %tmp_3, 13
  %tmp_16_cast = sext i17 %tmp_15 to i32
  %glPLSlices_addr_13 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_16_cast
  %tmp_16 = or i17 %tmp_3, 14
  %tmp_17_cast = sext i17 %tmp_16 to i32
  %glPLSlices_addr_14 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_17_cast
  %tmp_17 = or i17 %tmp_3, 15
  %tmp_18_cast = sext i17 %tmp_17 to i32
  %glPLSlices_addr_15 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_18_cast
  %tmp_18 = add i18 %tmp_3_cast1, 16
  %tmp_19_cast = sext i18 %tmp_18 to i32
  %glPLSlices_addr_16 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_19_cast
  %tmp_19 = add i18 %tmp_3_cast1, 17
  %tmp_20_cast = sext i18 %tmp_19 to i32
  %glPLSlices_addr_17 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_20_cast
  %tmp_20 = add i18 %tmp_3_cast1, 18
  %tmp_21_cast = sext i18 %tmp_20 to i32
  %glPLSlices_addr_18 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_21_cast
  %tmp_21 = add i18 %tmp_3_cast1, 19
  %tmp_22_cast = sext i18 %tmp_21 to i32
  %glPLSlices_addr_19 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_22_cast
  %tmp_22 = add i18 %tmp_3_cast1, 20
  %tmp_23_cast = sext i18 %tmp_22 to i32
  %glPLSlices_addr_20 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_23_cast
  %tmp_23 = add i18 %tmp_3_cast1, 21
  %tmp_24_cast = sext i18 %tmp_23 to i32
  %glPLSlices_addr_21 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_24_cast
  %tmp_24 = add i18 %tmp_3_cast1, 22
  %tmp_25_cast = sext i18 %tmp_24 to i32
  %glPLSlices_addr_22 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_25_cast
  %tmp_25 = add i18 %tmp_3_cast1, 23
  %tmp_26_cast = sext i18 %tmp_25 to i32
  %glPLSlices_addr_23 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_26_cast
  %tmp_26 = add i18 %tmp_3_cast1, 24
  %tmp_27_cast = sext i18 %tmp_26 to i32
  %glPLSlices_addr_24 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_27_cast
  %tmp_27 = add i18 %tmp_3_cast1, 25
  %tmp_28_cast = sext i18 %tmp_27 to i32
  %glPLSlices_addr_25 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_28_cast
  %tmp_28 = add i18 %tmp_3_cast1, 26
  %tmp_29_cast = sext i18 %tmp_28 to i32
  %glPLSlices_addr_26 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_29_cast
  %tmp_29 = add i18 %tmp_3_cast1, 27
  %tmp_30_cast = sext i18 %tmp_29 to i32
  %glPLSlices_addr_27 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_30_cast
  %tmp_30 = add i18 %tmp_3_cast1, 28
  %tmp_31_cast = sext i18 %tmp_30 to i32
  %glPLSlices_addr_28 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_31_cast
  %tmp_31 = add i18 %tmp_3_cast1, 29
  %tmp_32_cast = sext i18 %tmp_31 to i32
  %glPLSlices_addr_29 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_32_cast
  %tmp_32 = add i18 %tmp_3_cast1, 30
  %tmp_33_cast = sext i18 %tmp_32 to i32
  %glPLSlices_addr_30 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_33_cast
  %tmp_33 = add i18 %tmp_3_cast1, 31
  %tmp_34_cast = sext i18 %tmp_33 to i32
  %glPLSlices_addr_31 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_34_cast
  %tmp_34 = add i18 %tmp_3_cast1, 32
  %tmp_35_cast = sext i18 %tmp_34 to i32
  %glPLSlices_addr_32 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_35_cast
  %tmp_35 = add i18 %tmp_3_cast1, 33
  %tmp_36_cast = sext i18 %tmp_35 to i32
  %glPLSlices_addr_33 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_36_cast
  %tmp_36 = add i18 %tmp_3_cast1, 34
  %tmp_37_cast = sext i18 %tmp_36 to i32
  %glPLSlices_addr_34 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_37_cast
  %tmp_37 = add i18 %tmp_3_cast1, 35
  %tmp_38_cast = sext i18 %tmp_37 to i32
  %glPLSlices_addr_35 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_38_cast
  %tmp_38 = add i18 %tmp_3_cast1, 36
  %tmp_39_cast = sext i18 %tmp_38 to i32
  %glPLSlices_addr_36 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_39_cast
  %tmp_39 = add i18 %tmp_3_cast1, 37
  %tmp_40_cast = sext i18 %tmp_39 to i32
  %glPLSlices_addr_37 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_40_cast
  %tmp_40 = add i18 %tmp_3_cast1, 38
  %tmp_41_cast = sext i18 %tmp_40 to i32
  %glPLSlices_addr_38 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_41_cast
  %tmp_41 = add i18 %tmp_3_cast1, 39
  %tmp_42_cast = sext i18 %tmp_41 to i32
  %glPLSlices_addr_39 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_42_cast
  %tmp_42 = add i18 %tmp_3_cast1, 40
  %tmp_43_cast = sext i18 %tmp_42 to i32
  %glPLSlices_addr_40 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_43_cast
  %tmp_43 = add i18 %tmp_3_cast1, 41
  %tmp_44_cast = sext i18 %tmp_43 to i32
  %glPLSlices_addr_41 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_44_cast
  %tmp_44 = add i18 %tmp_3_cast1, 42
  %tmp_45_cast = sext i18 %tmp_44 to i32
  %glPLSlices_addr_42 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_45_cast
  %tmp_45 = add i18 %tmp_3_cast1, 43
  %tmp_46_cast = sext i18 %tmp_45 to i32
  %glPLSlices_addr_43 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_46_cast
  %tmp_46 = add i18 %tmp_3_cast1, 44
  %tmp_47_cast = sext i18 %tmp_46 to i32
  %glPLSlices_addr_44 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_47_cast
  %tmp_47 = add i18 %tmp_3_cast1, 45
  %tmp_48_cast = sext i18 %tmp_47 to i32
  %glPLSlices_addr_45 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_48_cast
  %tmp_48 = add i18 %tmp_3_cast1, 46
  %tmp_49_cast = sext i18 %tmp_48 to i32
  %glPLSlices_addr_46 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_49_cast
  %tmp_49 = add i18 %tmp_3_cast1, 47
  %tmp_50_cast = sext i18 %tmp_49 to i32
  %glPLSlices_addr_47 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_50_cast
  %tmp_50 = add i18 %tmp_3_cast1, 48
  %tmp_51_cast = sext i18 %tmp_50 to i32
  %glPLSlices_addr_48 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_51_cast
  %tmp_51 = add i18 %tmp_3_cast1, 49
  %tmp_52_cast = sext i18 %tmp_51 to i32
  %glPLSlices_addr_49 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_52_cast
  %tmp_52 = add i18 %tmp_3_cast1, 50
  %tmp_53_cast = sext i18 %tmp_52 to i32
  %glPLSlices_addr_50 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_53_cast
  %tmp_53 = add i18 %tmp_3_cast1, 51
  %tmp_54_cast = sext i18 %tmp_53 to i32
  %glPLSlices_addr_51 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_54_cast
  %tmp_54 = add i18 %tmp_3_cast1, 52
  %tmp_55_cast = sext i18 %tmp_54 to i32
  %glPLSlices_addr_52 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_55_cast
  %tmp_55 = add i18 %tmp_3_cast1, 53
  %tmp_56_cast = sext i18 %tmp_55 to i32
  %glPLSlices_addr_53 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_56_cast
  %tmp_56 = add i18 %tmp_3_cast1, 54
  %tmp_57_cast = sext i18 %tmp_56 to i32
  %glPLSlices_addr_54 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_57_cast
  %tmp_57 = add i18 %tmp_3_cast1, 55
  %tmp_58_cast = sext i18 %tmp_57 to i32
  %glPLSlices_addr_55 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_58_cast
  %tmp_58 = add i18 %tmp_3_cast1, 56
  %tmp_59_cast = sext i18 %tmp_58 to i32
  %glPLSlices_addr_56 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_59_cast
  %tmp_59 = add i18 %tmp_3_cast1, 57
  %tmp_60_cast = sext i18 %tmp_59 to i32
  %glPLSlices_addr_57 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_60_cast
  %tmp_60 = add i18 %tmp_3_cast1, 58
  %tmp_61_cast = sext i18 %tmp_60 to i32
  %glPLSlices_addr_58 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_61_cast
  %tmp_61 = add i18 %tmp_3_cast1, 59
  %tmp_62_cast = sext i18 %tmp_61 to i32
  %glPLSlices_addr_59 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_62_cast
  %tmp_62 = add i18 %tmp_3_cast1, 60
  %tmp_63_cast = sext i18 %tmp_62 to i32
  %glPLSlices_addr_60 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_63_cast
  %tmp_63 = add i18 %tmp_3_cast1, 61
  %tmp_64_cast = sext i18 %tmp_63 to i32
  %glPLSlices_addr_61 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_64_cast
  %tmp_64 = add i18 %tmp_3_cast1, 62
  %tmp_65_cast = sext i18 %tmp_64 to i32
  %glPLSlices_addr_62 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_65_cast
  %tmp_65 = add i18 %tmp_3_cast1, 63
  %tmp_66_cast = sext i18 %tmp_65 to i32
  %glPLSlices_addr_63 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_66_cast
  %tmp_66 = add i18 %tmp_3_cast1, 64
  %tmp_67_cast = sext i18 %tmp_66 to i32
  %glPLSlices_addr_64 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_67_cast
  %tmp_67 = add i18 %tmp_3_cast1, 65
  %tmp_68_cast = sext i18 %tmp_67 to i32
  %glPLSlices_addr_65 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_68_cast
  %tmp_68 = add i18 %tmp_3_cast1, 66
  %tmp_69_cast = sext i18 %tmp_68 to i32
  %glPLSlices_addr_66 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_69_cast
  %tmp_69 = add i18 %tmp_3_cast1, 67
  %tmp_70_cast = sext i18 %tmp_69 to i32
  %glPLSlices_addr_67 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_70_cast
  %tmp_70 = add i18 %tmp_3_cast1, 68
  %tmp_71_cast = sext i18 %tmp_70 to i32
  %glPLSlices_addr_68 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_71_cast
  %tmp_71 = add i18 %tmp_3_cast1, 69
  %tmp_72_cast = sext i18 %tmp_71 to i32
  %glPLSlices_addr_69 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_72_cast
  %tmp_72 = add i18 %tmp_3_cast1, 70
  %tmp_73_cast = sext i18 %tmp_72 to i32
  %glPLSlices_addr_70 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_73_cast
  %tmp_73 = add i18 %tmp_3_cast1, 71
  %tmp_74_cast = sext i18 %tmp_73 to i32
  %glPLSlices_addr_71 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_74_cast
  %tmp_74 = add i18 %tmp_3_cast1, 72
  %tmp_75_cast = sext i18 %tmp_74 to i32
  %glPLSlices_addr_72 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_75_cast
  %tmp_75 = add i18 %tmp_3_cast1, 73
  %tmp_76_cast = sext i18 %tmp_75 to i32
  %glPLSlices_addr_73 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_76_cast
  %tmp_76 = add i18 %tmp_3_cast1, 74
  %tmp_77_cast = sext i18 %tmp_76 to i32
  %glPLSlices_addr_74 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_77_cast
  %tmp_77 = add i18 %tmp_3_cast1, 75
  %tmp_78_cast = sext i18 %tmp_77 to i32
  %glPLSlices_addr_75 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_78_cast
  %tmp_78 = add i18 %tmp_3_cast1, 76
  %tmp_79_cast = sext i18 %tmp_78 to i32
  %glPLSlices_addr_76 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_79_cast
  %tmp_79 = add i18 %tmp_3_cast1, 77
  %tmp_80_cast = sext i18 %tmp_79 to i32
  %glPLSlices_addr_77 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_80_cast
  %tmp_80 = add i18 %tmp_3_cast1, 78
  %tmp_81_cast = sext i18 %tmp_80 to i32
  %glPLSlices_addr_78 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_81_cast
  %tmp_81 = add i18 %tmp_3_cast1, 79
  %tmp_82_cast = sext i18 %tmp_81 to i32
  %glPLSlices_addr_79 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_82_cast
  %tmp_82 = add i18 %tmp_3_cast1, 80
  %tmp_83_cast = sext i18 %tmp_82 to i32
  %glPLSlices_addr_80 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_83_cast
  %tmp_83 = add i18 %tmp_3_cast1, 81
  %tmp_84_cast = sext i18 %tmp_83 to i32
  %glPLSlices_addr_81 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_84_cast
  %tmp_84 = add i18 %tmp_3_cast1, 82
  %tmp_85_cast = sext i18 %tmp_84 to i32
  %glPLSlices_addr_82 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_85_cast
  %tmp_85 = add i18 %tmp_3_cast1, 83
  %tmp_86_cast = sext i18 %tmp_85 to i32
  %glPLSlices_addr_83 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_86_cast
  %tmp_86 = add i18 %tmp_3_cast1, 84
  %tmp_87_cast = sext i18 %tmp_86 to i32
  %glPLSlices_addr_84 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_87_cast
  %tmp_87 = add i18 %tmp_3_cast1, 85
  %tmp_88_cast = sext i18 %tmp_87 to i32
  %glPLSlices_addr_85 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_88_cast
  %tmp_88 = add i18 %tmp_3_cast1, 86
  %tmp_89_cast = sext i18 %tmp_88 to i32
  %glPLSlices_addr_86 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_89_cast
  %tmp_89 = add i18 %tmp_3_cast1, 87
  %tmp_90_cast = sext i18 %tmp_89 to i32
  %glPLSlices_addr_87 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_90_cast
  %tmp_90 = add i18 %tmp_3_cast1, 88
  %tmp_91_cast = sext i18 %tmp_90 to i32
  %glPLSlices_addr_88 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_91_cast
  %tmp_91 = add i18 %tmp_3_cast1, 89
  %tmp_92_cast = sext i18 %tmp_91 to i32
  %glPLSlices_addr_89 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_92_cast
  %tmp_92 = add i18 %tmp_3_cast1, 90
  %tmp_93_cast = sext i18 %tmp_92 to i32
  %glPLSlices_addr_90 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_93_cast
  %tmp_93 = add i18 %tmp_3_cast1, 91
  %tmp_94_cast = sext i18 %tmp_93 to i32
  %glPLSlices_addr_91 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_94_cast
  %tmp_94 = add i18 %tmp_3_cast1, 92
  %tmp_95_cast = sext i18 %tmp_94 to i32
  %glPLSlices_addr_92 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_95_cast
  %tmp_95 = add i18 %tmp_3_cast1, 93
  %tmp_96_cast = sext i18 %tmp_95 to i32
  %glPLSlices_addr_93 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_96_cast
  %tmp_96 = add i18 %tmp_3_cast1, 94
  %tmp_97_cast = sext i18 %tmp_96 to i32
  %glPLSlices_addr_94 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_97_cast
  %tmp_97 = add i18 %tmp_3_cast1, 95
  %tmp_98_cast = sext i18 %tmp_97 to i32
  %glPLSlices_addr_95 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_98_cast
  %tmp_98 = add i18 %tmp_3_cast1, 96
  %tmp_99_cast = sext i18 %tmp_98 to i32
  %glPLSlices_addr_96 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_99_cast
  %tmp_99 = add i18 %tmp_3_cast1, 97
  %tmp_100_cast = sext i18 %tmp_99 to i32
  %glPLSlices_addr_97 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_100_cast
  %tmp_100 = add i18 %tmp_3_cast1, 98
  %tmp_101_cast = sext i18 %tmp_100 to i32
  %glPLSlices_addr_98 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_101_cast
  %tmp_101 = add i18 %tmp_3_cast1, 99
  %tmp_102_cast = sext i18 %tmp_101 to i32
  %glPLSlices_addr_99 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_102_cast
  %tmp_102 = add i18 %tmp_3_cast1, 100
  %tmp_103_cast = sext i18 %tmp_102 to i32
  %glPLSlices_addr_100 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_103_cast
  %tmp_103 = add i18 %tmp_3_cast1, 101
  %tmp_104_cast = sext i18 %tmp_103 to i32
  %glPLSlices_addr_101 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_104_cast
  %tmp_104 = add i18 %tmp_3_cast1, 102
  %tmp_105_cast = sext i18 %tmp_104 to i32
  %glPLSlices_addr_102 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_105_cast
  %tmp_105 = add i18 %tmp_3_cast1, 103
  %tmp_106_cast = sext i18 %tmp_105 to i32
  %glPLSlices_addr_103 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_106_cast
  %tmp_106 = add i18 %tmp_3_cast1, 104
  %tmp_107_cast = sext i18 %tmp_106 to i32
  %glPLSlices_addr_104 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_107_cast
  %tmp_107 = add i18 %tmp_3_cast1, 105
  %tmp_108_cast = sext i18 %tmp_107 to i32
  %glPLSlices_addr_105 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_108_cast
  %tmp_108 = add i18 %tmp_3_cast1, 106
  %tmp_109_cast = sext i18 %tmp_108 to i32
  %glPLSlices_addr_106 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_109_cast
  %tmp_109 = add i18 %tmp_3_cast1, 107
  %tmp_110_cast = sext i18 %tmp_109 to i32
  %glPLSlices_addr_107 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_110_cast
  %tmp_110 = add i18 %tmp_3_cast1, 108
  %tmp_111_cast = sext i18 %tmp_110 to i32
  %glPLSlices_addr_108 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_111_cast
  %tmp_111 = add i18 %tmp_3_cast1, 109
  %tmp_112_cast = sext i18 %tmp_111 to i32
  %glPLSlices_addr_109 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_112_cast
  %tmp_112 = add i18 %tmp_3_cast1, 110
  %tmp_113_cast = sext i18 %tmp_112 to i32
  %glPLSlices_addr_110 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_113_cast
  %tmp_113 = add i18 %tmp_3_cast1, 111
  %tmp_114_cast = sext i18 %tmp_113 to i32
  %glPLSlices_addr_111 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_114_cast
  %tmp_114 = add i18 %tmp_3_cast1, 112
  %tmp_115_cast = sext i18 %tmp_114 to i32
  %glPLSlices_addr_112 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_115_cast
  %tmp_115 = add i18 %tmp_3_cast1, 113
  %tmp_116_cast = sext i18 %tmp_115 to i32
  %glPLSlices_addr_113 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_116_cast
  %tmp_116 = add i18 %tmp_3_cast1, 114
  %tmp_117_cast = sext i18 %tmp_116 to i32
  %glPLSlices_addr_114 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_117_cast
  %tmp_117 = add i18 %tmp_3_cast1, 115
  %tmp_118_cast = sext i18 %tmp_117 to i32
  %glPLSlices_addr_115 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_118_cast
  %tmp_118 = add i18 %tmp_3_cast1, 116
  %tmp_119_cast = sext i18 %tmp_118 to i32
  %glPLSlices_addr_116 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_119_cast
  %tmp_119 = add i18 %tmp_3_cast1, 117
  %tmp_120_cast = sext i18 %tmp_119 to i32
  %glPLSlices_addr_117 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_120_cast
  %tmp_120 = add i18 %tmp_3_cast1, 118
  %tmp_121_cast = sext i18 %tmp_120 to i32
  %glPLSlices_addr_118 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_121_cast
  %tmp_121 = add i18 %tmp_3_cast1, 119
  %tmp_122_cast = sext i18 %tmp_121 to i32
  %glPLSlices_addr_119 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_122_cast
  %tmp_122 = add i18 %tmp_3_cast1, 120
  %tmp_123_cast = sext i18 %tmp_122 to i32
  %glPLSlices_addr_120 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_123_cast
  %tmp_123 = add i18 %tmp_3_cast1, 121
  %tmp_124_cast = sext i18 %tmp_123 to i32
  %glPLSlices_addr_121 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_124_cast
  %tmp_124 = add i18 %tmp_3_cast1, 122
  %tmp_125_cast = sext i18 %tmp_124 to i32
  %glPLSlices_addr_122 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_125_cast
  %tmp_125 = add i18 %tmp_3_cast1, 123
  %tmp_126_cast = sext i18 %tmp_125 to i32
  %glPLSlices_addr_123 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_126_cast
  %tmp_126 = add i18 %tmp_3_cast1, 124
  %tmp_127_cast = sext i18 %tmp_126 to i32
  %glPLSlices_addr_124 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_127_cast
  %tmp_127 = add i18 %tmp_3_cast1, 125
  %tmp_128_cast = sext i18 %tmp_127 to i32
  %glPLSlices_addr_125 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_128_cast
  %tmp_128 = add i18 %tmp_3_cast1, 126
  %tmp_129_cast = sext i18 %tmp_128 to i32
  %glPLSlices_addr_126 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_129_cast
  %tmp_129 = add i18 %tmp_3_cast1, 127
  %tmp_130_cast = sext i18 %tmp_129 to i32
  %glPLSlices_addr_127 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_130_cast
  %tmp_130 = add i18 %tmp_3_cast1, 128
  %tmp_131_cast = sext i18 %tmp_130 to i32
  %glPLSlices_addr_128 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_131_cast
  %tmp_131 = add i18 %tmp_3_cast1, 129
  %tmp_132_cast = sext i18 %tmp_131 to i32
  %glPLSlices_addr_129 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_132_cast
  %tmp_132 = add i18 %tmp_3_cast1, 130
  %tmp_133_cast = sext i18 %tmp_132 to i32
  %glPLSlices_addr_130 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_133_cast
  %tmp_133 = add i18 %tmp_3_cast1, 131
  %tmp_134_cast = sext i18 %tmp_133 to i32
  %glPLSlices_addr_131 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_134_cast
  %tmp_134 = add i18 %tmp_3_cast1, 132
  %tmp_135_cast = sext i18 %tmp_134 to i32
  %glPLSlices_addr_132 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_135_cast
  %tmp_135 = add i18 %tmp_3_cast1, 133
  %tmp_136_cast = sext i18 %tmp_135 to i32
  %glPLSlices_addr_133 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_136_cast
  %tmp_136 = add i18 %tmp_3_cast1, 134
  %tmp_137_cast = sext i18 %tmp_136 to i32
  %glPLSlices_addr_134 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_137_cast
  %tmp_137 = add i18 %tmp_3_cast1, 135
  %tmp_138_cast = sext i18 %tmp_137 to i32
  %glPLSlices_addr_135 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_138_cast
  %tmp_138 = add i18 %tmp_3_cast1, 136
  %tmp_139_cast = sext i18 %tmp_138 to i32
  %glPLSlices_addr_136 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_139_cast
  %tmp_139 = add i18 %tmp_3_cast1, 137
  %tmp_140_cast = sext i18 %tmp_139 to i32
  %glPLSlices_addr_137 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_140_cast
  %tmp_140 = add i18 %tmp_3_cast1, 138
  %tmp_141_cast = sext i18 %tmp_140 to i32
  %glPLSlices_addr_138 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_141_cast
  %tmp_141 = add i18 %tmp_3_cast1, 139
  %tmp_142_cast = sext i18 %tmp_141 to i32
  %glPLSlices_addr_139 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_142_cast
  %tmp_142 = add i18 %tmp_3_cast1, 140
  %tmp_143_cast = sext i18 %tmp_142 to i32
  %glPLSlices_addr_140 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_143_cast
  %tmp_143 = add i18 %tmp_3_cast1, 141
  %tmp_144_cast = sext i18 %tmp_143 to i32
  %glPLSlices_addr_141 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_144_cast
  %tmp_144 = add i18 %tmp_3_cast1, 142
  %tmp_145_cast = sext i18 %tmp_144 to i32
  %glPLSlices_addr_142 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_145_cast
  %tmp_145 = add i18 %tmp_3_cast1, 143
  %tmp_146_cast = sext i18 %tmp_145 to i32
  %glPLSlices_addr_143 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_146_cast
  %tmp_146 = add i18 %tmp_3_cast1, 144
  %tmp_147_cast = sext i18 %tmp_146 to i32
  %glPLSlices_addr_144 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_147_cast
  %tmp_147 = add i18 %tmp_3_cast1, 145
  %tmp_148_cast = sext i18 %tmp_147 to i32
  %glPLSlices_addr_145 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_148_cast
  %tmp_148 = add i18 %tmp_3_cast1, 146
  %tmp_149_cast = sext i18 %tmp_148 to i32
  %glPLSlices_addr_146 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_149_cast
  %tmp_149 = add i18 %tmp_3_cast1, 147
  %tmp_150_cast = sext i18 %tmp_149 to i32
  %glPLSlices_addr_147 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_150_cast
  %tmp_150 = add i18 %tmp_3_cast1, 148
  %tmp_151_cast = sext i18 %tmp_150 to i32
  %glPLSlices_addr_148 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_151_cast
  %tmp_151 = add i18 %tmp_3_cast1, 149
  %tmp_152_cast = sext i18 %tmp_151 to i32
  %glPLSlices_addr_149 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_152_cast
  %tmp_152 = add i18 %tmp_3_cast1, 150
  %tmp_153_cast = sext i18 %tmp_152 to i32
  %glPLSlices_addr_150 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_153_cast
  %tmp_153 = add i18 %tmp_3_cast1, 151
  %tmp_154_cast = sext i18 %tmp_153 to i32
  %glPLSlices_addr_151 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_154_cast
  %tmp_154 = add i18 %tmp_3_cast1, 152
  %tmp_155_cast = sext i18 %tmp_154 to i32
  %glPLSlices_addr_152 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_155_cast
  %tmp_155 = add i18 %tmp_3_cast1, 153
  %tmp_156_cast = sext i18 %tmp_155 to i32
  %glPLSlices_addr_153 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_156_cast
  %tmp_156 = add i18 %tmp_3_cast1, 154
  %tmp_157_cast = sext i18 %tmp_156 to i32
  %glPLSlices_addr_154 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_157_cast
  %tmp_157 = add i18 %tmp_3_cast1, 155
  %tmp_158_cast = sext i18 %tmp_157 to i32
  %glPLSlices_addr_155 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_158_cast
  %tmp_158 = add i18 %tmp_3_cast1, 156
  %tmp_159_cast = sext i18 %tmp_158 to i32
  %glPLSlices_addr_156 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_159_cast
  %tmp_159 = add i18 %tmp_3_cast1, 157
  %tmp_160_cast = sext i18 %tmp_159 to i32
  %glPLSlices_addr_157 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_160_cast
  %tmp_160 = add i18 %tmp_3_cast1, 158
  %tmp_161_cast = sext i18 %tmp_160 to i32
  %glPLSlices_addr_158 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_161_cast
  %tmp_161 = add i18 %tmp_3_cast1, 159
  %tmp_162_cast = sext i18 %tmp_161 to i32
  %glPLSlices_addr_159 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_162_cast
  %tmp_162 = add i18 %tmp_3_cast1, 160
  %tmp_163_cast = sext i18 %tmp_162 to i32
  %glPLSlices_addr_160 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_163_cast
  %tmp_163 = add i18 %tmp_3_cast1, 161
  %tmp_164_cast = sext i18 %tmp_163 to i32
  %glPLSlices_addr_161 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_164_cast
  %tmp_164 = add i18 %tmp_3_cast1, 162
  %tmp_165_cast = sext i18 %tmp_164 to i32
  %glPLSlices_addr_162 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_165_cast
  %tmp_165 = add i18 %tmp_3_cast1, 163
  %tmp_166_cast = sext i18 %tmp_165 to i32
  %glPLSlices_addr_163 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_166_cast
  %tmp_166 = add i18 %tmp_3_cast1, 164
  %tmp_167_cast = sext i18 %tmp_166 to i32
  %glPLSlices_addr_164 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_167_cast
  %tmp_167 = add i18 %tmp_3_cast1, 165
  %tmp_168_cast = sext i18 %tmp_167 to i32
  %glPLSlices_addr_165 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_168_cast
  %tmp_168 = add i18 %tmp_3_cast1, 166
  %tmp_169_cast = sext i18 %tmp_168 to i32
  %glPLSlices_addr_166 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_169_cast
  %tmp_169 = add i18 %tmp_3_cast1, 167
  %tmp_170_cast = sext i18 %tmp_169 to i32
  %glPLSlices_addr_167 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_170_cast
  %tmp_170 = add i18 %tmp_3_cast1, 168
  %tmp_171_cast = sext i18 %tmp_170 to i32
  %glPLSlices_addr_168 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_171_cast
  %tmp_171 = add i18 %tmp_3_cast1, 169
  %tmp_172_cast = sext i18 %tmp_171 to i32
  %glPLSlices_addr_169 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_172_cast
  %tmp_172 = add i18 %tmp_3_cast1, 170
  %tmp_173_cast = sext i18 %tmp_172 to i32
  %glPLSlices_addr_170 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_173_cast
  %tmp_173 = add i18 %tmp_3_cast1, 171
  %tmp_174_cast = sext i18 %tmp_173 to i32
  %glPLSlices_addr_171 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_174_cast
  %tmp_174 = add i18 %tmp_3_cast1, 172
  %tmp_175_cast = sext i18 %tmp_174 to i32
  %glPLSlices_addr_172 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_175_cast
  %tmp_175 = add i18 %tmp_3_cast1, 173
  %tmp_176_cast = sext i18 %tmp_175 to i32
  %glPLSlices_addr_173 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_176_cast
  %tmp_176 = add i18 %tmp_3_cast1, 174
  %tmp_177_cast = sext i18 %tmp_176 to i32
  %glPLSlices_addr_174 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_177_cast
  %tmp_177 = add i18 %tmp_3_cast1, 175
  %tmp_178_cast = sext i18 %tmp_177 to i32
  %glPLSlices_addr_175 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_178_cast
  %tmp_178 = add i18 %tmp_3_cast1, 176
  %tmp_179_cast = sext i18 %tmp_178 to i32
  %glPLSlices_addr_176 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_179_cast
  %tmp_179 = add i18 %tmp_3_cast1, 177
  %tmp_180_cast = sext i18 %tmp_179 to i32
  %glPLSlices_addr_177 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_180_cast
  %tmp_180 = add i18 %tmp_3_cast1, 178
  %tmp_181_cast = sext i18 %tmp_180 to i32
  %glPLSlices_addr_178 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_181_cast
  %tmp_181 = add i18 %tmp_3_cast1, 179
  %tmp_182_cast = sext i18 %tmp_181 to i32
  %glPLSlices_addr_179 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_182_cast
  %tmp_182 = add i18 %tmp_3_cast1, 180
  %tmp_183_cast = sext i18 %tmp_182 to i32
  %glPLSlices_addr_180 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_183_cast
  %tmp_183 = add i18 %tmp_3_cast1, 181
  %tmp_184_cast = sext i18 %tmp_183 to i32
  %glPLSlices_addr_181 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_184_cast
  %tmp_184 = add i18 %tmp_3_cast1, 182
  %tmp_185_cast = sext i18 %tmp_184 to i32
  %glPLSlices_addr_182 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_185_cast
  %tmp_185 = add i18 %tmp_3_cast1, 183
  %tmp_186_cast = sext i18 %tmp_185 to i32
  %glPLSlices_addr_183 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_186_cast
  %tmp_186 = add i18 %tmp_3_cast1, 184
  %tmp_187_cast = sext i18 %tmp_186 to i32
  %glPLSlices_addr_184 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_187_cast
  %tmp_187 = add i18 %tmp_3_cast1, 185
  %tmp_188_cast = sext i18 %tmp_187 to i32
  %glPLSlices_addr_185 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_188_cast
  %tmp_188 = add i18 %tmp_3_cast1, 186
  %tmp_189_cast = sext i18 %tmp_188 to i32
  %glPLSlices_addr_186 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_189_cast
  %tmp_189 = add i18 %tmp_3_cast1, 187
  %tmp_190_cast = sext i18 %tmp_189 to i32
  %glPLSlices_addr_187 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_190_cast
  %tmp_190 = add i18 %tmp_3_cast1, 188
  %tmp_191_cast = sext i18 %tmp_190 to i32
  %glPLSlices_addr_188 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_191_cast
  %tmp_191 = add i18 %tmp_3_cast1, 189
  %tmp_192_cast = sext i18 %tmp_191 to i32
  %glPLSlices_addr_189 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_192_cast
  %tmp_192 = add i18 %tmp_3_cast1, 190
  %tmp_193_cast = sext i18 %tmp_192 to i32
  %glPLSlices_addr_190 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_193_cast
  %tmp_193 = add i18 %tmp_3_cast1, 191
  %tmp_194_cast = sext i18 %tmp_193 to i32
  %glPLSlices_addr_191 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_194_cast
  %tmp_194 = add i18 %tmp_3_cast1, 192
  %tmp_195_cast = sext i18 %tmp_194 to i32
  %glPLSlices_addr_192 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_195_cast
  %tmp_195 = add i18 %tmp_3_cast1, 193
  %tmp_196_cast = sext i18 %tmp_195 to i32
  %glPLSlices_addr_193 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_196_cast
  %tmp_196 = add i18 %tmp_3_cast1, 194
  %tmp_197_cast = sext i18 %tmp_196 to i32
  %glPLSlices_addr_194 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_197_cast
  %tmp_197 = add i18 %tmp_3_cast1, 195
  %tmp_198_cast = sext i18 %tmp_197 to i32
  %glPLSlices_addr_195 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_198_cast
  %tmp_198 = add i18 %tmp_3_cast1, 196
  %tmp_199_cast = sext i18 %tmp_198 to i32
  %glPLSlices_addr_196 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_199_cast
  %tmp_199 = add i18 %tmp_3_cast1, 197
  %tmp_200_cast = sext i18 %tmp_199 to i32
  %glPLSlices_addr_197 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_200_cast
  %tmp_200 = add i18 %tmp_3_cast1, 198
  %tmp_201_cast = sext i18 %tmp_200 to i32
  %glPLSlices_addr_198 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_201_cast
  %tmp_201 = add i18 %tmp_3_cast1, 199
  %tmp_202_cast = sext i18 %tmp_201 to i32
  %glPLSlices_addr_199 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_202_cast
  %tmp_202 = add i18 %tmp_3_cast1, 200
  %tmp_203_cast = sext i18 %tmp_202 to i32
  %glPLSlices_addr_200 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_203_cast
  %tmp_203 = add i18 %tmp_3_cast1, 201
  %tmp_204_cast = sext i18 %tmp_203 to i32
  %glPLSlices_addr_201 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_204_cast
  %tmp_204 = add i18 %tmp_3_cast1, 202
  %tmp_205_cast = sext i18 %tmp_204 to i32
  %glPLSlices_addr_202 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_205_cast
  %tmp_205 = add i18 %tmp_3_cast1, 203
  %tmp_206_cast = sext i18 %tmp_205 to i32
  %glPLSlices_addr_203 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_206_cast
  %tmp_206 = add i18 %tmp_3_cast1, 204
  %tmp_207_cast = sext i18 %tmp_206 to i32
  %glPLSlices_addr_204 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_207_cast
  %tmp_207 = add i18 %tmp_3_cast1, 205
  %tmp_208_cast = sext i18 %tmp_207 to i32
  %glPLSlices_addr_205 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_208_cast
  %tmp_208 = add i18 %tmp_3_cast1, 206
  %tmp_209_cast = sext i18 %tmp_208 to i32
  %glPLSlices_addr_206 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_209_cast
  %tmp_209 = add i18 %tmp_3_cast1, 207
  %tmp_210_cast = sext i18 %tmp_209 to i32
  %glPLSlices_addr_207 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_210_cast
  %tmp_210 = add i18 %tmp_3_cast1, 208
  %tmp_211_cast = sext i18 %tmp_210 to i32
  %glPLSlices_addr_208 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_211_cast
  %tmp_211 = add i18 %tmp_3_cast1, 209
  %tmp_212_cast = sext i18 %tmp_211 to i32
  %glPLSlices_addr_209 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_212_cast
  %tmp_212 = add i18 %tmp_3_cast1, 210
  %tmp_213_cast = sext i18 %tmp_212 to i32
  %glPLSlices_addr_210 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_213_cast
  %tmp_213 = add i18 %tmp_3_cast1, 211
  %tmp_214_cast = sext i18 %tmp_213 to i32
  %glPLSlices_addr_211 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_214_cast
  %tmp_214 = add i18 %tmp_3_cast1, 212
  %tmp_215_cast = sext i18 %tmp_214 to i32
  %glPLSlices_addr_212 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_215_cast
  %tmp_215 = add i18 %tmp_3_cast1, 213
  %tmp_216_cast = sext i18 %tmp_215 to i32
  %glPLSlices_addr_213 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_216_cast
  %tmp_216 = add i18 %tmp_3_cast1, 214
  %tmp_217_cast = sext i18 %tmp_216 to i32
  %glPLSlices_addr_214 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_217_cast
  %tmp_217 = add i18 %tmp_3_cast1, 215
  %tmp_218_cast = sext i18 %tmp_217 to i32
  %glPLSlices_addr_215 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_218_cast
  %tmp_218 = add i18 %tmp_3_cast1, 216
  %tmp_219_cast = sext i18 %tmp_218 to i32
  %glPLSlices_addr_216 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_219_cast
  %tmp_219 = add i18 %tmp_3_cast1, 217
  %tmp_220_cast = sext i18 %tmp_219 to i32
  %glPLSlices_addr_217 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_220_cast
  %tmp_220 = add i18 %tmp_3_cast1, 218
  %tmp_221_cast = sext i18 %tmp_220 to i32
  %glPLSlices_addr_218 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_221_cast
  %tmp_221 = add i18 %tmp_3_cast1, 219
  %tmp_222_cast = sext i18 %tmp_221 to i32
  %glPLSlices_addr_219 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_222_cast
  %tmp_222 = add i18 %tmp_3_cast1, 220
  %tmp_223_cast = sext i18 %tmp_222 to i32
  %glPLSlices_addr_220 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_223_cast
  %tmp_223 = add i18 %tmp_3_cast1, 221
  %tmp_224_cast = sext i18 %tmp_223 to i32
  %glPLSlices_addr_221 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_224_cast
  %tmp_224 = add i18 %tmp_3_cast1, 222
  %tmp_225_cast = sext i18 %tmp_224 to i32
  %glPLSlices_addr_222 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_225_cast
  %tmp_225 = add i18 %tmp_3_cast1, 223
  %tmp_226_cast = sext i18 %tmp_225 to i32
  %glPLSlices_addr_223 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_226_cast
  %tmp_226 = add i18 %tmp_3_cast1, 224
  %tmp_227_cast = sext i18 %tmp_226 to i32
  %glPLSlices_addr_224 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_227_cast
  %tmp_227 = add i18 %tmp_3_cast1, 225
  %tmp_228_cast = sext i18 %tmp_227 to i32
  %glPLSlices_addr_225 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_228_cast
  %tmp_228 = add i18 %tmp_3_cast1, 226
  %tmp_229_cast = sext i18 %tmp_228 to i32
  %glPLSlices_addr_226 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_229_cast
  %tmp_229 = add i18 %tmp_3_cast1, 227
  %tmp_230_cast = sext i18 %tmp_229 to i32
  %glPLSlices_addr_227 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_230_cast
  %tmp_230 = add i18 %tmp_3_cast1, 228
  %tmp_231_cast = sext i18 %tmp_230 to i32
  %glPLSlices_addr_228 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_231_cast
  %tmp_231 = add i18 %tmp_3_cast1, 229
  %tmp_232_cast = sext i18 %tmp_231 to i32
  %glPLSlices_addr_229 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_232_cast
  %tmp_232 = add i18 %tmp_3_cast1, 230
  %tmp_233_cast = sext i18 %tmp_232 to i32
  %glPLSlices_addr_230 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_233_cast
  %tmp_233 = add i18 %tmp_3_cast1, 231
  %tmp_234_cast = sext i18 %tmp_233 to i32
  %glPLSlices_addr_231 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_234_cast
  %tmp_234 = add i18 %tmp_3_cast1, 232
  %tmp_235_cast = sext i18 %tmp_234 to i32
  %glPLSlices_addr_232 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_235_cast
  %tmp_235 = add i18 %tmp_3_cast1, 233
  %tmp_236_cast = sext i18 %tmp_235 to i32
  %glPLSlices_addr_233 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_236_cast
  %tmp_236 = add i18 %tmp_3_cast1, 234
  %tmp_237_cast = sext i18 %tmp_236 to i32
  %glPLSlices_addr_234 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_237_cast
  %tmp_237 = add i18 %tmp_3_cast1, 235
  %tmp_238_cast = sext i18 %tmp_237 to i32
  %glPLSlices_addr_235 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_238_cast
  %tmp_238 = add i18 %tmp_3_cast1, 236
  %tmp_239_cast = sext i18 %tmp_238 to i32
  %glPLSlices_addr_236 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_239_cast
  %tmp_239 = add i18 %tmp_3_cast1, 237
  %tmp_240_cast = sext i18 %tmp_239 to i32
  %glPLSlices_addr_237 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_240_cast
  %tmp_240 = add i18 %tmp_3_cast1, 238
  %tmp_241_cast = sext i18 %tmp_240 to i32
  %glPLSlices_addr_238 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_241_cast
  %tmp_241 = add i18 %tmp_3_cast1, 239
  %tmp_242_cast = sext i18 %tmp_241 to i32
  %glPLSlices_addr_239 = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_242_cast
  store i8 0, i8* %glPLSlices_addr, align 16
  store i8 0, i8* %glPLSlices_addr_1, align 1
  store i8 0, i8* %glPLSlices_addr_2, align 2
  store i8 0, i8* %glPLSlices_addr_3, align 1
  store i8 0, i8* %glPLSlices_addr_4, align 4
  store i8 0, i8* %glPLSlices_addr_5, align 1
  store i8 0, i8* %glPLSlices_addr_6, align 2
  store i8 0, i8* %glPLSlices_addr_7, align 1
  store i8 0, i8* %glPLSlices_addr_8, align 8
  store i8 0, i8* %glPLSlices_addr_9, align 1
  store i8 0, i8* %glPLSlices_addr_10, align 2
  store i8 0, i8* %glPLSlices_addr_11, align 1
  store i8 0, i8* %glPLSlices_addr_12, align 4
  store i8 0, i8* %glPLSlices_addr_13, align 1
  store i8 0, i8* %glPLSlices_addr_14, align 2
  store i8 0, i8* %glPLSlices_addr_15, align 1
  store i8 0, i8* %glPLSlices_addr_16, align 16
  store i8 0, i8* %glPLSlices_addr_17, align 1
  store i8 0, i8* %glPLSlices_addr_18, align 2
  store i8 0, i8* %glPLSlices_addr_19, align 1
  store i8 0, i8* %glPLSlices_addr_20, align 4
  store i8 0, i8* %glPLSlices_addr_21, align 1
  store i8 0, i8* %glPLSlices_addr_22, align 2
  store i8 0, i8* %glPLSlices_addr_23, align 1
  store i8 0, i8* %glPLSlices_addr_24, align 8
  store i8 0, i8* %glPLSlices_addr_25, align 1
  store i8 0, i8* %glPLSlices_addr_26, align 2
  store i8 0, i8* %glPLSlices_addr_27, align 1
  store i8 0, i8* %glPLSlices_addr_28, align 4
  store i8 0, i8* %glPLSlices_addr_29, align 1
  store i8 0, i8* %glPLSlices_addr_30, align 2
  store i8 0, i8* %glPLSlices_addr_31, align 1
  store i8 0, i8* %glPLSlices_addr_32, align 16
  store i8 0, i8* %glPLSlices_addr_33, align 1
  store i8 0, i8* %glPLSlices_addr_34, align 2
  store i8 0, i8* %glPLSlices_addr_35, align 1
  store i8 0, i8* %glPLSlices_addr_36, align 4
  store i8 0, i8* %glPLSlices_addr_37, align 1
  store i8 0, i8* %glPLSlices_addr_38, align 2
  store i8 0, i8* %glPLSlices_addr_39, align 1
  store i8 0, i8* %glPLSlices_addr_40, align 8
  store i8 0, i8* %glPLSlices_addr_41, align 1
  store i8 0, i8* %glPLSlices_addr_42, align 2
  store i8 0, i8* %glPLSlices_addr_43, align 1
  store i8 0, i8* %glPLSlices_addr_44, align 4
  store i8 0, i8* %glPLSlices_addr_45, align 1
  store i8 0, i8* %glPLSlices_addr_46, align 2
  store i8 0, i8* %glPLSlices_addr_47, align 1
  store i8 0, i8* %glPLSlices_addr_48, align 16
  store i8 0, i8* %glPLSlices_addr_49, align 1
  store i8 0, i8* %glPLSlices_addr_50, align 2
  store i8 0, i8* %glPLSlices_addr_51, align 1
  store i8 0, i8* %glPLSlices_addr_52, align 4
  store i8 0, i8* %glPLSlices_addr_53, align 1
  store i8 0, i8* %glPLSlices_addr_54, align 2
  store i8 0, i8* %glPLSlices_addr_55, align 1
  store i8 0, i8* %glPLSlices_addr_56, align 8
  store i8 0, i8* %glPLSlices_addr_57, align 1
  store i8 0, i8* %glPLSlices_addr_58, align 2
  store i8 0, i8* %glPLSlices_addr_59, align 1
  store i8 0, i8* %glPLSlices_addr_60, align 4
  store i8 0, i8* %glPLSlices_addr_61, align 1
  store i8 0, i8* %glPLSlices_addr_62, align 2
  store i8 0, i8* %glPLSlices_addr_63, align 1
  store i8 0, i8* %glPLSlices_addr_64, align 16
  store i8 0, i8* %glPLSlices_addr_65, align 1
  store i8 0, i8* %glPLSlices_addr_66, align 2
  store i8 0, i8* %glPLSlices_addr_67, align 1
  store i8 0, i8* %glPLSlices_addr_68, align 4
  store i8 0, i8* %glPLSlices_addr_69, align 1
  store i8 0, i8* %glPLSlices_addr_70, align 2
  store i8 0, i8* %glPLSlices_addr_71, align 1
  store i8 0, i8* %glPLSlices_addr_72, align 8
  store i8 0, i8* %glPLSlices_addr_73, align 1
  store i8 0, i8* %glPLSlices_addr_74, align 2
  store i8 0, i8* %glPLSlices_addr_75, align 1
  store i8 0, i8* %glPLSlices_addr_76, align 4
  store i8 0, i8* %glPLSlices_addr_77, align 1
  store i8 0, i8* %glPLSlices_addr_78, align 2
  store i8 0, i8* %glPLSlices_addr_79, align 1
  store i8 0, i8* %glPLSlices_addr_80, align 16
  store i8 0, i8* %glPLSlices_addr_81, align 1
  store i8 0, i8* %glPLSlices_addr_82, align 2
  store i8 0, i8* %glPLSlices_addr_83, align 1
  store i8 0, i8* %glPLSlices_addr_84, align 4
  store i8 0, i8* %glPLSlices_addr_85, align 1
  store i8 0, i8* %glPLSlices_addr_86, align 2
  store i8 0, i8* %glPLSlices_addr_87, align 1
  store i8 0, i8* %glPLSlices_addr_88, align 8
  store i8 0, i8* %glPLSlices_addr_89, align 1
  store i8 0, i8* %glPLSlices_addr_90, align 2
  store i8 0, i8* %glPLSlices_addr_91, align 1
  store i8 0, i8* %glPLSlices_addr_92, align 4
  store i8 0, i8* %glPLSlices_addr_93, align 1
  store i8 0, i8* %glPLSlices_addr_94, align 2
  store i8 0, i8* %glPLSlices_addr_95, align 1
  store i8 0, i8* %glPLSlices_addr_96, align 16
  store i8 0, i8* %glPLSlices_addr_97, align 1
  store i8 0, i8* %glPLSlices_addr_98, align 2
  store i8 0, i8* %glPLSlices_addr_99, align 1
  store i8 0, i8* %glPLSlices_addr_100, align 4
  store i8 0, i8* %glPLSlices_addr_101, align 1
  store i8 0, i8* %glPLSlices_addr_102, align 2
  store i8 0, i8* %glPLSlices_addr_103, align 1
  store i8 0, i8* %glPLSlices_addr_104, align 8
  store i8 0, i8* %glPLSlices_addr_105, align 1
  store i8 0, i8* %glPLSlices_addr_106, align 2
  store i8 0, i8* %glPLSlices_addr_107, align 1
  store i8 0, i8* %glPLSlices_addr_108, align 4
  store i8 0, i8* %glPLSlices_addr_109, align 1
  store i8 0, i8* %glPLSlices_addr_110, align 2
  store i8 0, i8* %glPLSlices_addr_111, align 1
  store i8 0, i8* %glPLSlices_addr_112, align 16
  store i8 0, i8* %glPLSlices_addr_113, align 1
  store i8 0, i8* %glPLSlices_addr_114, align 2
  store i8 0, i8* %glPLSlices_addr_115, align 1
  store i8 0, i8* %glPLSlices_addr_116, align 4
  store i8 0, i8* %glPLSlices_addr_117, align 1
  store i8 0, i8* %glPLSlices_addr_118, align 2
  store i8 0, i8* %glPLSlices_addr_119, align 1
  store i8 0, i8* %glPLSlices_addr_120, align 8
  store i8 0, i8* %glPLSlices_addr_121, align 1
  store i8 0, i8* %glPLSlices_addr_122, align 2
  store i8 0, i8* %glPLSlices_addr_123, align 1
  store i8 0, i8* %glPLSlices_addr_124, align 4
  store i8 0, i8* %glPLSlices_addr_125, align 1
  store i8 0, i8* %glPLSlices_addr_126, align 2
  store i8 0, i8* %glPLSlices_addr_127, align 1
  store i8 0, i8* %glPLSlices_addr_128, align 16
  store i8 0, i8* %glPLSlices_addr_129, align 1
  store i8 0, i8* %glPLSlices_addr_130, align 2
  store i8 0, i8* %glPLSlices_addr_131, align 1
  store i8 0, i8* %glPLSlices_addr_132, align 4
  store i8 0, i8* %glPLSlices_addr_133, align 1
  store i8 0, i8* %glPLSlices_addr_134, align 2
  store i8 0, i8* %glPLSlices_addr_135, align 1
  store i8 0, i8* %glPLSlices_addr_136, align 8
  store i8 0, i8* %glPLSlices_addr_137, align 1
  store i8 0, i8* %glPLSlices_addr_138, align 2
  store i8 0, i8* %glPLSlices_addr_139, align 1
  store i8 0, i8* %glPLSlices_addr_140, align 4
  store i8 0, i8* %glPLSlices_addr_141, align 1
  store i8 0, i8* %glPLSlices_addr_142, align 2
  store i8 0, i8* %glPLSlices_addr_143, align 1
  store i8 0, i8* %glPLSlices_addr_144, align 16
  store i8 0, i8* %glPLSlices_addr_145, align 1
  store i8 0, i8* %glPLSlices_addr_146, align 2
  store i8 0, i8* %glPLSlices_addr_147, align 1
  store i8 0, i8* %glPLSlices_addr_148, align 4
  store i8 0, i8* %glPLSlices_addr_149, align 1
  store i8 0, i8* %glPLSlices_addr_150, align 2
  store i8 0, i8* %glPLSlices_addr_151, align 1
  store i8 0, i8* %glPLSlices_addr_152, align 8
  store i8 0, i8* %glPLSlices_addr_153, align 1
  store i8 0, i8* %glPLSlices_addr_154, align 2
  store i8 0, i8* %glPLSlices_addr_155, align 1
  store i8 0, i8* %glPLSlices_addr_156, align 4
  store i8 0, i8* %glPLSlices_addr_157, align 1
  store i8 0, i8* %glPLSlices_addr_158, align 2
  store i8 0, i8* %glPLSlices_addr_159, align 1
  store i8 0, i8* %glPLSlices_addr_160, align 16
  store i8 0, i8* %glPLSlices_addr_161, align 1
  store i8 0, i8* %glPLSlices_addr_162, align 2
  store i8 0, i8* %glPLSlices_addr_163, align 1
  store i8 0, i8* %glPLSlices_addr_164, align 4
  store i8 0, i8* %glPLSlices_addr_165, align 1
  store i8 0, i8* %glPLSlices_addr_166, align 2
  store i8 0, i8* %glPLSlices_addr_167, align 1
  store i8 0, i8* %glPLSlices_addr_168, align 8
  store i8 0, i8* %glPLSlices_addr_169, align 1
  store i8 0, i8* %glPLSlices_addr_170, align 2
  store i8 0, i8* %glPLSlices_addr_171, align 1
  store i8 0, i8* %glPLSlices_addr_172, align 4
  store i8 0, i8* %glPLSlices_addr_173, align 1
  store i8 0, i8* %glPLSlices_addr_174, align 2
  store i8 0, i8* %glPLSlices_addr_175, align 1
  store i8 0, i8* %glPLSlices_addr_176, align 16
  store i8 0, i8* %glPLSlices_addr_177, align 1
  store i8 0, i8* %glPLSlices_addr_178, align 2
  store i8 0, i8* %glPLSlices_addr_179, align 1
  store i8 0, i8* %glPLSlices_addr_180, align 4
  store i8 0, i8* %glPLSlices_addr_181, align 1
  store i8 0, i8* %glPLSlices_addr_182, align 2
  store i8 0, i8* %glPLSlices_addr_183, align 1
  store i8 0, i8* %glPLSlices_addr_184, align 8
  store i8 0, i8* %glPLSlices_addr_185, align 1
  store i8 0, i8* %glPLSlices_addr_186, align 2
  store i8 0, i8* %glPLSlices_addr_187, align 1
  store i8 0, i8* %glPLSlices_addr_188, align 4
  store i8 0, i8* %glPLSlices_addr_189, align 1
  store i8 0, i8* %glPLSlices_addr_190, align 2
  store i8 0, i8* %glPLSlices_addr_191, align 1
  store i8 0, i8* %glPLSlices_addr_192, align 16
  store i8 0, i8* %glPLSlices_addr_193, align 1
  store i8 0, i8* %glPLSlices_addr_194, align 2
  store i8 0, i8* %glPLSlices_addr_195, align 1
  store i8 0, i8* %glPLSlices_addr_196, align 4
  store i8 0, i8* %glPLSlices_addr_197, align 1
  store i8 0, i8* %glPLSlices_addr_198, align 2
  store i8 0, i8* %glPLSlices_addr_199, align 1
  store i8 0, i8* %glPLSlices_addr_200, align 8
  store i8 0, i8* %glPLSlices_addr_201, align 1
  store i8 0, i8* %glPLSlices_addr_202, align 2
  store i8 0, i8* %glPLSlices_addr_203, align 1
  store i8 0, i8* %glPLSlices_addr_204, align 4
  store i8 0, i8* %glPLSlices_addr_205, align 1
  store i8 0, i8* %glPLSlices_addr_206, align 2
  store i8 0, i8* %glPLSlices_addr_207, align 1
  store i8 0, i8* %glPLSlices_addr_208, align 16
  store i8 0, i8* %glPLSlices_addr_209, align 1
  store i8 0, i8* %glPLSlices_addr_210, align 2
  store i8 0, i8* %glPLSlices_addr_211, align 1
  store i8 0, i8* %glPLSlices_addr_212, align 4
  store i8 0, i8* %glPLSlices_addr_213, align 1
  store i8 0, i8* %glPLSlices_addr_214, align 2
  store i8 0, i8* %glPLSlices_addr_215, align 1
  store i8 0, i8* %glPLSlices_addr_216, align 8
  store i8 0, i8* %glPLSlices_addr_217, align 1
  store i8 0, i8* %glPLSlices_addr_218, align 2
  store i8 0, i8* %glPLSlices_addr_219, align 1
  store i8 0, i8* %glPLSlices_addr_220, align 4
  store i8 0, i8* %glPLSlices_addr_221, align 1
  store i8 0, i8* %glPLSlices_addr_222, align 2
  store i8 0, i8* %glPLSlices_addr_223, align 1
  store i8 0, i8* %glPLSlices_addr_224, align 16
  store i8 0, i8* %glPLSlices_addr_225, align 1
  store i8 0, i8* %glPLSlices_addr_226, align 2
  store i8 0, i8* %glPLSlices_addr_227, align 1
  store i8 0, i8* %glPLSlices_addr_228, align 4
  store i8 0, i8* %glPLSlices_addr_229, align 1
  store i8 0, i8* %glPLSlices_addr_230, align 2
  store i8 0, i8* %glPLSlices_addr_231, align 1
  store i8 0, i8* %glPLSlices_addr_232, align 8
  store i8 0, i8* %glPLSlices_addr_233, align 1
  store i8 0, i8* %glPLSlices_addr_234, align 2
  store i8 0, i8* %glPLSlices_addr_235, align 1
  store i8 0, i8* %glPLSlices_addr_236, align 4
  store i8 0, i8* %glPLSlices_addr_237, align 1
  store i8 0, i8* %glPLSlices_addr_238, align 2
  store i8 0, i8* %glPLSlices_addr_239, align 1
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
  %tmp_1 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %eventsArraySize_read, i32 30)
  %tmp_op_op9 = or i32 %tmp, 1
  %tmp_3 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_op_op9, i32 31)
  %p_neg = xor i32 %tmp, -1
  %p_lshr = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %p_neg, i32 1, i32 31)
  %p_neg_t = sub i31 0, %p_lshr
  %tmp_4 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %tmp_op_op9, i32 1, i32 31)
  %tmp_5 = select i1 %tmp_3, i31 %p_neg_t, i31 %tmp_4
  %tmp_6 = select i1 %tmp_1, i31 0, i31 %tmp_5
  %tmp_7 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %tmp_6, i1 false)
  br label %1

; <label>:1                                       ; preds = %accumulateHW.exit, %0
  %i = phi i32 [ 0, %0 ], [ %i_2, %accumulateHW.exit ]
  %tmp_8 = icmp eq i32 %i, %tmp_7
  br i1 %tmp_8, label %4, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str10) nounwind
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %data_read = call i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32* %data)
  %tmp_9 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %data_read, i32 1)
  br i1 %tmp_9, label %3, label %accumulateHW.exit

; <label>:3                                       ; preds = %2
  %tmp_10 = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %data_read, i32 17, i32 31)
  %tmp_i1_cast = zext i15 %tmp_10 to i18
  %tmp_11 = call i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32 %data_read, i32 2, i32 11)
  %p_shl_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_11, i8 0)
  %tmp_12 = call i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32 %data_read, i32 2, i32 15)
  %p_shl3_cast = call i18 @_ssdm_op_BitConcatenate.i18.i14.i4(i14 %tmp_12, i4 0)
  %tmp_s = sub i18 %p_shl_cast, %p_shl3_cast
  %tmp_242 = add i18 %tmp_i1_cast, %tmp_s
  %tmp_250_cast = sext i18 %tmp_242 to i32
  %glPLSlices_addr = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_250_cast
  %glPLSlices_load = load i8* %glPLSlices_addr, align 1
  %tmp_3_i = add i8 %glPLSlices_load, 1
  store i8 %tmp_3_i, i8* %glPLSlices_addr, align 1
  br label %accumulateHW.exit

accumulateHW.exit:                                ; preds = %2, %3
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @p_str10, i32 %tmp_2) nounwind
  %i_2 = add nsw i32 %i, 2
  br label %1

; <label>:4                                       ; preds = %1
  call fastcc void @copyToPS(i8* %eventSlice, i32 %eventSlice_offset_re)
  ret void
}

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define internal fastcc void @copyToPS(i8* %eventSlice, i32 %eventSlice_offset) {
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str8, [7 x i8]* @p_str9, [1 x i8]* @p_str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  %eventSlice_offset_re = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventSlice_offset)
  br label %1

; <label>:1                                       ; preds = %BurstBB18, %0
  %indvar_flatten = phi i16 [ 0, %0 ], [ %indvar_flatten_next, %BurstBB18 ]
  %i = phi i8 [ 0, %0 ], [ %tmp_mid2_v, %BurstBB18 ]
  %j = phi i8 [ 0, %0 ], [ %j_1, %BurstBB18 ]
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
  %tmp = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %tmp_mid2_v, i8 0)
  %p_shl4_cast = zext i16 %tmp to i17
  %tmp_243 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %tmp_mid2_v, i4 0)
  %p_shl5_cast = zext i12 %tmp_243 to i17
  %tmp_244 = sub i17 %p_shl4_cast, %p_shl5_cast
  %tmp_252_cast = sext i17 %tmp_244 to i18
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
  %tmp_1_cast = zext i8 %j_mid2 to i18
  %tmp_245 = add i18 %tmp_252_cast, %tmp_1_cast
  %tmp_253_cast = sext i18 %tmp_245 to i32
  %glPLSlices_addr = getelementptr [129600 x i8]* @glPLSlices, i32 0, i32 %tmp_253_cast
  %glPLSlices_load = load i8* %glPLSlices_addr, align 1
  %sum2 = add i32 %eventSlice_offset_re, %tmp_7_mid2
  %eventSlice_addr = getelementptr i8* %eventSlice, i32 %sum2
  %tmp_13 = urem i16 %indvar_flatten, 240
  %tmp_14 = icmp eq i16 %tmp_13, 0
  br i1 %tmp_14, label %ReqBB, label %BurstBB

ReqBB:                                            ; preds = %.reset
  %eventSlice_addr_1_wr = call i1 @_ssdm_op_WriteReq.m_axi.i8P(i8* %eventSlice_addr, i32 240)
  br label %BurstBB

BurstBB:                                          ; preds = %ReqBB, %.reset
  call void @_ssdm_op_Write.m_axi.i8P(i8* %eventSlice_addr, i8 %glPLSlices_load, i1 true)
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([16 x i8]* @p_str1, i32 %tmp_4) nounwind
  %j_1 = add i8 %j_mid2, 1
  %tmp_15 = urem i16 %indvar_flatten_next, 240
  %tmp_16 = icmp eq i16 %tmp_15, 0
  br i1 %tmp_16, label %RespBB, label %BurstBB18

RespBB:                                           ; preds = %BurstBB
  %eventSlice_addr_1_wr_1 = call i1 @_ssdm_op_WriteResp.m_axi.i8P(i8* %eventSlice_addr)
  br label %BurstBB18

BurstBB18:                                        ; preds = %RespBB, %BurstBB
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

define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_4 = trunc i32 %empty to i31
  ret i31 %empty_4
}

define weak i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_5 = trunc i32 %empty to i15
  ret i15 %empty_5
}

define weak i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_6 = trunc i32 %empty to i14
  ret i14 %empty_6
}

define weak i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_7 = trunc i32 %empty to i10
  ret i10 %empty_7
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_8 = and i32 %0, %empty
  %empty_9 = icmp ne i32 %empty_8, 0
  ret i1 %empty_9
}

define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2
  %empty_10 = shl i2 1, %empty
  %empty_11 = and i2 %0, %empty_10
  %empty_12 = icmp ne i2 %empty_11, 0
  ret i1 %empty_12
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone {
entry:
  %empty = zext i31 %0 to i32
  %empty_13 = zext i1 %1 to i32
  %empty_14 = shl i32 %empty, 1
  %empty_15 = or i32 %empty_14, %empty_13
  ret i32 %empty_15
}

define weak i18 @_ssdm_op_BitConcatenate.i18.i14.i4(i14, i4) nounwind readnone {
entry:
  %empty = zext i14 %0 to i18
  %empty_16 = zext i4 %1 to i18
  %empty_17 = shl i18 %empty, 4
  %empty_18 = or i18 %empty_17, %empty_16
  ret i18 %empty_18
}

define weak i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10, i8) nounwind readnone {
entry:
  %empty = zext i10 %0 to i18
  %empty_19 = zext i8 %1 to i18
  %empty_20 = shl i18 %empty, 8
  %empty_21 = or i18 %empty_20, %empty_19
  ret i18 %empty_21
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %0 to i16
  %empty_22 = zext i8 %1 to i16
  %empty_23 = shl i16 %empty, 8
  %empty_24 = or i16 %empty_23, %empty_22
  ret i16 %empty_24
}

define weak i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8, i4) nounwind readnone {
entry:
  %empty = zext i8 %0 to i12
  %empty_25 = zext i4 %1 to i12
  %empty_26 = shl i12 %empty, 4
  %empty_27 = or i12 %empty_26, %empty_25
  ret i12 %empty_27
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
