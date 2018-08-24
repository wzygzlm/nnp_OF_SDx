############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode m_axi -offset direct -bundle eventSlice "parseEvents" eventSlice
set_directive_pipeline "copyToPS/copyToPS_label2"
set_directive_pipeline "resetCurrentSliceHW/resetSliceLoop"
set_directive_pipeline "resetCurrentSliceHW/resetSliceLoop2"
set_directive_latency -min 1 "parseEvents"
set_directive_interface -mode ap_fifo "parseEvents" data
set_directive_pipeline "parseEvents/loop_1"
set_directive_loop_tripcount -min 0 -max 10000 "parseEvents/loop_1"
set_directive_array_partition -type block -factor 1 -dim 3 "resetCurrentSliceHW" glPLSlices
