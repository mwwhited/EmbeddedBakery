
## Summary

This is a design build around the Arduino Micro Pro using the Atmeg32U4, an I2C 20x4 LCD, 2x 4x4 Keypads and a 3x4 Keypads

## Pinout 

| Row 1	  | D1	| RAW	| N/C      | 
| Row 0	  | D0	| GND	| LCD GND  |
| N/C	    | GND |	RST	| N/C      |
| N/C	    | GND |	VCC	| LCD VCC  |
| LCD SDA	| D2	|A3	  | Column 0 |
| LCD SCL	| D3	|A2	  | Column 1 |
| Row 2	  | D4	|A1	  | Column 2 |
| Row 3	  | D5	|A0	  | Column 3 |
| Row 4	  | D6	|D15	| Row 8    |
| Row 5	  | D7	|D14	| Row 9    |
| Row 6	  | D8	|D16	| Row 10   |
| Row 7	  | D9	|D10	| Row 11   |
