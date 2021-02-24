`timescale 1ns / 1ps

module I2cWriteByteTestBench;

    wire SDA;
    wire SCL;
    wire Running;
    
    reg SystemClock = 0;
    reg Reset;
    reg Trigger;    
    reg [6:0] Address;
    reg [7:0] Data;
/*        
    wire i2c_SDA;
    wire i2c_SCL;
    wire internalClock;
    wire next_Address;
    wire next_Data;
    wire [5:0] currentState;
    wire [7:0] targetAddress;
    wire [7:0] sendingData;
    wire [3:0] pointer;  
    wire clocked;
*/        
    I2cWriteByte #(
        //.ClockingRatio(2) 
        ) underTest (
        .SDA(SDA),
        .SCL(SCL),
        .Running(Running),
        
        .SystemClock(SystemClock),
        .Reset(Reset),
        .Trigger(Trigger),
        .Address(Address),
        .Data(Data)
/*        
        ,.i2c_SDA(i2c_SDA)
        ,.i2c_SCL(i2c_SCL)
        ,.internalClock(internalClock)
        ,.next_Address(next_Address)
        ,.next_Data(next_Data)
        ,.currentState(currentState)
        ,.targetAddress(targetAddress)
        ,.sendingData(sendingData)
        ,.pointer(pointer)
*/        
    ) ;
        
    int testHarness = preload; 
    enum {
        preload=1,
        idle=2,
        reset=3,
        trigger=4,
        run=5,
        stop=6  
    } testStates;
     
    always #1 begin
        SystemClock = ~SystemClock;
        
        Reset <= 1'b0;
        Trigger <= 1'b0;
        
        if (!Running) begin
                
            case (testHarness) 
                preload : begin
                    Data <= 8'hZ;
                    Reset <= 1'bZ;
                    Trigger <= 1'bZ;
                    testHarness <= idle;
                end
                
                idle : begin
                    Address <= 7'h27;
                    Data <= 8'hDE;
                    testHarness <= reset;
                end
                
                reset : begin
                    Reset <= 1'b1;
                    testHarness <= trigger;
                end
                
                trigger : begin
                    Trigger <= 1'b1;
                    testHarness <= run;
                end
                
                run : begin
                    testHarness <= stop;
                end
                
                stop : begin
                    Data <= 8'hZ;
                    Reset <= 1'bZ;
                    Trigger <= 1'bZ;
                    testHarness <= preload;
                    $finish;
                end                
                
            endcase
        
        end
            
    end 
 
endmodule
