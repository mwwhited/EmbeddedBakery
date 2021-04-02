`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/31/2021 07:37:33 PM
// Design Name: 
// Module Name: InputKeypad
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

module InputKeypad(
    input           SystemClock         ,
    inout  [07:0]   KeypadPmod          ,    
    
    input           SetAddressPointer   ,
    input  [12:0]   AddressPointer      ,
    
    output          RamClock            ,
    output          RamWrite            ,
    output [12:0]   RamAddress          ,
    output [03:0]   RamData             
    );
    
    logic       scanClock          ; 
    logic       readClock          ; 
       
    ClockDivider_0 clockDivider(
        .SystemClock ( SystemClock ),
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
        .PModPort    ( KeypadPmod  ),
        .Value       ( KeypadValue ),
        .ReleasedKey ( ReleasedKey ),
        .PressedKey  ( PressedKey  )
    );
             
    logic       Writer_FIFO_full    ; 
    logic       Writer_FIFO_wr_ack  ; 
    logic       Writer_FIFO_wr_clk  ; 
    logic [3:0] Writer_FIFO_din     ; 
    logic       Writer_FIFO_wr_en   ; 
    logic       Writer_FIFO_wr_rst  ; 
                            
    TriggeredFIFOWriter_0 fifoWriter (
        .Clock         ( readClock          ),
        
        .InputData     ( KeypadValue        ),
        .InputTrigger  ( ReleasedKey        ), 
        
        .FIFO_full     ( Writer_FIFO_full   ),
        .FIFO_wr_ack   ( Writer_FIFO_wr_ack ),
        .FIFO_wr_clk   ( Writer_FIFO_wr_clk ),
        .FIFO_din      ( Writer_FIFO_din    ),
        .FIFO_wr_en    ( Writer_FIFO_wr_en  )
    );
    
    logic        Reader_rd_clk      ;
    logic        Reader_rd_en       ;
    logic [3:0]  Reader_dout        ;
    logic        Reader_empty       ;
    logic        Reader_valid       ;
                            
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
             
    FifoToBram #(
        .DataWidth      (4),
        .AddressWidth   (13),
        .LowerBound     (0),
        .UpperBound     (60*33*2)
    ) fifoToBram (
        .Clock      ( readClock     ),
        
        .SetAddressPointer(SetAddressPointer),
        .AddressPointer   (AddressPointer),
        
        .FIFO_dout  ( Reader_dout   ),
        .FIFO_rd_clk( Reader_rd_clk ),
        .FIFO_rd_en ( Reader_rd_en  ),
        .FIFO_empty ( Reader_empty  ),
        .FIFO_valid ( Reader_valid  ),
                
        .RAM_clka   ( RamClock      ),
        .RAM_wea    ( RamWrite      ),
        .RAM_addra  ( RamAddress    ),
        .RAM_data   ( RamData       )        
    ); 
    
endmodule
