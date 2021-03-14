`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2021 12:44:31 PM
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


module Top(
    input CLK100MHZ,
    input [3:0] btn,
    input [3:0] sw,
    output [3:0] led
    );
    
    typedef enum {
        start,
        idle,
        stop
    } state_def;
    
    state_def state;
    
    assign led = {cnt[7], last, {~state[2:0]}};
    
    initial begin
        state = start;
    end
    
    reg last;
    reg _btn;
    int cnt;
    
    always @(posedge CLK100MHZ) begin
        cnt++;
        if (cnt % 10000 == 0) begin
            last <= ~last;
            _btn <= btn[0];
            
            case (state)
                start: state = idle;
                idle: state = stop;
                stop: state = start;
            endcase
        end
    end
        /*
    always @(posedge btn[0]) begin
        //if (last != btn[0]) begin
            case (state)
                start: state = idle;
                idle: state = stop;
                stop: state = start;
            endcase
        //end          
        //last <= btn[0];
    end        
    */
endmodule
