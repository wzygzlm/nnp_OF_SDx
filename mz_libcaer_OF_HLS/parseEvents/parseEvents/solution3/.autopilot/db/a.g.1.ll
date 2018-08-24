; ModuleID = 'E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution3/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i386-w64-mingw32"

@parseEvents.str = internal unnamed_addr constant [12 x i8] c"parseEvents\00" ; [#uses=1 type=[12 x i8]*]
@glPLSlices = internal global [3 x [180 x [240 x i8]]] zeroinitializer, align 1 ; [#uses=4 type=[3 x [180 x [240 x i8]]]*]
@.str9 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=1 type=[7 x i8]*]
@.str8 = private unnamed_addr constant [11 x i8] c"eventSlice\00", align 1 ; [#uses=1 type=[11 x i8]*]
@.str7 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=1 type=[6 x i8]*]
@.str6 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1 ; [#uses=1 type=[8 x i8]*]
@.str5 = private unnamed_addr constant [16 x i8] c"resetSliceLoop2\00", align 1 ; [#uses=1 type=[16 x i8]*]
@.str4 = private unnamed_addr constant [15 x i8] c"resetSliceLoop\00", align 1 ; [#uses=1 type=[15 x i8]*]
@.str3 = private unnamed_addr constant [6 x i8] c"BLOCK\00", align 1 ; [#uses=1 type=[6 x i8]*]
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str10 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1 ; [#uses=1 type=[7 x i8]*]
@.str1 = private unnamed_addr constant [16 x i8] c"copyToPS_label2\00", align 1 ; [#uses=1 type=[16 x i8]*]
@.str = private unnamed_addr constant [13 x i8] c"copyToPSLoop\00", align 1 ; [#uses=1 type=[13 x i8]*]

; [#uses=1]
define internal fastcc void @resetCurrentSliceHW() nounwind {
  call void (...)* @_ssdm_SpecArrayPartition([180 x [240 x i8]]* getelementptr inbounds ([3 x [180 x [240 x i8]]]* @glPLSlices, i32 0, i32 0), i32 3, i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !68 ; [debug line = 28:1]
  br label %1, !dbg !70                           ; [debug line = 29:35]

; <label>:1                                       ; preds = %5, %0
  %i = phi i16 [ 0, %0 ], [ %i.1, %5 ]            ; [#uses=3 type=i16]
  %exitcond1 = icmp eq i16 %i, 180, !dbg !70      ; [#uses=1 type=i1] [debug line = 29:35]
  br i1 %exitcond1, label %6, label %2, !dbg !70  ; [debug line = 29:35]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0)) nounwind, !dbg !72 ; [debug line = 30:3]
  %rbegin = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0)) nounwind, !dbg !72 ; [#uses=1 type=i32] [debug line = 30:3]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !74 ; [debug line = 31:1]
  %tmp = sext i16 %i to i32, !dbg !75             ; [#uses=1 type=i32] [debug line = 33:4]
  br label %3, !dbg !78                           ; [debug line = 31:36]

; <label>:3                                       ; preds = %4, %2
  %j = phi i16 [ 0, %2 ], [ %j.1, %4 ]            ; [#uses=3 type=i16]
  %exitcond = icmp eq i16 %j, 240, !dbg !78       ; [#uses=1 type=i1] [debug line = 31:36]
  br i1 %exitcond, label %5, label %4, !dbg !78   ; [debug line = 31:36]

; <label>:4                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([16 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !79 ; [debug line = 32:4]
  %rbegin2 = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([16 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !79 ; [#uses=1 type=i32] [debug line = 32:4]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !80 ; [debug line = 33:1]
  %tmp.2 = sext i16 %j to i32, !dbg !75           ; [#uses=1 type=i32] [debug line = 33:4]
  %glPLSlices.addr = getelementptr inbounds [3 x [180 x [240 x i8]]]* @glPLSlices, i32 0, i32 0, i32 %tmp, i32 %tmp.2, !dbg !75 ; [#uses=1 type=i8*] [debug line = 33:4]
  store i8 0, i8* %glPLSlices.addr, align 1, !dbg !75 ; [debug line = 33:4]
  %rend3 = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([16 x i8]* @.str5, i32 0, i32 0), i32 %rbegin2) nounwind, !dbg !81 ; [#uses=0 type=i32] [debug line = 34:3]
  %j.1 = add i16 %j, 1, !dbg !82                  ; [#uses=1 type=i16] [debug line = 31:47]
  call void @llvm.dbg.value(metadata !{i16 %j.1}, i64 0, metadata !83), !dbg !82 ; [debug line = 31:47] [debug variable = j]
  br label %3, !dbg !82                           ; [debug line = 31:47]

; <label>:5                                       ; preds = %3
  %rend = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0), i32 %rbegin) nounwind, !dbg !84 ; [#uses=0 type=i32] [debug line = 35:2]
  %i.1 = add i16 %i, 1, !dbg !85                  ; [#uses=1 type=i16] [debug line = 29:46]
  call void @llvm.dbg.value(metadata !{i16 %i.1}, i64 0, metadata !86), !dbg !85 ; [debug line = 29:46] [debug variable = i]
  br label %1, !dbg !85                           ; [debug line = 29:46]

; <label>:6                                       ; preds = %1
  ret void, !dbg !87                              ; [debug line = 36:1]
}

; [#uses=0]
define void @parseEvents(i32* %data, i32 %eventsArraySize, i8* %eventSlice) nounwind {
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @parseEvents.str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !88), !dbg !89 ; [debug line = 38:35] [debug variable = data]
  call void @llvm.dbg.value(metadata !{i32 %eventsArraySize}, i64 0, metadata !90), !dbg !91 ; [debug line = 38:49] [debug variable = eventsArraySize]
  call void @llvm.dbg.value(metadata !{i8* %eventSlice}, i64 0, metadata !92), !dbg !93 ; [debug line = 38:74] [debug variable = eventSlice]
  call void (...)* @_ssdm_op_SpecInterface(i32* %data, i8* getelementptr inbounds ([8 x i8]* @.str6, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !94 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !94 ; [debug line = 40:1]
  call void (...)* @_ssdm_op_SpecInterface(i8* %eventSlice, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !94 ; [debug line = 40:1]
  call fastcc void @resetCurrentSliceHW(), !dbg !96 ; [debug line = 40:2]
  %tmp = shl nsw i32 %eventsArraySize, 1, !dbg !97 ; [#uses=1 type=i32] [debug line = 43:26]
  br label %1, !dbg !97                           ; [debug line = 43:26]

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i.2, %2 ]            ; [#uses=3 type=i32]
  %tmp.4 = icmp slt i32 %i, %tmp, !dbg !97        ; [#uses=1 type=i1] [debug line = 43:26]
  br i1 %tmp.4, label %2, label %3, !dbg !97      ; [debug line = 43:26]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !99 ; [debug line = 44:3]
  %rbegin = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !99 ; [#uses=1 type=i32] [debug line = 44:3]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !101 ; [debug line = 45:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !101 ; [debug line = 45:1]
  %data.addr = getelementptr inbounds i32* %data, i32 %i, !dbg !102 ; [#uses=1 type=i32*] [debug line = 46:45]
  %data.load = load i32* %data.addr, align 4, !dbg !102 ; [#uses=6 type=i32] [debug line = 46:45]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %data.load) nounwind
  %tmp.5 = lshr i32 %data.load, 17, !dbg !102     ; [#uses=1 type=i32] [debug line = 46:45]
  %x = trunc i32 %tmp.5 to i16, !dbg !102         ; [#uses=1 type=i16] [debug line = 46:45]
  call void @llvm.dbg.value(metadata !{i16 %x}, i64 0, metadata !103), !dbg !102 ; [debug line = 46:45] [debug variable = x]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %data.load) nounwind
  %tmp.6 = lshr i32 %data.load, 2, !dbg !104      ; [#uses=1 type=i32] [debug line = 47:44]
  %tmp.7 = trunc i32 %tmp.6 to i16, !dbg !104     ; [#uses=1 type=i16] [debug line = 47:44]
  %y = and i16 %tmp.7, 32767, !dbg !104           ; [#uses=1 type=i16] [debug line = 47:44]
  call void @llvm.dbg.value(metadata !{i16 %y}, i64 0, metadata !105), !dbg !104 ; [debug line = 47:44] [debug variable = y]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %data.load) nounwind
  %tmp.8 = and i32 %data.load, 2, !dbg !106       ; [#uses=1 type=i32] [debug line = 48:43]
  %pol = icmp ne i32 %tmp.8, 0, !dbg !106         ; [#uses=1 type=i1] [debug line = 48:43]
  call void @llvm.dbg.value(metadata !{i1 %pol}, i64 0, metadata !107), !dbg !106 ; [debug line = 48:43] [debug variable = pol]
  call fastcc void @accumulateHW(i16 signext %x, i16 signext %y, i1 zeroext %pol), !dbg !108 ; [debug line = 52:3]
  %rend = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0), i32 %rbegin) nounwind, !dbg !109 ; [#uses=0 type=i32] [debug line = 53:2]
  %i.2 = add nsw i32 %i, 2, !dbg !110             ; [#uses=1 type=i32] [debug line = 43:53]
  call void @llvm.dbg.value(metadata !{i32 %i.2}, i64 0, metadata !111), !dbg !110 ; [debug line = 43:53] [debug variable = i]
  br label %1, !dbg !110                          ; [debug line = 43:53]

; <label>:3                                       ; preds = %1
  call fastcc void @copyToPS(i8* %eventSlice), !dbg !112 ; [debug line = 55:2]
  ret void, !dbg !113                             ; [debug line = 56:1]
}

; [#uses=15]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define internal fastcc void @copyToPS(i8* %eventSlice) nounwind {
  call void @llvm.dbg.value(metadata !{i8* %eventSlice}, i64 0, metadata !114), !dbg !115 ; [debug line = 15:23] [debug variable = eventSlice]
  br label %1, !dbg !116                          ; [debug line = 17:33]

; <label>:1                                       ; preds = %5, %0
  %i = phi i16 [ 0, %0 ], [ %i.3, %5 ]            ; [#uses=3 type=i16]
  %exitcond1 = icmp eq i16 %i, 180, !dbg !116     ; [#uses=1 type=i1] [debug line = 17:33]
  br i1 %exitcond1, label %6, label %2, !dbg !116 ; [debug line = 17:33]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !119 ; [debug line = 18:3]
  %rbegin = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !119 ; [#uses=1 type=i32] [debug line = 18:3]
  %tmp = sext i16 %i to i32, !dbg !121            ; [#uses=2 type=i32] [debug line = 21:4]
  %tmp.10 = mul nsw i32 %tmp, 240, !dbg !121      ; [#uses=1 type=i32] [debug line = 21:4]
  br label %3, !dbg !124                          ; [debug line = 19:36]

; <label>:3                                       ; preds = %4, %2
  %j = phi i16 [ 0, %2 ], [ %j.2, %4 ]            ; [#uses=3 type=i16]
  %exitcond = icmp eq i16 %j, 240, !dbg !124      ; [#uses=1 type=i1] [debug line = 19:36]
  br i1 %exitcond, label %5, label %4, !dbg !124  ; [debug line = 19:36]

; <label>:4                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !125 ; [debug line = 20:4]
  %rbegin2 = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !125 ; [#uses=1 type=i32] [debug line = 20:4]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !126 ; [debug line = 21:1]
  %tmp.12 = sext i16 %j to i32, !dbg !121         ; [#uses=2 type=i32] [debug line = 21:4]
  %glPLSlices.addr = getelementptr inbounds [3 x [180 x [240 x i8]]]* @glPLSlices, i32 0, i32 0, i32 %tmp, i32 %tmp.12, !dbg !121 ; [#uses=1 type=i8*] [debug line = 21:4]
  %glPLSlices.load = load i8* %glPLSlices.addr, align 1, !dbg !121 ; [#uses=2 type=i8] [debug line = 21:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i8 %glPLSlices.load) nounwind
  %tmp.13 = add nsw i32 %tmp.12, %tmp.10, !dbg !121 ; [#uses=1 type=i32] [debug line = 21:4]
  %eventSlice.addr = getelementptr inbounds i8* %eventSlice, i32 %tmp.13, !dbg !121 ; [#uses=1 type=i8*] [debug line = 21:4]
  store i8 %glPLSlices.load, i8* %eventSlice.addr, align 1, !dbg !121 ; [debug line = 21:4]
  %rend3 = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0), i32 %rbegin2) nounwind, !dbg !127 ; [#uses=0 type=i32] [debug line = 22:3]
  %j.2 = add i16 %j, 1, !dbg !128                 ; [#uses=1 type=i16] [debug line = 19:47]
  call void @llvm.dbg.value(metadata !{i16 %j.2}, i64 0, metadata !129), !dbg !128 ; [debug line = 19:47] [debug variable = j]
  br label %3, !dbg !128                          ; [debug line = 19:47]

; <label>:5                                       ; preds = %3
  %rend = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %rbegin) nounwind, !dbg !130 ; [#uses=0 type=i32] [debug line = 23:2]
  %i.3 = add i16 %i, 1, !dbg !131                 ; [#uses=1 type=i16] [debug line = 17:44]
  call void @llvm.dbg.value(metadata !{i16 %i.3}, i64 0, metadata !132), !dbg !131 ; [debug line = 17:44] [debug variable = i]
  br label %1, !dbg !131                          ; [debug line = 17:44]

; <label>:6                                       ; preds = %1
  ret void, !dbg !133                             ; [debug line = 24:1]
}

; [#uses=1]
define internal fastcc void @accumulateHW(i16 signext %x, i16 signext %y, i1 zeroext %pol) nounwind {
  call void @llvm.dbg.value(metadata !{i16 %x}, i64 0, metadata !134), !dbg !135 ; [debug line = 6:27] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i16 %y}, i64 0, metadata !136), !dbg !137 ; [debug line = 6:38] [debug variable = y]
  call void @llvm.dbg.value(metadata !{i1 %pol}, i64 0, metadata !138), !dbg !139 ; [debug line = 6:46] [debug variable = pol]
  br i1 %pol, label %1, label %._crit_edge, !dbg !140 ; [debug line = 8:2]

; <label>:1                                       ; preds = %0
  %tmp = sext i16 %x to i32, !dbg !142            ; [#uses=1 type=i32] [debug line = 10:3]
  %tmp.15 = sext i16 %y to i32, !dbg !142         ; [#uses=1 type=i32] [debug line = 10:3]
  %glPLSlices.addr = getelementptr inbounds [3 x [180 x [240 x i8]]]* @glPLSlices, i32 0, i32 0, i32 %tmp.15, i32 %tmp, !dbg !142 ; [#uses=2 type=i8*] [debug line = 10:3]
  %glPLSlices.load = load i8* %glPLSlices.addr, align 1, !dbg !142 ; [#uses=2 type=i8] [debug line = 10:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i8 %glPLSlices.load) nounwind
  %tmp.16 = add i8 %glPLSlices.load, 1, !dbg !142 ; [#uses=1 type=i8] [debug line = 10:3]
  store i8 %tmp.16, i8* %glPLSlices.addr, align 1, !dbg !142 ; [debug line = 10:3]
  br label %._crit_edge, !dbg !144                ; [debug line = 11:2]

._crit_edge:                                      ; preds = %1, %0
  ret void, !dbg !145                             ; [debug line = 12:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=5]
declare i32 @_ssdm_op_SpecRegionEnd(...)

; [#uses=5]
declare i32 @_ssdm_op_SpecRegionBegin(...)

; [#uses=4]
declare void @_ssdm_op_SpecPipeline(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecLoopTripCount(...) nounwind

; [#uses=5]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecLatency(...) nounwind

; [#uses=2]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=5]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=1]
declare void @_ssdm_SpecArrayPartition(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!43, !50, !56, !62}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution3/.autopilot/db/abmof_hw_accel.pragma.2.cpp", metadata !"E:\5CxfOpenCV\5Cwksp_2018_1\5Cmz_libcaer_OF_HLS\5CparseEvents", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !34} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !16, metadata !22, metadata !25}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"accumulateHW", metadata !"accumulateHW", metadata !"_Z12accumulateHWssbx", metadata !6, i32 6, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 7} ; [ DW_TAG_subprogram ]
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
!16 = metadata !{i32 786478, i32 0, metadata !6, metadata !"copyToPS", metadata !"copyToPS", metadata !"_Z8copyToPSPa", metadata !6, i32 15, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @copyToPS, null, null, metadata !14, i32 16} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ]
!20 = metadata !{i32 786454, null, metadata !"int8_t", metadata !6, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ]
!21 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!22 = metadata !{i32 786478, i32 0, metadata !6, metadata !"resetCurrentSliceHW", metadata !"resetCurrentSliceHW", metadata !"_Z19resetCurrentSliceHWv", metadata !6, i32 26, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @resetCurrentSliceHW, null, null, metadata !14, i32 27} ; [ DW_TAG_subprogram ]
!23 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!24 = metadata !{null}
!25 = metadata !{i32 786478, i32 0, metadata !6, metadata !"parseEvents", metadata !"parseEvents", metadata !"_Z11parseEventsPKjiPa", metadata !6, i32 38, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32, i8*)* @parseEvents, null, null, metadata !14, i32 39} ; [ DW_TAG_subprogram ]
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
!36 = metadata !{i32 786484, i32 0, null, metadata !"glPLSlices", metadata !"glPLSlices", metadata !"_ZL10glPLSlices", metadata !6, i32 3, metadata !37, i32 1, i32 1, [3 x [180 x [240 x i8]]]* @glPLSlices} ; [ DW_TAG_variable ]
!37 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1036800, i64 8, i32 0, i32 0, metadata !20, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ]
!38 = metadata !{metadata !39, metadata !40, metadata !41}
!39 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!40 = metadata !{i32 786465, i64 0, i64 179}      ; [ DW_TAG_subrange_type ]
!41 = metadata !{i32 786465, i64 0, i64 239}      ; [ DW_TAG_subrange_type ]
!42 = metadata !{i32 786484, i32 0, null, metadata !"glPLSliceIdx", metadata !"glPLSliceIdx", metadata !"_ZL12glPLSliceIdx", metadata !6, i32 4, metadata !20, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!43 = metadata !{null, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49}
!44 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!45 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!46 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t", metadata !"_Bool", metadata !"int64_t"}
!47 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!48 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"pol", metadata !"ts"}
!49 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!50 = metadata !{void (i8*)* @copyToPS, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !49}
!51 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!52 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"int8_t*"}
!54 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!55 = metadata !{metadata !"kernel_arg_name", metadata !"eventSlice"}
!56 = metadata !{void ()* @resetCurrentSliceHW, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !49}
!57 = metadata !{metadata !"kernel_arg_addr_space"}
!58 = metadata !{metadata !"kernel_arg_access_qual"}
!59 = metadata !{metadata !"kernel_arg_type"}
!60 = metadata !{metadata !"kernel_arg_type_qual"}
!61 = metadata !{metadata !"kernel_arg_name"}
!62 = metadata !{void (i32*, i32, i8*)* @parseEvents, metadata !63, metadata !64, metadata !65, metadata !66, metadata !67, metadata !49}
!63 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1}
!64 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!65 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t*", metadata !"int32_t", metadata !"int8_t*"}
!66 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"", metadata !""}
!67 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"eventsArraySize", metadata !"eventSlice"}
!68 = metadata !{i32 28, i32 1, metadata !69, null}
!69 = metadata !{i32 786443, metadata !22, i32 27, i32 1, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!70 = metadata !{i32 29, i32 35, metadata !71, null}
!71 = metadata !{i32 786443, metadata !69, i32 29, i32 18, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!72 = metadata !{i32 30, i32 3, metadata !73, null}
!73 = metadata !{i32 786443, metadata !71, i32 30, i32 2, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 31, i32 1, metadata !73, null}
!75 = metadata !{i32 33, i32 4, metadata !76, null}
!76 = metadata !{i32 786443, metadata !77, i32 32, i32 3, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!77 = metadata !{i32 786443, metadata !73, i32 31, i32 19, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!78 = metadata !{i32 31, i32 36, metadata !77, null}
!79 = metadata !{i32 32, i32 4, metadata !76, null}
!80 = metadata !{i32 33, i32 1, metadata !76, null}
!81 = metadata !{i32 34, i32 3, metadata !76, null}
!82 = metadata !{i32 31, i32 47, metadata !77, null}
!83 = metadata !{i32 786688, metadata !77, metadata !"j", metadata !6, i32 31, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!84 = metadata !{i32 35, i32 2, metadata !73, null}
!85 = metadata !{i32 29, i32 46, metadata !71, null}
!86 = metadata !{i32 786688, metadata !71, metadata !"i", metadata !6, i32 29, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!87 = metadata !{i32 36, i32 1, metadata !69, null}
!88 = metadata !{i32 786689, metadata !25, metadata !"data", metadata !6, i32 16777254, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!89 = metadata !{i32 38, i32 35, metadata !25, null}
!90 = metadata !{i32 786689, metadata !25, metadata !"eventsArraySize", metadata !6, i32 33554470, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!91 = metadata !{i32 38, i32 49, metadata !25, null}
!92 = metadata !{i32 786689, metadata !25, metadata !"eventSlice", metadata !6, i32 50331686, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!93 = metadata !{i32 38, i32 74, metadata !25, null}
!94 = metadata !{i32 40, i32 1, metadata !95, null}
!95 = metadata !{i32 786443, metadata !25, i32 39, i32 1, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!96 = metadata !{i32 40, i32 2, metadata !95, null}
!97 = metadata !{i32 43, i32 26, metadata !98, null}
!98 = metadata !{i32 786443, metadata !95, i32 43, i32 9, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!99 = metadata !{i32 44, i32 3, metadata !100, null}
!100 = metadata !{i32 786443, metadata !98, i32 44, i32 2, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!101 = metadata !{i32 45, i32 1, metadata !100, null}
!102 = metadata !{i32 46, i32 45, metadata !100, null}
!103 = metadata !{i32 786688, metadata !100, metadata !"x", metadata !6, i32 46, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!104 = metadata !{i32 47, i32 44, metadata !100, null}
!105 = metadata !{i32 786688, metadata !100, metadata !"y", metadata !6, i32 47, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!106 = metadata !{i32 48, i32 43, metadata !100, null}
!107 = metadata !{i32 786688, metadata !100, metadata !"pol", metadata !6, i32 48, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!108 = metadata !{i32 52, i32 3, metadata !100, null}
!109 = metadata !{i32 53, i32 2, metadata !100, null}
!110 = metadata !{i32 43, i32 53, metadata !98, null}
!111 = metadata !{i32 786688, metadata !98, metadata !"i", metadata !6, i32 43, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!112 = metadata !{i32 55, i32 2, metadata !95, null}
!113 = metadata !{i32 56, i32 1, metadata !95, null}
!114 = metadata !{i32 786689, metadata !16, metadata !"eventSlice", metadata !6, i32 16777231, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!115 = metadata !{i32 15, i32 23, metadata !16, null}
!116 = metadata !{i32 17, i32 33, metadata !117, null}
!117 = metadata !{i32 786443, metadata !118, i32 17, i32 16, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!118 = metadata !{i32 786443, metadata !16, i32 16, i32 1, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!119 = metadata !{i32 18, i32 3, metadata !120, null}
!120 = metadata !{i32 786443, metadata !117, i32 18, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!121 = metadata !{i32 21, i32 4, metadata !122, null}
!122 = metadata !{i32 786443, metadata !123, i32 20, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!123 = metadata !{i32 786443, metadata !120, i32 19, i32 19, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!124 = metadata !{i32 19, i32 36, metadata !123, null}
!125 = metadata !{i32 20, i32 4, metadata !122, null}
!126 = metadata !{i32 21, i32 1, metadata !122, null}
!127 = metadata !{i32 22, i32 3, metadata !122, null}
!128 = metadata !{i32 19, i32 47, metadata !123, null}
!129 = metadata !{i32 786688, metadata !123, metadata !"j", metadata !6, i32 19, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!130 = metadata !{i32 23, i32 2, metadata !120, null}
!131 = metadata !{i32 17, i32 44, metadata !117, null}
!132 = metadata !{i32 786688, metadata !117, metadata !"i", metadata !6, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!133 = metadata !{i32 24, i32 1, metadata !118, null}
!134 = metadata !{i32 786689, metadata !5, metadata !"x", metadata !6, i32 16777222, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!135 = metadata !{i32 6, i32 27, metadata !5, null}
!136 = metadata !{i32 786689, metadata !5, metadata !"y", metadata !6, i32 33554438, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!137 = metadata !{i32 6, i32 38, metadata !5, null}
!138 = metadata !{i32 786689, metadata !5, metadata !"pol", metadata !6, i32 50331654, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!139 = metadata !{i32 6, i32 46, metadata !5, null}
!140 = metadata !{i32 8, i32 2, metadata !141, null}
!141 = metadata !{i32 786443, metadata !5, i32 7, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!142 = metadata !{i32 10, i32 3, metadata !143, null}
!143 = metadata !{i32 786443, metadata !141, i32 9, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!144 = metadata !{i32 11, i32 2, metadata !143, null}
!145 = metadata !{i32 12, i32 1, metadata !141, null}
