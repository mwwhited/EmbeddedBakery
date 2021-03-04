`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development 
// Engineer: Matthew Whited
// 
// Create Date: 03/03/2021 07:27:23 PM
// Design Name: 
// Module Name: VgaController
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


module TextModeController #(
    parameter FrameWidth = 1920,
    parameter FrameHeight = 1080, 
    
    parameter HfpPixels = 88,       //H front porch width (pixels)
    parameter HpwPixels = 44,       //H sync pulse width (pixels)
    parameter HMaxPixels = 2200,    //H total period (pixels)
    parameter HPolarization = 1,         
    
    parameter VfpLines = 4,         //V front porch width (lines)
    parameter VpwLines = 5,         //V sync pulse width (lines)
    parameter VMaxLines = 1125,     //V total period (lines)
    parameter VPolarization = 1,
    
    parameter CharacterRows = 80,
    parameter CharacterLines = 45,
    parameter CharacterPixelHeight = 8,
    parameter CharacterPixelWidth = 8,
    
    parameter HCounterWidth = $clog2(HMaxPixels),
    parameter VCounterWidth = $clog2(VMaxLines)
)(
    input ScanClock, //148.5 MHz for 1920x1080
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue,
    
    output reg HorizontalSync,
    output reg VerticalSync,
    
    output reg LineComplete,
    output reg FrameComplete,
    output reg LineBlanking,
    output reg FrameBlanking,
    
    input [15:0] CharacterBuffer [(CharacterRows * CharacterLines)-1:0], // 15:12 BgC, 11:8 FgC, 7:0 Char
    input [11:0] ColorPalette [15:0], // RRRR GGGG BBBB
    input [(CharacterPixelHeight * CharacterPixelWidth - 1):0] CharacterMap [255:0] // CharacterPixelHeight x CharacterPixelWidth pixels
);
    reg [HCounterWidth:0] hCounter = 0;
    reg [VCounterWidth:0] vCounter = 0;
    
    always @(posedge ScanClock) begin    
        Red <= 4'b0;
        Green <= 4'b0;
        Blue <= 4'b0;    
        
        HorizontalSync <= 1'b0;
        VerticalSync <= 1'b0;
        
        LineComplete <= 1'b0;
        FrameComplete <= 1'b0;
        LineBlanking <= 1'b0;
        FrameBlanking <= 1'b0;
    
        hCounter <= hCounter + 1;
        if (hCounter < FrameWidth) begin
            // Horizontal Display Period
        end else begin
            // Horizontal Blanking Period   
            LineBlanking <=  1'b1;    
                      
            if (hCounter > FrameWidth + HfpPixels && 
                hCounter < FrameWidth + HfpPixels + HpwPixels) begin
                HorizontalSync <=  1'b1;
            end  
            if (hCounter == HMaxPixels) begin
                hCounter <= -1;
                vCounter <= vCounter + 1;
                LineComplete <= ~LineComplete;
            end
        end
        
        if (vCounter < FrameHeight) begin
            // Vertical Display Period
        end else begin
            // Vertical Blanking Period   
            FrameBlanking <= 1'b1;        
            if (vCounter > FrameHeight + VfpLines && 
                vCounter < FrameHeight + VfpLines + VpwLines) begin
                HorizontalSync <=  1'b1;
            end   
            if (vCounter == VMaxLines) begin                
                vCounter <= -1;
                FrameComplete <= ~FrameComplete;
            end       
        end 
        
        if (~LineBlanking && ~FrameBlanking) begin
        
            {Red, Green, Blue} <= vCounter *  FrameWidth + hCounter;
        
            /*
            FrameWidth = 1920,
            FrameHeight = 1080, 
            CharacterRows = 80,
            CharacterLines = 45,
            CharacterPixelHeight = 8,
            CharacterPixelWidth = 8,
            */
            
            // X = hCounter
            // Y = vCounter
            
            //Draw Pixels
        end      
    end
    
endmodule
