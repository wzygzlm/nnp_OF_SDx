############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project parseEvents
set_top parseEvents
add_files ../../mz_libcaer_OF_HLS/ABMOF/abmof_hw_accel.cpp -cflags "-IE:/xfOpenCV/wksp_2018_1/mz_libcaer_OF/src -IE:/sdk_petalinux_2018_2_roofs/caer_include -IC:/Users/minliu/.Xilinx/SDx/2018.1/xfopencv/include -IE:/xfOpenCV/wksp_2018_1/mz_libcaer_OF/libs/sds_utils -Wall -O0 -g -fmessage-length=0 -Wno-overloaded-virtual -Wno-unused-label -Wno-strict-overflow -Wno-uninitialized -Wno-unused-function -Wno-unused-variable -Wno-unknown-attributes -Wno-unused-local-typedefs -Wno-sign-compare -Wno-unused-label -D__SDSCC__ -m32 -DHLS_NO_XIL_FPO_LIB -ID:/Xilinx/SDx/2018.1/target/aarch32-linux/include -IE:/xfOpenCV/wksp_2018_1/mz_libcaer_OF/src/ABMOF -D__SDSVHLS__ -D__SDSVHLS_SYNTHESIS__ -IE:/xfOpenCV/wksp_2018_1/mz_libcaer_OF/Debug -w"
open_solution "solution2"
set_part {xc7z007sclg225-1}
create_clock -period 10.000000 -name default
set_clock_uncertainty 27.0%
config_rtl -prefix a0_ -reset_level low
source "./parseEvents/solution2/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
