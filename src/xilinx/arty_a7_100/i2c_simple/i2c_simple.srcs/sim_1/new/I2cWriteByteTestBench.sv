`timescale 1ns / 1ps

module I2cWriteByteTestBench;

    reg SystemClock=0;
    reg Reset;
    reg Trigger;
    
    reg [6:0] Address;
    reg [7:0] Data;    
    
    wire SDA;
    wire SCL;
    wire busy;
    wire [4:0] state;
    wire [6:0] oAddress;
    wire [7:0] oData;
        
    I2cWriteByte #(
        .ClockingRatio(2) 
        ) underTest(
        .SDA(SDA),
        .SCL(SCL),
        .busy(busy),
        
        .SystemClock(SystemClock),
        .Reset(Reset),
        .Trigger(Trigger),
        
        .Address(Address),
        .Data(Data)
        
        ,.state(state)
        ,.tempAddress(oAddress)
        ,.tempData(oData)
    ) ;
        
    int testHarness = preload; 
    enum {
        preload=1,
        idle=2,
        reset=3,
        trigger=4,
        run=5,
        stop=6  
    } states;
     
    always #1 begin
        SystemClock = ~SystemClock;
        
        Reset <= 1'b0;
        Trigger <= 1'b0;
        
        if (!busy) begin
                
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
