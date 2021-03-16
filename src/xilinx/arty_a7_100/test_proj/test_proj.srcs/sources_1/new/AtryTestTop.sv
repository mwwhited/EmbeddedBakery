`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 08:14:17 AM
// Design Name: 
// Module Name: AtryTestTop
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

module AtryTestTop(
    input  CLK100MHZ   ,
    output [3:0] led_b , 
    output [3:0] led_g , 
    output [3:0] led_r , 
    output [3:0] led   , 
    input  [3:0] btn   ,
    input  [3:0] sw    ,
    inout  [7:0] jd    
);

    wire SystemClock         ; assign SystemClock = CLK100MHZ;
    wire DividedClock        ;

    ClockDivider #(
        .DividerCount ( 100000      )
    )clockDivider(
        .SystemClock  ( SystemClock  ),
        .DividedClock ( DividedClock )
    );
        
    wire       ScanClock     ; assign ScanClock = DividedClock  ;
    wire [3:0] ColumnPins    ; assign jd[3:0]   = ColumnPins    ;
    wire [3:0] RowPins       ; assign RowPins   = jd[7:4]       ;
    wire [3:0] Value         ; assign led       = Value         ;
    wire       ChangedValue  ; assign led_r[0]  = ChangedValue  ;
    wire       DetectedValue ; assign led_r[1]  = DetectedValue ;
    wire       ReleasedKey   ; assign led_r[2]  = ReleasedKey   ;
    wire       PressedKey    ; assign led_r[3]  = PressedKey    ;   
    wire       Debounced     ; assign led_b[3]  = Debounced     ;   

    wire [3:0] StatusRegisterOut [0:15];
    wire [63:0] StatusRegisterIn;
    assign StatusRegisterOut = {<<{StatusRegisterIn}};
    assign led_g = StatusRegisterOut[sw];
    
    RowColumnDecoder  #(
        .ColumnHeight  ( 4 ),
        .RowWidth      ( 4 )
    ) rowColumnDecoder (
    //PModKypd pModKypd (
        .ScanClock     ( ScanClock        ),
        .ColumnPins    ( ColumnPins       ),
        .RowPins       ( RowPins          ),
        .Value         ( Value            ),
        .ChangedValue  ( ChangedValue     ),
        .DetectedValue ( DetectedValue    ),
        .ReleasedKey   ( ReleasedKey      ),
        .PressedKey    ( PressedKey       ),     
        .StatusRegister( StatusRegisterIn )     
    );
    
    
endmodule
