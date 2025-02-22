EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "SG-Machine Adapter"
Date "2018-01-14"
Rev ""
Comp "Out-of-Band Development, LLC"
Comment1 "Matthew Whited"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SG_Power-rescue:DIN_5 SG-Machine
U 1 1 5A5AADA1
P 3700 3550
F 0 "SG-Machine" H 3700 3200 50  0000 C CNN
F 1 "DIN_5" H 3700 3125 50  0000 C CNN
F 2 "" H 3700 3550 50  0001 C CNN
F 3 "" H 3700 3550 50  0001 C CNN
	1    3700 3550
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:7805 U?
U 1 1 5A5AAEAC
P 6900 3400
F 0 "U?" H 7050 3204 50  0000 C CNN
F 1 "7805" H 6900 3600 50  0000 C CNN
F 2 "" H 6900 3400 50  0001 C CNN
F 3 "" H 6900 3400 50  0001 C CNN
	1    6900 3400
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:CP1 C?
U 1 1 5A5AAF33
P 7150 3850
F 0 "C?" H 7175 3950 50  0000 L CNN
F 1 "CP1" H 7175 3750 50  0000 L CNN
F 2 "" H 7150 3850 50  0001 C CNN
F 3 "" H 7150 3850 50  0001 C CNN
	1    7150 3850
	0    1    1    0   
$EndComp
$Comp
L SG_Power-rescue:RJ45 Breakout
U 1 1 5A5AAF9E
P 3750 1850
F 0 "Breakout" H 3950 2350 50  0000 C CNN
F 1 "RJ45" H 3600 2350 50  0000 C CNN
F 2 "" H 3750 1850 50  0001 C CNN
F 3 "" H 3750 1850 50  0001 C CNN
	1    3750 1850
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:RJ45 Breakout
U 1 1 5A5AB03B
P 6550 1850
F 0 "Breakout" H 6750 2350 50  0000 C CNN
F 1 "RJ45" H 6400 2350 50  0000 C CNN
F 2 "" H 6550 1850 50  0001 C CNN
F 3 "" H 6550 1850 50  0001 C CNN
	1    6550 1850
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:CONN_01X06 J1
U 1 1 5A5AB0D8
P 8100 2100
F 0 "J1" H 8100 2450 50  0000 C CNN
F 1 "Sain Smart 4 Relay" V 8200 2100 50  0000 C CNN
F 2 "" H 8100 2100 50  0001 C CNN
F 3 "" H 8100 2100 50  0001 C CNN
	1    8100 2100
	0    -1   -1   0   
$EndComp
$Comp
L SG_Power-rescue:GND #PWR?
U 1 1 5A5AB4BD
P 4350 4050
F 0 "#PWR?" H 4350 3800 50  0001 C CNN
F 1 "GND" H 4350 3900 50  0000 C CNN
F 2 "" H 4350 4050 50  0001 C CNN
F 3 "" H 4350 4050 50  0001 C CNN
	1    4350 4050
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:GND #PWR?
U 1 1 5A5ABD0D
P 6900 4000
F 0 "#PWR?" H 6900 3750 50  0001 C CNN
F 1 "GND" H 6900 3850 50  0000 C CNN
F 2 "" H 6900 4000 50  0001 C CNN
F 3 "" H 6900 4000 50  0001 C CNN
	1    6900 4000
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:+12V #PWR?
U 1 1 5A5AC31A
P 3550 2850
F 0 "#PWR?" H 3550 2700 50  0001 C CNN
F 1 "+12V" H 3550 2990 50  0000 C CNN
F 2 "" H 3550 2850 50  0001 C CNN
F 3 "" H 3550 2850 50  0001 C CNN
	1    3550 2850
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:+12V #PWR?
U 1 1 5A5AC33A
P 6350 2850
F 0 "#PWR?" H 6350 2700 50  0001 C CNN
F 1 "+12V" H 6350 2990 50  0000 C CNN
F 2 "" H 6350 2850 50  0001 C CNN
F 3 "" H 6350 2850 50  0001 C CNN
	1    6350 2850
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:+5V #PWR?
U 1 1 5A5AC35A
P 8450 2850
F 0 "#PWR?" H 8450 2700 50  0001 C CNN
F 1 "+5V" H 8450 2990 50  0000 C CNN
F 2 "" H 8450 2850 50  0001 C CNN
F 3 "" H 8450 2850 50  0001 C CNN
	1    8450 2850
	1    0    0    -1  
$EndComp
Text Label 3200 3100 1    60   ~ 0
White
Text Label 3300 3100 1    60   ~ 0
Black
Text Label 3700 3050 1    60   ~ 0
Red
Text Label 4350 3100 1    60   ~ 0
Green
Text Label 4100 3100 1    60   ~ 0
Yellow
Text Label 4250 3100 1    60   ~ 0
Blue
Text Label 7100 2600 0    60   ~ 0
Ground
Text Label 7100 2400 0    60   ~ 0
Left-White
Text Label 7100 2500 0    60   ~ 0
Left-Red
Text Label 7100 2700 0    60   ~ 0
Right-Green
Text Label 7100 2800 0    60   ~ 0
Right-White
Text Label 7400 3350 0    60   ~ 0
Vcc
Text Label 6500 3150 1    60   ~ 0
Vss
$Comp
L SG_Power-rescue:DB9_FEMALE RS-422(UT-890A)
U 1 1 5A5B9454
P 5500 5450
F 0 "RS-422(UT-890A)" H 5500 6000 50  0000 C CNN
F 1 "DB9_FEMALE" H 5500 4875 50  0000 C CNN
F 2 "" H 5500 5450 50  0001 C CNN
F 3 "" H 5500 5450 50  0001 C CNN
	1    5500 5450
	1    0    0    -1  
$EndComp
$Comp
L SG_Power-rescue:DB9_MALE SG-Machine
U 1 1 5A5B9561
P 3700 5450
F 0 "SG-Machine" H 3700 6000 50  0000 C CNN
F 1 "DB9_MALE" H 3700 4875 50  0000 C CNN
F 2 "" H 3700 5450 50  0001 C CNN
F 3 "" H 3700 5450 50  0001 C CNN
	1    3700 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 2300 3500 2400
Wire Wire Line
	3600 2500 3600 2300
Wire Wire Line
	3700 3150 3700 2850
Wire Wire Line
	3700 3850 4350 3850
Wire Wire Line
	4350 2600 4350 3850
Wire Wire Line
	3800 2300 3800 2600
Wire Wire Line
	3800 2600 4350 2600
Connection ~ 4350 3850
Wire Wire Line
	4100 3550 4250 3550
Wire Wire Line
	4250 3550 4250 2400
Wire Wire Line
	4250 2400 4000 2400
Wire Wire Line
	4000 2400 4000 2300
Wire Wire Line
	4100 3350 4100 2500
Wire Wire Line
	4100 2500 3900 2500
Wire Wire Line
	3900 2500 3900 2300
Wire Wire Line
	3300 3350 3300 2500
Wire Wire Line
	3300 2500 3600 2500
Wire Wire Line
	3500 2400 3200 2400
Wire Wire Line
	3200 2400 3200 3550
Wire Wire Line
	3200 3550 3300 3550
Wire Wire Line
	6900 3650 6900 3700
Wire Wire Line
	7000 3850 6900 3850
Connection ~ 6900 3850
Wire Wire Line
	7300 3850 7300 3350
Wire Wire Line
	6300 2300 6300 2400
Wire Wire Line
	6300 2400 7950 2400
Wire Wire Line
	7950 2400 7950 2300
Wire Wire Line
	6400 2300 6400 2500
Wire Wire Line
	6400 2500 8050 2500
Wire Wire Line
	8050 2500 8050 2300
Wire Wire Line
	6500 2300 6500 2850
Wire Wire Line
	6600 2300 6600 2600
Wire Wire Line
	6600 2600 7850 2600
Wire Wire Line
	7850 2300 7850 2600
Wire Wire Line
	7300 3350 8350 3350
Wire Wire Line
	8350 3350 8350 2850
Wire Wire Line
	7850 3700 6900 3700
Connection ~ 6900 3700
Connection ~ 7850 2600
Wire Wire Line
	6700 2300 6700 2700
Wire Wire Line
	6700 2700 8150 2700
Wire Wire Line
	8150 2700 8150 2300
Wire Wire Line
	6800 2300 6800 2800
Wire Wire Line
	6800 2800 8250 2800
Wire Wire Line
	8250 2800 8250 2300
Wire Wire Line
	3550 2850 3700 2850
Connection ~ 3700 2850
Wire Wire Line
	6350 2850 6500 2850
Connection ~ 6500 2850
Wire Wire Line
	8450 2850 8350 2850
Connection ~ 8350 2850
Text Notes 2250 3850 0    60   ~ 0
Din5 (SG-Machine)\n1) Left-White\n2) 12v+\n3) Right-White\n4) Red\n5) Green
Text Notes 7900 1900 0    60   ~ 0
Sain Smart 4 Relay\n1) Ground\n2) IN1\n3) IN2\n4) IN3\n5) IN4\n6) 5V+
Text Notes 6200 5850 0    60   ~ 0
RS-422 (UT-890A)\n1) T/R+ (Brown)\n2) T/R- (Black)\n3) Rxd+ (Orange)\n4) Rxd- (Red)\n5) Gnd (Green)\n6) Vcc (N/C)\n7) N/C\n8) N/C\n9) N/C
Text Notes 2250 5850 0    60   ~ 0
SG-Machine\n1) Input - (Black)\n2) Input+ (Brown)\n3) Output- (Red)\n4) Output+ (Orange)\n5) 12V (Yellow)\n6) Gnd (Blue)\n7) Gnd (N/C)\n8) Gnd (Green)\n9) 12V (White)
Wire Wire Line
	4000 5050 5200 5250
Wire Wire Line
	4000 5250 5200 5050
Wire Wire Line
	4000 5450 5200 5650
Wire Wire Line
	4000 5650 5200 5450
Wire Wire Line
	4000 5550 5200 5850
Wire Wire Line
	4350 3850 4350 4050
Wire Wire Line
	6900 3850 6900 4000
Wire Wire Line
	6900 3700 6900 3850
Wire Wire Line
	7850 2600 7850 3700
Wire Wire Line
	3700 2850 3700 2300
Wire Wire Line
	6500 2850 6500 3350
Wire Wire Line
	8350 2850 8350 2300
$EndSCHEMATC
