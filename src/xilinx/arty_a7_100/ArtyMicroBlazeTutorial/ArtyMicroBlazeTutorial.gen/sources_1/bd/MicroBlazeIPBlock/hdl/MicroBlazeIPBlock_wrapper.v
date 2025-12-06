//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Fri Dec  5 20:37:42 2025
//Host        : AGIMUS running 64-bit major release  (build 9200)
//Command     : generate_target MicroBlazeIPBlock_wrapper.bd
//Design      : MicroBlazeIPBlock_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MicroBlazeIPBlock_wrapper
   (diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    led_4bits_tri_o,
    reset,
    usb_uart_rxd,
    usb_uart_txd);
  input diff_clock_rtl_clk_n;
  input diff_clock_rtl_clk_p;
  output [3:0]led_4bits_tri_o;
  input reset;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire diff_clock_rtl_clk_n;
  wire diff_clock_rtl_clk_p;
  wire [3:0]led_4bits_tri_o;
  wire reset;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  MicroBlazeIPBlock MicroBlazeIPBlock_i
       (.diff_clock_rtl_clk_n(diff_clock_rtl_clk_n),
        .diff_clock_rtl_clk_p(diff_clock_rtl_clk_p),
        .led_4bits_tri_o(led_4bits_tri_o),
        .reset(reset),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
