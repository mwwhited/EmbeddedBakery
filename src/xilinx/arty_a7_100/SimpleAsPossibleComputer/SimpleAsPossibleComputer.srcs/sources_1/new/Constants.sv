`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 01/31/2021 02:17:18 PM
// Design Name: 
// Module Name: Constants
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

localparam ADDRESS_WIDTH = 32;
localparam DATA_WIDTH = 32;
    
localparam ADDRESS_TOP = ADDRESS_WIDTH - 1;
localparam DATA_TOP = DATA_WIDTH - 1;

localparam _data_z = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
