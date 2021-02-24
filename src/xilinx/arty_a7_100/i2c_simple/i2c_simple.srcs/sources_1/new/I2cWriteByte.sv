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
    parameter ClockingRatio = 250
) (
    output reg SDA,
    output reg SCL,
    output busy,
    
    input SystemClock,
    input Reset,
    input Trigger,
    
    input [6:0] Address,
    input [7:0] Data,
    
    output [4:0] state,
    output [6:0] tempAddress,
    output [7:0] tempData
);
    
    enum {
        IDLE=0,
        SEND_ADDRESS=1,
        SEND_ADDRESS_ACK=2,
        SEND_DATA=3,
        SEND_DATA_ACK=4,
        SEND_STOP=5
    } states;

    reg [16:00] count = 0;    
    reg adjustedClock = 0;
    reg [4:0] bytePostion = 0; 
    reg enabled = 0;
    
    reg [4:0] state;
    reg [7:0] internalAddress;
    reg [7:0] internalData;
    
    assign tempAddress = internalAddress[7:1];
    assign tempData = internalData;
    assign busy = enabled;
    
    initial begin
        count <= 0;
        state <= IDLE;
        enabled <= 0;
        SDA <= 1;
        SCL <= 1;        
    end
            
    always @(posedge SystemClock) begin
        if (Reset) begin
            state <= IDLE;
            enabled <= 0;
            SDA <= 1;
            SCL <= 1;
        end else if (Trigger & enabled != 1) begin
            enabled <= 1;
            count <= 0;
            internalAddress <= {Address, 1'b0};
            internalData <= Data;
        end else if (enabled) begin
            count <= count + 1;
            
            if (count >= (ClockingRatio >> 1)) begin
                count <= 0;
                adjustedClock <= ~adjustedClock;
                SCL <= adjustedClock;
                
                case (state)
                    IDLE: begin
                         SDA <= 0;
                         state <= SEND_ADDRESS;
                         bytePostion <= 0;
                    end
                    
                    SEND_ADDRESS : begin                        
                        SDA <= internalAddress[7];
                        internalAddress <= internalAddress << 1;
                        bytePostion <= bytePostion + 1;
                        if (bytePostion >= 8) begin
                            state <= SEND_ADDRESS_ACK;
                        end                        
                    end
                    
                    SEND_ADDRESS_ACK : begin
                        SDA <= 1;
                        state <= SEND_DATA; 
                        bytePostion <= 0;            
                    end
                    
                    SEND_DATA : begin   
                        SDA <= internalData[7];
                        internalData <= internalData << 1;
                        bytePostion <= bytePostion + 1;
                        if (bytePostion >= 8) begin
                            state <= SEND_DATA_ACK;
                        end                        
                    end
                    
                    SEND_DATA_ACK : begin
                        SDA <= 1;
                        state <= SEND_STOP;             
                    end
                    
                    SEND_STOP : begin
                        SDA <= 1;
                        state <= IDLE; 
                        enabled <= 0;            
                    end
                endcase 
            end
        end
    end
    
    /*
    always @(negedge adjustedClock) begin 
        SCL <= ~SCL;
    end
    */
    
endmodule
