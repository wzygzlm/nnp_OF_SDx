
set TopModule "parseEvents"
set ClockPeriod "10.000000"
set ClockList {ap_clk}
set multiClockList {}
set PortClockMap {}
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag  1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 1
set ResetLevelFlag 0
set ResetStyle "control"
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set fsmEncStyle "onehot"
set maxFanout "0"
set RtlPrefix "a0_"
set ExtraCCFlags ""
set ExtraCLdFlags ""
set SynCheckOptions ""
set PresynOptions ""
set PreprocOptions ""
set SchedOptions ""
set BindOptions ""
set RtlGenOptions ""
set RtlWriterOptions ""
set CbcGenFlag ""
set CasGenFlag ""
set CasMonitorFlag ""
set AutoSimOptions {}
set ExportMCPathFlag "0"
set SCTraceFileName "mytrace"
set SCTraceFileFormat "vcd"
set SCTraceOption "all"
set TargetInfo "xc7z007s:clg225:-1"
set SourceFiles {sc {} c ../../../ABMOF/abmof_hw_accel.cpp}
set SourceFlags {sc {} c {{-IE:/xfOpenCV/wksp_2018_1/mz_libcaer_OF/src -IE:/sdk_petalinux_2018_2_roofs/caer_include -IC:/Users/minliu/.Xilinx/SDx/2018.1/xfopencv/include -IE:/xfOpenCV/wksp_2018_1/mz_libcaer_OF/libs/sds_utils -Wall -O0 -g -fmessage-length=0 -Wno-overloaded-virtual -Wno-unused-label -Wno-strict-overflow -Wno-uninitialized -Wno-unused-function -Wno-unused-variable -Wno-unknown-attributes -Wno-unused-local-typedefs -Wno-sign-compare -Wno-unused-label -D__SDSCC__ -m32 -DHLS_NO_XIL_FPO_LIB -ID:/Xilinx/SDx/2018.1/target/aarch32-linux/include -IE:/xfOpenCV/wksp_2018_1/mz_libcaer_OF/src/ABMOF -D__SDSVHLS__ -D__SDSVHLS_SYNTHESIS__ -IE:/xfOpenCV/wksp_2018_1/mz_libcaer_OF/Debug -w}}}
set DirectiveFile {E:/xfOpenCV/wksp_2018_1/mz_libcaer_OF_HLS/parseEvents/parseEvents/solution1/solution1.directive}
set TBFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set SpecLanguage "C"
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {bc "" c "" sc "" cas "" vhdl "" verilog ""}
set TBInstNames {bc "" c "" sc "" cas "" vhdl "" verilog ""}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set PlatformFiles {{DefaultPlatform {xilinx/zynq/zynq xilinx/zynq/zynq_fpv6}}}
set DefaultPlatform "DefaultPlatform"
set TBTVFileNotFound ""
set AppFile "../vivado_hls.app"
set ApsFile "solution1.aps"
set AvePath "../.."
set HPFPO "0"
