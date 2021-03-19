`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 01:20:15 PM
// Design Name: 
// Module Name: PModShield
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


module PModShield(
    input CLK100MHZ,
    output [7:0] ps_ja,
    output [7:0] ps_jb,
    output [7:0] ps_jc,
    output reg [7:0] ps_jd,
    output [7:0] ps_je,
    input  [3:0] btn,
    output [3:0] led,
    output [3:0] led_r,
    output [3:0] led_g,
    output [3:0] led_b
    );
    
    logic dividedClock;
    int counter = 0;
    int even    = 0;
    
    ClockDivider_0 ClockDivider(
        .SystemClock(CLK100MHZ),
        .DividedClock(dividedClock)
    ); 
    
    PMod7SegmentDisplay_0 ssd(
        .ScanClock(dividedClock),
        .PModPort(ps_jd),
        .Invert(btn[3]),
        .Value(counter)
    );
    
    //assign  ps_jd =  { ~even, Hex27Segment(even ? counter[7:4] : counter[3:0]) };
    assign led = btn[2] ? counter[7:4] :counter[3:0];
    assign led_r[0] = ~even;
    assign led_r[1] =  even;
    assign led_r[3] = dividedClock;
    
    logic pushed = 0;    
    
    always @(posedge dividedClock) begin
        if (pushed && ~btn[0]) begin
            pushed <= 0;
        end
        if (~pushed && btn[0]) begin
            pushed <= 1;
            counter++;
        end
                
        if (btn[1]) begin
            counter <= 0;
        end
/*        
        even <= ~even;
        
        ps_jd <= btn[3] ?
          { even, Hex27Segment_D(even ? counter[7:4] : counter[3:0]) } :
          { ~even, Hex27Segment_U(even ? counter[7:4] : counter[3:0]) }
          ;
          */
    end     
    
endmodule
