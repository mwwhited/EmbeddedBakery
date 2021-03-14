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
        
    wire _keypadScanClock;     
    ClockDivider_0 clockDivider(
        .SystemClock(KeypadClock),
        .DividedClock(_keypadScanClock)
    );
        
    wire [3:0] _keypadValue;
    wire _keypadReleasedKey; 
    assign CurrentKeypadValue = _keypadValue;
        
    PModKypd_0 pmodKeypad(
        .ScanClock(_keypadScanClock),
        .RowPins(KeypadPmodPort[7:4]),
        .ColumnPins(KeypadPmodPort[3:0]),
        .Value(_keypadValue),
        .ReleasedKey(_keypadReleasedKey)
    );  
     
    typedef enum {
        RESET_REQUESTED = 1,
        INITIALIZING    = 2,
        INITIALIZED     = 3,
        IDLE            = 4,
        KEY_RELEASED    = 5,
        KEY_CAPTURE     = 6,
        KEY_WRITEN      = 7
    } WriterStates;     
    WriterStates writerState;
                
    // --- Setup FIFO ---
    wire       _keypadFifo_wr_clk           ;//: IN STD_LOGIC;
    reg        _keypadFifo_wr_en            ;//: IN STD_LOGIC;
    reg        _keypadFifo_wr_rst           ;//: IN STD_LOGIC;
    reg  [3:0] _keypadFifo_din              ;//: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    wire       _keypadFifo_wr_ack           ;//: OUT STD_LOGIC;
    wire       _keypadFifo_full             ;//: OUT STD_LOGIC;
    wire [3:0] _keypadFifo_wr_data_count    ;//: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

    reg        _keypadFifo_rd_clk           ;//: IN STD_LOGIC;
    reg        _keypadFifo_rd_en            ;//: IN STD_LOGIC;
    reg        _keypadFifo_rd_rst           ;//: IN STD_LOGIC;
    wire [3:0] _keypadFifo_dout             ;//: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    wire       _keypadFifo_valid            ;//: OUT STD_LOGIC;
    wire       _keypadFifo_empty            ;//: OUT STD_LOGIC;
    wire [3:0] _keypadFifo_rd_data_count    ;//: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

    assign _keypadFifo_wr_clk   = KeypadClock       ;
    assign _keypadFifo_rd_clk   = ReadClock         ;
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
        
    initial begin
        writerState <= RESET_REQUESTED; 
    end
          
    always @(posedge KeypadClock) begin
        if (Reset) begin
            writerState <= RESET_REQUESTED;
        end else begin              
            case (writerState)
                RESET_REQUESTED:    writerState <= __RESET();
                INITIALIZING:       writerState <= __INITIALIZING();
                INITIALIZED:        writerState <= __INITIALIZED();
                IDLE:               writerState <= __IDLE();
                KEY_RELEASED:       writerState <= __KEY_RELEASED();
                KEY_CAPTURE:        writerState <= __KEY_CAPTURE();
                KEY_WRITEN:         writerState <= __KEY_WRITEN();
            endcase
        end        
    end
    
    function WriterStates __RESET();        
        _keypadFifo_wr_rst <= 1'b1;      
        _keypadFifo_rd_rst <= 1'b1; 
        return INITIALIZING;        
    endfunction  
    
    function WriterStates __INITIALIZING();  
        return INITIALIZED;
    endfunction
            
    function WriterStates __INITIALIZED();       
        _keypadFifo_wr_rst <= 1'b0;      
        _keypadFifo_rd_rst <= 1'b0;  
        return IDLE;
    endfunction
    
    function WriterStates __IDLE();
        _keypadFifo_wr_en <= 1'b0;
        if (_keypadReleasedKey) begin
            return KEY_RELEASED;
        end     
        return IDLE;
    endfunction 
    
    function WriterStates __KEY_RELEASED();
        _keypadFifo_wr_en <= 1'b1;
        _keypadFifo_din   <= _keypadValue;
    endfunction
    
    function WriterStates __KEY_CAPTURE(); 
        if(_keypadFifo_wr_ack) begin
            return KEY_WRITEN;
        end else begin   
            return KEY_CAPTURE;
        end      
    endfunction  
    
    function WriterStates __KEY_WRITEN();  
        return IDLE;
    endfunction 
endmodule
