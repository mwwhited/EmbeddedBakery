`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/19/2021 07:33:20 AM
// Design Name: 
// Module Name: PMod7SegmentDisplay
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

module PMod7SegmentDisplay(
    input bit ScanClock,
    output reg [7:0] PModPort,
    input bit Invert,
    input byte Value
);
    function logic [6:0] Hex27Segment_D(
        input logic [3:0] value
    );
        //  A    
        // F B   
        //  G    
        // E C   
        //  D  p 
        case (value)
            //               GFEDCBA
            4'h0 : return 7'b0111111; // 0
            4'h1 : return 7'b0000110; // 1
            4'h2 : return 7'b1011011; // 2
            4'h3 : return 7'b1001111; // 3
            4'h4 : return 7'b1100110; // 4
            4'h5 : return 7'b1101101; // 5
            4'h6 : return 7'b1111101; // 6
            4'h7 : return 7'b0000111; // 7
            4'h8 : return 7'b1111111; // 8
            4'h9 : return 7'b1100111; // 9
            4'hA : return 7'b1110111; // A
            4'hB : return 7'b1111100; // b
            4'hC : return 7'b0111001; // C
            4'hD : return 7'b1011110; // d
            4'hE : return 7'b1111001; // E
            4'hF : return 7'b1110001; // F
        endcase
    endfunction 
    
    function logic [6:0] Hex27Segment_U(
        input logic [3:0] value
    );
        // p  A
        //   F B
        //    G
        //   E C
        //    D
        case (value)
            //               GCBAFED
            4'h0 : return 7'b0111111; // 0
            4'h1 : return 7'b0110000; // 1
            4'h2 : return 7'b1011011; // 2
            4'h3 : return 7'b1111001; // 3
            4'h4 : return 7'b1110100; // 4
            4'h5 : return 7'b1101101; // 5
            4'h6 : return 7'b1101111; // 6
            4'h7 : return 7'b0111000; // 7
            4'h8 : return 7'b1111111; // 8
            4'h9 : return 7'b1111100; // 9
            4'hA : return 7'b1111110; // A
            4'hB : return 7'b1100111; // b
            4'hC : return 7'b0001111; // C
            4'hD : return 7'b1110011; // d
            4'hE : return 7'b1001111; // E
            4'hF : return 7'b1001110; // F
        endcase
    endfunction 
    
    logic highByte;
       
    always @(posedge ScanClock) begin
        highByte <= ~highByte;
        PModPort <= Invert ?
          { ~highByte, Hex27Segment_U(highByte ? Value[7:4] : Value[3:0]) } :
          {  highByte, Hex27Segment_D(highByte ? Value[7:4] : Value[3:0]) } 
          ;
    end    

endmodule
