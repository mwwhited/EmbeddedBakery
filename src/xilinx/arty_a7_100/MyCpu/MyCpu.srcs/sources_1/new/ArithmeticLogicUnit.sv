`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Developments
// Engineer: Matthew Whited
// 
// Create Date: 01/28/2021 09:09:23 AM
// Design Name: 
// Module Name: ArithmeticLogicUnit
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

typedef enum bit[7:0] {
    //1 Operand
    OpIncerment,
    OpDecerment,
    OpASL,
    OpASR,
    OpLSL,
    OpLSR,
    OpRL,
    OpRR,
    OpRLwC,
    OpRRwC,
    OpADDwC,
    OpSUBwC,
    OpEndianSwap,

    OpReserved0,
    OpReserved1,
    OpReserved2,    
    
    //2 Operand
    OpADD,
    OpSUB,
    OpMultiple,
    OpDivide,
    OpXOR,
    OpAND,
    OpNOT,
    OpNOR,
    OpXNOR,
    OpNAND,
    OpOR,
    OpModulus,    
    
    OpReserved3,
    OpReserved4,
    OpReserved5,
    OpReserved6 
    
} AluControl;

module ArithmeticLogicUnit(
    input [15:0] A,
    input [15:0] B,
    input [7:0] Control,
    output reg [15:0] Result,
    output reg [15:0] Status
    );
    
    AluControl aluCtrl;
    
    initial 
    begin
        $cast(aluCtrl, Control);
        
        case (aluCtrl)
            OpADD:
                Result = A + B;
            default: 
                Result = 0;
            
//ASL,
// https://stackoverflow.com/questions/7543592/verilog-barrel-shifter   
// https://www.chipverify.com/systemverilog/systemverilog-enumeration   
// https://www.chipverify.com/verilog/verilog-case-statement
// https://www.chipverify.com/verilog/verilog-for-loop   
// https://www.chipverify.com/verilog/verilog-functions
// https://www.chipverify.com/verilog/verilog-task
           
//    ASR,
//    LSL,
//    LSR,
//    RL,
//    RR,
//    RLwC,
//    RRwC,
//    ADDwC,
//    SUBwC,
//    EndianSwap,
//    //2 Operand
//    ADD,
//    SUB,
//    Multiple,
//    Divide,
//    XOR,
//    AND,
//    NOT,
//    NOR,
//    XNOR,
//    NAND,
//    OR,
//    Modulus,    

        endcase
    end
    
//    function sum(a, b);
//        sum = a + b;
//    endfunction

    
endmodule
