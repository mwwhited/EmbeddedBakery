`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2021 03:43:58 PM
// Design Name: 
// Module Name: I2cWriteByte
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

module I2cWriteByte #(
    parameter ClockingRatio = 250,
    parameter ClockingRatioLength = 8
) (
    output SDA,
    output SCL,
    output Running,
    
    input SystemClock,
    input Reset,
    input Trigger,
    
    input [6:0] Address,
    input [7:0] Data
    
    /*
    ,output i2c_SDA
    ,output i2c_SCL
    ,output internalClock
    ,output next_Address
    ,output next_Data
    ,output [5:0] currentState
    ,output [7:0] targetAddress
    ,output [7:0] sendingData
    ,output [3:0] pointer  
    ,output clocked
    */
);   
    localparam START_BIT = 1'b0;
    localparam STOP_BIT = 1'b1;
    localparam ACK_BIT = 1'b1;
    
    enum {  
        IDLE             = 5'b00000,   
        START            = 5'b00001,
        SEND_ADDRESS     = 5'b00011,
        SEND_ADDRESS_ACK = 5'b00111,
        SEND_DATA        = 5'b01011,
        SEND_DATA_ACK    = 5'b01111,
        SEND_STOP        = 5'b11011,
        COMPLETE         = 5'b11100
    } states;
    
    reg i2c_SDA, i2c_SCL, internalClock;
    reg [5:0] currentState;
    reg next_Address, next_Data;
    reg [7:0] targetAddress;
    reg [7:0] sendingData;
    reg [3:0] pointer;  
    
    assign clocked = currentState[1];
    assign Running = currentState[0];
    
    assign SDA = Running ? (i2c_SDA ? 1'bZ : 1'b0) : 1'bZ;
    assign SCL = Running ? (i2c_SCL ? 1'bZ : 1'b0) : 1'bZ;
    
    ClockDivider #(
        .counterLength(ClockingRatioLength),
        .counterTarget(ClockingRatio/2)
    ) i2cClock
    (
        .clockIn(SystemClock),
        .clockOut(internalClock)
    );
    
    initial begin
        currentState <= IDLE;
        i2c_SDA <= 1'b1;
        i2c_SCL <= 1'b1;
    end
    
    always @(posedge Reset) begin
        currentState <= IDLE;
        i2c_SDA <= 1'b1;
        i2c_SCL <= 1'b1;
    end 
        
    always @(posedge Trigger) begin
        if (!Running) begin
            currentState <= START;
            targetAddress <= {Address, 1'b0};
            sendingData <= Data;
        end
    end
          
    always @(posedge internalClock) begin
        if (Running) begin 
            if (clocked) begin
                i2c_SCL <= 1'b1;
            end           
            case (currentState)              
                START : begin
                    i2c_SDA <= START_BIT;
                    pointer <= 0;
                    currentState <= SEND_ADDRESS;
                end
                
                SEND_ADDRESS : begin
                    i2c_SDA <= next_Address;
                    targetAddress <= targetAddress << 1;
                    pointer <= pointer + 1;
                    if (pointer == 7) begin
                        currentState <= SEND_ADDRESS_ACK;
                    end                    
                end
                
                SEND_ADDRESS_ACK : begin
                    i2c_SDA <= ACK_BIT;
                    //TODO: might want to consider reading ACK
                    currentState <= SEND_DATA;
                end
                
                SEND_DATA : begin
                    i2c_SDA <= next_Data;
                    sendingData <= sendingData << 1;
                    pointer <= pointer + 1;
                    if (pointer == 15) begin
                        currentState <= SEND_DATA_ACK;
                    end   
                end
                
                SEND_DATA_ACK : begin
                    i2c_SDA <= ACK_BIT;
                    //TODO: might want to consider reading ACK
                    currentState <= SEND_STOP;
                end
                
                SEND_STOP : begin
                    i2c_SDA <= STOP_BIT;
                    currentState <= COMPLETE;
                end
            endcase
        end
    end
        
    always @(negedge internalClock) begin
        if (Running & clocked) begin
            next_Address <= targetAddress[7];
            next_Data <= sendingData[7];
            i2c_SCL <= 1'b0; //~i2c_SCL;
        end
    end    
        
endmodule
