`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/11/2021 07:53:08 AM
// Design Name: 
// Module Name: CharacterRomTestBench
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


module CharacterRomTestBench;
    reg Write = 0;
    reg Clock = 0;
    reg Reset = 0;
    
    reg [7:0] CharacterIndex = 0;
    reg [2:0] VerticalOffset = 0;
    
    wire [7:0] CharacterData;
    wire [7:0] result;
    
    CharacterRom crom(
        .Write(Write),
        .Reset(Reset),
        .Clock(Clock),
        .CharacterIndex(CharacterIndex),
        .VerticalOffset(VerticalOffset),
        .CharacterData(CharacterData)
    );
        
    bit process = 0;
    bit display = 0;
    int counter = 0;  
    int vertical = 0; 
    int character = 0;
    
    assign result = display ? CharacterData : 8'hz;
    assign CharacterData = Write ? {character, vertical[2:0]} : 8'hz;
    
    always #2 begin
        Clock = ~Clock;
    end 
        
    always @(posedge Clock) begin        
        counter <= counter + 1;
        display <= 0;
        
        Reset <= counter[7];
        
        if (~process) begin
            process <= 1;
        end else begin
            vertical <= vertical + 1;
            if (vertical == 8) begin
                process <= 0;
                vertical <= 0;
                character <= character + 1;
            end else 
                display <= 1;
        end

        if (character == 2) begin
            Write <= ~Write;
            character = 0;
        end
        
        VerticalOffset <=vertical;
        CharacterIndex <=character;        
        
        if (counter == 256) begin
            $finish;
            counter = 0;
        end  
    end 
    
endmodule
