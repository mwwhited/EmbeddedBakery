// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Mar 14 09:57:10 2021
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
    ChangedValue,
    DetectedValue,
    ReleasedKey,
    PressedKey);
  input ScanClock;
  output [3:0]ColumnPins;
  input [3:0]RowPins;
  output [3:0]Value;
  output ChangedValue;
  output DetectedValue;
  output ReleasedKey;
  output PressedKey;

  wire ChangedValue;
  wire [3:0]ColumnPins;
  wire DetectedValue;
  wire PressedKey;
  wire ReleasedKey;
  wire [3:0]RowPins;
  wire ScanClock;
  wire [3:0]Value;
  wire \Value[1]_INST_0_i_1_n_0 ;
  wire \Value[1]_INST_0_i_2_n_0 ;
  wire \Value[3]_INST_0_i_1_n_0 ;
  wire inst_n_8;
  wire inst_n_9;

  FDRE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \Value[1]_INST_0_i_1 
       (.C(ScanClock),
        .CE(inst_n_9),
        .D(\Value[1]_INST_0_i_2_n_0 ),
        .Q(\Value[1]_INST_0_i_1_n_0 ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \Value[1]_INST_0_i_2 
       (.I0(RowPins[3]),
        .I1(RowPins[0]),
        .I2(RowPins[1]),
        .I3(RowPins[2]),
        .O(\Value[1]_INST_0_i_2_n_0 ));
  FDRE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \Value[3]_INST_0_i_1 
       (.C(ScanClock),
        .CE(inst_n_9),
        .D(inst_n_8),
        .Q(\Value[3]_INST_0_i_1_n_0 ),
        .R(1'b0));
  RowColumnDecoder_0_RowColumnDecoder inst
       (.ChangedValue(ChangedValue),
        .\ColumnPins_reg[3]_0 (ColumnPins),
        .D(inst_n_8),
        .DetectedValue(DetectedValue),
        .E(inst_n_9),
        .PressedKey(PressedKey),
        .Q({\Value[3]_INST_0_i_1_n_0 ,\Value[1]_INST_0_i_1_n_0 }),
        .ReleasedKey(ReleasedKey),
        .ReleasedKey_reg_0(ScanClock),
        .RowPins(RowPins),
        .ScanClock(ScanClock),
        .Value(Value));
endmodule

(* ORIG_REF_NAME = "RowColumnDecoder" *) 
module RowColumnDecoder_0_RowColumnDecoder
   (ChangedValue,
    DetectedValue,
    ReleasedKey,
    PressedKey,
    Value,
    D,
    E,
    \ColumnPins_reg[3]_0 ,
    ReleasedKey_reg_0,
    RowPins,
    ScanClock,
    Q);
  output ChangedValue;
  output DetectedValue;
  output ReleasedKey;
  output PressedKey;
  output [3:0]Value;
  output [0:0]D;
  output [0:0]E;
  output [3:0]\ColumnPins_reg[3]_0 ;
  input ReleasedKey_reg_0;
  input [3:0]RowPins;
  input ScanClock;
  input [1:0]Q;

  wire ChangedValue;
  wire [3:0]ChangedValue1;
  wire ChangedValue_i_1_n_0;
  wire ChangedValue_i_2_n_0;
  wire [3:0]\ColumnPins_reg[3]_0 ;
  wire [0:0]D;
  wire DetectedValue;
  wire DetectedValue_i_1_n_0;
  wire [0:0]E;
  wire [1:0]LSB;
  wire PressedKey;
  wire [1:0]Q;
  wire ReleasedKey;
  wire ReleasedKey_i_1_n_0;
  wire ReleasedKey_i_2_n_0;
  wire ReleasedKey_reg_0;
  wire [3:0]RowPins;
  wire ScanClock;
  wire [3:0]Value;
  wire \Value_tristate_oe[0]_i_1_n_0 ;
  wire \Value_tristate_oe[1]_i_1_n_0 ;
  wire \Value_tristate_oe_reg_n_0_[0] ;
  wire \Value_tristate_oe_reg_n_0_[1] ;
  wire \Value_tristate_oe_reg_n_0_[2] ;
  wire \Value_tristate_oe_reg_n_0_[3] ;
  wire _lastScan_reg_0_1_0_0_i_2_n_0;
  wire _lastScan_reg_0_1_0_0_i_3_n_0;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hBE00)) 
    ChangedValue_i_1
       (.I0(ChangedValue_i_2_n_0),
        .I1(RowPins[3]),
        .I2(ChangedValue1[3]),
        .I3(_lastScan_reg_0_1_0_0_i_2_n_0),
        .O(ChangedValue_i_1_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    ChangedValue_i_2
       (.I0(ChangedValue1[0]),
        .I1(RowPins[0]),
        .I2(RowPins[2]),
        .I3(ChangedValue1[2]),
        .I4(RowPins[1]),
        .I5(ChangedValue1[1]),
        .O(ChangedValue_i_2_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    ChangedValue_reg
       (.C(ScanClock),
        .CE(1'b1),
        .D(ChangedValue_i_1_n_0),
        .Q(ChangedValue),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ColumnPins_reg[0] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(\ColumnPins_reg[3]_0 [3]),
        .Q(\ColumnPins_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \ColumnPins_reg[1] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(\ColumnPins_reg[3]_0 [0]),
        .Q(\ColumnPins_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \ColumnPins_reg[2] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(\ColumnPins_reg[3]_0 [1]),
        .Q(\ColumnPins_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \ColumnPins_reg[3] 
       (.C(ScanClock),
        .CE(1'b1),
        .D(\ColumnPins_reg[3]_0 [2]),
        .Q(\ColumnPins_reg[3]_0 [3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF0000)) 
    DetectedValue_i_1
       (.I0(RowPins[2]),
        .I1(RowPins[3]),
        .I2(RowPins[0]),
        .I3(RowPins[1]),
        .I4(_lastScan_reg_0_1_0_0_i_2_n_0),
        .O(DetectedValue_i_1_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    DetectedValue_reg
       (.C(ScanClock),
        .CE(1'b1),
        .D(DetectedValue_i_1_n_0),
        .Q(DetectedValue),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    PressedKey_INST_0
       (.I0(ChangedValue),
        .I1(ReleasedKey),
        .O(PressedKey));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0000F600)) 
    ReleasedKey_i_1
       (.I0(ChangedValue1[3]),
        .I1(RowPins[3]),
        .I2(ChangedValue_i_2_n_0),
        .I3(_lastScan_reg_0_1_0_0_i_2_n_0),
        .I4(ReleasedKey_i_2_n_0),
        .O(ReleasedKey_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    ReleasedKey_i_2
       (.I0(RowPins[1]),
        .I1(RowPins[0]),
        .I2(RowPins[3]),
        .I3(RowPins[2]),
        .O(ReleasedKey_i_2_n_0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    ReleasedKey_reg
       (.C(ScanClock),
        .CE(1'b1),
        .D(ReleasedKey_i_1_n_0),
        .Q(ReleasedKey),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Value[0]_INST_0 
       (.I0(\Value_tristate_oe_reg_n_0_[0] ),
        .I1(Q[0]),
        .O(Value[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Value[1]_INST_0 
       (.I0(\Value_tristate_oe_reg_n_0_[1] ),
        .I1(Q[0]),
        .O(Value[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Value[2]_INST_0 
       (.I0(\Value_tristate_oe_reg_n_0_[2] ),
        .I1(Q[1]),
        .O(Value[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Value[3]_INST_0 
       (.I0(\Value_tristate_oe_reg_n_0_[3] ),
        .I1(Q[1]),
        .O(Value[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \Value[3]_INST_0_i_2 
       (.I0(\ColumnPins_reg[3]_0 [3]),
        .I1(\ColumnPins_reg[3]_0 [0]),
        .I2(\ColumnPins_reg[3]_0 [1]),
        .I3(\ColumnPins_reg[3]_0 [2]),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h22A2)) 
    \Value_tristate_oe[0]_i_1 
       (.I0(RowPins[0]),
        .I1(RowPins[1]),
        .I2(RowPins[2]),
        .I3(RowPins[3]),
        .O(\Value_tristate_oe[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2A00)) 
    \Value_tristate_oe[1]_i_1 
       (.I0(RowPins[0]),
        .I1(RowPins[2]),
        .I2(RowPins[3]),
        .I3(RowPins[1]),
        .O(\Value_tristate_oe[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h22A2)) 
    \Value_tristate_oe[2]_i_1 
       (.I0(\ColumnPins_reg[3]_0 [0]),
        .I1(\ColumnPins_reg[3]_0 [1]),
        .I2(\ColumnPins_reg[3]_0 [2]),
        .I3(\ColumnPins_reg[3]_0 [3]),
        .O(LSB[0]));
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \Value_tristate_oe[3]_i_1 
       (.I0(_lastScan_reg_0_1_0_0_i_2_n_0),
        .I1(RowPins[2]),
        .I2(RowPins[3]),
        .I3(RowPins[0]),
        .I4(RowPins[1]),
        .O(E));
  LUT4 #(
    .INIT(16'h2A00)) 
    \Value_tristate_oe[3]_i_2 
       (.I0(\ColumnPins_reg[3]_0 [0]),
        .I1(\ColumnPins_reg[3]_0 [2]),
        .I2(\ColumnPins_reg[3]_0 [3]),
        .I3(\ColumnPins_reg[3]_0 [1]),
        .O(LSB[1]));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \Value_tristate_oe_reg[0] 
       (.C(ScanClock),
        .CE(E),
        .D(\Value_tristate_oe[0]_i_1_n_0 ),
        .Q(\Value_tristate_oe_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \Value_tristate_oe_reg[1] 
       (.C(ScanClock),
        .CE(E),
        .D(\Value_tristate_oe[1]_i_1_n_0 ),
        .Q(\Value_tristate_oe_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \Value_tristate_oe_reg[2] 
       (.C(ScanClock),
        .CE(E),
        .D(LSB[0]),
        .Q(\Value_tristate_oe_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \Value_tristate_oe_reg[3] 
       (.C(ScanClock),
        .CE(E),
        .D(LSB[1]),
        .Q(\Value_tristate_oe_reg_n_0_[3] ),
        .R(1'b0));
  (* OPT_MODIFIED = "MLO" *) 
  (* RTL_RAM_BITS = "8" *) 
  (* RTL_RAM_NAME = "inst/_lastScan" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "0" *) 
  RAM32X1S #(
    .INIT(32'h00000003),
    .IS_WCLK_INVERTED(1'b1)) 
    _lastScan_reg_0_1_0_0
       (.A0(_lastScan_reg_0_1_0_0_i_3_n_0),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .A4(1'b0),
        .D(RowPins[0]),
        .O(ChangedValue1[0]),
        .WCLK(ReleasedKey_reg_0),
        .WE(_lastScan_reg_0_1_0_0_i_2_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    _lastScan_reg_0_1_0_0_i_2
       (.I0(\ColumnPins_reg[3]_0 [1]),
        .I1(\ColumnPins_reg[3]_0 [0]),
        .I2(\ColumnPins_reg[3]_0 [3]),
        .I3(\ColumnPins_reg[3]_0 [2]),
        .O(_lastScan_reg_0_1_0_0_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _lastScan_reg_0_1_0_0_i_3
       (.I0(LSB[0]),
        .I1(D),
        .O(_lastScan_reg_0_1_0_0_i_3_n_0));
  (* OPT_MODIFIED = "MLO" *) 
  (* RTL_RAM_BITS = "8" *) 
  (* RTL_RAM_NAME = "inst/_lastScan" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "1" *) 
  (* ram_slice_end = "1" *) 
  RAM32X1S #(
    .INIT(32'h00000003),
    .IS_WCLK_INVERTED(1'b1)) 
    _lastScan_reg_0_1_1_1
       (.A0(_lastScan_reg_0_1_0_0_i_3_n_0),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .A4(1'b0),
        .D(RowPins[1]),
        .O(ChangedValue1[1]),
        .WCLK(ReleasedKey_reg_0),
        .WE(_lastScan_reg_0_1_0_0_i_2_n_0));
  (* OPT_MODIFIED = "MLO" *) 
  (* RTL_RAM_BITS = "8" *) 
  (* RTL_RAM_NAME = "inst/_lastScan" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM32X1S #(
    .INIT(32'h00000003),
    .IS_WCLK_INVERTED(1'b1)) 
    _lastScan_reg_0_1_2_2
       (.A0(_lastScan_reg_0_1_0_0_i_3_n_0),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .A4(1'b0),
        .D(RowPins[2]),
        .O(ChangedValue1[2]),
        .WCLK(ReleasedKey_reg_0),
        .WE(_lastScan_reg_0_1_0_0_i_2_n_0));
  (* OPT_MODIFIED = "MLO" *) 
  (* RTL_RAM_BITS = "8" *) 
  (* RTL_RAM_NAME = "inst/_lastScan" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM32X1S #(
    .INIT(32'h00000003),
    .IS_WCLK_INVERTED(1'b1)) 
    _lastScan_reg_0_1_3_3
       (.A0(_lastScan_reg_0_1_0_0_i_3_n_0),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .A4(1'b0),
        .D(RowPins[3]),
        .O(ChangedValue1[3]),
        .WCLK(ReleasedKey_reg_0),
        .WE(_lastScan_reg_0_1_0_0_i_2_n_0));
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
