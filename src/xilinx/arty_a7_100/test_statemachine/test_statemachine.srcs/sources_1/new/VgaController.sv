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
    
    parameter CharacterColumns = 60, 
    parameter CharacterLines = 33, 
    parameter CharacterPixelWidth = 8,
    parameter CharacterPixelHeight = 8,
    parameter CharacterWidth = 8,
    
    parameter RedWidth = 4,
    parameter GreenWidth = 4,
    parameter BlueWidth = 4,
    
    parameter PaletteWidth = 4
)(
    input ScanClock, //148.5 MHz for 1920x1080
    output reg [(RedWidth-1):0] Red,
    output reg [(GreenWidth-1):0] Green,
    output reg [(BlueWidth-1):0] Blue,
    
    output reg HorizontalSync,
    output reg VerticalSync,
    
    output reg LineComplete,
    output reg FrameComplete,
    output reg LineBlanking,
    output reg FrameBlanking,
    
    //TODO: consider making color bit depth and character width adjustable  
    input [(CharacterBufferWidth-1):0] CharacterBuffer [(CharacterColumns * CharacterLines)-1:0], // 15:12 BgC, 11:8 FgC, 7:0 Char
    input [(ColorWidth-1):0] ColorPalette [(ColorPaletteCount-1):0], // RGB
    input [(CharacterPixelHeight * CharacterPixelWidth - 1):0] CharacterMap [255:0] // CharacterPixelHeight x CharacterPixelWidth pixels
);
    parameter ColorPaletteCount = 2 ** PaletteWidth; 
    parameter CharacterBufferWidth = PaletteWidth + PaletteWidth + CharacterWidth;
    parameter ColorWidth = RedWidth + GreenWidth + BlueWidth;
    parameter XPixelSubDivision = FrameWidth / CharacterColumns / CharacterPixelWidth;
    parameter YPixelSubDivision = FrameHeight / CharacterLines / CharacterPixelHeight;    
    parameter HCounterWidth = $clog2(HMaxPixels);
    parameter VCounterWidth = $clog2(VMaxLines);
    
    reg [HCounterWidth:0] hCounter;
    reg [VCounterWidth:0] vCounter;
    
    initial begin
        hCounter <= 0;
        vCounter <= 0;
    end
    
    wire characterSubPixel;
    
    int realX, realY;
    int characterX, characterY;
    int characterIndex;
    int subPixel, subLine; 
       
    // Create adjusted pixels for Font size
    assign realX = hCounter / XPixelSubDivision;
    assign realY = vCounter / YPixelSubDivision;   
    
    assign characterX = realX / CharacterPixelWidth % CharacterColumns;
    assign characterY = realY / CharacterPixelHeight;    
    assign characterIndex = characterY * CharacterColumns + characterX;
    assign subPixel = realX % CharacterPixelWidth + 1;
    assign subLine = realY % CharacterPixelHeight + 1;

    // Get character from buffer
    wire [(PaletteWidth-1):0] foreground;
    wire [(PaletteWidth-1):0] background;
    wire [(CharacterBufferWidth-1):0] characterBufferSelected;
    wire [(CharacterWidth-1):0] characterSelected;
    assign characterBufferSelected = CharacterBuffer[characterIndex];
    assign background = characterBufferSelected >> (PaletteWidth + CharacterWidth);
    assign foreground = characterBufferSelected >> (CharacterWidth);
    assign characterSelected = characterBufferSelected;
    
     // Get charcter data from character map
    wire [((CharacterPixelHeight * CharacterPixelWidth) - 1):0] characterMapped;
    wire [(CharacterPixelWidth-1):0] characterMapLine;
    wire characterSubPixel;
    assign characterMapped = CharacterMap[characterSelected];
    assign characterMapLine = characterMapped >> (CharacterPixelHeight - subLine) * CharacterPixelWidth;
    assign characterSubPixel = characterMapLine >> (CharacterPixelWidth - subPixel);
    
    // Get actual colors from palette
    wire [(ColorWidth-1):0] color;
    assign color = ColorPalette[characterSubPixel ? foreground : background];     

    always @(posedge ScanClock) begin    
        
        Red <= 4'b0;
        Green <= 4'b0;
        Blue <= 4'b0;    
        
        HorizontalSync <= ~HPolarization;
        VerticalSync <= ~VPolarization;
        
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
                HorizontalSync <=  HPolarization;
            end  
            if (hCounter == HMaxPixels) begin
                hCounter <= -1; // Reset
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
                //HorizontalSync <= HPolarization;
                VerticalSync <= VPolarization;
            end   
            if (vCounter == VMaxLines) begin                
                vCounter <= -1; // reset
                FrameComplete <= ~FrameComplete;
            end       
        end 
         
        if (
            // Only try to render pixels that are not in the blanking period
            ~LineBlanking && ~FrameBlanking
            // Only render text pixels withing the printable area
            && CharacterColumns * CharacterPixelWidth * XPixelSubDivision > hCounter
            && CharacterLines * CharacterPixelHeight * YPixelSubDivision > vCounter
            ) begin        
            //Draw Pixels
            {Red, Green, Blue} <= color;
        end      
    end
    
endmodule
