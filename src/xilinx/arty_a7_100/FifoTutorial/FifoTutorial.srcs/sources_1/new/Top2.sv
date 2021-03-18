`timescale 1ns / 1ps

module Top2(
    input        CLK100MHZ  ,
    input  [3:0] sw         ,
    input  [3:0] btn        ,
    output [3:0] led_b      ,
    output [3:0] led_r      ,
    output [3:0] led_g      ,
    output [3:0] led        ,
    inout  [7:0] ja
    );
    
    logic sw4;
    assign sw4  = ja[3];
    logic btn4;
    assign btn4 = ja[2];
    
    logic true  = 1'b1      ;
    logic false = 1'b0      ;
   
    logic       dividedClock ;   
    ClockDivider_0 clockDivider(
        .SystemClock(CLK100MHZ),
        .DividedClock(dividedClock)
    );
    
    logic Clock           ; assign Clock        = dividedClock ;
    logic ResetRequest    ; assign ResetRequest = btn[0]       ;
    logic ReadRequest     ; assign ReadRequest  = btn[1]       ;
    logic WriteRequest    ; assign WriteRequest = btn[2]       ;
    
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
    //  ===  Build out FIFO State Machine  === 
    typedef enum {
        ResetRequested  = 1,
        ResetProcessing = 2,
        ResetCompleted  = 3,
        
        WriteRequested  = 4,
        WriteProcessing = 5,
        WriteCompleted  = 6,
        
        ReadRequested   = 7,
        ReadProcessing  = 8,
        ReadCompleted   = 9,
        
        Error           = 10,
        Waiting         = 11
    } FifoStates;
    FifoStates currentState;
       
    
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
    // State Data
    
    logic _isResetting ;
    logic _Reset_Enable;
    logic _Read_Enable ;
    logic _WriteEnable ;
    
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
            
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
    // Build out FIFO    
        
    logic       rst           ; // : IN STD_LOGIC; 
    logic       wr_clk        ; // : IN STD_LOGIC;      
    logic       rd_clk        ; // : IN STD_LOGIC;               
    logic [3:0] din           ; // : IN STD_LOGIC_VECTOR(3 DOWNTO 0);    
    logic       wr_en         ; // : IN STD_LOGIC; 
    logic       rd_en         ; // : IN STD_LOGIC; 
    logic [3:0] dout          ; // : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
    logic       full          ; // : OUT STD_LOGIC;                    
    logic       wr_ack        ; // : OUT STD_LOGIC;                    
    logic       empty         ; // : OUT STD_LOGIC;                    
    logic       valid         ; // : OUT STD_LOGIC;                    
    logic       wr_rst_busy   ; // : OUT STD_LOGIC;                    
    logic       rd_rst_busy   ; // : OUT STD_LOGIC
         
    assign rst      = _Reset_Enable                    ;                    
    assign wr_clk   = Clock                            ;          
    assign rd_clk   = Clock                            ;          
    assign din      = sw                               ;  
    assign wr_en    = _WriteEnable;// && ~_Reset_Enable   ; 
    assign rd_en    = _Read_Enable;// && ~_Reset_Enable   ;
             
    assign led   = 
        btn4 ? { wr_en, rd_en, wr_rst_busy, rd_rst_busy}:dout                             ;
    assign led_g   = 
        btn4 ? {full, wr_ack, valid, empty}: 4'b0;
    assign led_r = (btn[3] || btn4) ? 4'b0 : currentState;    
    assign led_b = (btn[3] && ~btn4) ? 
        { ResetRequest, ReadRequest , WriteRequest, Clock } : 
        {_Reset_Enable, 2'b0, Clock };
              
    fifo_generator_0 fifo (
        .rst           (rst           ), // : IN STD_LOGIC;
        .wr_clk        (wr_clk        ), // : IN STD_LOGIC;
        .rd_clk        (rd_clk        ), // : IN STD_LOGIC;
        .din           (din           ), // : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        .wr_en         (wr_en         ), // : IN STD_LOGIC;
        .rd_en         (rd_en         ), // : IN STD_LOGIC;
        .dout          (dout          ), // : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        .full          (full          ), // : OUT STD_LOGIC;
        .wr_ack        (wr_ack        ), // : OUT STD_LOGIC;
        .empty         (empty         ), // : OUT STD_LOGIC;
        .valid         (valid         ), // : OUT STD_LOGIC;
        .wr_rst_busy   (wr_rst_busy   ), // : OUT STD_LOGIC;
        .rd_rst_busy   (rd_rst_busy   )  // : OUT STD_LOGIC
    );
    
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
        
    int errorCount;
    int maxErrorCount;
        
    initial begin
        __ResetRequested(currentState.first,0,0);
    end
        
    always @(posedge Clock) begin
        currentState <= GetNextState(.inputState(currentState), .inputCommand(btn), .inputData(sw));
    end

    function FifoStates GetNextState(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );
        case (inputState)
            ResetRequested  : return __ResetRequested  (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            ResetProcessing : return __ResetProcessing (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            ResetCompleted  : return __ResetCompleted  (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            
            WriteRequested  : return __WriteRequested  (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            WriteProcessing : return __WriteProcessing (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            WriteCompleted  : return __WriteCompleted  (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            
            ReadRequested   : return __ReadRequested   (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            ReadProcessing  : return __ReadProcessing  (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            ReadCompleted   : return __ReadCompleted   (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
                                                                                                        
            Waiting         : return __Waiting         (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            Error           : return __Error           (.inputState(inputState), .inputCommand(inputCommand), .inputData(inputData));
            
            default         : return ResetRequested;
        endcase
    endfunction
        
    int resetCount = 0;        
        
    function FifoStates __ResetRequested(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );
        //set clear stateful values
        _WriteEnable    <= false;
        _Read_Enable    <= false;
        errorCount      <= 0;
        resetCount++;
        
        //Spin with reset set until both read and write reset busy are set 
        _Reset_Enable   <= true;
        
        //if (resetCount < 6) return ResetRequested;
        
        if (wr_rst_busy && rd_rst_busy && empty) begin // does it also need to be empty?
            return ResetProcessing;    
        end
        return ResetRequested;
    endfunction
    
    function FifoStates __ResetProcessing(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );
        //Spin with reset cleared until read and write reset busy are cleared
        resetCount++;
        //if (resetCount > 60) return Error;

        _Reset_Enable <= false;
        if (~rd_rst_busy && ~wr_rst_busy) begin 
            return ResetCompleted;    
        end
        
        return ResetProcessing;
    endfunction
    
    function FifoStates __ResetCompleted(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );  
        resetCount <= 0;
        // Reset process complete wait for next command      
        return Waiting; 
    endfunction
    
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
    
    function FifoStates __WriteRequested (
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );  
        //ensure write enable is cleared    
        _WriteEnable <= false;
        if (full) begin
            // if full go to error
            return Error;
        end else if (wr_ack) begin 
            // if wr_ack spin
            return WriteRequested;
        end else begin 
            // else enable write and goto processing 
            _WriteEnable <= true;
            return WriteProcessing;
        end        
    endfunction
    
    function FifoStates __WriteProcessing(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );             
        //clear write enable
        _WriteEnable <= false;
        // this is doing a double write
        if (~wr_ack) begin //should only spin once.
            // if not wr_ack Spin
            return WriteProcessing;
        end else begin 
            // else goto write complete
            return WriteCompleted;
        end 
    endfunction
    function FifoStates __WriteCompleted(
        input FifoStates inputState,
        input [3:0] inputData,
        input [3:0] inputCommand
    );
        return Waiting;
    endfunction
    
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
    
    function FifoStates __ReadRequested(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );
        //ensure read enable is cleared
        _Read_Enable    <= false;
        
        if (empty) begin
            // if empty goto waiting... not an error
            return Waiting;
        end else if (valid) begin        
            // if valid spin
            return ReadRequested;
        end else begin
            // else enable read and go to processing
            _Read_Enable <= true;
            return ReadProcessing;
        end          
    endfunction
    
    function FifoStates __ReadProcessing(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );        
        //clear read enable
        _Read_Enable <= false;
         if (~valid) begin 
            // if not valid wait
            return ReadProcessing;
        end else begin 
            // else goto read complete 
            return ReadCompleted;
        end 
    endfunction
    
    function FifoStates __ReadCompleted(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    );
        return Waiting;
    endfunction
    
    // ==== ==== ==== ==== ==== ==== ==== ==== ==== 
        
    // ResetRequest = btn[0]
    // ReadRequest  = btn[1]
    // WriteRequest = btn[2]
        
    function FifoStates __Waiting(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    ); 
        if (inputCommand[0]) begin
            return ResetRequested;
        end else if (inputCommand[1]) begin
            return ReadRequested;
        end else if (inputCommand[2]) begin
            return WriteRequested;
        end
    
        return inputState;
    endfunction
    
    function FifoStates __Error(
        input FifoStates inputState,
        input [3:0] inputCommand,
        input [3:0] inputData
    ); 
        errorCount++;
        resetCount <= 0;
        if (errorCount == maxErrorCount) return ResetRequested;
        return Waiting;
    endfunction
    
endmodule
