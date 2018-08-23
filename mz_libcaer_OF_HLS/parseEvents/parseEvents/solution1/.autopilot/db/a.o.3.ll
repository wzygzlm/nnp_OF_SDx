; ModuleID = 'E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i386-w64-mingw32"

@parseEvents_str = internal unnamed_addr constant [12 x i8] c"parseEvents\00" ; [#uses=1 type=[12 x i8]*]
@glPLSlices_9 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_8 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_7 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_6 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_5 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_4 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_3 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_2 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_15 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_14 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_13 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_12 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_11 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_10 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_1 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@glPLSlices_0 = internal global [8100 x i8] zeroinitializer ; [#uses=17 type=[8100 x i8]*]
@copyToPSLoop_copyToP = internal unnamed_addr constant [29 x i8] c"copyToPSLoop_copyToPS_label2\00" ; [#uses=1 type=[29 x i8]*]
@p_str9 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=2 type=[7 x i8]*]
@p_str8 = private unnamed_addr constant [11 x i8] c"eventSlice\00", align 1 ; [#uses=2 type=[11 x i8]*]
@p_str7 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=2 type=[6 x i8]*]
@p_str5 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1 ; [#uses=1 type=[8 x i8]*]
@p_str3 = private unnamed_addr constant [15 x i8] c"resetSliceLoop\00", align 1 ; [#uses=3 type=[15 x i8]*]
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
  call void (...)* @_ssdm_op_SpecLoopName([15 x i8]* @p_str3) nounwind, !dbg !36 ; [debug line = 30:3]
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([15 x i8]* @p_str3) nounwind, !dbg !36 ; [#uses=1 type=i32] [debug line = 30:3]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !38 ; [debug line = 31:1]
  %tmp_cast = zext i8 %i to i13                   ; [#uses=1 type=i13]
  %tmp_2 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %i, i4 0) ; [#uses=1 type=i12]
  %p_shl_cast = zext i12 %tmp_2 to i13            ; [#uses=1 type=i13]
  %tmp_3 = sub i13 %p_shl_cast, %tmp_cast         ; [#uses=2 type=i13]
  %tmp_3_cast1 = sext i13 %tmp_3 to i14           ; [#uses=14 type=i14]
  %tmp_3_cast = sext i13 %tmp_3 to i32            ; [#uses=16 type=i32]
  %glPLSlices_0_addr = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %tmp_4 = add i14 %tmp_3_cast1, 1                ; [#uses=1 type=i14]
  %tmp_4_cast = sext i14 %tmp_4 to i32            ; [#uses=16 type=i32]
  %glPLSlices_0_addr_1 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %tmp_5 = add i14 %tmp_3_cast1, 2                ; [#uses=1 type=i14]
  %tmp_5_cast = sext i14 %tmp_5 to i32            ; [#uses=16 type=i32]
  %glPLSlices_0_addr_2 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %tmp_6 = add i14 %tmp_3_cast1, 3                ; [#uses=1 type=i14]
  %tmp_6_cast = sext i14 %tmp_6 to i32            ; [#uses=16 type=i32]
  %glPLSlices_0_addr_3 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %tmp_7 = add i14 %tmp_3_cast1, 4                ; [#uses=1 type=i14]
  %tmp_7_cast = sext i14 %tmp_7 to i32            ; [#uses=16 type=i32]
  %glPLSlices_0_addr_4 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %tmp_8 = add i14 %tmp_3_cast1, 5                ; [#uses=1 type=i14]
  %tmp_8_cast = sext i14 %tmp_8 to i32            ; [#uses=16 type=i32]
  %glPLSlices_0_addr_5 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %tmp_9 = add i14 %tmp_3_cast1, 6                ; [#uses=1 type=i14]
  %tmp_9_cast = sext i14 %tmp_9 to i32            ; [#uses=16 type=i32]
  %glPLSlices_0_addr_6 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %tmp_s = add i14 %tmp_3_cast1, 7                ; [#uses=1 type=i14]
  %tmp_10_cast = sext i14 %tmp_s to i32           ; [#uses=16 type=i32]
  %glPLSlices_0_addr_7 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %tmp_10 = add i14 %tmp_3_cast1, 8               ; [#uses=1 type=i14]
  %tmp_11_cast = sext i14 %tmp_10 to i32          ; [#uses=16 type=i32]
  %glPLSlices_0_addr_8 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %tmp_11 = add i14 %tmp_3_cast1, 9               ; [#uses=1 type=i14]
  %tmp_12_cast = sext i14 %tmp_11 to i32          ; [#uses=16 type=i32]
  %glPLSlices_0_addr_9 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %tmp_12 = add i14 %tmp_3_cast1, 10              ; [#uses=1 type=i14]
  %tmp_13_cast = sext i14 %tmp_12 to i32          ; [#uses=16 type=i32]
  %glPLSlices_0_addr_10 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %tmp_13 = add i14 %tmp_3_cast1, 11              ; [#uses=1 type=i14]
  %tmp_14_cast = sext i14 %tmp_13 to i32          ; [#uses=16 type=i32]
  %glPLSlices_0_addr_11 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %tmp_14 = add i14 %tmp_3_cast1, 12              ; [#uses=1 type=i14]
  %tmp_15_cast = sext i14 %tmp_14 to i32          ; [#uses=16 type=i32]
  %glPLSlices_0_addr_12 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %tmp_15 = add i14 %tmp_3_cast1, 13              ; [#uses=1 type=i14]
  %tmp_16_cast = sext i14 %tmp_15 to i32          ; [#uses=16 type=i32]
  %glPLSlices_0_addr_13 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %tmp_16 = add i14 %tmp_3_cast1, 14              ; [#uses=1 type=i14]
  %tmp_17_cast = sext i14 %tmp_16 to i32          ; [#uses=16 type=i32]
  %glPLSlices_0_addr_14 = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_1 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_2 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_3 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_4 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_5 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_6 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_7 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_8 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_9 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_10 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_11 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_12 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_13 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr_14 = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_1 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_2 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_3 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_4 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_5 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_6 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_7 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_8 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_9 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_10 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_11 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_12 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_13 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr_14 = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_1 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_2 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_3 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_4 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_5 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_6 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_7 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_8 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_9 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_10 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_11 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_12 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_13 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr_14 = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_1 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_2 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_3 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_4 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_5 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_6 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_7 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_8 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_9 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_10 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_11 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_12 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_13 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr_14 = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_1 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_2 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_3 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_4 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_5 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_6 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_7 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_8 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_9 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_10 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_11 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_12 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_13 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr_14 = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_1 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_2 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_3 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_4 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_5 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_6 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_7 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_8 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_9 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_10 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_11 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_12 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_13 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr_14 = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_1 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_2 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_3 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_4 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_5 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_6 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_7 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_8 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_9 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_10 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_11 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_12 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_13 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr_14 = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_1 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_2 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_3 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_4 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_5 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_6 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_7 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_8 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_9 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_10 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_11 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_12 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_13 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr_14 = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_1 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_2 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_3 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_4 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_5 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_6 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_7 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_8 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_9 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_10 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_11 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_12 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_13 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr_14 = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_1 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_2 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_3 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_4 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_5 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_6 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_7 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_8 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_9 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_10 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_11 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_12 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_13 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr_14 = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_1 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_2 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_3 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_4 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_5 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_6 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_7 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_8 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_9 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_10 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_11 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_12 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_13 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr_14 = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_1 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_2 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_3 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_4 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_5 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_6 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_7 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_8 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_9 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_10 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_11 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_12 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_13 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr_14 = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_1 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_2 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_3 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_4 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_5 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_6 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_7 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_8 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_9 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_10 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_11 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_12 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_13 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr_14 = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_1 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_2 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_3 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_4 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_5 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_6 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_7 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_8 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_9 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_10 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_11 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_12 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_13 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr_14 = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_3_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_1 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_4_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_2 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_5_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_3 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_6_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_4 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_7_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_5 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_8_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_6 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_9_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_7 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_10_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_8 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_11_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_9 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_12_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_10 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_13_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_11 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_14_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_12 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_15_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_13 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_16_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr_14 = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_17_cast ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices_0_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_0_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_1_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_2_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_3_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_4_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_5_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_6_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_7_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_8_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_9_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_10_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_11_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_12_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_13_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_14_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_1, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_2, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_3, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_4, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_5, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_6, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_7, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_8, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_9, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_10, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_11, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_12, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_13, align 1, !dbg !39 ; [debug line = 33:4]
  store i8 0, i8* %glPLSlices_15_addr_14, align 1, !dbg !39 ; [debug line = 33:4]
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([15 x i8]* @p_str3, i32 %tmp_1) nounwind, !dbg !42 ; [#uses=0 type=i32] [debug line = 35:2]
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
  call void (...)* @_ssdm_op_SpecInterface(i32* %data, [8 x i8]* @p_str5, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind, !dbg !81 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @p_str2) nounwind, !dbg !81 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str8, [7 x i8]* @p_str9, [1 x i8]* @p_str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind, !dbg !81 ; [debug line = 40:1]
  call fastcc void @resetCurrentSliceHW(), !dbg !83 ; [debug line = 40:2]
  %tmp = shl i32 %eventsArraySize_read, 1, !dbg !84 ; [#uses=2 type=i32] [debug line = 43:26]
  %tmp_1 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %eventsArraySize_read, i32 30) ; [#uses=1 type=i1]
  %tmp_op_op8 = or i32 %tmp, 1                    ; [#uses=2 type=i32]
  %tmp_3 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_op_op8, i32 31) ; [#uses=1 type=i1]
  %p_neg = xor i32 %tmp, -1                       ; [#uses=1 type=i32]
  %p_lshr = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %p_neg, i32 1, i32 31) ; [#uses=1 type=i31]
  %p_neg_t = sub i31 0, %p_lshr                   ; [#uses=1 type=i31]
  %tmp_4 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %tmp_op_op8, i32 1, i32 31) ; [#uses=1 type=i31]
  %tmp_5 = select i1 %tmp_3, i31 %p_neg_t, i31 %tmp_4 ; [#uses=1 type=i31]
  %tmp_6 = select i1 %tmp_1, i31 0, i31 %tmp_5    ; [#uses=1 type=i31]
  %tmp_7 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %tmp_6, i1 false) ; [#uses=1 type=i32]
  br label %1, !dbg !84                           ; [debug line = 43:26]

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i_2, %2 ]            ; [#uses=2 type=i32]
  %tmp_8 = icmp eq i32 %i, %tmp_7                 ; [#uses=1 type=i1]
  br i1 %tmp_8, label %3, label %2, !dbg !84      ; [debug line = 43:26]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str10) nounwind, !dbg !86 ; [debug line = 44:3]
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @p_str10) nounwind, !dbg !86 ; [#uses=1 type=i32] [debug line = 44:3]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @p_str2) nounwind, !dbg !88 ; [debug line = 45:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !88 ; [debug line = 45:1]
  %data_read = call i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32* %data), !dbg !89 ; [#uses=3 type=i32] [debug line = 46:45]
  %tmp_s = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %data_read, i32 17, i32 31), !dbg !89 ; [#uses=1 type=i15] [debug line = 46:45]
  %x = zext i15 %tmp_s to i16, !dbg !89           ; [#uses=1 type=i16] [debug line = 46:45]
  call void @llvm.dbg.value(metadata !{i16 %x}, i64 0, metadata !90), !dbg !89 ; [debug line = 46:45] [debug variable = x]
  %y = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %data_read, i32 2, i32 16), !dbg !91 ; [#uses=1 type=i15] [debug line = 47:44]
  %y_cast = zext i15 %y to i16, !dbg !91          ; [#uses=1 type=i16] [debug line = 47:44]
  call void @llvm.dbg.value(metadata !{i15 %y}, i64 0, metadata !92), !dbg !91 ; [debug line = 47:44] [debug variable = y]
  %pol = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %data_read, i32 1), !dbg !93 ; [#uses=1 type=i1] [debug line = 48:43]
  call void @llvm.dbg.value(metadata !{i1 %pol}, i64 0, metadata !94), !dbg !93 ; [debug line = 48:43] [debug variable = pol]
  call fastcc void @accumulateHW(i16 signext %x, i16 signext %y_cast, i1 zeroext %pol), !dbg !96 ; [debug line = 52:3]
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @p_str10, i32 %tmp_2) nounwind, !dbg !97 ; [#uses=0 type=i32] [debug line = 53:2]
  %i_2 = add nsw i32 2, %i, !dbg !98              ; [#uses=1 type=i32] [debug line = 43:53]
  call void @llvm.dbg.value(metadata !{i32 %i_2}, i64 0, metadata !99), !dbg !98 ; [debug line = 43:53] [debug variable = i]
  br label %1, !dbg !98                           ; [debug line = 43:53]

; <label>:3                                       ; preds = %1
  call fastcc void @copyToPS(i8* %eventSlice, i32 %eventSlice_offset_re), !dbg !100 ; [debug line = 55:2]
  ret void, !dbg !101                             ; [debug line = 56:1]
}

; [#uses=3]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
declare i18 @llvm.part.select.i18(i18, i32, i32) nounwind readnone

; [#uses=19]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define internal fastcc void @copyToPS(i8* %eventSlice, i32 %eventSlice_offset) {
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str8, [7 x i8]* @p_str9, [1 x i8]* @p_str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  %eventSlice_offset_re = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventSlice_offset) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i8* %eventSlice}, i64 0, metadata !102), !dbg !106 ; [debug line = 15:23] [debug variable = eventSlice]
  br label %1, !dbg !107                          ; [debug line = 17:33]

; <label>:1                                       ; preds = %BurstBB106, %0
  %indvar_flatten = phi i16 [ 0, %0 ], [ %indvar_flatten_next, %BurstBB106 ] ; [#uses=3 type=i16]
  %i = phi i8 [ 0, %0 ], [ %tmp_mid2_v, %BurstBB106 ] ; [#uses=4 type=i8]
  %j = phi i8 [ 0, %0 ], [ %j_1, %BurstBB106 ]    ; [#uses=2 type=i8]
  %p_shl = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %i, i8 0), !dbg !110 ; [#uses=1 type=i16] [debug line = 21:4]
  %p_shl_cast = zext i16 %p_shl to i17, !dbg !110 ; [#uses=1 type=i17] [debug line = 21:4]
  %p_shl1 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %i, i4 0), !dbg !110 ; [#uses=1 type=i12] [debug line = 21:4]
  %p_shl1_cast = zext i12 %p_shl1 to i17, !dbg !110 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp_s = sub i17 %p_shl_cast, %p_shl1_cast, !dbg !110 ; [#uses=1 type=i17] [debug line = 21:4]
  %exitcond_flatten = icmp eq i16 %indvar_flatten, -22336 ; [#uses=1 type=i1]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 43200, i64 43200, i64 43200)
  %indvar_flatten_next = add i16 %indvar_flatten, 1 ; [#uses=2 type=i16]
  br i1 %exitcond_flatten, label %2, label %.reset

.reset:                                           ; preds = %1
  %i_3 = add i8 %i, 1, !dbg !114                  ; [#uses=3 type=i8] [debug line = 17:44]
  call void @llvm.dbg.value(metadata !{i8 %i_3}, i64 0, metadata !115), !dbg !114 ; [debug line = 17:44] [debug variable = i]
  call void (...)* @_ssdm_op_SpecLoopName([29 x i8]* @copyToPSLoop_copyToP)
  %exitcond = icmp eq i8 %j, -16, !dbg !116       ; [#uses=3 type=i1] [debug line = 19:36]
  %j_mid2 = select i1 %exitcond, i8 0, i8 %j      ; [#uses=3 type=i8]
  %tmp_mid2_v = select i1 %exitcond, i8 %i_3, i8 %i, !dbg !110 ; [#uses=3 type=i8] [debug line = 21:4]
  %tmp_mid2_cast = zext i8 %tmp_mid2_v to i13     ; [#uses=1 type=i13]
  %tmp = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %tmp_mid2_v, i4 0) ; [#uses=1 type=i12]
  %p_shl4_cast = zext i12 %tmp to i13             ; [#uses=1 type=i13]
  %tmp_17 = sub i13 %p_shl4_cast, %tmp_mid2_cast  ; [#uses=1 type=i13]
  %tmp_20_cast = sext i13 %tmp_17 to i14          ; [#uses=1 type=i14]
  %p_shl_mid1 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %i_3, i8 0), !dbg !110 ; [#uses=1 type=i16] [debug line = 21:4]
  %p_shl_cast_mid1 = zext i16 %p_shl_mid1 to i17, !dbg !110 ; [#uses=1 type=i17] [debug line = 21:4]
  %p_shl1_mid1 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %i_3, i4 0), !dbg !110 ; [#uses=1 type=i12] [debug line = 21:4]
  %p_shl1_cast_mid1 = zext i12 %p_shl1_mid1 to i17, !dbg !110 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp_mid1 = sub i17 %p_shl_cast_mid1, %p_shl1_cast_mid1, !dbg !110 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp_mid2 = select i1 %exitcond, i17 %tmp_mid1, i17 %tmp_s, !dbg !110 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp_6_mid2 = sext i17 %tmp_mid2 to i32, !dbg !110 ; [#uses=1 type=i32] [debug line = 21:4]
  call void (...)* @_ssdm_op_SpecLoopName([16 x i8]* @p_str1) nounwind, !dbg !117 ; [debug line = 20:4]
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([16 x i8]* @p_str1) nounwind, !dbg !117 ; [#uses=1 type=i32] [debug line = 20:4]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !118 ; [debug line = 21:1]
  %zext_cast = zext i8 %j_mid2 to i18             ; [#uses=1 type=i18]
  %mul = mul i18 %zext_cast, 274                  ; [#uses=1 type=i18]
  %tmp_10 = call i6 @_ssdm_op_PartSelect.i6.i18.i32.i32(i18 %mul, i32 12, i32 17) ; [#uses=1 type=i6]
  %arrayNo = sext i6 %tmp_10 to i8                ; [#uses=1 type=i8]
  %arrayNo_cast = zext i8 %arrayNo to i16         ; [#uses=1 type=i16]
  %newIndex = urem i8 %j_mid2, 15                 ; [#uses=1 type=i8]
  %newIndex2_cast = zext i8 %newIndex to i14      ; [#uses=1 type=i14]
  %tmp_18 = add i14 %tmp_20_cast, %newIndex2_cast ; [#uses=1 type=i14]
  %tmp_21_cast = sext i14 %tmp_18 to i32          ; [#uses=16 type=i32]
  %glPLSlices_0_addr = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_1_addr = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_10_addr = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_11_addr = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_12_addr = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_13_addr = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_14_addr = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_15_addr = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_2_addr = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_3_addr = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_4_addr = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_5_addr = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_6_addr = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_7_addr = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_8_addr = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_9_addr = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_21_cast ; [#uses=1 type=i8*]
  %glPLSlices_0_load = load i8* %glPLSlices_0_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_1_load = load i8* %glPLSlices_1_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_2_load = load i8* %glPLSlices_2_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_3_load = load i8* %glPLSlices_3_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_4_load = load i8* %glPLSlices_4_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_5_load = load i8* %glPLSlices_5_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_6_load = load i8* %glPLSlices_6_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_7_load = load i8* %glPLSlices_7_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_8_load = load i8* %glPLSlices_8_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_9_load = load i8* %glPLSlices_9_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_10_load = load i8* %glPLSlices_10_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_11_load = load i8* %glPLSlices_11_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_12_load = load i8* %glPLSlices_12_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_13_load = load i8* %glPLSlices_13_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_14_load = load i8* %glPLSlices_14_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_15_load = load i8* %glPLSlices_15_addr, align 1 ; [#uses=1 type=i8]
  %tmp_7 = call i8 @_ssdm_op_Mux.ap_auto.16i8.i16(i8 %glPLSlices_0_load, i8 %glPLSlices_1_load, i8 %glPLSlices_2_load, i8 %glPLSlices_3_load, i8 %glPLSlices_4_load, i8 %glPLSlices_5_load, i8 %glPLSlices_6_load, i8 %glPLSlices_7_load, i8 %glPLSlices_8_load, i8 %glPLSlices_9_load, i8 %glPLSlices_10_load, i8 %glPLSlices_11_load, i8 %glPLSlices_12_load, i8 %glPLSlices_13_load, i8 %glPLSlices_14_load, i8 %glPLSlices_15_load, i16 %arrayNo_cast) nounwind ; [#uses=1 type=i8]
  %sum2 = add i32 %eventSlice_offset_re, %tmp_6_mid2 ; [#uses=1 type=i32]
  %eventSlice_addr = getelementptr i8* %eventSlice, i32 %sum2, !dbg !110 ; [#uses=3 type=i8*] [debug line = 21:4]
  %tmp_11 = urem i16 %indvar_flatten, 240         ; [#uses=1 type=i16]
  %tmp_12 = icmp eq i16 %tmp_11, 0                ; [#uses=1 type=i1]
  br i1 %tmp_12, label %ReqBB, label %BurstBB

ReqBB:                                            ; preds = %.reset
  %eventSlice_addr_1_wr = call i1 @_ssdm_op_WriteReq.m_axi.i8P(i8* %eventSlice_addr, i32 240), !dbg !110 ; [#uses=0 type=i1] [debug line = 21:4]
  br label %BurstBB

BurstBB:                                          ; preds = %ReqBB, %.reset
  call void @_ssdm_op_Write.m_axi.i8P(i8* %eventSlice_addr, i8 %tmp_7, i1 true), !dbg !110 ; [debug line = 21:4]
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([16 x i8]* @p_str1, i32 %tmp_4) nounwind, !dbg !119 ; [#uses=0 type=i32] [debug line = 22:3]
  %j_1 = add i8 %j_mid2, 1, !dbg !120             ; [#uses=1 type=i8] [debug line = 19:47]
  call void @llvm.dbg.value(metadata !{i8 %j_1}, i64 0, metadata !121), !dbg !120 ; [debug line = 19:47] [debug variable = j]
  %tmp_13 = urem i16 %indvar_flatten_next, 240    ; [#uses=1 type=i16]
  %tmp_14 = icmp eq i16 %tmp_13, 0                ; [#uses=1 type=i1]
  br i1 %tmp_14, label %RespBB, label %BurstBB106

RespBB:                                           ; preds = %BurstBB
  %eventSlice_addr_1_wr_1 = call i1 @_ssdm_op_WriteResp.m_axi.i8P(i8* %eventSlice_addr), !dbg !110 ; [#uses=0 type=i1] [debug line = 21:4]
  br label %BurstBB106

BurstBB106:                                       ; preds = %RespBB, %BurstBB
  br label %1

; <label>:2                                       ; preds = %1
  ret void, !dbg !122                             ; [debug line = 24:1]
}

; [#uses=1]
define internal fastcc void @accumulateHW(i16 signext %x, i16 signext %y, i1 zeroext %pol) nounwind {
  %pol_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %pol) nounwind ; [#uses=1 type=i1]
  call void @llvm.dbg.value(metadata !{i1 %pol_read}, i64 0, metadata !123), !dbg !129 ; [debug line = 6:46] [debug variable = pol]
  %y_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %y) nounwind ; [#uses=2 type=i16]
  call void @llvm.dbg.value(metadata !{i16 %y_read}, i64 0, metadata !130), !dbg !131 ; [debug line = 6:38] [debug variable = y]
  %x_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %x) nounwind ; [#uses=1 type=i16]
  call void @llvm.dbg.value(metadata !{i16 %x_read}, i64 0, metadata !132), !dbg !133 ; [debug line = 6:27] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i16 %x}, i64 0, metadata !132), !dbg !133 ; [debug line = 6:27] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i16 %y}, i64 0, metadata !130), !dbg !131 ; [debug line = 6:38] [debug variable = y]
  call void @llvm.dbg.value(metadata !{i1 %pol}, i64 0, metadata !123), !dbg !129 ; [debug line = 6:46] [debug variable = pol]
  br i1 %pol_read, label %1, label %._crit_edge, !dbg !134 ; [debug line = 8:2]

; <label>:1                                       ; preds = %0
  %tmp_15 = trunc i16 %y_read to i14              ; [#uses=1 type=i14]
  %tmp_16 = trunc i16 %y_read to i10              ; [#uses=1 type=i10]
  %p_shl_cast = call i14 @_ssdm_op_BitConcatenate.i14.i10.i4(i10 %tmp_16, i4 0), !dbg !136 ; [#uses=1 type=i14] [debug line = 10:3]
  %tmp_s = sub i14 %p_shl_cast, %tmp_15, !dbg !136 ; [#uses=1 type=i14] [debug line = 10:3]
  %tmp_17 = trunc i16 %x_read to i15              ; [#uses=2 type=i15]
  %zext_cast = zext i15 %tmp_17 to i32            ; [#uses=1 type=i32]
  %mul = mul i32 34953, %zext_cast                ; [#uses=1 type=i32]
  %tmp_18 = call i13 @_ssdm_op_PartSelect.i13.i32.i32.i32(i32 %mul, i32 19, i32 31) ; [#uses=1 type=i13]
  %arrayNo = sext i13 %tmp_18 to i15              ; [#uses=2 type=i15]
  %arrayNo_cast = zext i15 %arrayNo to i16        ; [#uses=1 type=i16]
  %newIndex = urem i15 %tmp_17, 15                ; [#uses=1 type=i15]
  %tmp_19 = trunc i15 %newIndex to i14, !dbg !136 ; [#uses=1 type=i14] [debug line = 10:3]
  %tmp_20 = add i14 %tmp_19, %tmp_s, !dbg !136    ; [#uses=1 type=i14] [debug line = 10:3]
  %tmp_24_cast = sext i14 %tmp_20 to i32, !dbg !136 ; [#uses=16 type=i32] [debug line = 10:3]
  %glPLSlices_0_addr = getelementptr [8100 x i8]* @glPLSlices_0, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_1_addr = getelementptr [8100 x i8]* @glPLSlices_1, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_10_addr = getelementptr [8100 x i8]* @glPLSlices_10, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_11_addr = getelementptr [8100 x i8]* @glPLSlices_11, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_12_addr = getelementptr [8100 x i8]* @glPLSlices_12, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_13_addr = getelementptr [8100 x i8]* @glPLSlices_13, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_14_addr = getelementptr [8100 x i8]* @glPLSlices_14, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_15_addr = getelementptr [8100 x i8]* @glPLSlices_15, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_2_addr = getelementptr [8100 x i8]* @glPLSlices_2, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_3_addr = getelementptr [8100 x i8]* @glPLSlices_3, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_4_addr = getelementptr [8100 x i8]* @glPLSlices_4, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_5_addr = getelementptr [8100 x i8]* @glPLSlices_5, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_6_addr = getelementptr [8100 x i8]* @glPLSlices_6, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_7_addr = getelementptr [8100 x i8]* @glPLSlices_7, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_8_addr = getelementptr [8100 x i8]* @glPLSlices_8, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_9_addr = getelementptr [8100 x i8]* @glPLSlices_9, i32 0, i32 %tmp_24_cast, !dbg !136 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices_0_load = load i8* %glPLSlices_0_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_1_load = load i8* %glPLSlices_1_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_2_load = load i8* %glPLSlices_2_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_3_load = load i8* %glPLSlices_3_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_4_load = load i8* %glPLSlices_4_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_5_load = load i8* %glPLSlices_5_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_6_load = load i8* %glPLSlices_6_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_7_load = load i8* %glPLSlices_7_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_8_load = load i8* %glPLSlices_8_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_9_load = load i8* %glPLSlices_9_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_10_load = load i8* %glPLSlices_10_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_11_load = load i8* %glPLSlices_11_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_12_load = load i8* %glPLSlices_12_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_13_load = load i8* %glPLSlices_13_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_14_load = load i8* %glPLSlices_14_addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices_15_load = load i8* %glPLSlices_15_addr, align 1 ; [#uses=1 type=i8]
  %tmp = call i8 @_ssdm_op_Mux.ap_auto.16i8.i16(i8 %glPLSlices_0_load, i8 %glPLSlices_1_load, i8 %glPLSlices_2_load, i8 %glPLSlices_3_load, i8 %glPLSlices_4_load, i8 %glPLSlices_5_load, i8 %glPLSlices_6_load, i8 %glPLSlices_7_load, i8 %glPLSlices_8_load, i8 %glPLSlices_9_load, i8 %glPLSlices_10_load, i8 %glPLSlices_11_load, i8 %glPLSlices_12_load, i8 %glPLSlices_13_load, i8 %glPLSlices_14_load, i8 %glPLSlices_15_load, i16 %arrayNo_cast) nounwind ; [#uses=1 type=i8]
  %tmp_3 = add i8 1, %tmp, !dbg !136              ; [#uses=16 type=i8] [debug line = 10:3]
  switch i15 %arrayNo, label %branch15 [
    i15 0, label %branch0
    i15 1, label %branch1
    i15 2, label %branch2
    i15 3, label %branch3
    i15 4, label %branch4
    i15 5, label %branch5
    i15 6, label %branch6
    i15 7, label %branch7
    i15 8, label %branch8
    i15 9, label %branch9
    i15 10, label %branch10
    i15 11, label %branch11
    i15 12, label %branch12
    i15 13, label %branch13
    i15 14, label %branch14
  ], !dbg !136                                    ; [debug line = 10:3]

; <label>:2                                       ; preds = %branch15, %branch14, %branch13, %branch12, %branch11, %branch10, %branch9, %branch8, %branch7, %branch6, %branch5, %branch4, %branch3, %branch2, %branch1, %branch0
  br label %._crit_edge, !dbg !138                ; [debug line = 11:2]

._crit_edge:                                      ; preds = %2, %0
  ret void, !dbg !139                             ; [debug line = 12:1]

branch0:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_0_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch1:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_1_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch2:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_2_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch3:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_3_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch4:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_4_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch5:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_5_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch6:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_6_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch7:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_7_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch8:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_8_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch9:                                          ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_9_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch10:                                         ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_10_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch11:                                         ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_11_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch12:                                         ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_12_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch13:                                         ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_13_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch14:                                         ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_14_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]

branch15:                                         ; preds = %1
  store i8 %tmp_3, i8* %glPLSlices_15_addr, align 1, !dbg !136 ; [debug line = 10:3]
  br label %2, !dbg !136                          ; [debug line = 10:3]
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

; [#uses=2]
define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

; [#uses=1]
define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

; [#uses=1]
define weak i6 @_ssdm_op_PartSelect.i6.i18.i32.i32(i18, i32, i32) nounwind readnone {
entry:
  %empty = call i18 @llvm.part.select.i18(i18 %0, i32 %1, i32 %2) ; [#uses=1 type=i18]
  %empty_6 = trunc i18 %empty to i6               ; [#uses=1 type=i6]
  ret i6 %empty_6
}

; [#uses=2]
define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_7 = trunc i32 %empty to i31              ; [#uses=1 type=i31]
  ret i31 %empty_7
}

; [#uses=2]
define weak i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_8 = trunc i32 %empty to i15              ; [#uses=1 type=i15]
  ret i15 %empty_8
}

; [#uses=0]
declare i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16, i32, i32) nounwind readnone

; [#uses=0]
declare i14 @_ssdm_op_PartSelect.i14.i16.i32.i32(i16, i32, i32) nounwind readnone

; [#uses=0]
declare i14 @_ssdm_op_PartSelect.i14.i15.i32.i32(i15, i32, i32) nounwind readnone

; [#uses=1]
define weak i13 @_ssdm_op_PartSelect.i13.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_9 = trunc i32 %empty to i13              ; [#uses=1 type=i13]
  ret i13 %empty_9
}

; [#uses=0]
declare i10 @_ssdm_op_PartSelect.i10.i16.i32.i32(i16, i32, i32) nounwind readnone

; [#uses=2]
define weak i8 @_ssdm_op_Mux.ap_auto.16i8.i16(i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i16) {
entry:
  switch i16 %16, label %case15 [
    i16 0, label %case0
    i16 1, label %case1
    i16 2, label %case2
    i16 3, label %case3
    i16 4, label %case4
    i16 5, label %case5
    i16 6, label %case6
    i16 7, label %case7
    i16 8, label %case8
    i16 9, label %case9
    i16 10, label %case10
    i16 11, label %case11
    i16 12, label %case12
    i16 13, label %case13
    i16 14, label %case14
  ]

case0:                                            ; preds = %case15, %case14, %case13, %case12, %case11, %case10, %case9, %case8, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %entry
  %merge = phi i8 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ], [ %4, %case4 ], [ %5, %case5 ], [ %6, %case6 ], [ %7, %case7 ], [ %8, %case8 ], [ %9, %case9 ], [ %10, %case10 ], [ %11, %case11 ], [ %12, %case12 ], [ %13, %case13 ], [ %14, %case14 ], [ %15, %case15 ] ; [#uses=1 type=i8]
  ret i8 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0

case4:                                            ; preds = %entry
  br label %case0

case5:                                            ; preds = %entry
  br label %case0

case6:                                            ; preds = %entry
  br label %case0

case7:                                            ; preds = %entry
  br label %case0

case8:                                            ; preds = %entry
  br label %case0

case9:                                            ; preds = %entry
  br label %case0

case10:                                           ; preds = %entry
  br label %case0

case11:                                           ; preds = %entry
  br label %case0

case12:                                           ; preds = %entry
  br label %case0

case13:                                           ; preds = %entry
  br label %case0

case14:                                           ; preds = %entry
  br label %case0

case15:                                           ; preds = %entry
  br label %case0
}

; [#uses=3]
define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1                          ; [#uses=1 type=i32]
  %empty_10 = and i32 %0, %empty                  ; [#uses=1 type=i32]
  %empty_11 = icmp ne i32 %empty_10, 0            ; [#uses=1 type=i1]
  ret i1 %empty_11
}

; [#uses=0]
define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2                     ; [#uses=1 type=i2]
  %empty_12 = shl i2 1, %empty                    ; [#uses=1 type=i2]
  %empty_13 = and i2 %0, %empty_12                ; [#uses=1 type=i2]
  %empty_14 = icmp ne i2 %empty_13, 0             ; [#uses=1 type=i1]
  ret i1 %empty_14
}

; [#uses=1]
define weak i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone {
entry:
  %empty = zext i31 %0 to i32                     ; [#uses=1 type=i32]
  %empty_15 = zext i1 %1 to i32                   ; [#uses=1 type=i32]
  %empty_16 = shl i32 %empty, 1                   ; [#uses=1 type=i32]
  %empty_17 = or i32 %empty_16, %empty_15         ; [#uses=1 type=i32]
  ret i32 %empty_17
}

; [#uses=2]
define weak i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %0 to i16                      ; [#uses=1 type=i16]
  %empty_18 = zext i8 %1 to i16                   ; [#uses=1 type=i16]
  %empty_19 = shl i16 %empty, 8                   ; [#uses=1 type=i16]
  %empty_20 = or i16 %empty_19, %empty_18         ; [#uses=1 type=i16]
  ret i16 %empty_20
}

; [#uses=1]
define weak i14 @_ssdm_op_BitConcatenate.i14.i10.i4(i10, i4) nounwind readnone {
entry:
  %empty = zext i10 %0 to i14                     ; [#uses=1 type=i14]
  %empty_21 = zext i4 %1 to i14                   ; [#uses=1 type=i14]
  %empty_22 = shl i14 %empty, 4                   ; [#uses=1 type=i14]
  %empty_23 = or i14 %empty_22, %empty_21         ; [#uses=1 type=i14]
  ret i14 %empty_23
}

; [#uses=4]
define weak i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8, i4) nounwind readnone {
entry:
  %empty = zext i8 %0 to i12                      ; [#uses=1 type=i12]
  %empty_24 = zext i4 %1 to i12                   ; [#uses=1 type=i12]
  %empty_25 = shl i12 %empty, 4                   ; [#uses=1 type=i12]
  %empty_26 = or i12 %empty_25, %empty_24         ; [#uses=1 type=i12]
  ret i12 %empty_26
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
!90 = metadata !{i32 786688, metadata !87, metadata !"x", metadata !30, i32 46, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!91 = metadata !{i32 47, i32 44, metadata !87, null}
!92 = metadata !{i32 786688, metadata !87, metadata !"y", metadata !30, i32 47, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!93 = metadata !{i32 48, i32 43, metadata !87, null}
!94 = metadata !{i32 786688, metadata !87, metadata !"pol", metadata !30, i32 48, metadata !95, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!95 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!96 = metadata !{i32 52, i32 3, metadata !87, null}
!97 = metadata !{i32 53, i32 2, metadata !87, null}
!98 = metadata !{i32 43, i32 53, metadata !85, null}
!99 = metadata !{i32 786688, metadata !85, metadata !"i", metadata !30, i32 43, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!100 = metadata !{i32 55, i32 2, metadata !82, null}
!101 = metadata !{i32 56, i32 1, metadata !82, null}
!102 = metadata !{i32 786689, metadata !103, metadata !"eventSlice", metadata !30, i32 16777231, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!103 = metadata !{i32 786478, i32 0, metadata !30, metadata !"copyToPS", metadata !"copyToPS", metadata !"_Z8copyToPSPa", metadata !30, i32 15, metadata !104, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !33, i32 16} ; [ DW_TAG_subprogram ]
!104 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!105 = metadata !{null, metadata !73}
!106 = metadata !{i32 15, i32 23, metadata !103, null}
!107 = metadata !{i32 17, i32 33, metadata !108, null}
!108 = metadata !{i32 786443, metadata !109, i32 17, i32 16, metadata !30, i32 3} ; [ DW_TAG_lexical_block ]
!109 = metadata !{i32 786443, metadata !103, i32 16, i32 1, metadata !30, i32 2} ; [ DW_TAG_lexical_block ]
!110 = metadata !{i32 21, i32 4, metadata !111, null}
!111 = metadata !{i32 786443, metadata !112, i32 20, i32 3, metadata !30, i32 6} ; [ DW_TAG_lexical_block ]
!112 = metadata !{i32 786443, metadata !113, i32 19, i32 19, metadata !30, i32 5} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 786443, metadata !108, i32 18, i32 2, metadata !30, i32 4} ; [ DW_TAG_lexical_block ]
!114 = metadata !{i32 17, i32 44, metadata !108, null}
!115 = metadata !{i32 786688, metadata !108, metadata !"i", metadata !30, i32 17, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!116 = metadata !{i32 19, i32 36, metadata !112, null}
!117 = metadata !{i32 20, i32 4, metadata !111, null}
!118 = metadata !{i32 21, i32 1, metadata !111, null}
!119 = metadata !{i32 22, i32 3, metadata !111, null}
!120 = metadata !{i32 19, i32 47, metadata !112, null}
!121 = metadata !{i32 786688, metadata !112, metadata !"j", metadata !30, i32 19, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!122 = metadata !{i32 24, i32 1, metadata !109, null}
!123 = metadata !{i32 786689, metadata !124, metadata !"pol", metadata !30, i32 50331654, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!124 = metadata !{i32 786478, i32 0, metadata !30, metadata !"accumulateHW", metadata !"accumulateHW", metadata !"_Z12accumulateHWssbx", metadata !30, i32 6, metadata !125, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !33, i32 7} ; [ DW_TAG_subprogram ]
!125 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !126, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!126 = metadata !{null, metadata !44, metadata !44, metadata !95, metadata !127}
!127 = metadata !{i32 786454, null, metadata !"int64_t", metadata !30, i32 41, i64 0, i64 0, i64 0, i32 0, metadata !128} ; [ DW_TAG_typedef ]
!128 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!129 = metadata !{i32 6, i32 46, metadata !124, null}
!130 = metadata !{i32 786689, metadata !124, metadata !"y", metadata !30, i32 33554438, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!131 = metadata !{i32 6, i32 38, metadata !124, null}
!132 = metadata !{i32 786689, metadata !124, metadata !"x", metadata !30, i32 16777222, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!133 = metadata !{i32 6, i32 27, metadata !124, null}
!134 = metadata !{i32 8, i32 2, metadata !135, null}
!135 = metadata !{i32 786443, metadata !124, i32 7, i32 1, metadata !30, i32 0} ; [ DW_TAG_lexical_block ]
!136 = metadata !{i32 10, i32 3, metadata !137, null}
!137 = metadata !{i32 786443, metadata !135, i32 9, i32 2, metadata !30, i32 1} ; [ DW_TAG_lexical_block ]
!138 = metadata !{i32 11, i32 2, metadata !137, null}
!139 = metadata !{i32 12, i32 1, metadata !135, null}
