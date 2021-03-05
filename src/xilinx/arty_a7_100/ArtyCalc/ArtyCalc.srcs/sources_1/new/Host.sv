`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 02/21/2021 07:08:48 AM
// Design Name: Simple Arty Calculator - Top
// Module Name: Host
// Project Name: Simple Arty Calculator
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: This is a very simple calculator build using Digilent Arty A7-100. 
// The intention is to create a simple 2 register, 32bit, 4 function calculator
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Host(    
    input  CLK100MHZ,  // Clock signal
    //input  [3:0] sw,   // Register + Byte[2:0] Selector
    output reg [3:0] led,  // Current byte value
    //output reg [3:0] ledB, // Selected hexadecimalvalue byte value
    //output reg [3:0] ledG, // Selected operator {Addition, Subtraction, Multiplication, Division}
    //output reg [3:0] ledR, // Register + Byte[2:0] Selected
    //input  [3:0] btn,  // Operator selector {Addition, Subtraction, Multiplication, Division}
    inout  [7:0] jd,    // PModKypd (hexadecimal keypad)
    
    output [7:0] jb, //VGA Red/Blue
    output [7:0] jc //VGA Green/Sync
);
//JD + PModKypd) Hexadecimal Input
//LD3B:LD0B) Selected hexadecimalvalue byte value

    wire [3:0] mapped; 
    PModKypd_0 pmodKeypad(
        .SystemClock(CLK100MHZ),
        .RowPins(jd[7:4]),
        .ColumnPins(jd[3:0]),
        .Value(mapped)
    );  
    
    assign led = mapped;
    //assign ledG = sw[1] ? jd[7:4] : 4'b0;
    //assign led = sw;   
    
    /* --- Starting here is the VGA Text Mode --- */
    wire VGA_1920x1080Clock;     
    ClockGenerator clockGen(
        .SystemClock(CLK100MHZ),
        .VGA_1920x1080(VGA_1920x1080Clock)
    );

    reg [15:0] CharacterBuffer [(60 * 33)-1:0]; // 15:12 BgC, 11:8 FgC, 7:0 Char
    reg [11:0] ColorPalette [15:0]; // RRRR GGGG BBBB
    reg [63:0] CharacterMap [255:0]; // CharacterPixelHeight x CharacterPixelWidth pixels
        
    wire  [(60 * 33 * 15)-1:0] CharacterBuffer_packed;
    assign CharacterBuffer_packed = {<<{CharacterBuffer}};
    wire  [(12 * 16)-1:0] ColorPalette_packed;
    assign ColorPalette_packed = {<<{ColorPalette}};
    wire  [(64 * 256)-1:0] CharacterMap_packed;
    assign CharacterMap_packed = {<<{CharacterMap}};
    
    wire [3:0] Red;
    wire [3:0] Green;
    wire [3:0] Blue;    
    wire HorizontalSync;
    wire VerticalSync;
    
    wire LineComplete;
    wire FrameComplete;
    wire LineBlanking;
    wire FrameBlanking;
    
    //assign led = {LineComplete, LineBlanking, FrameComplete, FrameBlanking};
    assign jb = {Blue, Red};
    assign jc = { 1'b0, 1'b0, VerticalSync, HorizontalSync, Green};

    VgaTextController vtc(
        .ScanClock(VGA_1920x1080Clock),
        
        .CharacterBuffer(CharacterBuffer_packed),
        .ColorPalette(ColorPalette_packed),
        .CharacterMap(CharacterMap_packed),
        
        .Red(Red),
        .Green(Green),
        .Blue(Blue),        
        .HorizontalSync(HorizontalSync),
        .VerticalSync(VerticalSync),
        
        .LineComplete(LineComplete),
        .FrameComplete(FrameComplete),
        .LineBlanking(LineBlanking),
        .FrameBlanking(FrameBlanking)
    );
    
    int CharacterBufferIndex;
    always @(mapped) begin
        CharacterBufferIndex <= CharacterBufferIndex + 1;
        if (CharacterBufferIndex >= $size(CharacterBuffer)) begin
            CharacterBufferIndex <= 0;
        end
        CharacterBuffer[CharacterBufferIndex] <= { 4'h0, 4'hf, 4'h0, mapped };
    end
    
    initial begin
        CharacterBufferIndex <= 0;
    
        for(int c = 0; c < (60*33); c++) begin
            //we are just going to default to black and white
            CharacterBuffer[c] <= {  // 15:12 BgC, 11:8 FgC, 7:0 Char
                /* bg */ {4'h0000}[3:0],  
                /* fg */ {4'h1111}[3:0],  
                /*char*/ c[7:0]  
                };
        end
        
        //TODO: once I can load things from cleaner I should move this as well... 
        //Better still somewhere on the SPI Flash 
        ColorPalette[00] <= 12'h000;
        ColorPalette[01] <= 12'h00A;
        ColorPalette[02] <= 12'hA00;
        ColorPalette[03] <= 12'hA0A;
        ColorPalette[04] <= 12'h0A0;
        ColorPalette[05] <= 12'h0AA;
        ColorPalette[06] <= 12'hAA0;
        ColorPalette[07] <= 12'hAAA;
        ColorPalette[08] <= 12'h666;
        ColorPalette[09] <= 12'h00F;
        ColorPalette[10] <= 12'hF00;
        ColorPalette[11] <= 12'hF0F;
        ColorPalette[12] <= 12'h0F0;
        ColorPalette[13] <= 12'h0FF;
        ColorPalette[14] <= 12'hFF0;
        ColorPalette[15] <= 12'hFFF;
    
        //TODO: really want to shorten this path but that's to figure out another day
        $readmemh("C:/Repos/mwwhited/EmbeddedBakery/src/xilinx/arty_a7_100/ArtyCalc/ArtyCalc.srcs/sources_1/imports/fonts/901447-10m.mem.txt", CharacterMap);
    end
    
    
//SW3) Register selector (A = 0, B = 1)
//LD3R) Register selected
//SW2:SW0) Register byte selector
//LD2R:LDR0) Register  byte selected

//LD7:LD4) Current byte value

//BTN3) Addition              A <= A + B
//BTN2) Subtraction           A <= A - B
//BTN1) Multiplication        A <= A * B
//BTN0) Division              A <= A / B
//LD3G:LD0G) Selected operator {Addition, Subtraction, Multiplication, Division}

endmodule