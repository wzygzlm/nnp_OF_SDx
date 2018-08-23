; ModuleID = 'E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution1/.autopilot/db/a.o.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i386-w64-mingw32"

@_ZL12glPLSliceIdx = internal global i8 0, align 1 ; [#uses=3 type=i8*]
@_ZL10glPLSlices = internal global [3 x [180 x [240 x i8]]] zeroinitializer, align 1 ; [#uses=4 type=[3 x [180 x [240 x i8]]]*]
@.str = private unnamed_addr constant [13 x i8] c"copyToPSLoop\00", align 1 ; [#uses=1 type=[13 x i8]*]
@.str1 = private unnamed_addr constant [16 x i8] c"copyToPS_label2\00", align 1 ; [#uses=1 type=[16 x i8]*]
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str3 = private unnamed_addr constant [15 x i8] c"resetSliceLoop\00", align 1 ; [#uses=1 type=[15 x i8]*]
@.str4 = private unnamed_addr constant [16 x i8] c"resetSliceLoop2\00", align 1 ; [#uses=1 type=[16 x i8]*]
@.str5 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1 ; [#uses=1 type=[8 x i8]*]
@.str6 = private unnamed_addr constant [6 x i8] c"BLOCK\00", align 1 ; [#uses=1 type=[6 x i8]*]
@.str7 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=1 type=[6 x i8]*]
@.str8 = private unnamed_addr constant [11 x i8] c"eventSlice\00", align 1 ; [#uses=1 type=[11 x i8]*]
@.str9 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=1 type=[7 x i8]*]
@.str10 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1 ; [#uses=1 type=[7 x i8]*]

; [#uses=1]
define internal void @_Z12accumulateHWssbx(i16 signext %x, i16 signext %y, i1 zeroext %pol, i64 %ts) nounwind {
  %1 = alloca i16, align 2                        ; [#uses=2 type=i16*]
  %2 = alloca i16, align 2                        ; [#uses=2 type=i16*]
  %3 = alloca i1, align 1                         ; [#uses=2 type=i1*]
  %4 = alloca i64, align 8                        ; [#uses=1 type=i64*]
  store i16 %x, i16* %1, align 2
  call void @llvm.dbg.declare(metadata !{i16* %1}, metadata !68), !dbg !69 ; [debug line = 6:27] [debug variable = x]
  store i16 %y, i16* %2, align 2
  call void @llvm.dbg.declare(metadata !{i16* %2}, metadata !70), !dbg !71 ; [debug line = 6:38] [debug variable = y]
  store i1 %pol, i1* %3, align 1
  call void @llvm.dbg.declare(metadata !{i1* %3}, metadata !72), !dbg !73 ; [debug line = 6:46] [debug variable = pol]
  store i64 %ts, i64* %4, align 8
  call void @llvm.dbg.declare(metadata !{i64* %4}, metadata !74), !dbg !75 ; [debug line = 6:59] [debug variable = ts]
  %5 = load i1* %3, align 1, !dbg !76             ; [#uses=1 type=i1] [debug line = 8:2]
  %6 = zext i1 %5 to i32, !dbg !76                ; [#uses=1 type=i32] [debug line = 8:2]
  %7 = icmp eq i32 %6, 1, !dbg !76                ; [#uses=1 type=i1] [debug line = 8:2]
  br i1 %7, label %8, label %22, !dbg !76         ; [debug line = 8:2]

; <label>:8                                       ; preds = %0
  %9 = load i16* %1, align 2, !dbg !78            ; [#uses=1 type=i16] [debug line = 10:3]
  %10 = sext i16 %9 to i32, !dbg !78              ; [#uses=1 type=i32] [debug line = 10:3]
  %11 = load i16* %2, align 2, !dbg !78           ; [#uses=1 type=i16] [debug line = 10:3]
  %12 = sext i16 %11 to i32, !dbg !78             ; [#uses=1 type=i32] [debug line = 10:3]
  %13 = load i8* @_ZL12glPLSliceIdx, align 1, !dbg !78 ; [#uses=1 type=i8] [debug line = 10:3]
  %14 = sext i8 %13 to i32, !dbg !78              ; [#uses=1 type=i32] [debug line = 10:3]
  %15 = getelementptr inbounds [3 x [180 x [240 x i8]]]* @_ZL10glPLSlices, i32 0, i32 %14, !dbg !78 ; [#uses=1 type=[180 x [240 x i8]]*] [debug line = 10:3]
  %16 = getelementptr inbounds [180 x [240 x i8]]* %15, i32 0, i32 %12, !dbg !78 ; [#uses=1 type=[240 x i8]*] [debug line = 10:3]
  %17 = getelementptr inbounds [240 x i8]* %16, i32 0, i32 %10, !dbg !78 ; [#uses=2 type=i8*] [debug line = 10:3]
  %18 = load i8* %17, align 1, !dbg !78           ; [#uses=1 type=i8] [debug line = 10:3]
  %19 = sext i8 %18 to i32, !dbg !78              ; [#uses=1 type=i32] [debug line = 10:3]
  %20 = add nsw i32 %19, 1, !dbg !78              ; [#uses=1 type=i32] [debug line = 10:3]
  %21 = trunc i32 %20 to i8, !dbg !78             ; [#uses=1 type=i8] [debug line = 10:3]
  store i8 %21, i8* %17, align 1, !dbg !78        ; [debug line = 10:3]
  br label %22, !dbg !80                          ; [debug line = 11:2]

; <label>:22                                      ; preds = %8, %0
  ret void, !dbg !81                              ; [debug line = 12:1]
}

; [#uses=16]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
define internal void @_Z8copyToPSPa(i8* %eventSlice) nounwind {
  %1 = alloca i8*, align 4                        ; [#uses=2 type=i8**]
  %i = alloca i16, align 2                        ; [#uses=6 type=i16*]
  %j = alloca i16, align 2                        ; [#uses=6 type=i16*]
  store i8* %eventSlice, i8** %1, align 4
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !82), !dbg !83 ; [debug line = 15:23] [debug variable = eventSlice]
  br label %2, !dbg !84                           ; [debug line = 16:1]

; <label>:2                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{i16* %i}, metadata !86), !dbg !88 ; [debug line = 17:28] [debug variable = i]
  store i16 0, i16* %i, align 2, !dbg !89         ; [debug line = 17:33]
  br label %3, !dbg !89                           ; [debug line = 17:33]

; <label>:3                                       ; preds = %36, %2
  %4 = load i16* %i, align 2, !dbg !89            ; [#uses=1 type=i16] [debug line = 17:33]
  %5 = sext i16 %4 to i32, !dbg !89               ; [#uses=1 type=i32] [debug line = 17:33]
  %6 = icmp slt i32 %5, 180, !dbg !89             ; [#uses=1 type=i1] [debug line = 17:33]
  br i1 %6, label %7, label %39, !dbg !89         ; [debug line = 17:33]

; <label>:7                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !90 ; [debug line = 18:3]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !90 ; [debug line = 18:3]
  br label %8, !dbg !90                           ; [debug line = 18:3]

; <label>:8                                       ; preds = %7
  call void @llvm.dbg.declare(metadata !{i16* %j}, metadata !92), !dbg !94 ; [debug line = 19:31] [debug variable = j]
  store i16 0, i16* %j, align 2, !dbg !95         ; [debug line = 19:36]
  br label %9, !dbg !95                           ; [debug line = 19:36]

; <label>:9                                       ; preds = %32, %8
  %10 = load i16* %j, align 2, !dbg !95           ; [#uses=1 type=i16] [debug line = 19:36]
  %11 = sext i16 %10 to i32, !dbg !95             ; [#uses=1 type=i32] [debug line = 19:36]
  %12 = icmp slt i32 %11, 240, !dbg !95           ; [#uses=1 type=i1] [debug line = 19:36]
  br i1 %12, label %13, label %35, !dbg !95       ; [debug line = 19:36]

; <label>:13                                      ; preds = %9
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !96 ; [debug line = 20:4]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !96 ; [debug line = 20:4]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !98 ; [debug line = 21:1]
  %14 = load i16* %j, align 2, !dbg !99           ; [#uses=1 type=i16] [debug line = 21:4]
  %15 = sext i16 %14 to i32, !dbg !99             ; [#uses=1 type=i32] [debug line = 21:4]
  %16 = load i16* %i, align 2, !dbg !99           ; [#uses=1 type=i16] [debug line = 21:4]
  %17 = sext i16 %16 to i32, !dbg !99             ; [#uses=1 type=i32] [debug line = 21:4]
  %18 = load i8* @_ZL12glPLSliceIdx, align 1, !dbg !99 ; [#uses=1 type=i8] [debug line = 21:4]
  %19 = sext i8 %18 to i32, !dbg !99              ; [#uses=1 type=i32] [debug line = 21:4]
  %20 = getelementptr inbounds [3 x [180 x [240 x i8]]]* @_ZL10glPLSlices, i32 0, i32 %19, !dbg !99 ; [#uses=1 type=[180 x [240 x i8]]*] [debug line = 21:4]
  %21 = getelementptr inbounds [180 x [240 x i8]]* %20, i32 0, i32 %17, !dbg !99 ; [#uses=1 type=[240 x i8]*] [debug line = 21:4]
  %22 = getelementptr inbounds [240 x i8]* %21, i32 0, i32 %15, !dbg !99 ; [#uses=1 type=i8*] [debug line = 21:4]
  %23 = load i8* %22, align 1, !dbg !99           ; [#uses=1 type=i8] [debug line = 21:4]
  %24 = load i16* %i, align 2, !dbg !99           ; [#uses=1 type=i16] [debug line = 21:4]
  %25 = sext i16 %24 to i32, !dbg !99             ; [#uses=1 type=i32] [debug line = 21:4]
  %26 = mul nsw i32 %25, 240, !dbg !99            ; [#uses=1 type=i32] [debug line = 21:4]
  %27 = load i16* %j, align 2, !dbg !99           ; [#uses=1 type=i16] [debug line = 21:4]
  %28 = sext i16 %27 to i32, !dbg !99             ; [#uses=1 type=i32] [debug line = 21:4]
  %29 = add nsw i32 %26, %28, !dbg !99            ; [#uses=1 type=i32] [debug line = 21:4]
  %30 = load i8** %1, align 4, !dbg !99           ; [#uses=1 type=i8*] [debug line = 21:4]
  %31 = getelementptr inbounds i8* %30, i32 %29, !dbg !99 ; [#uses=1 type=i8*] [debug line = 21:4]
  store i8 %23, i8* %31, align 1, !dbg !99        ; [debug line = 21:4]
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !100 ; [debug line = 22:3]
  br label %32, !dbg !100                         ; [debug line = 22:3]

; <label>:32                                      ; preds = %13
  %33 = load i16* %j, align 2, !dbg !101          ; [#uses=1 type=i16] [debug line = 19:47]
  %34 = add i16 %33, 1, !dbg !101                 ; [#uses=1 type=i16] [debug line = 19:47]
  store i16 %34, i16* %j, align 2, !dbg !101      ; [debug line = 19:47]
  br label %9, !dbg !101                          ; [debug line = 19:47]

; <label>:35                                      ; preds = %9
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !102 ; [debug line = 23:2]
  br label %36, !dbg !102                         ; [debug line = 23:2]

; <label>:36                                      ; preds = %35
  %37 = load i16* %i, align 2, !dbg !103          ; [#uses=1 type=i16] [debug line = 17:44]
  %38 = add i16 %37, 1, !dbg !103                 ; [#uses=1 type=i16] [debug line = 17:44]
  store i16 %38, i16* %i, align 2, !dbg !103      ; [debug line = 17:44]
  br label %3, !dbg !103                          ; [debug line = 17:44]

; <label>:39                                      ; preds = %3
  ret void, !dbg !104                             ; [debug line = 24:1]
}

; [#uses=5]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=5]
declare void @_ssdm_RegionBegin(...) nounwind

; [#uses=4]
declare void @_ssdm_op_SpecPipeline(...) nounwind

; [#uses=5]
declare void @_ssdm_RegionEnd(...) nounwind

; [#uses=1]
define internal void @_Z19resetCurrentSliceHWv() nounwind {
  %i = alloca i16, align 2                        ; [#uses=5 type=i16*]
  %j = alloca i16, align 2                        ; [#uses=5 type=i16*]
  br label %1, !dbg !105                          ; [debug line = 27:1]

; <label>:1                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{i16* %i}, metadata !107), !dbg !109 ; [debug line = 29:30] [debug variable = i]
  store i16 0, i16* %i, align 2, !dbg !110        ; [debug line = 29:35]
  br label %2, !dbg !110                          ; [debug line = 29:35]

; <label>:2                                       ; preds = %26, %1
  %3 = load i16* %i, align 2, !dbg !110           ; [#uses=1 type=i16] [debug line = 29:35]
  %4 = sext i16 %3 to i32, !dbg !110              ; [#uses=1 type=i32] [debug line = 29:35]
  %5 = icmp slt i32 %4, 180, !dbg !110            ; [#uses=1 type=i1] [debug line = 29:35]
  br i1 %5, label %6, label %29, !dbg !110        ; [debug line = 29:35]

; <label>:6                                       ; preds = %2
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([15 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !111 ; [debug line = 30:3]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([15 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !111 ; [debug line = 30:3]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !113 ; [debug line = 31:1]
  br label %7, !dbg !113                          ; [debug line = 31:1]

; <label>:7                                       ; preds = %6
  call void @llvm.dbg.declare(metadata !{i16* %j}, metadata !114), !dbg !116 ; [debug line = 31:31] [debug variable = j]
  store i16 0, i16* %j, align 2, !dbg !117        ; [debug line = 31:36]
  br label %8, !dbg !117                          ; [debug line = 31:36]

; <label>:8                                       ; preds = %22, %7
  %9 = load i16* %j, align 2, !dbg !117           ; [#uses=1 type=i16] [debug line = 31:36]
  %10 = sext i16 %9 to i32, !dbg !117             ; [#uses=1 type=i32] [debug line = 31:36]
  %11 = icmp slt i32 %10, 240, !dbg !117          ; [#uses=1 type=i1] [debug line = 31:36]
  br i1 %11, label %12, label %25, !dbg !117      ; [debug line = 31:36]

; <label>:12                                      ; preds = %8
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0)) nounwind, !dbg !118 ; [debug line = 32:4]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0)) nounwind, !dbg !118 ; [debug line = 32:4]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !120 ; [debug line = 33:1]
  %13 = load i16* %j, align 2, !dbg !121          ; [#uses=1 type=i16] [debug line = 33:4]
  %14 = sext i16 %13 to i32, !dbg !121            ; [#uses=1 type=i32] [debug line = 33:4]
  %15 = load i16* %i, align 2, !dbg !121          ; [#uses=1 type=i16] [debug line = 33:4]
  %16 = sext i16 %15 to i32, !dbg !121            ; [#uses=1 type=i32] [debug line = 33:4]
  %17 = load i8* @_ZL12glPLSliceIdx, align 1, !dbg !121 ; [#uses=1 type=i8] [debug line = 33:4]
  %18 = sext i8 %17 to i32, !dbg !121             ; [#uses=1 type=i32] [debug line = 33:4]
  %19 = getelementptr inbounds [3 x [180 x [240 x i8]]]* @_ZL10glPLSlices, i32 0, i32 %18, !dbg !121 ; [#uses=1 type=[180 x [240 x i8]]*] [debug line = 33:4]
  %20 = getelementptr inbounds [180 x [240 x i8]]* %19, i32 0, i32 %16, !dbg !121 ; [#uses=1 type=[240 x i8]*] [debug line = 33:4]
  %21 = getelementptr inbounds [240 x i8]* %20, i32 0, i32 %14, !dbg !121 ; [#uses=1 type=i8*] [debug line = 33:4]
  store i8 0, i8* %21, align 1, !dbg !121         ; [debug line = 33:4]
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0)) nounwind, !dbg !122 ; [debug line = 34:3]
  br label %22, !dbg !122                         ; [debug line = 34:3]

; <label>:22                                      ; preds = %12
  %23 = load i16* %j, align 2, !dbg !123          ; [#uses=1 type=i16] [debug line = 31:47]
  %24 = add i16 %23, 1, !dbg !123                 ; [#uses=1 type=i16] [debug line = 31:47]
  store i16 %24, i16* %j, align 2, !dbg !123      ; [debug line = 31:47]
  br label %8, !dbg !123                          ; [debug line = 31:47]

; <label>:25                                      ; preds = %8
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([15 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !124 ; [debug line = 35:2]
  br label %26, !dbg !124                         ; [debug line = 35:2]

; <label>:26                                      ; preds = %25
  %27 = load i16* %i, align 2, !dbg !125          ; [#uses=1 type=i16] [debug line = 29:46]
  %28 = add i16 %27, 1, !dbg !125                 ; [#uses=1 type=i16] [debug line = 29:46]
  store i16 %28, i16* %i, align 2, !dbg !125      ; [debug line = 29:46]
  br label %2, !dbg !125                          ; [debug line = 29:46]

; <label>:29                                      ; preds = %2
  ret void, !dbg !126                             ; [debug line = 36:1]
}

; [#uses=0]
define void @_Z11parseEventsPKjiPa(i32* %data, i32 %eventsArraySize, i8* %eventSlice) nounwind {
  %1 = alloca i32*, align 4                       ; [#uses=5 type=i32**]
  %2 = alloca i32, align 4                        ; [#uses=2 type=i32*]
  %3 = alloca i8*, align 4                        ; [#uses=3 type=i8**]
  %i = alloca i32, align 4                        ; [#uses=7 type=i32*]
  %x = alloca i16, align 2                        ; [#uses=2 type=i16*]
  %y = alloca i16, align 2                        ; [#uses=2 type=i16*]
  %pol = alloca i1, align 1                       ; [#uses=2 type=i1*]
  store i32* %data, i32** %1, align 4
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !127), !dbg !128 ; [debug line = 38:35] [debug variable = data]
  store i32 %eventsArraySize, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !129), !dbg !130 ; [debug line = 38:49] [debug variable = eventsArraySize]
  store i8* %eventSlice, i8** %3, align 4
  call void @llvm.dbg.declare(metadata !{i8** %3}, metadata !131), !dbg !132 ; [debug line = 38:74] [debug variable = eventSlice]
  %4 = load i32** %1, align 4, !dbg !133          ; [#uses=1 type=i32*] [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %4, i8* getelementptr inbounds ([8 x i8]* @.str5, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !133 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !133 ; [debug line = 40:1]
  call void (...)* @_ssdm_SpecArrayPartition([180 x [240 x i8]]* getelementptr inbounds ([3 x [180 x [240 x i8]]]* @_ZL10glPLSlices, i32 0, i32 0), i32 3, i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0), i32 16, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !133 ; [debug line = 40:1]
  %5 = load i8** %3, align 4, !dbg !133           ; [#uses=1 type=i8*] [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecInterface(i8* %5, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !133 ; [debug line = 40:1]
  call void @_Z19resetCurrentSliceHWv(), !dbg !135 ; [debug line = 40:2]
  br label %6, !dbg !135                          ; [debug line = 40:2]

; <label>:6                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !136), !dbg !138 ; [debug line = 43:21] [debug variable = i]
  store i32 0, i32* %i, align 4, !dbg !139        ; [debug line = 43:26]
  br label %7, !dbg !139                          ; [debug line = 43:26]

; <label>:7                                       ; preds = %37, %6
  %8 = load i32* %i, align 4, !dbg !139           ; [#uses=1 type=i32] [debug line = 43:26]
  %9 = load i32* %2, align 4, !dbg !139           ; [#uses=1 type=i32] [debug line = 43:26]
  %10 = mul nsw i32 %9, 2, !dbg !139              ; [#uses=1 type=i32] [debug line = 43:26]
  %11 = icmp slt i32 %8, %10, !dbg !139           ; [#uses=1 type=i1] [debug line = 43:26]
  br i1 %11, label %12, label %40, !dbg !139      ; [debug line = 43:26]

; <label>:12                                      ; preds = %7
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !140 ; [debug line = 44:3]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !140 ; [debug line = 44:3]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !142 ; [debug line = 45:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !142 ; [debug line = 45:1]
  call void @llvm.dbg.declare(metadata !{i16* %x}, metadata !143), !dbg !144 ; [debug line = 46:11] [debug variable = x]
  %13 = load i32* %i, align 4, !dbg !145          ; [#uses=1 type=i32] [debug line = 46:45]
  %14 = load i32** %1, align 4, !dbg !145         ; [#uses=1 type=i32*] [debug line = 46:45]
  %15 = getelementptr inbounds i32* %14, i32 %13, !dbg !145 ; [#uses=1 type=i32*] [debug line = 46:45]
  %16 = load i32* %15, align 4, !dbg !145         ; [#uses=1 type=i32] [debug line = 46:45]
  %17 = lshr i32 %16, 17, !dbg !145               ; [#uses=1 type=i32] [debug line = 46:45]
  %18 = and i32 %17, 32767, !dbg !145             ; [#uses=1 type=i32] [debug line = 46:45]
  %19 = trunc i32 %18 to i16, !dbg !145           ; [#uses=1 type=i16] [debug line = 46:45]
  store i16 %19, i16* %x, align 2, !dbg !145      ; [debug line = 46:45]
  call void @llvm.dbg.declare(metadata !{i16* %y}, metadata !146), !dbg !147 ; [debug line = 47:11] [debug variable = y]
  %20 = load i32* %i, align 4, !dbg !148          ; [#uses=1 type=i32] [debug line = 47:44]
  %21 = load i32** %1, align 4, !dbg !148         ; [#uses=1 type=i32*] [debug line = 47:44]
  %22 = getelementptr inbounds i32* %21, i32 %20, !dbg !148 ; [#uses=1 type=i32*] [debug line = 47:44]
  %23 = load i32* %22, align 4, !dbg !148         ; [#uses=1 type=i32] [debug line = 47:44]
  %24 = lshr i32 %23, 2, !dbg !148                ; [#uses=1 type=i32] [debug line = 47:44]
  %25 = and i32 %24, 32767, !dbg !148             ; [#uses=1 type=i32] [debug line = 47:44]
  %26 = trunc i32 %25 to i16, !dbg !148           ; [#uses=1 type=i16] [debug line = 47:44]
  store i16 %26, i16* %y, align 2, !dbg !148      ; [debug line = 47:44]
  call void @llvm.dbg.declare(metadata !{i1* %pol}, metadata !149), !dbg !150 ; [debug line = 48:8] [debug variable = pol]
  %27 = load i32* %i, align 4, !dbg !151          ; [#uses=1 type=i32] [debug line = 48:43]
  %28 = load i32** %1, align 4, !dbg !151         ; [#uses=1 type=i32*] [debug line = 48:43]
  %29 = getelementptr inbounds i32* %28, i32 %27, !dbg !151 ; [#uses=1 type=i32*] [debug line = 48:43]
  %30 = load i32* %29, align 4, !dbg !151         ; [#uses=1 type=i32] [debug line = 48:43]
  %31 = lshr i32 %30, 1, !dbg !151                ; [#uses=1 type=i32] [debug line = 48:43]
  %32 = and i32 %31, 1, !dbg !151                 ; [#uses=1 type=i32] [debug line = 48:43]
  %33 = icmp ne i32 %32, 0, !dbg !151             ; [#uses=1 type=i1] [debug line = 48:43]
  store i1 %33, i1* %pol, align 1, !dbg !151      ; [debug line = 48:43]
  %34 = load i16* %x, align 2, !dbg !152          ; [#uses=1 type=i16] [debug line = 52:3]
  %35 = load i16* %y, align 2, !dbg !152          ; [#uses=1 type=i16] [debug line = 52:3]
  %36 = load i1* %pol, align 1, !dbg !152         ; [#uses=1 type=i1] [debug line = 52:3]
  call void @_Z12accumulateHWssbx(i16 signext %34, i16 signext %35, i1 zeroext %36, i64 0), !dbg !152 ; [debug line = 52:3]
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !153 ; [debug line = 53:2]
  br label %37, !dbg !153                         ; [debug line = 53:2]

; <label>:37                                      ; preds = %12
  %38 = load i32* %i, align 4, !dbg !154          ; [#uses=1 type=i32] [debug line = 43:53]
  %39 = add nsw i32 %38, 2, !dbg !154             ; [#uses=1 type=i32] [debug line = 43:53]
  store i32 %39, i32* %i, align 4, !dbg !154      ; [debug line = 43:53]
  br label %7, !dbg !154                          ; [debug line = 43:53]

; <label>:40                                      ; preds = %7
  %41 = load i8** %3, align 4, !dbg !155          ; [#uses=1 type=i8*] [debug line = 55:2]
  call void @_Z8copyToPSPa(i8* %41), !dbg !155    ; [debug line = 55:2]
  ret void, !dbg !156                             ; [debug line = 56:1]
}

; [#uses=2]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecLatency(...) nounwind

; [#uses=1]
declare void @_ssdm_SpecArrayPartition(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecLoopTripCount(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!43, !50, !56, !62}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution1/.autopilot/db/abmof_hw_accel.pragma.2.cpp", metadata !"E:\5CxfOpenCV\5Cwksp_2018_1\5Cmz_libcaer_OF_HLS\5CparseEvents", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !34} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !16, metadata !22, metadata !25}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"accumulateHW", metadata !"accumulateHW", metadata !"_Z12accumulateHWssbx", metadata !6, i32 6, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16, i16, i1, i64)* @_Z12accumulateHWssbx, null, null, metadata !14, i32 7} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"../../mz_libcaer_OF_HLS/ABMOF/abmof_hw_accel.cpp", metadata !"E:\5CxfOpenCV\5Cwksp_2018_1\5Cmz_libcaer_OF_HLS\5CparseEvents", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !11, metadata !12}
!9 = metadata !{i32 786454, null, metadata !"int16_t", metadata !6, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!10 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 786454, null, metadata !"int64_t", metadata !6, i32 41, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!13 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!16 = metadata !{i32 786478, i32 0, metadata !6, metadata !"copyToPS", metadata !"copyToPS", metadata !"_Z8copyToPSPa", metadata !6, i32 15, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @_Z8copyToPSPa, null, null, metadata !14, i32 16} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ]
!20 = metadata !{i32 786454, null, metadata !"int8_t", metadata !6, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ]
!21 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!22 = metadata !{i32 786478, i32 0, metadata !6, metadata !"resetCurrentSliceHW", metadata !"resetCurrentSliceHW", metadata !"_Z19resetCurrentSliceHWv", metadata !6, i32 26, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_Z19resetCurrentSliceHWv, null, null, metadata !14, i32 27} ; [ DW_TAG_subprogram ]
!23 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!24 = metadata !{null}
!25 = metadata !{i32 786478, i32 0, metadata !6, metadata !"parseEvents", metadata !"parseEvents", metadata !"_Z11parseEventsPKjiPa", metadata !6, i32 38, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32, i8*)* @_Z11parseEventsPKjiPa, null, null, metadata !14, i32 39} ; [ DW_TAG_subprogram ]
!26 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!27 = metadata !{null, metadata !28, metadata !32, metadata !19}
!28 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ]
!29 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_const_type ]
!30 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !6, i32 40, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!31 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!32 = metadata !{i32 786454, null, metadata !"int32_t", metadata !6, i32 39, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!33 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !36, metadata !42}
!36 = metadata !{i32 786484, i32 0, null, metadata !"glPLSlices", metadata !"glPLSlices", metadata !"_ZL10glPLSlices", metadata !6, i32 3, metadata !37, i32 1, i32 1, [3 x [180 x [240 x i8]]]* @_ZL10glPLSlices} ; [ DW_TAG_variable ]
!37 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1036800, i64 8, i32 0, i32 0, metadata !20, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ]
!38 = metadata !{metadata !39, metadata !40, metadata !41}
!39 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!40 = metadata !{i32 786465, i64 0, i64 179}      ; [ DW_TAG_subrange_type ]
!41 = metadata !{i32 786465, i64 0, i64 239}      ; [ DW_TAG_subrange_type ]
!42 = metadata !{i32 786484, i32 0, null, metadata !"glPLSliceIdx", metadata !"glPLSliceIdx", metadata !"_ZL12glPLSliceIdx", metadata !6, i32 4, metadata !20, i32 1, i32 1, i8* @_ZL12glPLSliceIdx} ; [ DW_TAG_variable ]
!43 = metadata !{void (i16, i16, i1, i64)* @_Z12accumulateHWssbx, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49}
!44 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!45 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!46 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t", metadata !"_Bool", metadata !"int64_t"}
!47 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!48 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"pol", metadata !"ts"}
!49 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!50 = metadata !{void (i8*)* @_Z8copyToPSPa, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !49}
!51 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!52 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"int8_t*"}
!54 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!55 = metadata !{metadata !"kernel_arg_name", metadata !"eventSlice"}
!56 = metadata !{void ()* @_Z19resetCurrentSliceHWv, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !49}
!57 = metadata !{metadata !"kernel_arg_addr_space"}
!58 = metadata !{metadata !"kernel_arg_access_qual"}
!59 = metadata !{metadata !"kernel_arg_type"}
!60 = metadata !{metadata !"kernel_arg_type_qual"}
!61 = metadata !{metadata !"kernel_arg_name"}
!62 = metadata !{void (i32*, i32, i8*)* @_Z11parseEventsPKjiPa, metadata !63, metadata !64, metadata !65, metadata !66, metadata !67, metadata !49}
!63 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1}
!64 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!65 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t*", metadata !"int32_t", metadata !"int8_t*"}
!66 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"", metadata !""}
!67 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"eventsArraySize", metadata !"eventSlice"}
!68 = metadata !{i32 786689, metadata !5, metadata !"x", metadata !6, i32 16777222, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!69 = metadata !{i32 6, i32 27, metadata !5, null}
!70 = metadata !{i32 786689, metadata !5, metadata !"y", metadata !6, i32 33554438, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!71 = metadata !{i32 6, i32 38, metadata !5, null}
!72 = metadata !{i32 786689, metadata !5, metadata !"pol", metadata !6, i32 50331654, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!73 = metadata !{i32 6, i32 46, metadata !5, null}
!74 = metadata !{i32 786689, metadata !5, metadata !"ts", metadata !6, i32 67108870, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!75 = metadata !{i32 6, i32 59, metadata !5, null}
!76 = metadata !{i32 8, i32 2, metadata !77, null}
!77 = metadata !{i32 786443, metadata !5, i32 7, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!78 = metadata !{i32 10, i32 3, metadata !79, null}
!79 = metadata !{i32 786443, metadata !77, i32 9, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 11, i32 2, metadata !79, null}
!81 = metadata !{i32 12, i32 1, metadata !77, null}
!82 = metadata !{i32 786689, metadata !16, metadata !"eventSlice", metadata !6, i32 16777231, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!83 = metadata !{i32 15, i32 23, metadata !16, null}
!84 = metadata !{i32 16, i32 1, metadata !85, null}
!85 = metadata !{i32 786443, metadata !16, i32 16, i32 1, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!86 = metadata !{i32 786688, metadata !87, metadata !"i", metadata !6, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!87 = metadata !{i32 786443, metadata !85, i32 17, i32 16, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 17, i32 28, metadata !87, null}
!89 = metadata !{i32 17, i32 33, metadata !87, null}
!90 = metadata !{i32 18, i32 3, metadata !91, null}
!91 = metadata !{i32 786443, metadata !87, i32 18, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!92 = metadata !{i32 786688, metadata !93, metadata !"j", metadata !6, i32 19, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!93 = metadata !{i32 786443, metadata !91, i32 19, i32 19, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!94 = metadata !{i32 19, i32 31, metadata !93, null}
!95 = metadata !{i32 19, i32 36, metadata !93, null}
!96 = metadata !{i32 20, i32 4, metadata !97, null}
!97 = metadata !{i32 786443, metadata !93, i32 20, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!98 = metadata !{i32 21, i32 1, metadata !97, null}
!99 = metadata !{i32 21, i32 4, metadata !97, null}
!100 = metadata !{i32 22, i32 3, metadata !97, null}
!101 = metadata !{i32 19, i32 47, metadata !93, null}
!102 = metadata !{i32 23, i32 2, metadata !91, null}
!103 = metadata !{i32 17, i32 44, metadata !87, null}
!104 = metadata !{i32 24, i32 1, metadata !85, null}
!105 = metadata !{i32 27, i32 1, metadata !106, null}
!106 = metadata !{i32 786443, metadata !22, i32 27, i32 1, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!107 = metadata !{i32 786688, metadata !108, metadata !"i", metadata !6, i32 29, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!108 = metadata !{i32 786443, metadata !106, i32 29, i32 18, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!109 = metadata !{i32 29, i32 30, metadata !108, null}
!110 = metadata !{i32 29, i32 35, metadata !108, null}
!111 = metadata !{i32 30, i32 3, metadata !112, null}
!112 = metadata !{i32 786443, metadata !108, i32 30, i32 2, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 31, i32 1, metadata !112, null}
!114 = metadata !{i32 786688, metadata !115, metadata !"j", metadata !6, i32 31, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!115 = metadata !{i32 786443, metadata !112, i32 31, i32 19, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!116 = metadata !{i32 31, i32 31, metadata !115, null}
!117 = metadata !{i32 31, i32 36, metadata !115, null}
!118 = metadata !{i32 32, i32 4, metadata !119, null}
!119 = metadata !{i32 786443, metadata !115, i32 32, i32 3, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!120 = metadata !{i32 33, i32 1, metadata !119, null}
!121 = metadata !{i32 33, i32 4, metadata !119, null}
!122 = metadata !{i32 34, i32 3, metadata !119, null}
!123 = metadata !{i32 31, i32 47, metadata !115, null}
!124 = metadata !{i32 35, i32 2, metadata !112, null}
!125 = metadata !{i32 29, i32 46, metadata !108, null}
!126 = metadata !{i32 36, i32 1, metadata !106, null}
!127 = metadata !{i32 786689, metadata !25, metadata !"data", metadata !6, i32 16777254, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!128 = metadata !{i32 38, i32 35, metadata !25, null}
!129 = metadata !{i32 786689, metadata !25, metadata !"eventsArraySize", metadata !6, i32 33554470, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!130 = metadata !{i32 38, i32 49, metadata !25, null}
!131 = metadata !{i32 786689, metadata !25, metadata !"eventSlice", metadata !6, i32 50331686, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!132 = metadata !{i32 38, i32 74, metadata !25, null}
!133 = metadata !{i32 40, i32 1, metadata !134, null}
!134 = metadata !{i32 786443, metadata !25, i32 39, i32 1, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!135 = metadata !{i32 40, i32 2, metadata !134, null}
!136 = metadata !{i32 786688, metadata !137, metadata !"i", metadata !6, i32 43, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!137 = metadata !{i32 786443, metadata !134, i32 43, i32 9, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!138 = metadata !{i32 43, i32 21, metadata !137, null}
!139 = metadata !{i32 43, i32 26, metadata !137, null}
!140 = metadata !{i32 44, i32 3, metadata !141, null}
!141 = metadata !{i32 786443, metadata !137, i32 44, i32 2, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!142 = metadata !{i32 45, i32 1, metadata !141, null}
!143 = metadata !{i32 786688, metadata !141, metadata !"x", metadata !6, i32 46, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!144 = metadata !{i32 46, i32 11, metadata !141, null}
!145 = metadata !{i32 46, i32 45, metadata !141, null}
!146 = metadata !{i32 786688, metadata !141, metadata !"y", metadata !6, i32 47, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!147 = metadata !{i32 47, i32 11, metadata !141, null}
!148 = metadata !{i32 47, i32 44, metadata !141, null}
!149 = metadata !{i32 786688, metadata !141, metadata !"pol", metadata !6, i32 48, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!150 = metadata !{i32 48, i32 8, metadata !141, null}
!151 = metadata !{i32 48, i32 43, metadata !141, null}
!152 = metadata !{i32 52, i32 3, metadata !141, null}
!153 = metadata !{i32 53, i32 2, metadata !141, null}
!154 = metadata !{i32 43, i32 53, metadata !137, null}
!155 = metadata !{i32 55, i32 2, metadata !134, null}
!156 = metadata !{i32 56, i32 1, metadata !134, null}
