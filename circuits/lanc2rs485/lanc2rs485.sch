EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "LanC to RS-485 Bridge"
Date ""
Rev ""
Comp "Out-of-Band Development, LLC"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Matthew Whited"
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v2.x A?
U 1 1 5C5B9F54
P 4750 4450
F 0 "A?" V 4704 3410 50  0000 R CNN
F 1 "Arduino_Nano_v2.x" V 4795 3410 50  0000 R CNN
F 2 "Module:Arduino_Nano" H 4900 3500 50  0001 L CNN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 4750 3450 50  0001 C CNN
	1    4750 4450
	0    1    1    0   
$EndComp
$Comp
L Connector:AudioJack3 J?
U 1 1 5C5B9FF0
P 7250 1350
F 0 "J?" H 6970 1283 50  0000 R CNN
F 1 "AudioJack3" H 6970 1374 50  0000 R CNN
F 2 "" H 7250 1350 50  0001 C CNN
F 3 "~" H 7250 1350 50  0001 C CNN
	1    7250 1350
	-1   0    0    1   
$EndComp
$Comp
L Transistor_BJT:PN2222A Q?
U 1 1 5C5BA0F8
P 5950 2850
F 0 "Q?" H 6141 2896 50  0000 L CNN
F 1 "PN2222A" H 6141 2805 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6150 2775 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 5950 2850 50  0001 L CNN
	1    5950 2850
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N47xxA D?
U 1 1 5C5BA184
P 4100 2800
F 0 "D?" H 4100 3016 50  0000 C CNN
F 1 "1N47xxA" H 4100 2925 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 4100 2625 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85816/1n4728a.pdf" H 4100 2800 50  0001 C CNN
	1    4100 2800
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5C5BA233
P 5200 2850
F 0 "R?" H 5268 2896 50  0000 L CNN
F 1 "R_US" H 5268 2805 50  0000 L CNN
F 2 "" V 5240 2840 50  0001 C CNN
F 3 "~" H 5200 2850 50  0001 C CNN
	1    5200 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5C5BA273
P 6050 2050
F 0 "R?" H 6118 2096 50  0000 L CNN
F 1 "R_US" H 6118 2005 50  0000 L CNN
F 2 "" V 6090 2040 50  0001 C CNN
F 3 "~" H 6050 2050 50  0001 C CNN
	1    6050 2050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5C5BA2C9
P 4100 1350
F 0 "#PWR?" H 4100 1200 50  0001 C CNN
F 1 "VCC" H 4117 1523 50  0000 C CNN
F 2 "" H 4100 1350 50  0001 C CNN
F 3 "" H 4100 1350 50  0001 C CNN
	1    4100 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C5BA30C
P 3400 5250
F 0 "#PWR?" H 3400 5000 50  0001 C CNN
F 1 "GND" H 3405 5077 50  0000 C CNN
F 2 "" H 3400 5250 50  0001 C CNN
F 3 "" H 3400 5250 50  0001 C CNN
	1    3400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5300 3400 5250
Wire Wire Line
	3400 4450 3550 4450
Connection ~ 3400 5250
Wire Wire Line
	3400 5250 3400 5100
Wire Wire Line
	3750 4550 3550 4550
Wire Wire Line
	3550 4550 3550 4450
Connection ~ 3550 4450
Wire Wire Line
	3550 4450 3750 4450
Wire Wire Line
	7050 1450 3400 1450
Connection ~ 3400 4450
Wire Wire Line
	6050 3050 6050 3500
Wire Wire Line
	6050 3500 4100 3500
Connection ~ 3400 3500
Wire Wire Line
	3400 3500 3400 4450
Wire Wire Line
	3400 1450 3400 3500
Wire Wire Line
	4100 2650 4100 1350
Wire Wire Line
	4100 2950 4100 3500
Connection ~ 4100 3500
Wire Wire Line
	4100 3500 3400 3500
Wire Wire Line
	4100 1350 6050 1350
Wire Wire Line
	6050 1900 6050 1350
Connection ~ 6050 1350
Wire Wire Line
	6050 1350 7050 1350
Wire Wire Line
	6050 2200 6050 2400
Wire Wire Line
	7050 1250 6550 1250
Wire Wire Line
	6550 1250 6550 2400
Wire Wire Line
	6550 2400 6050 2400
Connection ~ 6050 2400
Wire Wire Line
	6050 2400 6050 2650
Wire Wire Line
	6050 2400 4250 2400
Wire Wire Line
	4250 2400 4250 3950
Wire Wire Line
	4650 3950 4650 2850
Wire Wire Line
	4650 2850 5050 2850
Wire Wire Line
	5350 2850 5750 2850
$Comp
L Interface_UART:MAX485E U?
U 1 1 5C5BBF11
P 7900 3700
F 0 "U?" H 7900 4378 50  0000 C CNN
F 1 "MAX485E" H 7900 4287 50  0000 C CNN
F 2 "" H 7900 3000 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX1487E-MAX491E.pdf" H 7900 3750 50  0001 C CNN
	1    7900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3950 5250 3600
Wire Wire Line
	5250 3600 7500 3600
Wire Wire Line
	7500 3900 5350 3900
Wire Wire Line
	5350 3900 5350 3950
Wire Wire Line
	7500 3700 7350 3700
Wire Wire Line
	7350 3700 7350 3800
Wire Wire Line
	7350 3800 7500 3800
Wire Wire Line
	7350 3800 5150 3800
Wire Wire Line
	5150 3800 5150 3950
Connection ~ 7350 3800
Wire Wire Line
	7900 4300 7900 5100
Wire Wire Line
	7900 5100 3400 5100
Connection ~ 3400 5100
Wire Wire Line
	3400 5100 3400 4450
Connection ~ 4100 1350
$Comp
L power:VCC #PWR?
U 1 1 5C5BE508
P 7000 2900
F 0 "#PWR?" H 7000 2750 50  0001 C CNN
F 1 "VCC" H 7017 3073 50  0000 C CNN
F 2 "" H 7000 2900 50  0001 C CNN
F 3 "" H 7000 2900 50  0001 C CNN
	1    7000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3200 7000 3200
Wire Wire Line
	7000 3200 7000 2900
Wire Wire Line
	7000 3200 7000 4650
Wire Wire Line
	7000 4650 5750 4650
Connection ~ 7000 3200
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 5C5BF22B
P 8950 3750
F 0 "J?" H 9030 3742 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 9030 3651 50  0000 L CNN
F 2 "" H 8950 3750 50  0001 C CNN
F 3 "~" H 8950 3750 50  0001 C CNN
	1    8950 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3600 8750 3600
Wire Wire Line
	8750 3600 8750 3750
Wire Wire Line
	8750 3850 8300 3850
Wire Wire Line
	8300 3850 8300 3900
$EndSCHEMATC
