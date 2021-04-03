`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 12:07:27 AM
// Design Name: 
// Module Name: Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module PMod16Banked #(
    parameter ScanDividerCount
) (
    input         SystemClock,
    inout  [07:0] PModPort,
    output [15:0] Value,
    
    output [3:0] red,
    output [3:0] blue
);
    int bank    = 0;
    logic [3:0] selection; 
    logic [3:0] values [3:0]; 
    int scanCount       = 0;
    
    assign Value = {values[3], values[2],values[1], values[0]}; 
    assign selection = 1 << bank;
    assign PModPort[3:0] = selection;
    
    assign red = bank;
    assign blue = selection;
    
    initial begin
        for (int i = 0; i < $size(values); i++) begin
            values[i] <= 0;
        end
    end      
    
    always @(posedge SystemClock) begin
        scanCount++;
        if (scanCount == ScanDividerCount) begin
            scanCount <= 0;
            values[bank] <= PModPort[7:4];
            bank <= bank == 3 ? 0 : bank + 1;
        end
    end
    
endmodule

module Top(
    input           CLK100MHZ,
    input  [7:0]    ps_ja, 
    inout  [7:0]    ps_jb,
    input  [3:0]    sw,
    output [3:0]    led,
    output [3:0]    led_r,
    output [3:0]    led_g,
    output [3:0]    led_b  
    );
    
    //assign ps_jb[3:0] = ps_ja[3:0];
    //assign led = ps_jb[7:4];
    
    /*
    parameter ScanDividerCount
    input         SystemClock,
    inout  [07:0] PModPort,
    output [15:0] Value
    */
    
    logic [15:0] value;
    
    assign led = 
        sw == 0 ? value [03:00] :
        sw == 1 ? value [07:04] :
        sw == 2 ? value [11:08] :
        sw == 3 ? value [15:12] :
        0
        ;
        
    //assign led_g = sw;        
    
    PMod16Banked #(
        .ScanDividerCount   ( 10000  )
    ) banked16 (
        .SystemClock        ( CLK100MHZ ),
        .PModPort           ( ps_jb     ),
        .Value              ( value     ),
        .red(led_r),
        .blue(led_b)
    );
    
    
endmodule
