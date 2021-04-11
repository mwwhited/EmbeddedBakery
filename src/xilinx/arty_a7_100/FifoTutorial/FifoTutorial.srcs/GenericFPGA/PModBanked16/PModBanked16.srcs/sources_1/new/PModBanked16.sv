`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 04/03/2021 04:26:17 PM
// Design Name: 
// Module Name: PModBanked16
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


module PModBanked16 #(
    parameter ScanDividerCount = 10000
) (
    input         SystemClock,
    inout  [07:0] PModPort,
    output [15:0] Value
);
    int bank    = 0;
    logic [3:0] selection; 
    logic [3:0] values [3:0]; 
    int scanCount       = 0;
    
    assign Value = {>>{values}};
    assign selection = 1 << bank;
    assign PModPort[3:0] = selection;
        
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
