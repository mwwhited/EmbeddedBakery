// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Fri Dec  5 20:38:39 2025
// Host        : AGIMUS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/repo/a7100/ArtyMicroBlazeTutorial/ArtyMicroBlazeTutorial.gen/sources_1/bd/MicroBlazeIPBlock/ip/MicroBlazeIPBlock_lmb_bram_0/MicroBlazeIPBlock_lmb_bram_0_sim_netlist.v
// Design      : MicroBlazeIPBlock_lmb_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MicroBlazeIPBlock_lmb_bram_0,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MicroBlazeIPBlock_lmb_bram_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "MicroBlazeIPBlock_lmb_bram_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MicroBlazeIPBlock_lmb_bram_0_blk_mem_gen_v8_4_12 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 61392)
`pragma protect data_block
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
jfA2
`pragma protect end_protected
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
