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
    inout  [7:0] ps_ja      , // PMod 4+4 Switches
    inout  [7:0] ps_jb      , // PMod 16bit Banked Switches
    inout  [7:0] ps_jc      , // PMod LED 8x8 Cols
    inout  [7:0] ps_jd      , // PMod LED 8x8 Rows
    inout  [7:0] ps_je      , // PMod 7 Segment Display
    input        ck_rst
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
    
    logic        RAM_clka           ;
    logic        RAM_wea            ;
    logic [12:0] RAM_addra          ;
    logic [3 :0] RAM_data           ;
    
    logic        SetAddressPointer  ;
    logic [12:0] AddressPointer     ;
    
    assign SetAddressPointer    = ~ck_rst;
    assign AddressPointer       = 13'b0;
 
 //Note: the fito to blockram ip isn't working as configured
   // FifoToBlockRam_0 /*#(
   //     .DataWidth      (4),
   //     .AddressWidth   (13),
   //     .LowerBound     (0),
   //     .UpperBound     (60*33*2)
   // )*/
             
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
                
        .RAM_clka   ( RAM_clka     ),
        .RAM_wea    ( RAM_wea      ),
        .RAM_addra  ( RAM_addra    ),
        .RAM_data   ( RAM_data     )        
    ); 
                            
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

    // ======================================    
    
    logic        bram_clka    ;
    logic        bram_wea     ;
    logic [12:0] bram_addra   ;
    logic [3 :0] bram_dina    ;
    logic [3 :0] bram_douta   ;
    
    assign bram_clka    = RAM_clka  ;
    assign bram_wea     = RAM_wea   ;
    assign bram_addra   = RAM_addra ;
    assign bram_dina    = RAM_data  ;
    //assign bram_douta   = RAM_data  ;
    
    logic        bram_clkb    ;  
    logic        bram_web     ;  
    logic [10:0] bram_addrb   ;  
    logic [15:0] bram_dinb    ;  
    logic [15:0] bram_doutb   ;  
    
    assign bram_clkb    = CLK100MHZ ;
    assign bram_web     = 1'b0      ;
    assign bram_dinb    = 16'bZ     ;
    assign bram_addrb   = { 
    // if this works I can test a wide range of memory by page addressing with buttons
        7'b0,
        ps_ja[7:4]
    }; 
    
    blk_mem_gen_0 textBuffer (
        .clka  ( bram_clka  ), //  : IN STD_LOGIC;
        .wea   ( bram_wea   ), //  : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        .addra ( bram_addra ), //  : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        .dina  ( bram_dina  ), //  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        //.douta ( bram_douta ), //  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

        .clkb  ( bram_clkb  ), //  : IN STD_LOGIC;
        .web   ( bram_web   ), //  : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        .addrb ( bram_addrb ), //  : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        .dinb  ( bram_dinb  ), //  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        .doutb ( bram_doutb )  //  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)  
    );
    
    logic [2:0] VerticalOffset;
    logic [3:0] TextValue [7:0];    
    
    logic [2:0] _pixel;
        
    reg _bnt1Last;
    reg _bnt2Last;
    
    always @(posedge scanClock) begin
    
        if (_bnt1Last && ~btn[1]) begin
            _bnt1Last <= 0;
        end else if (~_bnt1Last && btn[1]) begin
            _bnt1Last <= 1;
            _pixel++;
        end
        
        if (_bnt2Last && ~btn[2]) begin
            _bnt2Last <= 0;
        end else if (~_bnt2Last && btn[2]) begin
            _bnt2Last <= 1;
            VerticalOffset++;
        end
    
    end
        
    assign led_g = TextValue[_pixel];
    //assign led_r = bram_doutb[15:12];
    //assign led_b = bram_doutb[11:08];
    
    /*
    output [3:0] led_b      ,
    output [3:0] led_r      ,
    output [3:0] led_g      ,
    */
    
    TextColorMux textColorMux(
        .BackgroundColor( bram_doutb[15:12] ),
        .ForegroundColor( bram_doutb[11:08] ),
        .Text           ( bram_doutb[07:00] ),
        
        .VerticalOffset ( VerticalOffset    ),
        .Value          ( TextValue         )
    );

    // ========================================
        
    byte displayValue;
    function byte GetValue(
        [3:0] address
    );
        case (address)
            4'b0000: return { PressedKey, ReleasedKey, KeypadValue };
            4'b0001: return { Reader_dout , Writer_FIFO_din };
            4'b0010: return { Reader_rd_clk, Reader_rd_en, Reader_empty, Reader_valid, Writer_FIFO_wr_clk, Writer_FIFO_wr_en, Writer_FIFO_full, Writer_FIFO_wr_ack };
            
            4'b0011: return GetSubValue(sw[2:1], {1'B0,_pixel, 1'B0,VerticalOffset});
            //4'b0100: return GetSubValue(sw[2:1], );
            //4'b0101: return GetSubValue(sw[2:1], StatusRegister2);
            4'b0110: return { bram_clkb, RAM_clka, RAM_wea, RAM_data };
            4'b0111: return GetSubValue(sw[2:1], RAM_addra);
            
            4'b1000: return GetSubValue(sw[2:1], bram_addrb);
            4'b1001: return GetSubValue(sw[2:1], bram_doutb);
 
            default : return 8'b0;
        endcase
    endfunction    
    
    function byte GetSubValue(
        input [1:0] index,
        input int value
        );
        case (index)
            2'b00: return value[07:00];
            2'b01: return value[15:08];
            2'b10: return value[23:16];
            2'b11: return value[31:24];
        endcase        
    endfunction    
    
    assign displayValue = GetValue(ps_ja[3:0]);
    assign led          = sw[0] ? displayValue[3:0] : displayValue[7:4];
    
    PMod7SegmentDisplay_0 pmod7sd (
        .ScanClock ( scanClock    ),
        .Invert    ( btn[3]       ),
        .Value     ( displayValue ),
        .PModPort  ( ps_je        )
    );
    
endmodule
