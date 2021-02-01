`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 01/31/2021 06:05:58 PM
// Design Name: 
// Module Name: BusFabric38
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

module BusFabric38(
    input [2:0] Selector
    ,inout [DATA_TOP:0] Matrix [8]     
    ,input Enable 
    ,inout [DATA_TOP:0] Bus 
    ,output Selected [8]   
    );
           
    assign Bus = Enable ? Matrix[Selector] : _data_z;   
     
    assign Matrix[0] = Enable ? ((Selector == 0) ? Bus : _data_z) : _data_z;
    assign Matrix[1] = Enable ? ((Selector == 1) ? Bus : _data_z) : _data_z;
    assign Matrix[2] = Enable ? ((Selector == 2) ? Bus : _data_z) : _data_z;
    assign Matrix[3] = Enable ? ((Selector == 3) ? Bus : _data_z) : _data_z;
    assign Matrix[4] = Enable ? ((Selector == 4) ? Bus : _data_z) : _data_z;
    assign Matrix[5] = Enable ? ((Selector == 5) ? Bus : _data_z) : _data_z;
    assign Matrix[6] = Enable ? ((Selector == 6) ? Bus : _data_z) : _data_z;
    assign Matrix[7] = Enable ? ((Selector == 7) ? Bus : _data_z) : _data_z;
    
    assign Selected[0] = (Selector == 0) ? Enable : 'bz;
    assign Selected[1] = (Selector == 1) ? Enable : 'bz;
    assign Selected[2] = (Selector == 2) ? Enable : 'bz;
    assign Selected[3] = (Selector == 3) ? Enable : 'bz;
    assign Selected[4] = (Selector == 4) ? Enable : 'bz;
    assign Selected[5] = (Selector == 5) ? Enable : 'bz;
    assign Selected[6] = (Selector == 6) ? Enable : 'bz;
    assign Selected[7] = (Selector == 7) ? Enable : 'bz;
    
endmodule
