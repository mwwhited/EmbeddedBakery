`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 06:43:47 PM
// Design Name: 
// Module Name: FifoToBram
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


module FifoToBram #(
    parameter int                       DataWidth   ,
    parameter int                       AddressWidth,
    parameter [(AddressWidth - 1):0]    LowerBound  ,
    parameter [(AddressWidth - 1):0]    UpperBound  
) (
    input                               Clock            ,
    
    input                               SetAddressPointer,
    inout [(AddressWidth - 1):0]        AddressPointer   ,
         
    output                              FIFO_rd_clk      ,
    output reg                          FIFO_rd_en       ,
    input      [(DataWidth    - 1):0]   FIFO_dout        ,
    input                               FIFO_empty       ,
    input                               FIFO_valid       ,
    
    output                              RAM_clka         ,
    output reg                          RAM_wea          ,
    output     [(AddressWidth - 1):0]   RAM_addra        ,
    inout      [(DataWidth    - 1):0]   RAM_data        
    
    ,output int StatusRegister0   
    ,output int StatusRegister1   
    ,output int StatusRegister2   
);

    assign FIFO_rd_clk = Clock;
    assign RAM_clka    = Clock;
        
    typedef enum {
        Waiting             = 0,
        ReadFifoReady       = 1,
        ReadFifoInput       = 2,
        ReadFifoComplete    = 3,
        WriteMemoryReady    = 4,
        WriteMemoryOutput   = 5,
        WriteMemoryComplete = 6,
        WriteMemoryReadNext = 7
    } ReadStates;
    ReadStates currentState;    
    
    reg [(DataWidth    - 1):0] _readInput       ;
    reg [(AddressWidth - 1):0] _addressPointer  ;
    
    assign StatusRegister0 = {Clock, currentState};
    assign StatusRegister1 = _readInput;
    assign StatusRegister2 = _addressPointer;
    
    assign RAM_addra        = _addressPointer;
    assign RAM_data         = RAM_wea ? _readInput : {$size(RAM_data){1'bZ}};
    assign AddressPointer   = SetAddressPointer ? {$size(AddressPointer){1'bZ}} : _addressPointer;
    
    // ----------------------------------------------------------------
    
    initial begin
        currentState    <= currentState.first;
        _addressPointer <= LowerBound;
        RAM_wea         <= 1'b0;
        FIFO_rd_en      <= 1'b0;
    end
        
    always @(posedge Clock) begin
        currentState <= GetNextState(currentState);
    end
    
    function ReadStates GetNextState(
        input ReadStates state
        );
        case (state)
            Waiting             : return __Waiting              ();
            ReadFifoReady       : return __ReadFifoReady        ();
            ReadFifoInput       : return __ReadFifoInput        ();
            ReadFifoComplete    : return __ReadFifoComplete     ();
            WriteMemoryReady    : return __WriteMemoryReady     ();
            WriteMemoryOutput   : return __WriteMemoryOutput    ();
            WriteMemoryComplete : return __WriteMemoryComplete  ();
            WriteMemoryReadNext : return __WriteMemoryReadNext  ();
        endcase
    endfunction    
    
    function ReadStates __Waiting;
        RAM_wea     <= 1'b0;
        FIFO_rd_en  <= 1'b0;
        if (SetAddressPointer) begin
            _addressPointer <= __SetAddress(AddressPointer);
        end else begin
            if (~FIFO_empty) begin
                return ReadFifoReady;
            end else begin
                return Waiting;
            end
        end        
    endfunction
    
    function ReadStates __ReadFifoReady;
        if (~FIFO_valid) begin
            FIFO_rd_en <= 1'b1;
            return ReadFifoInput;
        end else begin
            return ReadFifoReady;
        end
    endfunction
        
    function ReadStates __ReadFifoInput;
        FIFO_rd_en <= 1'b0;
        if (FIFO_valid) begin
            _readInput <= FIFO_dout;
            return ReadFifoComplete;
        end else begin
            return ReadFifoInput;
        end
    endfunction
    
    function ReadStates __ReadFifoComplete;
        return WriteMemoryReady;
    endfunction
        
    function ReadStates __WriteMemoryReady;
        return WriteMemoryOutput;
    endfunction   
    
    function ReadStates __WriteMemoryOutput;
        RAM_wea <= 1'b1;
        return WriteMemoryComplete;
    endfunction    

    function ReadStates __WriteMemoryComplete;
        RAM_wea <= 1'b0;
        return WriteMemoryReadNext;
    endfunction   
    
    function ReadStates __WriteMemoryReadNext;
        _addressPointer <= __GetNextAddress(_addressPointer);
        return Waiting;
    endfunction    
    
    function [(AddressWidth - 1):0] __GetNextAddress(
        input [(AddressWidth - 1):0] address
        );
        if (address == UpperBound) begin
            return LowerBound;
        end else begin
            return address + 1;
        end
    endfunction 
    
    function [(AddressWidth - 1):0] __SetAddress(
        input [(AddressWidth - 1):0] address
        );
        if (address >= UpperBound) begin
            return LowerBound;
        end else if (address <= LowerBound) begin
            return UpperBound;
        end else begin
            return address;
        end
    endfunction     
    
endmodule
