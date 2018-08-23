; ModuleID = 'E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i386-w64-mingw32"

@parseEvents.str = internal unnamed_addr constant [12 x i8] c"parseEvents\00" ; [#uses=1 type=[12 x i8]*]
@glPLSlices.9 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.8 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.7 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.6 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.5 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.4 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.3 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.2 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.15 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.14 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.13 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.12 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.11 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.10 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.1 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@glPLSlices.0 = internal unnamed_addr global [3 x [180 x [15 x i8]]] zeroinitializer ; [#uses=17 type=[3 x [180 x [15 x i8]]]*]
@.str9 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=2 type=[7 x i8]*]
@.str8 = private unnamed_addr constant [11 x i8] c"eventSlice\00", align 1 ; [#uses=2 type=[11 x i8]*]
@.str7 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=2 type=[6 x i8]*]
@.str5 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1 ; [#uses=1 type=[8 x i8]*]
@.str3 = private unnamed_addr constant [15 x i8] c"resetSliceLoop\00", align 1 ; [#uses=3 type=[15 x i8]*]
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=19 type=[1 x i8]*]
@.str10 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1 ; [#uses=3 type=[7 x i8]*]
@.str1 = private unnamed_addr constant [16 x i8] c"copyToPS_label2\00", align 1 ; [#uses=3 type=[16 x i8]*]
@.str = private unnamed_addr constant [13 x i8] c"copyToPSLoop\00", align 1 ; [#uses=3 type=[13 x i8]*]

; [#uses=1]
define internal fastcc void @resetCurrentSliceHW() nounwind {
  br label %1, !dbg !48                           ; [debug line = 29:35]

; <label>:1                                       ; preds = %2, %0
  %i = phi i8 [ 0, %0 ], [ %i.1, %2 ]             ; [#uses=3 type=i8]
  %exitcond1 = icmp eq i8 %i, -76, !dbg !48       ; [#uses=1 type=i1] [debug line = 29:35]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 180, i64 180, i64 180)
  br i1 %exitcond1, label %4, label %2, !dbg !48  ; [debug line = 29:35]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([15 x i8]* @.str3) nounwind, !dbg !54 ; [debug line = 30:3]
  %tmp.1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([15 x i8]* @.str3) nounwind, !dbg !54 ; [#uses=1 type=i32] [debug line = 30:3]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @.str2) nounwind, !dbg !56 ; [debug line = 31:1]
  %tmp = zext i8 %i to i32, !dbg !57              ; [#uses=240 type=i32] [debug line = 33:4]
  %glPLSlices.0.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.0.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.0.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.1.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.1.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.2.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.2.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.3.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.3.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.4.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.4.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.5.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.5.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.6.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.6.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.7.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.7.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.8.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.8.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.9.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.9.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.10.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.10.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.11.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.11.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.12.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.12.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.13.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.13.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.14.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.14.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 0 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.1 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 1 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.1, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.2 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 2 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.2, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.3 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 3 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.3, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.4 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 4 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.4, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.5 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 5 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.5, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.6 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 6 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.6, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.7 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 7 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.7, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.8 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 8 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.8, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.9 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 9 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.9, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.10 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 10 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.10, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.11 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 11 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.11, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.12 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 12 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.12, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.13 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 13 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.13, align 1, !dbg !57 ; [debug line = 33:4]
  %glPLSlices.15.addr.14 = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 14 ; [#uses=1 type=i8*]
  store i8 0, i8* %glPLSlices.15.addr.14, align 1, !dbg !57 ; [debug line = 33:4]
  %3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([15 x i8]* @.str3, i32 %tmp.1) nounwind, !dbg !60 ; [#uses=0 type=i32] [debug line = 35:2]
  %i.1 = add i8 %i, 1, !dbg !61                   ; [#uses=1 type=i8] [debug line = 29:46]
  call void @llvm.dbg.value(metadata !{i8 %i.1}, i64 0, metadata !62), !dbg !61 ; [debug line = 29:46] [debug variable = i]
  br label %1, !dbg !61                           ; [debug line = 29:46]

; <label>:4                                       ; preds = %1
  ret void, !dbg !63                              ; [debug line = 36:1]
}

; [#uses=0]
define void @parseEvents(i32* %data, i32 %eventsArraySize, i8* %eventSlice) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %data) nounwind, !map !64
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %eventsArraySize) nounwind, !map !70
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %eventSlice) nounwind, !map !76
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @parseEvents.str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !80), !dbg !91 ; [debug line = 38:35] [debug variable = data]
  call void @llvm.dbg.value(metadata !{i32 %eventsArraySize}, i64 0, metadata !92), !dbg !93 ; [debug line = 38:49] [debug variable = eventsArraySize]
  call void @llvm.dbg.value(metadata !{i8* %eventSlice}, i64 0, metadata !94), !dbg !95 ; [debug line = 38:74] [debug variable = eventSlice]
  call void (...)* @_ssdm_op_SpecInterface(i32* %data, [8 x i8]* @.str5, i32 0, i32 0, [1 x i8]* @.str2, i32 0, i32 0, [1 x i8]* @.str2, [1 x i8]* @.str2, [1 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str2, [1 x i8]* @.str2) nounwind, !dbg !96 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @.str2) nounwind, !dbg !96 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @.str7, i32 0, i32 0, [1 x i8]* @.str2, i32 0, i32 0, [11 x i8]* @.str8, [7 x i8]* @.str9, [1 x i8]* @.str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @.str2, [1 x i8]* @.str2) nounwind, !dbg !96 ; [debug line = 40:1]
  call fastcc void @resetCurrentSliceHW(), !dbg !98 ; [debug line = 40:2]
  %tmp = shl nsw i32 %eventsArraySize, 1, !dbg !99 ; [#uses=1 type=i32] [debug line = 43:26]
  br label %1, !dbg !99                           ; [debug line = 43:26]

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i.2, %2 ]            ; [#uses=3 type=i32]
  %tmp.4 = icmp slt i32 %i, %tmp, !dbg !99        ; [#uses=1 type=i1] [debug line = 43:26]
  br i1 %tmp.4, label %2, label %4, !dbg !99      ; [debug line = 43:26]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @.str10) nounwind, !dbg !101 ; [debug line = 44:3]
  %tmp.2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @.str10) nounwind, !dbg !101 ; [#uses=1 type=i32] [debug line = 44:3]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @.str2) nounwind, !dbg !103 ; [debug line = 45:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @.str2) nounwind, !dbg !103 ; [debug line = 45:1]
  %data.addr = getelementptr inbounds i32* %data, i32 %i, !dbg !104 ; [#uses=1 type=i32*] [debug line = 46:45]
  %data.load = load volatile i32* %data.addr, align 4, !dbg !104 ; [#uses=3 type=i32] [debug line = 46:45]
  %data.load.cast1 = trunc i32 %data.load to i2, !dbg !104 ; [#uses=1 type=i2] [debug line = 46:45]
  %data.load.cast = trunc i32 %data.load to i18, !dbg !104 ; [#uses=1 type=i18] [debug line = 46:45]
  %tmp.5 = lshr i32 %data.load, 17, !dbg !104     ; [#uses=1 type=i32] [debug line = 46:45]
  %x = trunc i32 %tmp.5 to i16, !dbg !104         ; [#uses=1 type=i16] [debug line = 46:45]
  call void @llvm.dbg.value(metadata !{i16 %x}, i64 0, metadata !105), !dbg !104 ; [debug line = 46:45] [debug variable = x]
  %tmp.6 = lshr i18 %data.load.cast, 2, !dbg !106 ; [#uses=1 type=i18] [debug line = 47:44]
  %y = trunc i18 %tmp.6 to i15, !dbg !106         ; [#uses=1 type=i15] [debug line = 47:44]
  %y.cast = zext i15 %y to i16, !dbg !106         ; [#uses=1 type=i16] [debug line = 47:44]
  call void @llvm.dbg.value(metadata !{i15 %y}, i64 0, metadata !107), !dbg !106 ; [debug line = 47:44] [debug variable = y]
  %pol = icmp slt i2 %data.load.cast1, 0, !dbg !108 ; [#uses=1 type=i1] [debug line = 48:43]
  call void @llvm.dbg.value(metadata !{i1 %pol}, i64 0, metadata !109), !dbg !108 ; [debug line = 48:43] [debug variable = pol]
  call fastcc void @accumulateHW(i16 signext %x, i16 signext %y.cast, i1 zeroext %pol), !dbg !110 ; [debug line = 52:3]
  %3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @.str10, i32 %tmp.2) nounwind, !dbg !111 ; [#uses=0 type=i32] [debug line = 53:2]
  %i.2 = add nsw i32 %i, 2, !dbg !112             ; [#uses=1 type=i32] [debug line = 43:53]
  call void @llvm.dbg.value(metadata !{i32 %i.2}, i64 0, metadata !113), !dbg !112 ; [debug line = 43:53] [debug variable = i]
  br label %1, !dbg !112                          ; [debug line = 43:53]

; <label>:4                                       ; preds = %1
  call fastcc void @copyToPS(i8* %eventSlice), !dbg !114 ; [debug line = 55:2]
  ret void, !dbg !115                             ; [debug line = 56:1]
}

; [#uses=14]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define internal fastcc void @copyToPS(i8* %eventSlice) nounwind {
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, [6 x i8]* @.str7, i32 0, i32 0, [1 x i8]* @.str2, i32 0, i32 0, [11 x i8]* @.str8, [7 x i8]* @.str9, [1 x i8]* @.str2, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @.str2, [1 x i8]* @.str2) nounwind
  call void @llvm.dbg.value(metadata !{i8* %eventSlice}, i64 0, metadata !116), !dbg !120 ; [debug line = 15:23] [debug variable = eventSlice]
  br label %1, !dbg !121                          ; [debug line = 17:33]

; <label>:1                                       ; preds = %7, %0
  %i = phi i8 [ 0, %0 ], [ %i.3, %7 ]             ; [#uses=5 type=i8]
  %exitcond1 = icmp eq i8 %i, -76, !dbg !121      ; [#uses=1 type=i1] [debug line = 17:33]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 180, i64 180, i64 180)
  br i1 %exitcond1, label %9, label %2, !dbg !121 ; [debug line = 17:33]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([13 x i8]* @.str) nounwind, !dbg !124 ; [debug line = 18:3]
  %tmp.3 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @.str) nounwind, !dbg !124 ; [#uses=1 type=i32] [debug line = 18:3]
  %tmp = zext i8 %i to i32, !dbg !126             ; [#uses=16 type=i32] [debug line = 21:4]
  %tmp.cast2 = zext i8 %i to i12, !dbg !126       ; [#uses=1 type=i12] [debug line = 21:4]
  %tmp.cast = zext i8 %i to i16, !dbg !126        ; [#uses=1 type=i16] [debug line = 21:4]
  %_shl = shl nuw i16 %tmp.cast, 8, !dbg !126     ; [#uses=1 type=i16] [debug line = 21:4]
  %_shl.cast = zext i16 %_shl to i17, !dbg !126   ; [#uses=1 type=i17] [debug line = 21:4]
  %_shl1 = shl nuw i12 %tmp.cast2, 4, !dbg !126   ; [#uses=1 type=i12] [debug line = 21:4]
  %_shl1.cast = zext i12 %_shl1 to i17, !dbg !126 ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp. = sub i17 %_shl.cast, %_shl1.cast, !dbg !126 ; [#uses=2 type=i17] [debug line = 21:4]
  %tmp.1 = zext i8 0 to i17                       ; [#uses=1 type=i17]
  %tmp.5 = add i17 %tmp.1, %tmp., !dbg !126       ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp.6 = sext i17 %tmp.5 to i32, !dbg !126      ; [#uses=1 type=i32] [debug line = 21:4]
  br label %3, !dbg !129                          ; [debug line = 19:36]

; <label>:3                                       ; preds = %4, %2
  %j = phi i8 [ 0, %2 ], [ %j.1, %4 ]             ; [#uses=5 type=i8]
  %exitcond = icmp eq i8 %j, -16, !dbg !129       ; [#uses=1 type=i1] [debug line = 19:36]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 240, i64 240, i64 240)
  br i1 %exitcond, label %7, label %4, !dbg !129  ; [debug line = 19:36]

; <label>:4                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName([16 x i8]* @.str1) nounwind, !dbg !130 ; [debug line = 20:4]
  %tmp.4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([16 x i8]* @.str1) nounwind, !dbg !130 ; [#uses=1 type=i32] [debug line = 20:4]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @.str2) nounwind, !dbg !131 ; [debug line = 21:1]
  %tmp.1.cast = zext i8 %j to i17                 ; [#uses=1 type=i17]
  %arrayNo = udiv i8 %j, 15                       ; [#uses=1 type=i8]
  %arrayNo.cast = zext i8 %arrayNo to i16         ; [#uses=1 type=i16]
  %newIndex = urem i8 %j, 15                      ; [#uses=1 type=i8]
  %newIndex2 = zext i8 %newIndex to i32           ; [#uses=16 type=i32]
  %glPLSlices.0.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.0.load = load i8* %glPLSlices.0.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.1.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.1.load = load i8* %glPLSlices.1.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.2.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.2.load = load i8* %glPLSlices.2.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.3.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.3.load = load i8* %glPLSlices.3.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.4.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.4.load = load i8* %glPLSlices.4.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.5.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.5.load = load i8* %glPLSlices.5.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.6.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.6.load = load i8* %glPLSlices.6.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.7.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.7.load = load i8* %glPLSlices.7.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.8.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.8.load = load i8* %glPLSlices.8.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.9.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.9.load = load i8* %glPLSlices.9.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.10.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.10.load = load i8* %glPLSlices.10.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.11.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.11.load = load i8* %glPLSlices.11.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.12.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.12.load = load i8* %glPLSlices.12.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.13.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.13.load = load i8* %glPLSlices.13.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.14.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.14.load = load i8* %glPLSlices.14.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.15.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp, i32 %newIndex2 ; [#uses=1 type=i8*]
  %glPLSlices.15.load = load i8* %glPLSlices.15.addr, align 1 ; [#uses=1 type=i8]
  %tmp.7 = call i8 @_ssdm_op_Mux.ap_auto.16i8.i16(i8 %glPLSlices.0.load, i8 %glPLSlices.1.load, i8 %glPLSlices.2.load, i8 %glPLSlices.3.load, i8 %glPLSlices.4.load, i8 %glPLSlices.5.load, i8 %glPLSlices.6.load, i8 %glPLSlices.7.load, i8 %glPLSlices.8.load, i8 %glPLSlices.9.load, i8 %glPLSlices.10.load, i8 %glPLSlices.11.load, i8 %glPLSlices.12.load, i8 %glPLSlices.13.load, i8 %glPLSlices.14.load, i8 %glPLSlices.15.load, i16 %arrayNo.cast) nounwind ; [#uses=1 type=i8]
  %tmp.2 = add i17 %tmp.1.cast, %tmp., !dbg !126  ; [#uses=1 type=i17] [debug line = 21:4]
  %tmp.2.cast = sext i17 %tmp.2 to i32, !dbg !126 ; [#uses=1 type=i32] [debug line = 21:4]
  %eventSlice.addr = getelementptr inbounds i8* %eventSlice, i32 %tmp.2.cast, !dbg !126 ; [#uses=1 type=i8*] [debug line = 21:4]
  %eventSlice.addr.1 = getelementptr inbounds i8* %eventSlice, i32 %tmp.6, !dbg !126 ; [#uses=1 type=i8*] [debug line = 21:4]
  %tmp.8 = zext i8 -16 to i32                     ; [#uses=1 type=i32]
  %5 = call i32 (...)* @_ssdm_op_SpecBurst(i8* %eventSlice.addr.1, i32 0, i32 %tmp.8, i32 1) ; [#uses=0 type=i32]
  store i8 %tmp.7, i8* %eventSlice.addr, align 1, !dbg !126 ; [debug line = 21:4]
  %6 = call i32 (...)* @_ssdm_op_SpecRegionEnd([16 x i8]* @.str1, i32 %tmp.4) nounwind, !dbg !132 ; [#uses=0 type=i32] [debug line = 22:3]
  %j.1 = add i8 %j, 1, !dbg !133                  ; [#uses=1 type=i8] [debug line = 19:47]
  call void @llvm.dbg.value(metadata !{i8 %j.1}, i64 0, metadata !134), !dbg !133 ; [debug line = 19:47] [debug variable = j]
  br label %3, !dbg !133                          ; [debug line = 19:47]

; <label>:7                                       ; preds = %3
  %8 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @.str, i32 %tmp.3) nounwind, !dbg !135 ; [#uses=0 type=i32] [debug line = 23:2]
  %i.3 = add i8 %i, 1, !dbg !136                  ; [#uses=1 type=i8] [debug line = 17:44]
  call void @llvm.dbg.value(metadata !{i8 %i.3}, i64 0, metadata !137), !dbg !136 ; [debug line = 17:44] [debug variable = i]
  br label %1, !dbg !136                          ; [debug line = 17:44]

; <label>:9                                       ; preds = %1
  ret void, !dbg !138                             ; [debug line = 24:1]
}

; [#uses=1]
define internal fastcc void @accumulateHW(i16 signext %x, i16 signext %y, i1 zeroext %pol) nounwind {
  call void (...)* @_ssdm_SpecKeepAssert(i16 %x) nounwind, !hlsrange !139
  call void (...)* @_ssdm_SpecKeepAssert(i16 %y) nounwind, !hlsrange !139
  call void @llvm.dbg.value(metadata !{i16 %x}, i64 0, metadata !140), !dbg !141 ; [debug line = 6:27] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i16 %y}, i64 0, metadata !142), !dbg !143 ; [debug line = 6:38] [debug variable = y]
  call void @llvm.dbg.value(metadata !{i1 %pol}, i64 0, metadata !144), !dbg !145 ; [debug line = 6:46] [debug variable = pol]
  br i1 %pol, label %1, label %._crit_edge, !dbg !146 ; [debug line = 8:2]

; <label>:1                                       ; preds = %0
  %tmp. = zext i16 %y to i32, !dbg !148           ; [#uses=16 type=i32] [debug line = 10:3]
  %x.cast1 = trunc i16 %x to i15                  ; [#uses=1 type=i15]
  %arrayNo = udiv i15 %x.cast1, 15                ; [#uses=2 type=i15]
  %arrayNo.cast = zext i15 %arrayNo to i16        ; [#uses=1 type=i16]
  %x.cast = trunc i16 %x to i15                   ; [#uses=1 type=i15]
  %newIndex = urem i15 %x.cast, 15                ; [#uses=1 type=i15]
  %newIndex1 = zext i15 %newIndex to i32          ; [#uses=16 type=i32]
  %glPLSlices.0.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.0, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.1.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.1, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.2.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.2, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.3.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.3, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.4.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.4, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.5.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.5, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.6.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.6, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.7.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.7, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.8.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.8, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.9.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.9, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.10.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.10, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.11.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.11, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.12.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.12, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.13.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.13, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.14.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.14, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.15.addr = getelementptr [3 x [180 x [15 x i8]]]* @glPLSlices.15, i32 0, i32 0, i32 %tmp., i32 %newIndex1, !dbg !148 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.0.load = load i8* %glPLSlices.0.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.1.load = load i8* %glPLSlices.1.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.2.load = load i8* %glPLSlices.2.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.3.load = load i8* %glPLSlices.3.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.4.load = load i8* %glPLSlices.4.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.5.load = load i8* %glPLSlices.5.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.6.load = load i8* %glPLSlices.6.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.7.load = load i8* %glPLSlices.7.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.8.load = load i8* %glPLSlices.8.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.9.load = load i8* %glPLSlices.9.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.10.load = load i8* %glPLSlices.10.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.11.load = load i8* %glPLSlices.11.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.12.load = load i8* %glPLSlices.12.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.13.load = load i8* %glPLSlices.13.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.14.load = load i8* %glPLSlices.14.addr, align 1 ; [#uses=1 type=i8]
  %glPLSlices.15.load = load i8* %glPLSlices.15.addr, align 1 ; [#uses=1 type=i8]
  %tmp = call i8 @_ssdm_op_Mux.ap_auto.16i8.i16(i8 %glPLSlices.0.load, i8 %glPLSlices.1.load, i8 %glPLSlices.2.load, i8 %glPLSlices.3.load, i8 %glPLSlices.4.load, i8 %glPLSlices.5.load, i8 %glPLSlices.6.load, i8 %glPLSlices.7.load, i8 %glPLSlices.8.load, i8 %glPLSlices.9.load, i8 %glPLSlices.10.load, i8 %glPLSlices.11.load, i8 %glPLSlices.12.load, i8 %glPLSlices.13.load, i8 %glPLSlices.14.load, i8 %glPLSlices.15.load, i16 %arrayNo.cast) nounwind ; [#uses=1 type=i8]
  %tmp.3 = add i8 %tmp, 1, !dbg !148              ; [#uses=16 type=i8] [debug line = 10:3]
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
  ], !dbg !148                                    ; [debug line = 10:3]

; <label>:2                                       ; preds = %branch15, %branch14, %branch13, %branch12, %branch11, %branch10, %branch9, %branch8, %branch7, %branch6, %branch5, %branch4, %branch3, %branch2, %branch1, %branch0
  br label %._crit_edge, !dbg !150                ; [debug line = 11:2]

._crit_edge:                                      ; preds = %2, %0
  ret void, !dbg !151                             ; [debug line = 12:1]

branch0:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.0.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch1:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.1.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch2:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.2.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch3:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.3.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch4:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.4.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch5:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.5.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch6:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.6.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch7:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.7.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch8:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.8.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch9:                                          ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.9.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch10:                                         ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.10.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch11:                                         ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.11.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch12:                                         ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.12.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch13:                                         ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.13.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch14:                                         ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.14.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]

branch15:                                         ; preds = %1
  store i8 %tmp.3, i8* %glPLSlices.15.addr, align 1, !dbg !148 ; [debug line = 10:3]
  br label %2, !dbg !148                          ; [debug line = 10:3]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=4]
declare i32 @_ssdm_op_SpecRegionEnd(...)

; [#uses=4]
declare i32 @_ssdm_op_SpecRegionBegin(...)

; [#uses=3]
declare void @_ssdm_op_SpecPipeline(...) nounwind

; [#uses=4]
declare void @_ssdm_op_SpecLoopTripCount(...) nounwind

; [#uses=4]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecLatency(...) nounwind

; [#uses=3]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=1]
declare i32 @_ssdm_op_SpecBurst(...)

; [#uses=3]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=2]
declare i8 @_ssdm_op_Mux.ap_auto.16i8.i16(i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i16)

; [#uses=2]
declare void @_ssdm_SpecKeepAssert(...)

!opencl.kernels = !{!0, !7, !13, !19}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}
!llvm.dbg.cu = !{!25}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t", metadata !"_Bool", metadata !"int64_t"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"pol", metadata !"ts"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{void (i8*)* @copyToPS, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
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
!19 = metadata !{void (i32*, i32, i8*)* @parseEvents, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t*", metadata !"int32_t", metadata !"int8_t*"}
!23 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"", metadata !""}
!24 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"eventsArraySize", metadata !"eventSlice"}
!25 = metadata !{i32 786449, i32 0, i32 4, metadata !"E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution1/.autopilot/db/abmof_hw_accel.pragma.2.cpp", metadata !"E:\5CxfOpenCV\5Cwksp_2018_1\5Cmz_libcaer_OF_HLS\5CparseEvents", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, null, null, metadata !26, metadata !37} ; [ DW_TAG_compile_unit ]
!26 = metadata !{i32 786478, i32 0, metadata !27, metadata !"accumulateHW", metadata !"accumulateHW", metadata !"_Z12accumulateHWssbx", metadata !27, i32 6, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !35, i32 7} ; [ DW_TAG_subprogram ]
!27 = metadata !{i32 786473, metadata !"../../mz_libcaer_OF_HLS/ABMOF/abmof_hw_accel.cpp", metadata !"E:\5CxfOpenCV\5Cwksp_2018_1\5Cmz_libcaer_OF_HLS\5CparseEvents", null} ; [ DW_TAG_file_type ]
!28 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!29 = metadata !{null, metadata !30, metadata !30, metadata !32, metadata !33}
!30 = metadata !{i32 786454, null, metadata !"int16_t", metadata !27, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!31 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!32 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!33 = metadata !{i32 786454, null, metadata !"int64_t", metadata !27, i32 41, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!34 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!37 = metadata !{metadata !38}
!38 = metadata !{metadata !39, metadata !47}
!39 = metadata !{i32 786484, i32 0, null, metadata !"glPLSlices", metadata !"glPLSlices", metadata !"_ZL10glPLSlices", metadata !27, i32 3, metadata !40, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!40 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1036800, i64 8, i32 0, i32 0, metadata !41, metadata !43, i32 0, i32 0} ; [ DW_TAG_array_type ]
!41 = metadata !{i32 786454, null, metadata !"int8_t", metadata !27, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!43 = metadata !{metadata !44, metadata !45, metadata !46}
!44 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!45 = metadata !{i32 786465, i64 0, i64 179}      ; [ DW_TAG_subrange_type ]
!46 = metadata !{i32 786465, i64 0, i64 239}      ; [ DW_TAG_subrange_type ]
!47 = metadata !{i32 786484, i32 0, null, metadata !"glPLSliceIdx", metadata !"glPLSliceIdx", metadata !"_ZL12glPLSliceIdx", metadata !27, i32 4, metadata !41, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!48 = metadata !{i32 29, i32 35, metadata !49, null}
!49 = metadata !{i32 786443, metadata !50, i32 29, i32 18, metadata !27, i32 8} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 786443, metadata !51, i32 27, i32 1, metadata !27, i32 7} ; [ DW_TAG_lexical_block ]
!51 = metadata !{i32 786478, i32 0, metadata !27, metadata !"resetCurrentSliceHW", metadata !"resetCurrentSliceHW", metadata !"_Z19resetCurrentSliceHWv", metadata !27, i32 26, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @resetCurrentSliceHW, null, null, metadata !35, i32 27} ; [ DW_TAG_subprogram ]
!52 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!53 = metadata !{null}
!54 = metadata !{i32 30, i32 3, metadata !55, null}
!55 = metadata !{i32 786443, metadata !49, i32 30, i32 2, metadata !27, i32 9} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 31, i32 1, metadata !55, null}
!57 = metadata !{i32 33, i32 4, metadata !58, null}
!58 = metadata !{i32 786443, metadata !59, i32 32, i32 3, metadata !27, i32 11} ; [ DW_TAG_lexical_block ]
!59 = metadata !{i32 786443, metadata !55, i32 31, i32 19, metadata !27, i32 10} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 35, i32 2, metadata !55, null}
!61 = metadata !{i32 29, i32 46, metadata !49, null}
!62 = metadata !{i32 786688, metadata !49, metadata !"i", metadata !27, i32 29, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!63 = metadata !{i32 36, i32 1, metadata !50, null}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 0, i32 31, metadata !66}
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !"data", metadata !68, metadata !"unsigned int", i32 0, i32 31}
!68 = metadata !{metadata !69}
!69 = metadata !{i32 0, i32 0, i32 1}
!70 = metadata !{metadata !71}
!71 = metadata !{i32 0, i32 31, metadata !72}
!72 = metadata !{metadata !73}
!73 = metadata !{metadata !"eventsArraySize", metadata !74, metadata !"int", i32 0, i32 31}
!74 = metadata !{metadata !75}
!75 = metadata !{i32 0, i32 0, i32 0}
!76 = metadata !{metadata !77}
!77 = metadata !{i32 0, i32 7, metadata !78}
!78 = metadata !{metadata !79}
!79 = metadata !{metadata !"eventSlice", metadata !68, metadata !"signed char", i32 0, i32 7}
!80 = metadata !{i32 786689, metadata !81, metadata !"data", metadata !27, i32 16777254, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!81 = metadata !{i32 786478, i32 0, metadata !27, metadata !"parseEvents", metadata !"parseEvents", metadata !"_Z11parseEventsPKjiPa", metadata !27, i32 38, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32, i8*)* @parseEvents, null, null, metadata !35, i32 39} ; [ DW_TAG_subprogram ]
!82 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!83 = metadata !{null, metadata !84, metadata !88, metadata !90}
!84 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !85} ; [ DW_TAG_pointer_type ]
!85 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !86} ; [ DW_TAG_const_type ]
!86 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !27, i32 40, i64 0, i64 0, i64 0, i32 0, metadata !87} ; [ DW_TAG_typedef ]
!87 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!88 = metadata !{i32 786454, null, metadata !"int32_t", metadata !27, i32 39, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_typedef ]
!89 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!90 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ]
!91 = metadata !{i32 38, i32 35, metadata !81, null}
!92 = metadata !{i32 786689, metadata !81, metadata !"eventsArraySize", metadata !27, i32 33554470, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!93 = metadata !{i32 38, i32 49, metadata !81, null}
!94 = metadata !{i32 786689, metadata !81, metadata !"eventSlice", metadata !27, i32 50331686, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!95 = metadata !{i32 38, i32 74, metadata !81, null}
!96 = metadata !{i32 40, i32 1, metadata !97, null}
!97 = metadata !{i32 786443, metadata !81, i32 39, i32 1, metadata !27, i32 12} ; [ DW_TAG_lexical_block ]
!98 = metadata !{i32 40, i32 2, metadata !97, null}
!99 = metadata !{i32 43, i32 26, metadata !100, null}
!100 = metadata !{i32 786443, metadata !97, i32 43, i32 9, metadata !27, i32 13} ; [ DW_TAG_lexical_block ]
!101 = metadata !{i32 44, i32 3, metadata !102, null}
!102 = metadata !{i32 786443, metadata !100, i32 44, i32 2, metadata !27, i32 14} ; [ DW_TAG_lexical_block ]
!103 = metadata !{i32 45, i32 1, metadata !102, null}
!104 = metadata !{i32 46, i32 45, metadata !102, null}
!105 = metadata !{i32 786688, metadata !102, metadata !"x", metadata !27, i32 46, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!106 = metadata !{i32 47, i32 44, metadata !102, null}
!107 = metadata !{i32 786688, metadata !102, metadata !"y", metadata !27, i32 47, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!108 = metadata !{i32 48, i32 43, metadata !102, null}
!109 = metadata !{i32 786688, metadata !102, metadata !"pol", metadata !27, i32 48, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!110 = metadata !{i32 52, i32 3, metadata !102, null}
!111 = metadata !{i32 53, i32 2, metadata !102, null}
!112 = metadata !{i32 43, i32 53, metadata !100, null}
!113 = metadata !{i32 786688, metadata !100, metadata !"i", metadata !27, i32 43, metadata !88, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!114 = metadata !{i32 55, i32 2, metadata !97, null}
!115 = metadata !{i32 56, i32 1, metadata !97, null}
!116 = metadata !{i32 786689, metadata !117, metadata !"eventSlice", metadata !27, i32 16777231, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!117 = metadata !{i32 786478, i32 0, metadata !27, metadata !"copyToPS", metadata !"copyToPS", metadata !"_Z8copyToPSPa", metadata !27, i32 15, metadata !118, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @copyToPS, null, null, metadata !35, i32 16} ; [ DW_TAG_subprogram ]
!118 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!119 = metadata !{null, metadata !90}
!120 = metadata !{i32 15, i32 23, metadata !117, null}
!121 = metadata !{i32 17, i32 33, metadata !122, null}
!122 = metadata !{i32 786443, metadata !123, i32 17, i32 16, metadata !27, i32 3} ; [ DW_TAG_lexical_block ]
!123 = metadata !{i32 786443, metadata !117, i32 16, i32 1, metadata !27, i32 2} ; [ DW_TAG_lexical_block ]
!124 = metadata !{i32 18, i32 3, metadata !125, null}
!125 = metadata !{i32 786443, metadata !122, i32 18, i32 2, metadata !27, i32 4} ; [ DW_TAG_lexical_block ]
!126 = metadata !{i32 21, i32 4, metadata !127, null}
!127 = metadata !{i32 786443, metadata !128, i32 20, i32 3, metadata !27, i32 6} ; [ DW_TAG_lexical_block ]
!128 = metadata !{i32 786443, metadata !125, i32 19, i32 19, metadata !27, i32 5} ; [ DW_TAG_lexical_block ]
!129 = metadata !{i32 19, i32 36, metadata !128, null}
!130 = metadata !{i32 20, i32 4, metadata !127, null}
!131 = metadata !{i32 21, i32 1, metadata !127, null}
!132 = metadata !{i32 22, i32 3, metadata !127, null}
!133 = metadata !{i32 19, i32 47, metadata !128, null}
!134 = metadata !{i32 786688, metadata !128, metadata !"j", metadata !27, i32 19, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!135 = metadata !{i32 23, i32 2, metadata !125, null}
!136 = metadata !{i32 17, i32 44, metadata !122, null}
!137 = metadata !{i32 786688, metadata !122, metadata !"i", metadata !27, i32 17, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!138 = metadata !{i32 24, i32 1, metadata !123, null}
!139 = metadata !{i16 0, i16 32767, i16 0, i16 32767} 
!140 = metadata !{i32 786689, metadata !26, metadata !"x", metadata !27, i32 16777222, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!141 = metadata !{i32 6, i32 27, metadata !26, null}
!142 = metadata !{i32 786689, metadata !26, metadata !"y", metadata !27, i32 33554438, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!143 = metadata !{i32 6, i32 38, metadata !26, null}
!144 = metadata !{i32 786689, metadata !26, metadata !"pol", metadata !27, i32 50331654, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!145 = metadata !{i32 6, i32 46, metadata !26, null}
!146 = metadata !{i32 8, i32 2, metadata !147, null}
!147 = metadata !{i32 786443, metadata !26, i32 7, i32 1, metadata !27, i32 0} ; [ DW_TAG_lexical_block ]
!148 = metadata !{i32 10, i32 3, metadata !149, null}
!149 = metadata !{i32 786443, metadata !147, i32 9, i32 2, metadata !27, i32 1} ; [ DW_TAG_lexical_block ]
!150 = metadata !{i32 11, i32 2, metadata !149, null}
!151 = metadata !{i32 12, i32 1, metadata !147, null}
