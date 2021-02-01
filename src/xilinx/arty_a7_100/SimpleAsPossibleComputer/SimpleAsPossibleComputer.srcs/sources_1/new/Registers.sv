`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 01/31/2021 07:33:29 PM
// Design Name: 
// Module Name: Registers
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


module Registers(
     input [3:0]operand0
    ,input [3:0]operand1
    ,input [3:0]operand2
    );
    
    Register banks[8];
    

    //BusFabric38 Bank0(operand0[2:0]) 
    
    //Register A =  
    
    /*
module BusFabric38(
    input [2:0] Selector
    ,inout [DATA_TOP:0] Matrix [8]     
    ,input Enable 
    ,inout [DATA_TOP:0] Bus 
    ,output Selected [8]   
    );
    */

endmodule
