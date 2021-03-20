`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/19/2021 09:43:15 PM
// Design Name: 
// Module Name: KeypadBufferTop
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

module KeypadBufferTop(
    input        CLK100MHZ  , //System Clock
    input  [3:0] sw         ,
    input  [3:0] btn        ,
    output [3:0] led_b      ,
    output [3:0] led_r      ,
    output [3:0] led_g      ,
    output [3:0] led        ,
    inout  [7:0] jd         , // PMod Keypad
    inout  [7:0] jc         , // PMod VGA-RB
    inout  [7:0] jb         , // PMod VGA-GHV
    inout  [7:0] ja         , // PMod Encoder
    inout  [7:0] ps_jd      , // PMod 7 Segment Display
    inout  [7:0] ps_ja      , // PMod 4 Switches
    inout  [7:0] ps_jb        // PMod 4 Switches
    );
    
    logic       scanClock          ; 
    logic       readClock          ;     
    ClockDivider_0 clockDivider(
        .SystemClock ( CLK100MHZ ),
        .DividedClock( scanClock )
    );
    ClockDivider_1 clockDivider1(
        .SystemClock ( CLK100MHZ ),
        .DividedClock( readClock )
    );
    
    logic [3:0] KeypadValue         ; 
    logic       ReleasedKey         ;
    logic       PressedKey          ;
    PModKypd_0 pModKypd(
        .ScanClock   ( scanClock   ),
        .PModPort    ( jd          ),
        .Value       ( KeypadValue ),
        .ReleasedKey ( ReleasedKey ),
        .PressedKey  ( PressedKey )
    );
        
    logic       Writer_FIFO_full    ; 
    logic       Writer_FIFO_wr_ack  ; 
    logic       Writer_FIFO_wr_clk  ; 
    logic [3:0] Writer_FIFO_din     ; 
    logic       Writer_FIFO_wr_en   ; 
    logic       Writer_FIFO_wr_rst  ; 
    
    logic [7:0] StatusRegister      ; 
    logic [7:0] StatusRegister2     ; 
    logic [7:0] StatusRegister3     ; 
    logic [7:0] StatusRegister4     ; 
    logic [7:0] StatusRegister5     ; 
    logic [7:0] StatusRegister6     ; 
    logic [7:0] StatusRegister7     ; 
    logic [7:0] StatusRegister8     ; 
        
    FifoWriter #(
        .DataWidth(4)
    ) fifoWriter (
        .Clock         ( readClock          ),
        
        .InputData     ( KeypadValue        ),
        .InputTrigger  ( ReleasedKey        ), 
        
        .FIFO_full     ( Writer_FIFO_full   ),
        .FIFO_wr_ack   ( Writer_FIFO_wr_ack ),
        .FIFO_wr_clk   ( Writer_FIFO_wr_clk ),
        .FIFO_din      ( Writer_FIFO_din    ),
        .FIFO_wr_en    ( Writer_FIFO_wr_en  )
        
        ,.StatusRegister(StatusRegister)
        ,.StatusRegister2(StatusRegister2)
        ,.StatusRegister3(StatusRegister3)
        ,.StatusRegister4(StatusRegister4)
        ,.StatusRegister5(StatusRegister5)
        ,.StatusRegister6(StatusRegister6)
        ,.StatusRegister7(StatusRegister7)
        ,.StatusRegister8(StatusRegister8)
    );
     
    logic       Reader_rd_clk ;
    logic       Reader_rd_en  ;
    logic [3:0] Reader_dout   ;
    logic       Reader_empty  ;
    logic       Reader_valid  ;
    
    assign Reader_rd_clk = scanClock;
    assign Reader_rd_en = btn[0];
                            
    fifo_generator_0 fifo (    
        .wr_clk ( Writer_FIFO_wr_clk ), 
        .din    ( Writer_FIFO_din    ), 
        .wr_en  ( Writer_FIFO_wr_en  ), 
        .full   ( Writer_FIFO_full   ), 
        .wr_ack ( Writer_FIFO_wr_ack ), 
        
        .rd_clk ( Reader_rd_clk      ), 
        .rd_en  ( Reader_rd_en       ), 
        .dout   ( Reader_dout        ), 
        .empty  ( Reader_empty       ), 
        .valid  ( Reader_valid       )  
    );
    
    byte displayValue;
    function byte GetValue(
        [3:0] address
    );
        case (address)
            4'b0000: return { 4'b0000     , KeypadValue     };
            4'b0001: return { Reader_dout , Writer_FIFO_din };
            4'b0010: return {
                Reader_rd_clk     ,
                Reader_rd_en      ,
                Reader_empty      ,
                Reader_valid      ,
                
                Writer_FIFO_wr_clk, 
                Writer_FIFO_wr_en , 
                Writer_FIFO_full  , 
                Writer_FIFO_wr_ack 
                };
            4'b0011: return {
                ReleasedKey       ,
                PressedKey        ,
                4'b0              ,
                PressedKey        ,
                ReleasedKey        
                };
                
            4'b0100: return StatusRegister;
            4'b0101: return StatusRegister2;
            4'b0110: return StatusRegister3;
            4'b0111: return StatusRegister4;
            4'b1000: return StatusRegister5;
            4'b1001: return StatusRegister6;
            4'b1010: return StatusRegister7;
            4'b1011: return StatusRegister8;
                
            4'b1111: return {4'b0000, Reader_dout     };            
            default : return 8'bZ;
        endcase
    endfunction    
    
    assign displayValue = GetValue(ps_ja[3:0]);
    assign led          = sw[0] ? displayValue[3:0] : displayValue[7:4];
    
    PMod7SegmentDisplay_0 pmod7sd (
        .ScanClock ( scanClock    ),
        .Invert    ( btn[3]       ),
        .Value     ( displayValue ),
        .PModPort  ( ps_jd        )
    );
    
endmodule
