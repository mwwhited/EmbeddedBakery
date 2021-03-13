// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Mar 13 14:00:29 2021
// Host        : EvengerBook running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Repos/mwwhited/EmbeddedBakery/src/GenericFPGA/PModKypd/PModKypd.gen/sources_1/ip/RowColumnDecoder_0/RowColumnDecoder_0_sim_netlist.v
// Design      : RowColumnDecoder_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "RowColumnDecoder_0,RowColumnDecoder,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "RowColumnDecoder,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module RowColumnDecoder_0
   (ScanClock,
    ColumnPins,
    RowPins,
    Value,
    ChangedValue);
  input ScanClock;
  output [3:0]ColumnPins;
  input [3:0]RowPins;
  output [3:0]Value;
  output ChangedValue;

  wire ChangedValue;
  wire [3:0]ColumnPins;
  wire [3:0]RowPins;
  wire ScanClock;
  wire [3:0]Value;

  RowColumnDecoder_0_RowColumnDecoder inst
       (.ChangedValue(ChangedValue),
        .Q(ColumnPins),
        .RowPins(RowPins),
        .ScanClock(ScanClock),
        .Value(Value));
endmodule

(* ORIG_REF_NAME = "RowColumnDecoder" *) 
module RowColumnDecoder_0_RowColumnDecoder
   (Q,
    Value,
    ChangedValue,
    ScanClock,
    RowPins);
  output [3:0]Q;
  output [3:0]Value;
  output ChangedValue;
  input ScanClock;
  input [3:0]RowPins;

  wire ChangedValue;
  wire ChangedValue_i_1_n_0;
  wire ChangedValue_i_2_n_0;
  wire ChangedValue_i_3_n_0;
  wire ChangedValue_i_4_n_0;
  wire ChangedValue_i_5_n_0;
  wire ChangedValue_i_6_n_0;
  wire ChangedValue_i_7_n_0;
  wire ChangedValue_i_8_n_0;
  wire \ColumnPins[0]_i_1_n_0 ;
  wire \ColumnPins[1]_i_1_n_0 ;
  wire \ColumnPins[2]_i_1_n_0 ;
  wire \ColumnPins[3]_i_1_n_0 ;
  wire [3:0]Q;
  wire [3:0]RowPins;
  wire ScanClock;
  wire [3:0]Value;
  wire \Value[0]_i_1_n_0 ;
  wire \Value[0]_i_2_n_0 ;
  wire \Value[1]_i_1_n_0 ;
  wire \Value[2]_i_1_n_0 ;
  wire \Value[3]_i_1_n_0 ;
  wire \Value[3]_i_2_n_0 ;
  wire \Value[3]_i_3_n_0 ;
  wire [1:0]counter;
  wire [1:0]p_0_in;

  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    ChangedValue_i_1
       (.I0(ChangedValue_i_2_n_0),
        .I1(ChangedValue_i_3_n_0),
        .I2(ChangedValue_i_4_n_0),
        .I3(ChangedValue_i_5_n_0),
        .I4(ChangedValue_i_6_n_0),
        .O(ChangedValue_i_1_n_0));
  LUT6 #(
    .INIT(64'h08080808FF080808)) 
    ChangedValue_i_2
       (.I0(\Value[0]_i_2_n_0 ),
        .I1(ChangedValue_i_7_n_0),
        .I2(Value[1]),
        .I3(\Value[3]_i_3_n_0 ),
        .I4(ChangedValue_i_8_n_0),
        .I5(Value[3]),
        .O(ChangedValue_i_2_n_0));
  LUT6 #(
    .INIT(64'h4040C0C040F0F0F0)) 
    ChangedValue_i_3
       (.I0(Q[0]),
        .I1(Value[3]),
        .I2(\Value[3]_i_3_n_0 ),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(Value[2]),
        .O(ChangedValue_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2A00)) 
    ChangedValue_i_4
       (.I0(Value[2]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(\Value[3]_i_3_n_0 ),
        .O(ChangedValue_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2A00)) 
    ChangedValue_i_5
       (.I0(Value[0]),
        .I1(RowPins[0]),
        .I2(RowPins[2]),
        .I3(\Value[0]_i_2_n_0 ),
        .O(ChangedValue_i_5_n_0));
  LUT6 #(
    .INIT(64'h4040C0C040F0F0F0)) 
    ChangedValue_i_6
       (.I0(RowPins[0]),
        .I1(Value[1]),
        .I2(\Value[0]_i_2_n_0 ),
        .I3(RowPins[3]),
        .I4(RowPins[1]),
        .I5(Value[0]),
        .O(ChangedValue_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ChangedValue_i_7
       (.I0(RowPins[2]),
        .I1(RowPins[3]),
        .O(ChangedValue_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ChangedValue_i_8
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(ChangedValue_i_8_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    ChangedValue_reg
       (.C(ScanClock),
        .CE(1'b1),
        .D(ChangedValue_i_1_n_0),
        .Q(ChangedValue),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \ColumnPins[0]_i_1 
       (.I0(counter[1]),
        .I1(counter[0]),
        .O(\ColumnPins[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \ColumnPins[1]_i_1 
       (.I0(counter[1]),
        .I1(counter[0]),
        .O(\ColumnPins[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \ColumnPins[2]_i_1 
       (.I0(counter[0]),
        .I1(counter[1]),
        .O(\ColumnPins[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \ColumnPins[3]_i_1 
       (.I0(counter[1]),
        .I1(counter[0]),
        .O(\ColumnPins[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ColumnPins_reg[0] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(\ColumnPins[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ColumnPins_reg[1] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(\ColumnPins[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ColumnPins_reg[2] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(\ColumnPins[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ColumnPins_reg[3] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(\ColumnPins[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2F00)) 
    \Value[0]_i_1 
       (.I0(RowPins[2]),
        .I1(RowPins[1]),
        .I2(RowPins[3]),
        .I3(\Value[0]_i_2_n_0 ),
        .O(\Value[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \Value[0]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[2]),
        .O(\Value[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00007FFF7FFF7FFF)) 
    \Value[1]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(RowPins[3]),
        .I5(RowPins[2]),
        .O(\Value[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h2F)) 
    \Value[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .O(\Value[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF0000)) 
    \Value[3]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\Value[3]_i_3_n_0 ),
        .O(\Value[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0777777777777777)) 
    \Value[3]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(RowPins[2]),
        .I3(RowPins[3]),
        .I4(RowPins[0]),
        .I5(RowPins[1]),
        .O(\Value[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \Value[3]_i_3 
       (.I0(RowPins[1]),
        .I1(RowPins[0]),
        .I2(RowPins[3]),
        .I3(RowPins[2]),
        .O(\Value[3]_i_3_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \Value_reg[0] 
       (.C(ScanClock),
        .CE(\Value[3]_i_1_n_0 ),
        .D(\Value[0]_i_1_n_0 ),
        .Q(Value[0]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \Value_reg[1] 
       (.C(ScanClock),
        .CE(\Value[3]_i_1_n_0 ),
        .D(\Value[1]_i_1_n_0 ),
        .Q(Value[1]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \Value_reg[2] 
       (.C(ScanClock),
        .CE(\Value[3]_i_1_n_0 ),
        .D(\Value[2]_i_1_n_0 ),
        .Q(Value[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Value_reg[3] 
       (.C(ScanClock),
        .CE(\Value[3]_i_1_n_0 ),
        .D(\Value[3]_i_2_n_0 ),
        .Q(Value[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(counter[0]),
        .I1(counter[1]),
        .O(p_0_in[1]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(counter[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(counter[1]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
