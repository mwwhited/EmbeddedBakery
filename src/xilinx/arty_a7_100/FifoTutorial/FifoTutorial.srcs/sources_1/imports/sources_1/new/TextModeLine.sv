`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 05:18:13 PM
// Design Name: 
// Module Name: TextModeLine
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

module TextModeLine #(
    parameter CharactersPerLine = 60,
    parameter CharacterIndexBits = 8,
    parameter CharacterMaskWidth = 8,
    parameter CharacterMaskHeight = 8,
    parameter ColorIndexWidth = 4, 
    parameter ColorBits = 12
) (
    input Clock,        // Constant
    input [(CharacterDataWidth - 1):0] Characters [(CharactersPerLine - 1):0],  // Text Line Buffer
    
    input ResetPixel,   // Async ResetPixel
    input Enable,       // High when Active
    
    output CharacterLineCompletePulse,
    output CharacterPixelLineCompletePulse,
    
    output [(ColumnIndexWidth - 1):0] CharacterColumnIndex,    
    output [(CharacterPixelWidth - 1):0] CharacterPixelX,
    output [(CharacterPixelHeight - 1):0] CharacterPixelY,
    
    output [(ColorBits - 1):0] PixelColor
);
    parameter CharacterDataWidth = ColorIndexWidth + ColorIndexWidth + CharacterIndexBits;
    parameter ColumnIndexWidth = $clog2(CharactersPerLine) + 1;
    parameter CharacterPixelWidth = $clog2(CharacterMaskWidth);
    parameter CharacterPixelHeight = $clog2(CharacterMaskHeight);
    parameter CharacterPixelTotal = CharacterMaskWidth * CharactersPerLine;
    parameter CharacterMaskHeightBits = $clog2(CharacterMaskHeight);
    
    int _counter = 0;
    
    reg _characterLineCompletePulse;
    reg _characterPixelLineCompletePulse;
    
    reg [(ColumnIndexWidth - 1):0] _characterColumnIndex;    
    int _characterPixelX;
    int _characterPixelY;
    
    reg [(ColorBits - 1):0] _pixelColor;
    
    assign CharacterLineCompletePulse       = _characterLineCompletePulse      ;
    assign CharacterPixelLineCompletePulse  = _characterPixelLineCompletePulse ;
    assign CharacterColumnIndex             = _characterColumnIndex            ;
    assign CharacterPixelX                  = _characterPixelX                 ;
    assign CharacterPixelY                  = _characterPixelY                 ;
    assign PixelColor                       = _pixelColor                      ;
    
    function void _resetPixel();
        _characterLineCompletePulse         <= 1'b0                            ;
        _characterPixelLineCompletePulse    <= 1'b0                            ;
        _characterColumnIndex               <= {ColumnIndexWidth{1'b0}}        ;
        _characterPixelX                    <= {CharacterPixelWidth{1'b0}}     ;
        _characterPixelY                    <= {CharacterPixelHeight{1'b0}}    ;
        _pixelColor                         <= {ColorBits{1'b0}}               ;
        _counter                            <= 0                               ;
    endfunction
    
    initial _resetPixel();    
    always @(posedge ResetPixel) _resetPixel();
    
    wire [(CharacterDataWidth - 1):0] _characterData;
    assign _characterData = Characters[_characterColumnIndex];
    
    wire [(CharacterMaskWidth - 1):0] _characterMap;
    wire [(CharacterIndexBits - 1):0] _characterIndex;
    assign _characterIndex = _characterData[(CharacterMaskWidth - 1):0];
    
    wire [(ColorIndexWidth - 1):0] _backgroundColor;
    wire [(ColorIndexWidth - 1):0] _foregroundColor;
    assign _backgroundColor = _characterData[(ColorIndexWidth - 1 + (ColorIndexWidth + CharacterMaskWidth)):0 + (ColorIndexWidth + CharacterMaskWidth)];
    assign _foregroundColor = _characterData[(ColorIndexWidth - 1 + (CharacterMaskWidth)):0 + (CharacterMaskWidth)];
         
    wire [(CharacterIndexBits - 1):0] __characterIndex;
    wire [(CharacterMaskHeightBits - 1):0] __verticalOffset;    
    wire [(CharacterMaskWidth - 1):0] __characterData;
    assign __characterIndex = _characterIndex;
    assign __verticalOffset = _characterPixelY[(CharacterMaskHeightBits - 1):0];
    assign __characterData = _characterMap;
    
    CharacterRom #(    
        .CharacterIndexBits(CharacterIndexBits),
        .CharacterMaskWidth(CharacterMaskWidth),
        .CharacterMaskHeight(CharacterMaskHeight)
    ) characterRom (
        .CharacterIndex(__characterIndex),
        .VerticalOffset(__verticalOffset),
        .CharacterData(__characterData)
    );
            
    wire _characterPixel [(CharacterMaskWidth - 1):0];
    assign _characterPixel = {<<{_characterMap}};
    
    wire _activePixel;
    assign _activePixel = _characterPixel[_characterPixelX];    
    wire [(ColorBits - 1):0] _currentPixelColor;
        
    ColorPaletteRom  #(    
        .ColorIndexWidth(ColorIndexWidth),
        .ColorBits(ColorBits)
    ) colorPaletteRom    
    (
        .ColorIndex(_activePixel ? _foregroundColor : _backgroundColor),
        .ColorValue(_currentPixelColor)
    ); 
    
    always @(posedge Clock) begin
        if (Enable) begin            
            _characterLineCompletePulse <= 1'b0;
            _characterPixelLineCompletePulse <= 1'b0;
            
            _characterPixelX <= _characterPixelX + 1;            
            _pixelColor <= _currentPixelColor;
            
            if ((_counter % CharacterMaskWidth) == 0) begin
                _characterPixelX <= 0;
            end
            
            if ((_counter % CharacterPixelTotal) == 0) begin
                _characterPixelY <= _characterPixelY + 1;  
                _characterPixelX <= 0;
                _characterPixelLineCompletePulse <= 1'b1;             
            end
            
            if (_characterPixelY == CharacterMaskHeight) begin
                _characterPixelY <= 0;               
                _characterLineCompletePulse <= 1'b1;
            end
            
            _counter <= _counter + 1;
        end
    end

endmodule
