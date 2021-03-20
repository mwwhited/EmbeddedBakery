`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/19/2021 05:46:39 PM
// Design Name: 
// Module Name: FifoWriter
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

module FifoWriter #(
    parameter int DataWidth
) (
    input                              Clock,
    input          [(DataWidth - 1):0] InputData,
    input                              InputTrigger, 
    
    input                              FIFO_full,
    input                              FIFO_wr_ack,
    output                             FIFO_wr_clk,
    output reg [(DataWidth - 1):0]     FIFO_din,
    output reg                         FIFO_wr_en
    
    ,output [7:0] StatusRegister
    ,output [7:0] StatusRegister2
    ,output [7:0] StatusRegister3
    ,output reg [7:0] StatusRegister4
    ,output [7:0] StatusRegister5
    ,output [7:0] StatusRegister6
    ,output [7:0] StatusRegister7
    ,output [7:0] StatusRegister8
);    
    assign FIFO_wr_clk = Clock;
    
    assign StatusRegister = {
        InputData,
        
        Clock,
        InputTrigger,
        2'b0
    };
    
    assign StatusRegister2 = {
        FIFO_din,
        
        FIFO_full,
        FIFO_wr_ack,
        FIFO_wr_clk,
        FIFO_wr_en
    };
    
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
    //  ===  Build out FIFO State Machine  === 
    
    typedef enum {
        WriteRequested  =0,
        WriteStarted    =1,
        WriteProcessing =2,        
        Waiting         =3 
    } FifoStates;
    
    FifoStates currentState;    
    reg                     _WriteTriggered;
    reg [(DataWidth - 1):0] _WriteData     ;
        
    assign StatusRegister3 = {
        _WriteData,
        
        currentState,
        1'b0,
        _WriteTriggered
    };
    
    int stepcount =0;
    int triggerCount =0;
    
    assign {StatusRegister5, StatusRegister6} = stepcount;
    assign {StatusRegister7, StatusRegister8} = triggerCount;
            
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
                
    initial begin
        currentState    <= currentState.first;
        _WriteTriggered <= 1'b0              ;
        _WriteData      <= {DataWidth{1'b0}} ;
        
        StatusRegister4 <= 0;
    end

    reg d1;
    reg d2;
    reg d3;
        
    always @(posedge Clock) begin
    
        // https://www.nandland.com/articles/crossing-clock-domains-in-an-fpga.html
        d1 <=  InputTrigger;
        d2 <=  d1;
        d3 <=  d2;           
        if (d3 == 1'b0 && d2 == 1'b1) begin
            triggerCount++;
            _WriteData      <= InputData;
            _WriteTriggered <= 1'b1;
        end           
    
        StatusRegister4[1] <= ~StatusRegister4[1];
        currentState <= GetNextState();
    end

    function FifoStates GetNextState;
        StatusRegister4[2] <= ~StatusRegister4[2];
        stepcount++;
        case (currentState)       
            Waiting         : return __Waiting         ();
            WriteRequested  : return __WriteRequested  ();
            WriteStarted    : return __WriteStarted    ();
            WriteProcessing : return __WriteProcessing ();     
            default         : return Waiting             ;
        endcase
    endfunction

    function FifoStates __WriteRequested; 
        StatusRegister4[3] <= ~StatusRegister4[3];
        FIFO_wr_en      <= 1'b0                  ;   
        FIFO_din        <= _WriteData            ;
        _WriteTriggered <= 1'b0                  ;
        if (FIFO_full  ) return Waiting         ;        
        if (FIFO_wr_ack) return WriteRequested  ;        
        return WriteStarted;            
    endfunction
        
    function FifoStates __WriteStarted;
        StatusRegister4[4] <= ~StatusRegister4[4];
        FIFO_wr_en <= 1'b1     ;   
        return WriteProcessing; 
    endfunction
    
    function FifoStates __WriteProcessing; 
        StatusRegister4[5] <= ~StatusRegister4[5]; 
        FIFO_wr_en <= 1'b0;
        return ~FIFO_wr_ack ? WriteProcessing : Waiting;       
    endfunction
                 
    function FifoStates __Waiting;
        StatusRegister4[6] <= ~StatusRegister4[6]; 
        FIFO_wr_en      <= 1'b0                ;  
        if (_WriteTriggered) begin 
            StatusRegister4[7] <= ~StatusRegister4[7]; 
            return WriteRequested;
        end else begin       
            return Waiting;
        end        
    endfunction

endmodule
