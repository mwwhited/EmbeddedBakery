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
    input           Reset,
          
    input           KeypadClock,  
    inout  [7:0]    KeypadPmodPort,
    output [3:0]    CurrentKeypadValue,
    
    input           ReadClock, 
    input           ReadEnable,  
    output [3:0]    ReadValue,
    
    output [63:0]   StatusRegister   
    );
        
    logic _keypadScanClock;     
    ClockDivider_0 clockDivider(
        .SystemClock(KeypadClock),
        .DividedClock(_keypadScanClock)
    );
        
    logic [3:0] _keypadValue;
    logic _keypadReleasedKey; 
    logic _keypadPressedKey; 
    assign CurrentKeypadValue = _keypadValue;
        
    PModKypd_0 pmodKeypad(
        .ScanClock      ( _keypadScanClock      ),
        .RowPins        ( KeypadPmodPort[7:4]   ),
        .ColumnPins     ( KeypadPmodPort[3:0]   ),
        .Value          ( _keypadValue          ),
        .ReleasedKey    ( _keypadReleasedKey    ),
        .PressedKey     ( _keypadPressedKey     )
    );  
 
    // --- Setup FIFO ---
    logic       _keypadFifo_reset_clock      ;
    
    logic       _keypadFifo_wr_clk           ;//: IN STD_LOGIC;
    logic       _keypadFifo_wr_en            ;//: IN STD_LOGIC;
    logic       _keypadFifo_wr_rst           ;//: IN STD_LOGIC;
    logic [3:0] _keypadFifo_din              ;//: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    logic       _keypadFifo_wr_ack           ;//: OUT STD_LOGIC;
    logic       _keypadFifo_full             ;//: OUT STD_LOGIC;
    logic [3:0] _keypadFifo_wr_data_count    ;//: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

    logic       _keypadFifo_rd_clk           ;//: IN STD_LOGIC;
    logic       _keypadFifo_rd_en            ;//: IN STD_LOGIC;
    logic       _keypadFifo_rd_rst           ;//: IN STD_LOGIC;
    logic [3:0] _keypadFifo_dout             ;//: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    logic       _keypadFifo_valid            ;//: OUT STD_LOGIC;
    logic       _keypadFifo_empty            ;//: OUT STD_LOGIC;
    logic [3:0] _keypadFifo_rd_data_count    ;//: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

    assign _keypadFifo_wr_clk   = 
        ( Reset && _keypadFifo_reset_clock) ||
        (~Reset && KeypadClock            );
    assign _keypadFifo_rd_clk   = 
        ( Reset && _keypadFifo_reset_clock) ||
        (~Reset && ReadClock              );
    assign _keypadFifo_rd_en    = ReadEnable        ;
    assign ReadValue            = _keypadFifo_dout  ;
                         
    KeypadInputFifo keypadFifo( 
        .wr_clk        ( _keypadFifo_wr_clk        ), 
        .wr_en         ( _keypadFifo_wr_en         ), 
        .wr_rst        ( _keypadFifo_wr_rst        ), 
        .din           ( _keypadFifo_din           ), 
        .wr_ack        ( _keypadFifo_wr_ack        ), 
        .full          ( _keypadFifo_full          ), 
        
        .wr_data_count ( _keypadFifo_wr_data_count ), 
        .rd_clk        ( _keypadFifo_rd_clk        ), 
        .rd_en         ( _keypadFifo_rd_en         ), 
        .rd_rst        ( _keypadFifo_rd_rst        ), 
        .dout          ( _keypadFifo_dout          ), 
        .valid         ( _keypadFifo_valid         ), 
        .empty         ( _keypadFifo_empty         ), 
        .rd_data_count ( _keypadFifo_rd_data_count )     
    ); 
    
    // Build out state machines
    
    assign StatusRegister = {
        writerState[3:0]            , //  :: 8   
        
        3'b0,
        _keypadFifo_wr_clk          , //  :: 7 
                 
        _keypadFifo_wr_en           ,           
        _keypadFifo_wr_rst          ,            
        _keypadFifo_wr_ack          ,          
        _keypadFifo_full            , //  :: 6
           
        _keypadFifo_din             , //4 :: 5            
        _keypadFifo_wr_data_count   , //4 :: 4
                      
        3'b0                        ,                  
        _keypadFifo_rd_clk          , //  :: 3  
          
        _keypadFifo_rd_en           ,           
        _keypadFifo_rd_rst          ,           
        _keypadFifo_valid           ,           
        _keypadFifo_empty           , //  :: 2
          
        _keypadFifo_dout            , //4 :: 1           
        _keypadFifo_rd_data_count     //4 :: 0
    };
        
    typedef enum {
        RESET_REQUESTED = 1,
        INITIALIZING    = 2,
        INITIALIZED     = 3,
        IDLE            = 4,
        KEY_PRESSED     = 5,
        KEY_CAPTURED    = 6,
        KEY_RELEASED    = 7
    } WriterStates;     
    WriterStates writerState;
                
        
    initial begin
        writerState <= RESET_REQUESTED; 
    end
          
    // always @(posedge KeypadClock) begin
    always @(posedge _keypadScanClock) begin
        if (Reset) begin
            writerState <= RESET_REQUESTED;
        end else begin              
            case (writerState)
                RESET_REQUESTED:    writerState <= __RESET        ( writerState, _keypadValue );
                INITIALIZING:       writerState <= __INITIALIZING ( writerState, _keypadValue );
                INITIALIZED:        writerState <= __INITIALIZED  ( writerState, _keypadValue );
                IDLE:               writerState <= __IDLE         ( writerState, _keypadValue );
                KEY_PRESSED:        writerState <= __KEY_PRESSED  ( writerState, _keypadValue );
                KEY_CAPTURED:       writerState <= __KEY_CAPTURED ( writerState, _keypadValue );
                KEY_RELEASED:       writerState <= __KEY_RELEASED ( writerState, _keypadValue );
                default:            writerState <= writerState.first;
            endcase
        end        
    end
    
    function WriterStates __RESET(
        input WriterStates request,
        input logic [3:0] value
    );        
        _keypadFifo_wr_rst <= 1'b1;      
        _keypadFifo_rd_rst <= 1'b1; 
        _resetCount        <= 0;
        _keypadFifo_din    <= 4'b0;     
        _keypadFifo_wr_en  <= 1'b0;      
        //_keypadFifo_rd_en  <= 1'b0; 
        return INITIALIZING;        
    endfunction  
    
    byte _resetCount;
    function WriterStates __INITIALIZING(
        input WriterStates request,
        input logic [3:0] value
    );
        _resetCount++;
        if (_resetCount == 6) begin
            return INITIALIZED;
        end else begin
            return INITIALIZING;
        end        
    endfunction
            
    function WriterStates __INITIALIZED(
        input WriterStates request,
        input logic [3:0] value
    );       
        _keypadFifo_wr_rst <= 1'b0;      
        _keypadFifo_rd_rst <= 1'b0;  
        return IDLE;
    endfunction
    
    function WriterStates __IDLE(
        input WriterStates request,
        input logic [3:0] value
    );
        _keypadFifo_wr_en <= 1'b0;
        
        if (_keypadPressedKey) begin
            _keypadFifo_din <= _keypadValue;
            return KEY_PRESSED;
        end
            
        return IDLE;
    endfunction 
    
    function WriterStates __KEY_PRESSED(
        input WriterStates request,
        input logic [3:0] value
    );
        _keypadFifo_wr_en <= 1'b0;
        return KEY_CAPTURED;
    endfunction
    
    function WriterStates __KEY_CAPTURED(
        input WriterStates request,
        input logic [3:0] value
    ); 
        _keypadFifo_wr_en  <= 1'b0;
        
        if (_keypadPressedKey) begin
            return KEY_PRESSED;
        end
        
        return KEY_RELEASED;            
    endfunction  
    
    function WriterStates __KEY_RELEASED(
        input WriterStates request,
        input logic [3:0] value
    );
        return request.first;
    endfunction
        
endmodule
