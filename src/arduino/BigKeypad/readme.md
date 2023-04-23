# Big Pad

## Summary

This is a design build around the Arduino Nano, and I2C 20x4 LCD 2x 4x4 Keypads and a 3x4 Keypads

## Pinouts

| Pin   | Use                    |
| ----- | ---------------------- |
| D7    | Keypad 4x4 Right:  R4  |   
| D6    | Keypad 4x4 Right:  R3  |   
| D5    | Keypad 4x4 Right:  R2  |   
| D4    | Keypad 4x4 Right:  R1  |   
| D3    | Keypad 4x4 Middle: R4  |   
| D2    | Keypad 4x4 Middle: R3  |   
| A7/21 | Keypad 4x4 Middle: R2  |   
| A6/20 | Keypad 4x4 Middle: R1  |   
| A3    | Keypad 3x4 Left:   R4  |   
| A2    | Keypad 3x4 Left:   R3  |   
| A1    | Keypad 3x4 Left:   R2  |   
| A0    | Keypad 3x4 Left:   R1  | 
| D12   | Keypads:           C1  |
| D11   | Keypads:           C2  |
| D10   | Keypads:           C3  |
| D9    | Keypads:           C4  |
| XX    | I2C SCL                |
| XX    | I2C SDA                |

## Key Codes

### Simple (value - 128)

Keypad		   2   2	 2 	 1	 1	 1	 1	0	 0	 0	0
Column		   1	 2	 3   1	 2	 3	 0	1	 2	 3	0
Row	      7	39	43	47	23	27	31	19	7	11	15	3
	        6	38	42	46	22	26	30	18	6	10	14	2
	        5	37	41	45	21	25	29	17	5	 9	13	1
	        4	36	40	44	20	24	28	16	4	 8	12	0

### Actual

Keypad	 2	 2	 2	 1	 1	 1	 1	 0	 0	 0	 0
Column	 1	 2	 3	 1	 2	 3	 0	 1	 2	 3	 0
Row	  7	A7	AB	AF	97	9B	9F	93	87	8B	8F	83
	    6	A6	AA	AE	96	9A	9E	92	86	8A	8E	82
	    5	A5	A9	AD	95	99	9D	91	85	89	8D	81
	    4	A4	A8	AC	94	98	9C	90	84	88	8C	80

## Notes and References

