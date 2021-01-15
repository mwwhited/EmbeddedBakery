// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Jan 12 10:32:02 2021
// Host        : EvengerBook running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Repos/mwwhited/BlinkyTest/BlinkyTest.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_stub.v
// Design      : design_1_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module design_1_clk_wiz_0_0(clk_out_sys, clk_out_ddr, clk_out_eth_fi, 
  resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out_sys,clk_out_ddr,clk_out_eth_fi,resetn,locked,clk_in1" */;
  output clk_out_sys;
  output clk_out_ddr;
  output clk_out_eth_fi;
  input resetn;
  output locked;
  input clk_in1;
endmodule
