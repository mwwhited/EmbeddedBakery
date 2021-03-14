`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/14/2021 10:15:57 AM
// Design Name: 
// Module Name: KeypadBuffered
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


module KeypadBuffered(
    input  SystemClock,  
    input  Reset,      
    inout  [7:0] KeypadPmodPort,
    
    output int StatusRegister,
    
    output [3:0] CurrentKeypadValue     
    );
        
    wire _keypadScanClock;     
    ClockDivider_0 clockDivider(
        .SystemClock(SystemClock),
        .DividedClock(_keypadScanClock)
    );
        
    wire [3:0] _keypadValue;
    wire _keypadChangedValue,
        _keypadDetectedValue,
        _keypadReleasedKey,
        _keypadPressedKey
        ; 
    assign CurrentKeypadValue = _keypadValue;
        
    PModKypd_0 pmodKeypad(
        .ScanClock(_keypadScanClock),
        .RowPins(KeypadPmodPort[7:4]),
        .ColumnPins(KeypadPmodPort[3:0]),
        .Value(_keypadValue),
        .ChangedValue(_keypadChangedValue),
        .DetectedValue(_keypadDetectedValue),
        .ReleasedKey(_keypadReleasedKey),
        .PressedKey(_keypadPressedKey)
    );  
     
    typedef enum {
        RESET_REQUESTED,
        INITIALIZING,
        INITIALIZED,
        IDLE,
        KEY_PRESSED,
        KEY_CAPTURE,
        KEY_WRITEN
    } WriterStates;     
    int writerState;
    // WriterStates writerState;
                
    // --- Setup FIFO ---
    reg _keypadFifo_rst; 
      
    reg _keypadFifo_wr_clk; 
    reg _keypadFifo_wr_en; 
    wire _keypadFifo_wr_ack; 
    wire _keypadFifo_wr_rst_busy;
    reg [3:0] _keypadFifo_din; 
    wire _keypadFifo_overflow; 
    wire _keypadFifo_full; 
    wire _keypadFifo_almost_full;
    
    reg _keypadFifo_rd_clk; 
    reg _keypadFifo_rd_en; 
    wire _keypadFifo_rd_rst_busy; 
    wire [3:0] _keypadFifo_dout; 
    wire _keypadFifo_valid; 
    wire _keypadFifo_underflow;       
    wire _keypadFifo_empty; 
    wire _keypadFifo_almost_empty;
    
    // Extensions 
    wire _keypadFifo_rst_clk; 
    assign _keypadFifo_rst_clk = _keypadFifo_rst ? SystemClock : 1'b0;  
    
    assign StatusRegister = {
        writerState,
        _keypadFifo_rst,
        
        _keypadFifo_wr_ack,
        _keypadFifo_overflow,
        _keypadFifo_full,
        _keypadFifo_almost_full,
        
        _keypadFifo_valid,
        _keypadFifo_underflow,
        _keypadFifo_empty,
        _keypadFifo_almost_empty
    };
    
    wire gated_keypadFifo_wr_clk;
    assign gated_keypadFifo_wr_clk =
        (~_keypadFifo_rst && _keypadFifo_wr_clk) || 
        ( _keypadFifo_rst && _keypadFifo_rst_clk)
        ;
    wire gated_keypadFifo_wr_en;
    assign gated_keypadFifo_wr_en =
        ~_keypadFifo_rst && _keypadFifo_wr_en
        ;
        
    wire gated_keypadFifo_rd_clk;
    assign gated_keypadFifo_rd_clk =
        (~_keypadFifo_rst && _keypadFifo_rd_clk) || 
        ( _keypadFifo_rst && _keypadFifo_rst_clk)
        ;
    wire gated_keypadFifo_rd_en;
    assign gated_keypadFifo_rd_en =
        ~_keypadFifo_rst && _keypadFifo_rd_en
        ;
                         
    KeypadInputFifo keypadFifo( 
        .rst(_keypadFifo_rst), 
        
        .wr_clk(gated_keypadFifo_wr_clk), 
        .wr_en(gated_keypadFifo_wr_en), 
        .wr_ack(_keypadFifo_wr_ack), 
        .wr_rst_busy(_keypadFifo_wr_rst_busy), 
        .din(_keypadFifo_din), 
        .overflow(_keypadFifo_overflow), 
        .full(_keypadFifo_full), 
        .almost_full(_keypadFifo_almost_full), 
        
        .rd_clk(gated_keypadFifo_rd_clk), 
        .rd_en(gated_keypadFifo_rd_en), 
        .rd_rst_busy(_keypadFifo_rd_rst_busy), 
        .dout(_keypadFifo_dout), 
        .valid(_keypadFifo_valid), 
        .underflow(_keypadFifo_underflow), 
        .empty(_keypadFifo_empty), 
        .almost_empty(_keypadFifo_almost_empty) 
    ); 
    
    // Build out state machines
    
    initial begin
        writerState <= RESET_REQUESTED; 
    end
    
    /*
    always @(posedge Reset) begin
        writerState <= RESET_REQUESTED;
    end   
    
    always @(negedge _keypadReleasedKey) begin
        if (writerState == IDLE) begin
            writerState <= KEY_PRESSED;
        end
    end
    */
      
    always @(posedge SystemClock) begin
        case (writerState)
            RESET_REQUESTED: __RESET();
            INITIALIZING: __INITIALIZING();
            INITIALIZED: writerState <= IDLE;
            KEY_PRESSED: writerState <= KEY_CAPTURE;
            KEY_CAPTURE: __KEY_CAPTURE();
            KEY_WRITEN: writerState <= IDLE;
        endcase
    end
    
    function void __RESET();
        writerState <= INITIALIZING;
        
        _keypadFifo_rst <= 1'b1;
        
        _keypadFifo_wr_clk <= 1'b0;
        _keypadFifo_wr_en <= 1'b0;
        _keypadFifo_din <= {$size(_keypadFifo_din){1'bZ}};
        
        _keypadFifo_rd_clk <= 1'b0;
        _keypadFifo_rd_en <= 1'b0;
        
    endfunction          
    function void __INITIALIZING(); 
        if (_keypadFifo_rst) begin
            if (~_keypadFifo_wr_rst_busy && ~_keypadFifo_rd_rst_busy) begin
                _keypadFifo_rst <= 1'b0;
                writerState <= INITIALIZED;
            end
        end
    endfunction
    
    function void __KEY_CAPTURE();
        //TODO: do fifo write here
        
        _keypadFifo_din <= _keypadValue;    
        
        writerState <= KEY_WRITEN;
    endfunction   
endmodule
