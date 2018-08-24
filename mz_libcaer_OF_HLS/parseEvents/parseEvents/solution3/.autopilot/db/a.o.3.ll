; ModuleID = 'E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution3/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i386-w64-mingw32"

@parseEvents_str = internal unnamed_addr constant [12 x i8] c"parseEvents\00" ; [#uses=1 type=[12 x i8]*]
@glPLSlices_3 = internal global [32400 x i8] zeroinitializer ; [#uses=62 type=[32400 x i8]*]
@glPLSlices_2 = internal global [32400 x i8] zeroinitializer ; [#uses=62 type=[32400 x i8]*]
@glPLSlices_1 = internal global [32400 x i8] zeroinitializer ; [#uses=62 type=[32400 x i8]*]
@glPLSlices_0 = internal global [32400 x i8] zeroinitializer ; [#uses=62 type=[32400 x i8]*]
@copyToPSLoop_copyToP = internal unnamed_addr constant [29 x i8] c"copyToPSLoop_copyToPS_label2\00" ; [#uses=1 type=[29 x i8]*]
@p_str9 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=2 type=[7 x i8]*]
@p_str8 = private unnamed_addr constant [11 x i8] c"eventSlice\00", align 1 ; [#uses=2 type=[11 x i8]*]
@p_str7 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=2 type=[6 x i8]*]
@p_str6 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1 ; [#uses=1 type=[8 x i8]*]
@p_str4 = private unnamed_addr constant [15 x i8] c"resetSliceLoop\00", align 1 ; [#uses=3 type=[15 x i8]*]
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=19 type=[1 x i8]*]
@p_str10 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1 ; [#uses=3 type=[7 x i8]*]
@p_str1 = private unnamed_addr constant [16 x i8] c"copyToPS_label2\00", align 1 ; [#uses=3 type=[16 x i8]*]

; [#uses=1]
define internal fastcc void @resetCurrentSliceHW() nounwind {
  br label %1, !dbg !26                           ; [debug line = 29:35]

; <label>:1                                       ; preds = %2, %0
  %i = phi i8 [ 0, %0 ], [ %i_1, %2 ]             ; [#uses=4 type=i8]
  %exitcond1 = icmp eq i8 %i, -76, !dbg !26       ; [#uses=1 type=i1] [debug line = 29:35]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 180, i64 180, i64 180)
  %i_1 = add i8 %i, 1, !dbg !35                   ; [#uses=1 type=i8] [debug line = 29:46]
  br i1 %exitcond1, label %3, label %2, !dbg !26  ; [debug line = 29:35]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([15 x i8]* @p_str4) nounwind, !dbg !36 ; [debug line = 30:3]
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([15 x i8]* @p_str4) nounwind, !dbg !36 ; [#uses=1 type=i32] [debug line = 30:3]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !38 ; [debug line = 31:1]
  %tmp = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %i, i6 0) ; [#uses=1 type=i14]
  %p_shl_cast = zext i14 %tmp to i15              ; [#uses=1 type=i15]
  %tmp_2 = call i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8 %i, i2 0) ; [#uses=1 type=i10]
  %p_shl1_cast = zext i10 %tmp_2 to i15           ; [#uses=1 type=i15]
  %tmp_3 = sub i15 %p_shl_cast, %p_shl1_cast      ; [#uses=4 type=i15]
  %tmp_3_cast1 = sext i15 %tmp_3 to i16           ; [#uses=57 type=i16]
  %tmp_3_cast = sext i15 %tmp_3 to i32            ; [#uses=4 type=i32]
  %glPLSlices_0_addr = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %tmp_4 = or i16 %tmp_3_cast1, 1                 ; [#uses=1 type=i16]
  %tmp_4_cast = zext i16 %tmp_4 to i32            ; [#uses=4 type=i32]
  %glPLSlices_0_addr_1 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %tmp_5 = or i15 %tmp_3, 2                       ; [#uses=1 type=i15]
  %tmp_5_cast = sext i15 %tmp_5 to i32            ; [#uses=4 type=i32]
  %glPLSlices_0_addr_2 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %tmp_6 = or i15 %tmp_3, 3                       ; [#uses=1 type=i15]
  %tmp_6_cast = sext i15 %tmp_6 to i32            ; [#uses=4 type=i32]
  %glPLSlices_0_addr_3 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %tmp_7 = add i16 %tmp_3_cast1, 4                ; [#uses=1 type=i16]
  %tmp_7_cast = sext i16 %tmp_7 to i32            ; [#uses=4 type=i32]
  %glPLSlices_0_addr_4 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %tmp_8 = add i16 %tmp_3_cast1, 5                ; [#uses=1 type=i16]
  %tmp_8_cast = sext i16 %tmp_8 to i32            ; [#uses=4 type=i32]
  %glPLSlices_0_addr_5 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %tmp_9 = add i16 %tmp_3_cast1, 6                ; [#uses=1 type=i16]
  %tmp_9_cast = sext i16 %tmp_9 to i32            ; [#uses=4 type=i32]
  %glPLSlices_0_addr_6 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %tmp_s = add i16 %tmp_3_cast1, 7                ; [#uses=1 type=i16]
  %tmp_10_cast = sext i16 %tmp_s to i32           ; [#uses=4 type=i32]
  %glPLSlices_0_addr_7 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %tmp_10 = add i16 %tmp_3_cast1, 8               ; [#uses=1 type=i16]
  %tmp_11_cast = sext i16 %tmp_10 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_8 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %tmp_11 = add i16 %tmp_3_cast1, 9               ; [#uses=1 type=i16]
  %tmp_12_cast = sext i16 %tmp_11 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_9 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %tmp_12 = add i16 %tmp_3_cast1, 10              ; [#uses=1 type=i16]
  %tmp_13_cast = sext i16 %tmp_12 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_10 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %tmp_13 = add i16 %tmp_3_cast1, 11              ; [#uses=1 type=i16]
  %tmp_14_cast = sext i16 %tmp_13 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_11 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %tmp_14 = add i16 %tmp_3_cast1, 12              ; [#uses=1 type=i16]
  %tmp_15_cast = sext i16 %tmp_14 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_12 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %tmp_15 = add i16 %tmp_3_cast1, 13              ; [#uses=1 type=i16]
  %tmp_16_cast = sext i16 %tmp_15 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_13 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %tmp_16 = add i16 %tmp_3_cast1, 14              ; [#uses=1 type=i16]
  %tmp_17_cast = sext i16 %tmp_16 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_14 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %tmp_17 = add i16 %tmp_3_cast1, 15              ; [#uses=1 type=i16]
  %tmp_18_cast = sext i16 %tmp_17 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_15 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_18_cast ; [#uses=1 type=i8*]
  %tmp_18 = add i16 %tmp_3_cast1, 16              ; [#uses=1 type=i16]
  %tmp_19_cast = sext i16 %tmp_18 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_16 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_19_cast ; [#uses=1 type=i8*]
  %tmp_19 = add i16 %tmp_3_cast1, 17              ; [#uses=1 type=i16]
  %tmp_20_cast = sext i16 %tmp_19 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_17 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_20_cast ; [#uses=1 type=i8*]
  %tmp_20 = add i16 %tmp_3_cast1, 18              ; [#uses=1 type=i16]
  %tmp_21_cast = sext i16 %tmp_20 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_18 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %tmp_21 = add i16 %tmp_3_cast1, 19              ; [#uses=1 type=i16]
  %tmp_22_cast = sext i16 %tmp_21 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_19 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_22_cast ; [#uses=1 type=i8*]
  %tmp_22 = add i16 %tmp_3_cast1, 20              ; [#uses=1 type=i16]
  %tmp_23_cast = sext i16 %tmp_22 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_20 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_23_cast ; [#uses=1 type=i8*]
  %tmp_23 = add i16 %tmp_3_cast1, 21              ; [#uses=1 type=i16]
  %tmp_24_cast = sext i16 %tmp_23 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_21 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_24_cast ; [#uses=1 type=i8*]
  %tmp_24 = add i16 %tmp_3_cast1, 22              ; [#uses=1 type=i16]
  %tmp_25_cast = sext i16 %tmp_24 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_22 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_25_cast ; [#uses=1 type=i8*]
  %tmp_25 = add i16 %tmp_3_cast1, 23              ; [#uses=1 type=i16]
  %tmp_26_cast = sext i16 %tmp_25 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_23 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_26_cast ; [#uses=1 type=i8*]
  %tmp_26 = add i16 %tmp_3_cast1, 24              ; [#uses=1 type=i16]
  %tmp_27_cast = sext i16 %tmp_26 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_24 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_27_cast ; [#uses=1 type=i8*]
  %tmp_27 = add i16 %tmp_3_cast1, 25              ; [#uses=1 type=i16]
  %tmp_28_cast = sext i16 %tmp_27 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_25 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_28_cast ; [#uses=1 type=i8*]
  %tmp_28 = add i16 %tmp_3_cast1, 26              ; [#uses=1 type=i16]
  %tmp_29_cast = sext i16 %tmp_28 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_26 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_29_cast ; [#uses=1 type=i8*]
  %tmp_29 = add i16 %tmp_3_cast1, 27              ; [#uses=1 type=i16]
  %tmp_30_cast = sext i16 %tmp_29 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_27 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_30_cast ; [#uses=1 type=i8*]
  %tmp_30 = add i16 %tmp_3_cast1, 28              ; [#uses=1 type=i16]
  %tmp_31_cast = sext i16 %tmp_30 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_28 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_31_cast ; [#uses=1 type=i8*]
  %tmp_31 = add i16 %tmp_3_cast1, 29              ; [#uses=1 type=i16]
  %tmp_32_cast = sext i16 %tmp_31 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_29 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_32_cast ; [#uses=1 type=i8*]
  %tmp_32 = add i16 %tmp_3_cast1, 30              ; [#uses=1 type=i16]
  %tmp_33_cast = sext i16 %tmp_32 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_30 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_33_cast ; [#uses=1 type=i8*]
  %tmp_33 = add i16 %tmp_3_cast1, 31              ; [#uses=1 type=i16]
  %tmp_34_cast = sext i16 %tmp_33 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_31 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_34_cast ; [#uses=1 type=i8*]
  %tmp_34 = add i16 %tmp_3_cast1, 32              ; [#uses=1 type=i16]
  %tmp_35_cast = sext i16 %tmp_34 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_32 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_35_cast ; [#uses=1 type=i8*]
  %tmp_35 = add i16 %tmp_3_cast1, 33              ; [#uses=1 type=i16]
  %tmp_36_cast = sext i16 %tmp_35 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_33 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_36_cast ; [#uses=1 type=i8*]
  %tmp_36 = add i16 %tmp_3_cast1, 34              ; [#uses=1 type=i16]
  %tmp_37_cast = sext i16 %tmp_36 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_34 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_37_cast ; [#uses=1 type=i8*]
  %tmp_37 = add i16 %tmp_3_cast1, 35              ; [#uses=1 type=i16]
  %tmp_38_cast = sext i16 %tmp_37 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_35 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_38_cast ; [#uses=1 type=i8*]
  %tmp_38 = add i16 %tmp_3_cast1, 36              ; [#uses=1 type=i16]
  %tmp_39_cast = sext i16 %tmp_38 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_36 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_39_cast ; [#uses=1 type=i8*]
  %tmp_39 = add i16 %tmp_3_cast1, 37              ; [#uses=1 type=i16]
  %tmp_40_cast = sext i16 %tmp_39 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_37 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_40_cast ; [#uses=1 type=i8*]
  %tmp_40 = add i16 %tmp_3_cast1, 38              ; [#uses=1 type=i16]
  %tmp_41_cast = sext i16 %tmp_40 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_38 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_41_cast ; [#uses=1 type=i8*]
  %tmp_41 = add i16 %tmp_3_cast1, 39              ; [#uses=1 type=i16]
  %tmp_42_cast = sext i16 %tmp_41 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_39 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_42_cast ; [#uses=1 type=i8*]
  %tmp_42 = add i16 %tmp_3_cast1, 40              ; [#uses=1 type=i16]
  %tmp_43_cast = sext i16 %tmp_42 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_40 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_43_cast ; [#uses=1 type=i8*]
  %tmp_43 = add i16 %tmp_3_cast1, 41              ; [#uses=1 type=i16]
  %tmp_44_cast = sext i16 %tmp_43 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_41 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_44_cast ; [#uses=1 type=i8*]
  %tmp_44 = add i16 %tmp_3_cast1, 42              ; [#uses=1 type=i16]
  %tmp_45_cast = sext i16 %tmp_44 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_42 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_45_cast ; [#uses=1 type=i8*]
  %tmp_45 = add i16 %tmp_3_cast1, 43              ; [#uses=1 type=i16]
  %tmp_46_cast = sext i16 %tmp_45 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_43 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_46_cast ; [#uses=1 type=i8*]
  %tmp_46 = add i16 %tmp_3_cast1, 44              ; [#uses=1 type=i16]
  %tmp_47_cast = sext i16 %tmp_46 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_44 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_47_cast ; [#uses=1 type=i8*]
  %tmp_47 = add i16 %tmp_3_cast1, 45              ; [#uses=1 type=i16]
  %tmp_48_cast = sext i16 %tmp_47 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_45 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_48_cast ; [#uses=1 type=i8*]
  %tmp_48 = add i16 %tmp_3_cast1, 46              ; [#uses=1 type=i16]
  %tmp_49_cast = sext i16 %tmp_48 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_46 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_49_cast ; [#uses=1 type=i8*]
  %tmp_49 = add i16 %tmp_3_cast1, 47              ; [#uses=1 type=i16]
  %tmp_50_cast = sext i16 %tmp_49 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_47 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_50_cast ; [#uses=1 type=i8*]
  %tmp_50 = add i16 %tmp_3_cast1, 48              ; [#uses=1 type=i16]
  %tmp_51_cast = sext i16 %tmp_50 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_48 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_51_cast ; [#uses=1 type=i8*]
  %tmp_51 = add i16 %tmp_3_cast1, 49              ; [#uses=1 type=i16]
  %tmp_52_cast = sext i16 %tmp_51 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_49 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_52_cast ; [#uses=1 type=i8*]
  %tmp_52 = add i16 %tmp_3_cast1, 50              ; [#uses=1 type=i16]
  %tmp_53_cast = sext i16 %tmp_52 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_50 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_53_cast ; [#uses=1 type=i8*]
  %tmp_53 = add i16 %tmp_3_cast1, 51              ; [#uses=1 type=i16]
  %tmp_54_cast = sext i16 %tmp_53 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_51 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_54_cast ; [#uses=1 type=i8*]
  %tmp_54 = add i16 %tmp_3_cast1, 52              ; [#uses=1 type=i16]
  %tmp_55_cast = sext i16 %tmp_54 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_52 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_55_cast ; [#uses=1 type=i8*]
  %tmp_55 = add i16 %tmp_3_cast1, 53              ; [#uses=1 type=i16]
  %tmp_56_cast = sext i16 %tmp_55 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_53 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_56_cast ; [#uses=1 type=i8*]
  %tmp_56 = add i16 %tmp_3_cast1, 54              ; [#uses=1 type=i16]
  %tmp_57_cast = sext i16 %tmp_56 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_54 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_57_cast ; [#uses=1 type=i8*]
  %tmp_57 = add i16 %tmp_3_cast1, 55              ; [#uses=1 type=i16]
  %tmp_58_cast = sext i16 %tmp_57 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_55 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_58_cast ; [#uses=1 type=i8*]
  %tmp_58 = add i16 %tmp_3_cast1, 56              ; [#uses=1 type=i16]
  %tmp_59_cast = sext i16 %tmp_58 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_56 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_59_cast ; [#uses=1 type=i8*]
  %tmp_59 = add i16 %tmp_3_cast1, 57              ; [#uses=1 type=i16]
  %tmp_60_cast = sext i16 %tmp_59 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_57 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_60_cast ; [#uses=1 type=i8*]
  %tmp_60 = add i16 %tmp_3_cast1, 58              ; [#uses=1 type=i16]
  %tmp_61_cast = sext i16 %tmp_60 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_58 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_61_cast ; [#uses=1 type=i8*]
  %tmp_61 = add i16 %tmp_3_cast1, 59              ; [#uses=1 type=i16]
  %tmp_62_cast = sext i16 %tmp_61 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr_59 = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_62_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_1 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_2 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_3 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_4 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_5 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_6 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_7 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_8 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_9 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_10 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_11 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_12 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_13 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_14 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_15 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_18_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_16 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_19_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_17 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_20_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_18 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_19 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_22_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_20 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_23_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_21 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_24_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_22 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_25_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_23 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_26_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_24 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_27_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_25 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_28_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_26 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_29_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_27 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_30_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_28 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_31_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_29 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_32_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_30 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_33_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_31 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_34_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_32 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_35_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_33 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_36_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_34 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_37_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_35 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_38_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_36 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_39_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_37 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_40_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_38 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_41_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_39 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_42_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_40 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_43_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_41 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_44_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_42 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_45_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_43 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_46_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_44 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_47_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_45 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_48_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_46 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_49_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_47 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_50_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_48 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_51_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_49 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_52_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_50 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_53_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_51 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_54_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_52 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_55_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_53 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_56_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_54 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_57_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_55 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_58_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_56 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_59_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_57 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_60_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_58 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_61_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_59 = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_62_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_1 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_2 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_3 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_4 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_5 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_6 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_7 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_8 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_9 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_10 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_11 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_12 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_13 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_14 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_15 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_18_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_16 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_19_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_17 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_20_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_18 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_19 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_22_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_20 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_23_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_21 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_24_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_22 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_25_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_23 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_26_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_24 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_27_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_25 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_28_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_26 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_29_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_27 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_30_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_28 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_31_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_29 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_32_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_30 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_33_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_31 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_34_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_32 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_35_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_33 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_36_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_34 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_37_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_35 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_38_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_36 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_39_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_37 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_40_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_38 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_41_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_39 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_42_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_40 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_43_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_41 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_44_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_42 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_45_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_43 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_46_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_44 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_47_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_45 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_48_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_46 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_49_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_47 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_50_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_48 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_51_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_49 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_52_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_50 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_53_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_51 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_54_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_52 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_55_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_53 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_56_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_54 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_57_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_55 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_58_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_56 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_59_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_57 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_60_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_58 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_61_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_59 = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_62_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_1 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_2 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_3 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_4 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_5 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_6 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_7 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_8 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_9 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_10 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_11 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_12 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_13 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_14 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_15 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_18_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_16 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_19_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_17 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_20_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_18 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_19 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_22_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_20 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_23_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_21 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_24_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_22 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_25_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_23 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_26_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_24 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_27_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_25 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_28_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_26 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_29_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_27 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_30_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_28 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_31_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_29 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_32_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_30 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_33_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_31 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_34_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_32 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_35_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_33 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_36_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_34 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_37_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_35 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_38_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_36 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_39_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_37 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_40_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_38 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_41_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_39 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_42_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_40 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_43_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_41 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_44_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_42 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_45_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_43 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_46_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_44 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_47_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_45 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_48_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_46 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_49_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_47 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_50_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_48 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_51_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_49 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_52_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_50 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_53_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_51 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_54_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_52 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_55_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_53 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_56_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_54 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_57_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_55 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_58_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_56 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_59_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_57 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_60_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_58 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_61_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_59 = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_62_cast ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices_0_addr, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_2, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_4, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_6, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_8, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_10, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_12, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_14, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_15, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_16, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_17, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_18, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_19, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_20, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_21, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_22, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_23, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_24, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_25, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_26, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_27, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_28, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_29, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_30, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_31, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_32, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_33, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_34, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_35, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_36, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_37, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_38, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_39, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_40, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_41, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_42, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_43, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_44, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_45, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_46, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_47, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_48, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_49, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_50, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_51, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_52, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_53, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_54, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_55, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_56, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_57, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_58, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_59, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_2, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_4, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_6, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_8, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_10, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_12, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_14, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_15, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_16, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_17, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_18, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_19, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_20, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_21, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_22, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_23, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_24, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_25, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_26, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_27, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_28, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_29, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_30, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_31, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_32, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_33, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_34, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_35, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_36, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_37, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_38, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_39, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_40, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_41, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_42, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_43, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_44, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_45, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_46, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_47, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_48, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_49, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_50, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_51, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_52, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_53, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_54, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_55, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_56, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_57, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_58, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_59, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_2, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_4, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_6, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_8, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_10, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_12, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_14, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_15, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_16, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_17, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_18, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_19, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_20, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_21, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_22, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_23, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_24, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_25, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_26, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_27, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_28, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_29, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_30, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_31, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_32, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_33, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_34, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_35, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_36, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_37, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_38, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_39, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_40, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_41, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_42, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_43, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_44, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_45, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_46, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_47, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_48, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_49, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_50, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_51, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_52, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_53, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_54, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_55, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_56, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_57, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_58, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_59, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_2, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_4, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_6, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_8, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_10, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_12, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_14, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_15, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_16, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_17, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_18, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_19, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_20, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_21, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_22, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_23, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_24, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_25, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_26, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_27, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_28, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_29, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_30, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_31, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_32, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_33, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_34, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_35, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_36, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_37, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_38, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_39, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_40, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_41, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_42, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_43, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_44, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_45, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_46, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_47, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_48, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_49, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_50, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_51, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_52, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_53, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_54, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_55, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_56, align 4, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_57, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_58, align 2, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_59, align 1, !dbg !39 ; [debug line = 33:4]
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([15 x i8]* @p_str4, i32 %tmp_1) nounwind, !dbg !42 ; [#uses=0 type=i32] [debug line = 35:2]
  call void @llvm.dbg.value(metadata !{i8 %i_1}, i64 0, metadata !43), !dbg !35 ; [debug line = 29:46] [debug variable = i]
  br label %1, !dbg !35                           ; [debug line = 29:46]

; <label>:3                                       ; preds = %1
  ret void, !dbg !46                              ; [debug line = 36:1]
}

; [#uses=0]
define void @parseEvents(i8* %eventSlice, i32* %data, i32 %eventsArraySize, i32 %eventSlice_offset) {
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %eventSlice), !map !47
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %data) nounwind, !map !53
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %eventsArraySize) nounwind, !map !57
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @parseEvents_str) nounwind
  %eventSlice_offset_re = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventSlice_offset) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %eventSlice_offset_re}, i64 0, metadata !63), !dbg !76 ; [debug line = 38:74] [debug variable = eventSlice]
  %eventsArraySize_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventsArraySize) ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %eventsArraySize_read}, i64 0, metadata !77), !dbg !78 ; [debug line = 38:49] [debug variable = eventsArraySize]
  call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !79), !dbg !80 ; [debug line = 38:35] [debug variable = data]
  call void @llvm.dbg.value(metadata !{i32 %eventsArraySize}, i64 0, metadata !77), !dbg !78 ; [debug line = 38:49] [debug variable = eventsArraySize]
  call void @llvm.dbg.value(metadata !{i32 %eventSlice_offset}, i64 0, metadata !63), !dbg !76 ; [debug line = 38:74] [debug variable = eventSlice]
  call void (...)* @_ssdm_op_SpecInterface(i32* %data, [8 x i8]* @p_str6, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind, !dbg !81 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @p_str2) nounwind, !dbg !81 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str8, [7 x i8]* @p_str9, [1 x i8]* @p_str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind, !dbg !81 ; [debug line = 40:1]
  call fastcc void @resetCurrentSliceHW(), !dbg !83 ; [debug line = 40:2]
  %tmp = shl i32 %eventsArraySize_read, 1, !dbg !84 ; [#uses=2 type=i32] [debug line = 43:26]
  %tmp_3 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %eventsArraySize_read, i32 30) ; [#uses=1 type=i1]
  %tmp_op_op9 = or i32 %tmp, 1                    ; [#uses=2 type=i32]
  %tmp_4 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_op_op9, i32 31) ; [#uses=1 type=i1]
  %p_neg = xor i32 %tmp, -1                       ; [#uses=1 type=i32]
  %p_lshr = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %p_neg, i32 1, i32 31) ; [#uses=1 type=i31]
  %p_neg_t = sub i31 0, %p_lshr                   ; [#uses=1 type=i31]
  %tmp_5 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %tmp_op_op9, i32 1, i32 31) ; [#uses=1 type=i31]
  %tmp_6 = select i1 %tmp_4, i31 %p_neg_t, i31 %tmp_5 ; [#uses=1 type=i31]
  %tmp_7 = select i1 %tmp_3, i31 0, i31 %tmp_6    ; [#uses=1 type=i31]
  %tmp_8 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %tmp_7, i1 false) ; [#uses=1 type=i32]
  br label %1, !dbg !84                           ; [debug line = 43:26]

; <label>:1                                       ; preds = %accumulateHW.exit, %0
  %i = phi i32 [ 0, %0 ], [ %i_2, %accumulateHW.exit ] ; [#uses=2 type=i32]
  %tmp_9 = icmp eq i32 %i, %tmp_8                 ; [#uses=1 type=i1]
  br i1 %tmp_9, label %5, label %2, !dbg !84      ; [debug line = 43:26]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str10) nounwind, !dbg !86 ; [debug line = 44:3]
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @p_str10) nounwind, !dbg !86 ; [#uses=1 type=i32] [debug line = 44:3]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @p_str2) nounwind, !dbg !88 ; [debug line = 45:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !88 ; [debug line = 45:1]
  %data_read = call i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32* %data), !dbg !89 ; [#uses=4 type=i32] [debug line = 46:45]
  %x_cast = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %data_read, i32 17, i32 31), !dbg !89 ; [#uses=2 type=i15] [debug line = 46:45]
  %tmp_10 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %data_read, i32 1), !dbg !90 ; [#uses=1 type=i1] [debug line = 48:43]
  br i1 %tmp_10, label %3, label %accumulateHW.exit, !dbg !91 ; [debug line = 8:2@52:3]

; <label>:3                                       ; preds = %2
  %tmp_11 = call i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32 %data_read, i32 2, i32 11) ; [#uses=1 type=i10]
  %p_shl_cast = call i16 @_ssdm_op_BitConcatenate.i16.i10.i6(i10 %tmp_11, i6 0) ; [#uses=1 type=i16]
  %tmp_12 = call i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32 %data_read, i32 2, i32 15) ; [#uses=1 type=i14]
  %p_shl3_cast = call i16 @_ssdm_op_BitConcatenate.i16.i14.i2(i14 %tmp_12, i2 0), !dbg !100 ; [#uses=1 type=i16] [debug line = 10:3@52:3]
  %tmp_s = sub i16 %p_shl_cast, %p_shl3_cast, !dbg !100 ; [#uses=1 type=i16] [debug line = 10:3@52:3]
  %zext_cast = zext i15 %x_cast to i32            ; [#uses=1 type=i32]
  %mul = mul i32 %zext_cast, 34953                ; [#uses=1 type=i32]
  %tmp_13 = call i11 @_ssdm_op_PartSelect.i11.i32.i32.i32(i32 %mul, i32 21, i32 31) ; [#uses=1 type=i11]
  %arrayNo_i = sext i11 %tmp_13 to i15            ; [#uses=2 type=i15]
  %arrayNo_i_cast = zext i15 %arrayNo_i to i16    ; [#uses=1 type=i16]
  %newIndex_i = urem i15 %x_cast, 60              ; [#uses=1 type=i15]
  %newIndex1_i_cast = zext i15 %newIndex_i to i16, !dbg !100 ; [#uses=1 type=i16] [debug line = 10:3@52:3]
  %tmp_62 = add i16 %newIndex1_i_cast, %tmp_s, !dbg !100 ; [#uses=1 type=i16] [debug line = 10:3@52:3]
  %tmp_69_cast = sext i16 %tmp_62 to i32, !dbg !100 ; [#uses=4 type=i32] [debug line = 10:3@52:3]
  %glPLSlices_0_addr = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_69_cast, !dbg !100 ; [#uses=2 type=i8*] [debug line = 10:3@52:3]
  %glPLSlices_1_addr = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_69_cast, !dbg !100 ; [#uses=2 type=i8*] [debug line = 10:3@52:3]
  %glPLSlices_2_addr = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_69_cast, !dbg !100 ; [#uses=2 type=i8*] [debug line = 10:3@52:3]
  %glPLSlices_3_addr = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_69_cast, !dbg !100 ; [#uses=2 type=i8*] [debug line = 10:3@52:3]
  %glPLSlices_0_load = load i8* %glPLSlices_0_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_1_load = load i8* %glPLSlices_1_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_2_load = load i8* %glPLSlices_2_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_3_load = load i8* %glPLSlices_3_addr, align 1 ; [#uses=1 type=i8]
  %tmp_1 = call i8 @_ssdm_op_Mux.ap_auto.4i8.i16(i8 %glPLSlices_0_load, i8 %glPLSlices_1_load, i8 %glPLSlices_2_load, i8 %glPLSlices_3_load, i16 %arrayNo_i_cast) nounwind ; [#uses=1 type=i8]
  %tmp_3_i = add i8 %tmp_1, 1, !dbg !100          ; [#uses=4 type=i8] [debug line = 10:3@52:3]
  switch i15 %arrayNo_i, label %branch3.i [
    i15 0, label %branch0.i
    i15 1, label %branch1.i
    i15 2, label %branch2.i
  ], !dbg !100                                    ; [debug line = 10:3@52:3]

; <label>:4                                       ; preds = %branch3.i, %branch2.i, %branch1.i, %branch0.i
  br label %accumulateHW.exit, !dbg !102          ; [debug line = 11:2@52:3]

branch0.i:                                        ; preds = %3
  store i8 %tmp_3_i, i8* %glPLSlices_0_addr, align 1, !dbg !100 ; [debug line = 10:3@52:3]
  br label %4, !dbg !100                          ; [debug line = 10:3@52:3]

branch1.i:                                        ; preds = %3
  store i8 %tmp_3_i, i8* %glPLSlices_1_addr, align 1, !dbg !100 ; [debug line = 10:3@52:3]
  br label %4, !dbg !100                          ; [debug line = 10:3@52:3]

branch2.i:                                        ; preds = %3
  store i8 %tmp_3_i, i8* %glPLSlices_2_addr, align 1, !dbg !100 ; [debug line = 10:3@52:3]
  br label %4, !dbg !100                          ; [debug line = 10:3@52:3]

branch3.i:                                        ; preds = %3
  store i8 %tmp_3_i, i8* %glPLSlices_3_addr, align 1, !dbg !100 ; [debug line = 10:3@52:3]
  br label %4, !dbg !100                          ; [debug line = 10:3@52:3]

accumulateHW.exit:                                ; preds = %4, %2
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @p_str10, i32 %tmp_2) nounwind, !dbg !103 ; [#uses=0 type=i32] [debug line = 53:2]
  %i_2 = add nsw i32 %i, 2, !dbg !104             ; [#uses=1 type=i32] [debug line = 43:53]
  call void @llvm.dbg.value(metadata !{i32 %i_2}, i64 0, metadata !105), !dbg !104 ; [debug line = 43:53] [debug variable = i]
  br label %1, !dbg !104                          ; [debug line = 43:53]

; <label>:5                                       ; preds = %1
  call fastcc void @copyToPS(i8* %eventSlice, i32 %eventSlice_offset_re), !dbg !106 ; [debug line = 55:2]
  ret void, !dbg !107                             ; [debug line = 56:1]
}

; [#uses=5]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
declare i18 @llvm.part.select.i18(i18, i32, i32) nounwind readnone

; [#uses=10]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define internal fastcc void @copyToPS(i8* %eventSlice, i32 %eventSlice_offset) {
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str8, [7 x i8]* @p_str9, [1 x i8]* @p_str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  %eventSlice_offset_re = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventSlice_offset) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i8* %eventSlice}, i64 0, metadata !108), !dbg !112 ; [debug line = 15:23] [debug variable = eventSlice]
  br label %1, !dbg !113                          ; [debug line = 17:33]

; <label>:1                                       ; preds = %BurstBB35, %0
  %indvar_flatten = phi i16 [ 0, %0 ], [ %indvar_flatten_next, %BurstBB35 ] ; [#uses=3 type=i16]
  %i = phi i8 [ 0, %0 ], [ %tmp_mid2_v, %BurstBB35 ] ; [#uses=4 type=i8]
  %j = phi i8 [ 0, %0 ], [ %j_1, %BurstBB35 ]     ; [#uses=2 type=i8]
  %p_shl = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %i, i8 0), !dbg !116 ; [#uses=1 type=i16] [debug line = 21:4]
  %p_shl_cast = zext i16 %p_shl to i17, !dbg !116 ; [#uses=1 type=i17] [debug line = 21:4]
  %p_shl1 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %i, i4 0), !dbg !116 ; [#uses=1 type=i12] [debug line = 21:4]
  %p_shl1_cast = zext i12 %p_shl1 to i17, !dbg !116 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp_s = sub i17 %p_shl_cast, %p_shl1_cast, !dbg !116 ; [#uses=1 type=i17] [debug line = 21:4]
  %exitcond_flatten = icmp eq i16 %indvar_flatten, -22336 ; [#uses=1 type=i1]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 43200, i64 43200, i64 43200)
  %indvar_flatten_next = add i16 %indvar_flatten, 1 ; [#uses=2 type=i16]
  br i1 %exitcond_flatten, label %2, label %.reset

.reset:                                           ; preds = %1
  %i_3 = add i8 %i, 1, !dbg !120                  ; [#uses=3 type=i8] [debug line = 17:44]
  call void @llvm.dbg.value(metadata !{i8 %i_3}, i64 0, metadata !121), !dbg !120 ; [debug line = 17:44] [debug variable = i]
  call void (...)* @_ssdm_op_SpecLoopName([29 x i8]* @copyToPSLoop_copyToP)
  %exitcond = icmp eq i8 %j, -16, !dbg !122       ; [#uses=3 type=i1] [debug line = 19:36]
  %j_mid2 = select i1 %exitcond, i8 0, i8 %j      ; [#uses=3 type=i8]
  %tmp_mid2_v = select i1 %exitcond, i8 %i_3, i8 %i, !dbg !116 ; [#uses=3 type=i8] [debug line = 21:4]
  %tmp = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %tmp_mid2_v, i6 0) ; [#uses=1 type=i14]
  %p_shl4_cast = zext i14 %tmp to i15             ; [#uses=1 type=i15]
  %tmp_63 = call i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8 %tmp_mid2_v, i2 0) ; [#uses=1 type=i10]
  %p_shl5_cast = zext i10 %tmp_63 to i15          ; [#uses=1 type=i15]
  %tmp_64 = sub i15 %p_shl4_cast, %p_shl5_cast    ; [#uses=1 type=i15]
  %tmp_71_cast = sext i15 %tmp_64 to i16          ; [#uses=1 type=i16]
  %p_shl_mid1 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %i_3, i8 0), !dbg !116 ; [#uses=1 type=i16] [debug line = 21:4]
  %p_shl_cast_mid1 = zext i16 %p_shl_mid1 to i17, !dbg !116 ; [#uses=1 type=i17] [debug line = 21:4]
  %p_shl1_mid1 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %i_3, i4 0), !dbg !116 ; [#uses=1 type=i12] [debug line = 21:4]
  %p_shl1_cast_mid1 = zext i12 %p_shl1_mid1 to i17, !dbg !116 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp_mid1 = sub i17 %p_shl_cast_mid1, %p_shl1_cast_mid1, !dbg !116 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp_mid2 = select i1 %exitcond, i17 %tmp_mid1, i17 %tmp_s, !dbg !116 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp_7_mid2 = sext i17 %tmp_mid2 to i32, !dbg !116 ; [#uses=1 type=i32] [debug line = 21:4]
  call void (...)* @_ssdm_op_SpecLoopName([16 x i8]* @p_str1) nounwind, !dbg !123 ; [debug line = 20:4]
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([16 x i8]* @p_str1) nounwind, !dbg !123 ; [#uses=1 type=i32] [debug line = 20:4]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !124 ; [debug line = 21:1]
  %zext_cast = zext i8 %j_mid2 to i18             ; [#uses=1 type=i18]
  %mul = mul i18 %zext_cast, 274                  ; [#uses=1 type=i18]
  %tmp_14 = call i4 @_ssdm_op_PartSelect.i4.i18.i32.i32(i18 %mul, i32 14, i32 17) ; [#uses=1 type=i4]
  %arrayNo = sext i4 %tmp_14 to i8                ; [#uses=1 type=i8]
  %arrayNo_cast = zext i8 %arrayNo to i16         ; [#uses=1 type=i16]
  %newIndex = urem i8 %j_mid2, 60                 ; [#uses=1 type=i8]
  %newIndex2_cast = zext i8 %newIndex to i16      ; [#uses=1 type=i16]
  %tmp_65 = add i16 %tmp_71_cast, %newIndex2_cast ; [#uses=1 type=i16]
  %tmp_72_cast = sext i16 %tmp_65 to i32          ; [#uses=4 type=i32]
  %glPLSlices_0_addr = getelementptr [32400 x i8]* @glPLSlices_0, i32 0, i32 %tmp_72_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr = getelementptr [32400 x i8]* @glPLSlices_1, i32 0, i32 %tmp_72_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr = getelementptr [32400 x i8]* @glPLSlices_2, i32 0, i32 %tmp_72_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr = getelementptr [32400 x i8]* @glPLSlices_3, i32 0, i32 %tmp_72_cast ; [#uses=1 type=i8*]
  %glPLSlices_0_load = load i8* %glPLSlices_0_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_1_load = load i8* %glPLSlices_1_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_2_load = load i8* %glPLSlices_2_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_3_load = load i8* %glPLSlices_3_addr, align 1 ; [#uses=1 type=i8]
  %tmp_8 = call i8 @_ssdm_op_Mux.ap_auto.4i8.i16(i8 %glPLSlices_0_load, i8 %glPLSlices_1_load, i8 %glPLSlices_2_load, i8 %glPLSlices_3_load, i16 %arrayNo_cast) nounwind ; [#uses=1 type=i8]
  %sum2 = add i32 %eventSlice_offset_re, %tmp_7_mid2 ; [#uses=1 type=i32]
  %eventSlice_addr = getelementptr i8* %eventSlice, i32 %sum2, !dbg !116 ; [#uses=3 type=i8*] [debug line = 21:4]
  %tmp_15 = urem i16 %indvar_flatten, 240         ; [#uses=1 type=i16]
  %tmp_16 = icmp eq i16 %tmp_15, 0                ; [#uses=1 type=i1]
  br i1 %tmp_16, label %ReqBB, label %BurstBB

ReqBB:                                            ; preds = %.reset
  %eventSlice_addr_1_wr = call i1 @_ssdm_op_WriteReq.m_axi.i8P(i8* %eventSlice_addr, i32 240), !dbg !116 ; [#uses=0 type=i1] [debug line = 21:4]
  br label %BurstBB

BurstBB:                                          ; preds = %ReqBB, %.reset
  call void @_ssdm_op_Write.m_axi.i8P(i8* %eventSlice_addr, i8 %tmp_8, i1 true), !dbg !116 ; [debug line = 21:4]
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([16 x i8]* @p_str1, i32 %tmp_4) nounwind, !dbg !125 ; [#uses=0 type=i32] [debug line = 22:3]
  %j_1 = add i8 %j_mid2, 1, !dbg !126             ; [#uses=1 type=i8] [debug line = 19:47]
  call void @llvm.dbg.value(metadata !{i8 %j_1}, i64 0, metadata !127), !dbg !126 ; [debug line = 19:47] [debug variable = j]
  %tmp_17 = urem i16 %indvar_flatten_next, 240    ; [#uses=1 type=i16]
  %tmp_18 = icmp eq i16 %tmp_17, 0                ; [#uses=1 type=i1]
  br i1 %tmp_18, label %RespBB, label %BurstBB35

RespBB:                                           ; preds = %BurstBB
  %eventSlice_addr_1_wr_1 = call i1 @_ssdm_op_WriteResp.m_axi.i8P(i8* %eventSlice_addr), !dbg !116 ; [#uses=0 type=i1] [debug line = 21:4]
  br label %BurstBB35

BurstBB35:                                        ; preds = %RespBB, %BurstBB
  br label %1

; <label>:2                                       ; preds = %1
  ret void, !dbg !128                             ; [debug line = 24:1]
}

; [#uses=1]
define weak i1 @_ssdm_op_WriteResp.m_axi.i8P(i8*) {
entry:
  ret i1 true
}

; [#uses=1]
define weak i1 @_ssdm_op_WriteReq.m_axi.i8P(i8*, i32) {
entry:
  ret i1 true
}

; [#uses=1]
define weak void @_ssdm_op_Write.m_axi.i8P(i8*, i8, i1) {
entry:
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

; [#uses=3]
define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecLoopTripCount(...) nounwind {
entry:
  ret void
}

; [#uses=4]
define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecLatency(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32*) {
entry:
  %empty = call i32 @_autotb_FifoRead_i32(i32* %0) ; [#uses=1 type=i32]
  ret i32 %empty
}

; [#uses=3]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=1]
define weak i4 @_ssdm_op_PartSelect.i4.i18.i32.i32(i18, i32, i32) nounwind readnone {
entry:
  %empty = call i18 @llvm.part.select.i18(i18 %0, i32 %1, i32 %2) ; [#uses=1 type=i18]
  %empty_6 = trunc i18 %empty to i4               ; [#uses=1 type=i4]
  ret i4 %empty_6
}

; [#uses=2]
define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_7 = trunc i32 %empty to i31              ; [#uses=1 type=i31]
  ret i31 %empty_7
}

; [#uses=1]
define weak i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_8 = trunc i32 %empty to i15              ; [#uses=1 type=i15]
  ret i15 %empty_8
}

; [#uses=1]
define weak i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_9 = trunc i32 %empty to i14              ; [#uses=1 type=i14]
  ret i14 %empty_9
}

; [#uses=1]
define weak i11 @_ssdm_op_PartSelect.i11.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_10 = trunc i32 %empty to i11             ; [#uses=1 type=i11]
  ret i11 %empty_10
}

; [#uses=1]
define weak i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_11 = trunc i32 %empty to i10             ; [#uses=1 type=i10]
  ret i10 %empty_11
}

; [#uses=2]
define weak i8 @_ssdm_op_Mux.ap_auto.4i8.i16(i8, i8, i8, i8, i16) {
entry:
  switch i16 %4, label %case3 [
    i16 0, label %case0
    i16 1, label %case1
    i16 2, label %case2
  ]

case0:                                            ; preds = %case3, %case2, %case1, %entry
  %merge = phi i8 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ] ; [#uses=1 type=i8]
  ret i8 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0
}

; [#uses=3]
define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1                          ; [#uses=1 type=i32]
  %empty_12 = and i32 %0, %empty                  ; [#uses=1 type=i32]
  %empty_13 = icmp ne i32 %empty_12, 0            ; [#uses=1 type=i1]
  ret i1 %empty_13
}

; [#uses=0]
define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2                     ; [#uses=1 type=i2]
  %empty_14 = shl i2 1, %empty                    ; [#uses=1 type=i2]
  %empty_15 = and i2 %0, %empty_14                ; [#uses=1 type=i2]
  %empty_16 = icmp ne i2 %empty_15, 0             ; [#uses=1 type=i1]
  ret i1 %empty_16
}

; [#uses=1]
define weak i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone {
entry:
  %empty = zext i31 %0 to i32                     ; [#uses=1 type=i32]
  %empty_17 = zext i1 %1 to i32                   ; [#uses=1 type=i32]
  %empty_18 = shl i32 %empty, 1                   ; [#uses=1 type=i32]
  %empty_19 = or i32 %empty_18, %empty_17         ; [#uses=1 type=i32]
  ret i32 %empty_19
}

; [#uses=2]
define weak i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %0 to i16                      ; [#uses=1 type=i16]
  %empty_20 = zext i8 %1 to i16                   ; [#uses=1 type=i16]
  %empty_21 = shl i16 %empty, 8                   ; [#uses=1 type=i16]
  %empty_22 = or i16 %empty_21, %empty_20         ; [#uses=1 type=i16]
  ret i16 %empty_22
}

; [#uses=1]
define weak i16 @_ssdm_op_BitConcatenate.i16.i14.i2(i14, i2) nounwind readnone {
entry:
  %empty = zext i14 %0 to i16                     ; [#uses=1 type=i16]
  %empty_23 = zext i2 %1 to i16                   ; [#uses=1 type=i16]
  %empty_24 = shl i16 %empty, 2                   ; [#uses=1 type=i16]
  %empty_25 = or i16 %empty_24, %empty_23         ; [#uses=1 type=i16]
  ret i16 %empty_25
}

; [#uses=1]
define weak i16 @_ssdm_op_BitConcatenate.i16.i10.i6(i10, i6) nounwind readnone {
entry:
  %empty = zext i10 %0 to i16                     ; [#uses=1 type=i16]
  %empty_26 = zext i6 %1 to i16                   ; [#uses=1 type=i16]
  %empty_27 = shl i16 %empty, 6                   ; [#uses=1 type=i16]
  %empty_28 = or i16 %empty_27, %empty_26         ; [#uses=1 type=i16]
  ret i16 %empty_28
}

; [#uses=2]
define weak i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8, i6) nounwind readnone {
entry:
  %empty = zext i8 %0 to i14                      ; [#uses=1 type=i14]
  %empty_29 = zext i6 %1 to i14                   ; [#uses=1 type=i14]
  %empty_30 = shl i14 %empty, 6                   ; [#uses=1 type=i14]
  %empty_31 = or i14 %empty_30, %empty_29         ; [#uses=1 type=i14]
  ret i14 %empty_31
}

; [#uses=2]
define weak i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8, i4) nounwind readnone {
entry:
  %empty = zext i8 %0 to i12                      ; [#uses=1 type=i12]
  %empty_32 = zext i4 %1 to i12                   ; [#uses=1 type=i12]
  %empty_33 = shl i12 %empty, 4                   ; [#uses=1 type=i12]
  %empty_34 = or i12 %empty_33, %empty_32         ; [#uses=1 type=i12]
  ret i12 %empty_34
}

; [#uses=2]
define weak i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8, i2) nounwind readnone {
entry:
  %empty = zext i8 %0 to i10                      ; [#uses=1 type=i10]
  %empty_35 = zext i2 %1 to i10                   ; [#uses=1 type=i10]
  %empty_36 = shl i10 %empty, 2                   ; [#uses=1 type=i10]
  %empty_37 = or i10 %empty_36, %empty_35         ; [#uses=1 type=i10]
  ret i10 %empty_37
}

; [#uses=1]
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
!26 = metadata !{i32 29, i32 35, metadata !27, null}
!27 = metadata !{i32 786443, metadata !28, i32 29, i32 18, metadata !30, i32 8} ; [ DW_TAG_lexical_block ]
!28 = metadata !{i32 786443, metadata !29, i32 27, i32 1, metadata !30, i32 7} ; [ DW_TAG_lexical_block ]
!29 = metadata !{i32 786478, i32 0, metadata !30, metadata !"resetCurrentSliceHW", metadata !"resetCurrentSliceHW", metadata !"_Z19resetCurrentSliceHWv", metadata !30, i32 26, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @resetCurrentSliceHW, null, null, metadata !33, i32 27} ; [ DW_TAG_subprogram ]
!30 = metadata !{i32 786473, metadata !"../../mz_libcaer_OF_HLS/ABMOF/abmof_hw_accel.cpp", metadata !"E:\5CxfOpenCV\5Cwksp_2018_1\5Cmz_libcaer_OF_HLS\5CparseEvents", null} ; [ DW_TAG_file_type ]
!31 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!32 = metadata !{null}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!35 = metadata !{i32 29, i32 46, metadata !27, null}
!36 = metadata !{i32 30, i32 3, metadata !37, null}
!37 = metadata !{i32 786443, metadata !27, i32 30, i32 2, metadata !30, i32 9} ; [ DW_TAG_lexical_block ]
!38 = metadata !{i32 31, i32 1, metadata !37, null}
!39 = metadata !{i32 33, i32 4, metadata !40, null}
!40 = metadata !{i32 786443, metadata !41, i32 32, i32 3, metadata !30, i32 11} ; [ DW_TAG_lexical_block ]
!41 = metadata !{i32 786443, metadata !37, i32 31, i32 19, metadata !30, i32 10} ; [ DW_TAG_lexical_block ]
!42 = metadata !{i32 35, i32 2, metadata !37, null}
!43 = metadata !{i32 786688, metadata !27, metadata !"i", metadata !30, i32 29, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!44 = metadata !{i32 786454, null, metadata !"int16_t", metadata !30, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ]
!45 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!46 = metadata !{i32 36, i32 1, metadata !28, null}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 7, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"eventSlice", metadata !51, metadata !"signed char", i32 0, i32 7}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 0, i32 0, i32 1}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 0, i32 31, metadata !55}
!55 = metadata !{metadata !56}
!56 = metadata !{metadata !"data", metadata !51, metadata !"unsigned int", i32 0, i32 31}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 0, i32 31, metadata !59}
!59 = metadata !{metadata !60}
!60 = metadata !{metadata !"eventsArraySize", metadata !61, metadata !"int", i32 0, i32 31}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 0, i32 0, i32 0}
!63 = metadata !{i32 786689, metadata !64, metadata !"eventSlice", metadata !30, i32 50331686, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!64 = metadata !{i32 786478, i32 0, metadata !30, metadata !"parseEvents", metadata !"parseEvents", metadata !"_Z11parseEventsPKjiPa", metadata !30, i32 38, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !33, i32 39} ; [ DW_TAG_subprogram ]
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!66 = metadata !{null, metadata !67, metadata !71, metadata !73}
!67 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !68} ; [ DW_TAG_pointer_type ]
!68 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_const_type ]
!69 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !30, i32 40, i64 0, i64 0, i64 0, i32 0, metadata !70} ; [ DW_TAG_typedef ]
!70 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!71 = metadata !{i32 786454, null, metadata !"int32_t", metadata !30, i32 39, i64 0, i64 0, i64 0, i32 0, metadata !72} ; [ DW_TAG_typedef ]
!72 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!73 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ]
!74 = metadata !{i32 786454, null, metadata !"int8_t", metadata !30, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!75 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!76 = metadata !{i32 38, i32 74, metadata !64, null}
!77 = metadata !{i32 786689, metadata !64, metadata !"eventsArraySize", metadata !30, i32 33554470, metadata !71, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!78 = metadata !{i32 38, i32 49, metadata !64, null}
!79 = metadata !{i32 786689, metadata !64, metadata !"data", metadata !30, i32 16777254, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!80 = metadata !{i32 38, i32 35, metadata !64, null}
!81 = metadata !{i32 40, i32 1, metadata !82, null}
!82 = metadata !{i32 786443, metadata !64, i32 39, i32 1, metadata !30, i32 12} ; [ DW_TAG_lexical_block ]
!83 = metadata !{i32 40, i32 2, metadata !82, null}
!84 = metadata !{i32 43, i32 26, metadata !85, null}
!85 = metadata !{i32 786443, metadata !82, i32 43, i32 9, metadata !30, i32 13} ; [ DW_TAG_lexical_block ]
!86 = metadata !{i32 44, i32 3, metadata !87, null}
!87 = metadata !{i32 786443, metadata !85, i32 44, i32 2, metadata !30, i32 14} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 45, i32 1, metadata !87, null}
!89 = metadata !{i32 46, i32 45, metadata !87, null}
!90 = metadata !{i32 48, i32 43, metadata !87, null}
!91 = metadata !{i32 8, i32 2, metadata !92, metadata !99}
!92 = metadata !{i32 786443, metadata !93, i32 7, i32 1, metadata !30, i32 0} ; [ DW_TAG_lexical_block ]
!93 = metadata !{i32 786478, i32 0, metadata !30, metadata !"accumulateHW", metadata !"accumulateHW", metadata !"_Z12accumulateHWssbx", metadata !30, i32 6, metadata !94, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !33, i32 7} ; [ DW_TAG_subprogram ]
!94 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!95 = metadata !{null, metadata !44, metadata !44, metadata !96, metadata !97}
!96 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!97 = metadata !{i32 786454, null, metadata !"int64_t", metadata !30, i32 41, i64 0, i64 0, i64 0, i32 0, metadata !98} ; [ DW_TAG_typedef ]
!98 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!99 = metadata !{i32 52, i32 3, metadata !87, null}
!100 = metadata !{i32 10, i32 3, metadata !101, metadata !99}
!101 = metadata !{i32 786443, metadata !92, i32 9, i32 2, metadata !30, i32 1} ; [ DW_TAG_lexical_block ]
!102 = metadata !{i32 11, i32 2, metadata !101, metadata !99}
!103 = metadata !{i32 53, i32 2, metadata !87, null}
!104 = metadata !{i32 43, i32 53, metadata !85, null}
!105 = metadata !{i32 786688, metadata !85, metadata !"i", metadata !30, i32 43, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!106 = metadata !{i32 55, i32 2, metadata !82, null}
!107 = metadata !{i32 56, i32 1, metadata !82, null}
!108 = metadata !{i32 786689, metadata !109, metadata !"eventSlice", metadata !30, i32 16777231, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!109 = metadata !{i32 786478, i32 0, metadata !30, metadata !"copyToPS", metadata !"copyToPS", metadata !"_Z8copyToPSPa", metadata !30, i32 15, metadata !110, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !33, i32 16} ; [ DW_TAG_subprogram ]
!110 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !111, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!111 = metadata !{null, metadata !73}
!112 = metadata !{i32 15, i32 23, metadata !109, null}
!113 = metadata !{i32 17, i32 33, metadata !114, null}
!114 = metadata !{i32 786443, metadata !115, i32 17, i32 16, metadata !30, i32 3} ; [ DW_TAG_lexical_block ]
!115 = metadata !{i32 786443, metadata !109, i32 16, i32 1, metadata !30, i32 2} ; [ DW_TAG_lexical_block ]
!116 = metadata !{i32 21, i32 4, metadata !117, null}
!117 = metadata !{i32 786443, metadata !118, i32 20, i32 3, metadata !30, i32 6} ; [ DW_TAG_lexical_block ]
!118 = metadata !{i32 786443, metadata !119, i32 19, i32 19, metadata !30, i32 5} ; [ DW_TAG_lexical_block ]
!119 = metadata !{i32 786443, metadata !114, i32 18, i32 2, metadata !30, i32 4} ; [ DW_TAG_lexical_block ]
!120 = metadata !{i32 17, i32 44, metadata !114, null}
!121 = metadata !{i32 786688, metadata !114, metadata !"i", metadata !30, i32 17, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!122 = metadata !{i32 19, i32 36, metadata !118, null}
!123 = metadata !{i32 20, i32 4, metadata !117, null}
!124 = metadata !{i32 21, i32 1, metadata !117, null}
!125 = metadata !{i32 22, i32 3, metadata !117, null}
!126 = metadata !{i32 19, i32 47, metadata !118, null}
!127 = metadata !{i32 786688, metadata !118, metadata !"j", metadata !30, i32 19, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!128 = metadata !{i32 24, i32 1, metadata !115, null}
