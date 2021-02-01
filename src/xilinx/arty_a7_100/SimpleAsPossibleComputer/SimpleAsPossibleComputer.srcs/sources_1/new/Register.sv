`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 01/31/2021 01:42:12 PM
// Design Name: 
// Module Name: Register
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

module Register(data, clk, set, enable);
    inout [DATA_TOP:0] data;
    input clk;
    input set;
    input enable;
    
    reg [DATA_TOP:0] value;
    
    assign data = enable ? value : 'bz;
    
    initial begin 
        value <= 0;
    end
        
    always @ (negedge clk)
    begin            
        if (enable & set) value = data;
    end
endmodule
