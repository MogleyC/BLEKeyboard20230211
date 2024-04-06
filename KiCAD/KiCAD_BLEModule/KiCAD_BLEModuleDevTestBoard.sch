EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Custom:+5V #PWR02
U 1 1 66095933
P 1800 1000
F 0 "#PWR02" H 1800 850 50  0001 C CNN
F 1 "+5V" H 1815 1173 50  0000 C CNN
F 2 "" H 1800 1000 50  0001 C CNN
F 3 "" H 1800 1000 50  0001 C CNN
	1    1800 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR04
U 1 1 66096301
P 1900 2050
F 0 "#PWR04" H 1900 1850 50  0001 C CNN
F 1 "GNDPWR" H 1904 1896 50  0000 C CNN
F 2 "" H 1900 2000 50  0001 C CNN
F 3 "" H 1900 2000 50  0001 C CNN
	1    1900 2050
	1    0    0    -1  
$EndComp
Text GLabel 2600 1650 2    50   Output ~ 0
SWD_CLK
Text GLabel 2600 1550 2    50   BiDi ~ 0
SWD_IO
Text GLabel 2600 1750 2    50   Output ~ 0
UART_RX
Text Label 1500 1150 0    50   ~ 0
V_IN
Text Label 1500 1350 0    50   ~ 0
V_OUT
Text Label 1500 1250 0    50   ~ 0
GND
Text Label 1500 1550 0    50   ~ 0
SWD_IO
Text Label 1500 1650 0    50   ~ 0
SWD_CLK
Text Label 1500 1750 0    50   ~ 0
UART_RX
Text Label 1500 1850 0    50   ~ 0
UART_TX
Wire Wire Line
	1500 1150 1800 1150
Wire Wire Line
	1800 1150 1800 1000
Wire Wire Line
	1500 1350 2050 1350
Wire Wire Line
	2050 1350 2050 1000
Wire Wire Line
	1500 1250 1900 1250
Wire Wire Line
	1900 1250 1900 2050
Text GLabel 2600 1850 2    50   Input ~ 0
UART_TX
Wire Wire Line
	2600 1550 1500 1550
Wire Wire Line
	1500 1750 2600 1750
Wire Wire Line
	1500 1650 2600 1650
Wire Wire Line
	2600 1850 1500 1850
Wire Wire Line
	8750 1700 8750 1350
$Comp
L Custom:SW_Tact_1105 SW13
U 1 1 61BC9363
P 2350 5500
F 0 "SW13" H 2350 5650 50  0000 C CNN
F 1 "SW_Tact_1105" H 2350 5450 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 2350 5700 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 2350 5700 50  0001 C CNN
F 4 "ITS-1105-5mm" H 2350 5500 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 2350 5500 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 2350 5500 50  0001 C CNN "Maker"
F 7 "SWICH" H 2350 5500 50  0001 C CNN "Type"
	1    2350 5500
	1    0    0    -1  
$EndComp
Text GLabel 7400 3700 0    50   Output ~ 0
SWD_CLK
Text GLabel 7400 3800 0    50   BiDi ~ 0
SWD_IO
Text GLabel 7400 4000 0    50   Output ~ 0
UART_TX
Text GLabel 7400 3900 0    50   Input ~ 0
UART_RX
$Comp
L Custom:BLEModule U1
U 1 1 660A756D
P 8750 3400
F 0 "U1" H 8050 5050 50  0000 C CNN
F 1 "BLEModule" H 8750 3400 50  0000 C CNN
F 2 "Custom:BLEModule" H 8750 3400 50  0001 C CNN
F 3 "http://infocenter.nordicsemi.com/pdf/nRF52832_PS_v1.4.pdf" H 8750 3400 50  0001 C CNN
	1    8750 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5400 7700 5400
Wire Wire Line
	7700 5400 7700 3900
Wire Wire Line
	7700 3900 7400 3900
Wire Wire Line
	9900 5500 7600 5500
Wire Wire Line
	7600 5500 7600 4000
Wire Wire Line
	7600 4000 7400 4000
Wire Wire Line
	7400 3800 7850 3800
Wire Wire Line
	7400 3700 7850 3700
Wire Wire Line
	10000 3700 9650 3700
Wire Wire Line
	10000 3700 10000 5400
Wire Wire Line
	9650 3800 9900 3800
Wire Wire Line
	9900 3800 9900 5500
$Comp
L Custom:PinHeader2.54mm_8 J1
U 1 1 6613E59D
P 1300 1450
F 0 "J1" H 1218 1967 50  0000 C CNN
F 1 "PinHeader2.54mm_8" H 1218 1876 50  0000 C CNN
F 2 "Custom:PinHeader_1x08_P2.54mm_Vertical" H 1300 1450 50  0001 C CNN
F 3 "~" H 1300 1450 50  0001 C CNN
F 4 "PIN HEADER" H 1300 1450 50  0001 C CNN "Type"
F 5 "PinHeader2.54mm-8P" H 1300 1450 50  0001 C CNN "PartName"
	1    1300 1450
	-1   0    0    -1  
$EndComp
Text Label 1500 1450 0    50   ~ 0
~RESET
Text GLabel 2600 1450 2    50   Output ~ 0
~RSESET
Text GLabel 7400 3600 0    50   Input ~ 0
~RSESET
Wire Wire Line
	7800 3600 7800 5300
Wire Wire Line
	7800 5300 9800 5300
Wire Wire Line
	9800 5300 9800 4700
$Comp
L power:GNDPWR #PWR014
U 1 1 6615EC10
P 8750 5600
F 0 "#PWR014" H 8750 5400 50  0001 C CNN
F 1 "GNDPWR" H 8754 5446 50  0000 C CNN
F 2 "" H 8750 5550 50  0001 C CNN
F 3 "" H 8750 5550 50  0001 C CNN
	1    8750 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1450 2500 1450
Wire Wire Line
	2300 1450 1500 1450
Wire Wire Line
	7400 3600 7800 3600
$Comp
L Custom:PinHeader2.54mm_2x16 J2
U 1 1 66100360
P 5800 1550
F 0 "J2" H 5850 2467 50  0000 C CNN
F 1 "PinHeader2.54mm_2x16" H 5850 2376 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x16_P2.54mm_Vertical" H 5800 1550 50  0001 C CNN
F 3 "~" H 5800 1550 50  0001 C CNN
	1    5800 1550
	1    0    0    -1  
$EndComp
Text GLabel 10450 1900 2    50   BiDi ~ 0
P0.25
Text GLabel 10450 2000 2    50   BiDi ~ 0
P0.26
Text GLabel 10450 2100 2    50   BiDi ~ 0
P0.27
Text GLabel 10450 2200 2    50   BiDi ~ 0
P0.28
Text GLabel 10450 2300 2    50   BiDi ~ 0
P0.29
Text GLabel 10450 2400 2    50   BiDi ~ 0
P0.30
Text GLabel 10450 2500 2    50   BiDi ~ 0
P0.31
Text GLabel 10450 2600 2    50   BiDi ~ 0
P0.00
Text GLabel 10450 2700 2    50   BiDi ~ 0
P0.01
Text GLabel 10450 2800 2    50   BiDi ~ 0
P0.02
Text GLabel 10450 2900 2    50   BiDi ~ 0
P0.03
Text GLabel 10450 3000 2    50   BiDi ~ 0
P0.04
Text GLabel 10450 3100 2    50   BiDi ~ 0
P0.05
Text GLabel 10450 3200 2    50   BiDi ~ 0
P0.06
Text GLabel 10450 3300 2    50   BiDi ~ 0
P0.07
Text GLabel 10450 3400 2    50   BiDi ~ 0
P0.08
Text GLabel 10450 3500 2    50   BiDi ~ 0
P0.09
Text GLabel 10450 3600 2    50   BiDi ~ 0
P0.10
Text GLabel 10450 3700 2    50   BiDi ~ 0
P0.11
Text GLabel 10450 3800 2    50   BiDi ~ 0
P0.12
Text GLabel 10450 3900 2    50   BiDi ~ 0
P0.13
Text GLabel 10450 4000 2    50   BiDi ~ 0
P0.14
Text GLabel 10450 4100 2    50   BiDi ~ 0
P0.15
Text GLabel 10450 4200 2    50   BiDi ~ 0
P0.16
Text GLabel 10450 4300 2    50   BiDi ~ 0
P0.17
Text GLabel 10450 4400 2    50   BiDi ~ 0
P0.18
Text GLabel 10450 4500 2    50   BiDi ~ 0
P0.19
Text GLabel 10450 4600 2    50   BiDi ~ 0
P0.20
Text GLabel 10450 4700 2    50   BiDi ~ 0
P0.21
Text GLabel 10450 4800 2    50   BiDi ~ 0
P0.22
Text GLabel 10450 5000 2    50   BiDi ~ 0
P0.24
Text GLabel 10450 4900 2    50   BiDi ~ 0
P0.23
Wire Wire Line
	9650 1900 10450 1900
Wire Wire Line
	9650 2000 10450 2000
Wire Wire Line
	9650 2100 10450 2100
Wire Wire Line
	9650 2200 10450 2200
Wire Wire Line
	9650 2300 10450 2300
Wire Wire Line
	9650 2400 10450 2400
Wire Wire Line
	9650 2500 10450 2500
Wire Wire Line
	9650 2600 10450 2600
Wire Wire Line
	9650 2700 10450 2700
Wire Wire Line
	9650 2800 10450 2800
Wire Wire Line
	9650 2900 10450 2900
Wire Wire Line
	9650 3000 10450 3000
Wire Wire Line
	9650 3100 10450 3100
Wire Wire Line
	9650 3200 10450 3200
Wire Wire Line
	9650 3300 10450 3300
Wire Wire Line
	9650 3400 10450 3400
Wire Wire Line
	9650 3500 10450 3500
Wire Wire Line
	9650 3600 10450 3600
Wire Wire Line
	10000 3700 10450 3700
Connection ~ 10000 3700
Wire Wire Line
	10450 3800 9900 3800
Connection ~ 9900 3800
Wire Wire Line
	9650 3900 10450 3900
Wire Wire Line
	9650 4000 10450 4000
Wire Wire Line
	9650 4100 10450 4100
Wire Wire Line
	9650 4200 10450 4200
Wire Wire Line
	9650 4300 10450 4300
Wire Wire Line
	9650 4400 10450 4400
Wire Wire Line
	9650 4500 10450 4500
Wire Wire Line
	9650 4600 10450 4600
Wire Wire Line
	9650 4800 10450 4800
Wire Wire Line
	9650 4900 10450 4900
Wire Wire Line
	9650 4700 9800 4700
Connection ~ 9800 4700
Wire Wire Line
	9800 4700 10450 4700
Wire Wire Line
	9650 5000 10450 5000
Text GLabel 5600 2150 0    50   BiDi ~ 0
P0.26
Text GLabel 5600 2250 0    50   BiDi ~ 0
P0.28
Text GLabel 5600 2350 0    50   BiDi ~ 0
P0.30
Text GLabel 5600 850  0    50   BiDi ~ 0
P0.00
Text GLabel 5600 950  0    50   BiDi ~ 0
P0.02
Text GLabel 5600 1050 0    50   BiDi ~ 0
P0.04
Text GLabel 5600 1150 0    50   BiDi ~ 0
P0.06
Text GLabel 5600 1250 0    50   BiDi ~ 0
P0.08
Text GLabel 5600 1350 0    50   BiDi ~ 0
P0.10
Text GLabel 5600 1450 0    50   BiDi ~ 0
P0.12
Text GLabel 5600 1550 0    50   BiDi ~ 0
P0.14
Text GLabel 5600 1650 0    50   BiDi ~ 0
P0.16
Text GLabel 5600 1750 0    50   BiDi ~ 0
P0.18
Text GLabel 5600 1850 0    50   BiDi ~ 0
P0.20
Text GLabel 5600 1950 0    50   BiDi ~ 0
P0.22
Text GLabel 5600 2050 0    50   BiDi ~ 0
P0.24
Text GLabel 6100 2050 2    50   BiDi ~ 0
P0.25
Text GLabel 6100 2150 2    50   BiDi ~ 0
P0.27
Text GLabel 6100 2250 2    50   BiDi ~ 0
P0.29
Text GLabel 6100 2350 2    50   BiDi ~ 0
P0.31
Text GLabel 6100 850  2    50   BiDi ~ 0
P0.01
Text GLabel 6100 950  2    50   BiDi ~ 0
P0.03
Text GLabel 6100 1050 2    50   BiDi ~ 0
P0.05
Text GLabel 6100 1150 2    50   BiDi ~ 0
P0.07
Text GLabel 6100 1250 2    50   BiDi ~ 0
P0.09
Text GLabel 6100 1350 2    50   BiDi ~ 0
P0.11
Text GLabel 6100 1450 2    50   BiDi ~ 0
P0.13
Text GLabel 6100 1550 2    50   BiDi ~ 0
P0.15
Text GLabel 6100 1650 2    50   BiDi ~ 0
P0.17
Text GLabel 6100 1750 2    50   BiDi ~ 0
P0.19
Text GLabel 6100 1850 2    50   BiDi ~ 0
P0.21
Text GLabel 6100 1950 2    50   BiDi ~ 0
P0.23
$Comp
L Custom:SS14 D13
U 1 1 6618146F
P 1950 5500
F 0 "D13" H 2000 5725 50  0000 C CNN
F 1 "SS14" H 2000 5634 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 2150 5700 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 2150 5800 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 2150 6400 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 2150 6500 60  0001 L CNN "Description"
	1    1950 5500
	-1   0    0    -1  
$EndComp
$Comp
L Custom:SW_Tact_1105 SW14
U 1 1 661AD501
P 3450 5500
F 0 "SW14" H 3450 5650 50  0000 C CNN
F 1 "SW_Tact_1105" H 3450 5450 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 3450 5700 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 3450 5700 50  0001 C CNN
F 4 "ITS-1105-5mm" H 3450 5500 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 3450 5500 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 3450 5500 50  0001 C CNN "Maker"
F 7 "SWICH" H 3450 5500 50  0001 C CNN "Type"
	1    3450 5500
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D14
U 1 1 661AD527
P 3050 5500
F 0 "D14" H 3100 5725 50  0000 C CNN
F 1 "SS14" H 3100 5634 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 3250 5700 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 3250 5800 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 3250 6400 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 3250 6500 60  0001 L CNN "Description"
	1    3050 5500
	-1   0    0    -1  
$EndComp
$Comp
L Custom:SW_Tact_1105 SW15
U 1 1 661B7CF9
P 4550 5500
F 0 "SW15" H 4550 5650 50  0000 C CNN
F 1 "SW_Tact_1105" H 4550 5450 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 4550 5700 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 4550 5700 50  0001 C CNN
F 4 "ITS-1105-5mm" H 4550 5500 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 4550 5500 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 4550 5500 50  0001 C CNN "Maker"
F 7 "SWICH" H 4550 5500 50  0001 C CNN "Type"
	1    4550 5500
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D15
U 1 1 661B7D1F
P 4150 5500
F 0 "D15" H 4200 5725 50  0000 C CNN
F 1 "SS14" H 4200 5634 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 4350 5700 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 4350 5800 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 4350 6400 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 4350 6500 60  0001 L CNN "Description"
	1    4150 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2700 5150 2650 5150
Wire Wire Line
	2650 5150 2650 5500
Wire Wire Line
	2650 5500 2550 5500
Wire Wire Line
	2050 5500 2150 5500
Wire Wire Line
	3850 5650 3850 5500
Wire Wire Line
	3850 5500 3950 5500
Wire Wire Line
	2850 5500 2750 5500
Wire Wire Line
	2750 5500 2750 5650
Connection ~ 2750 5650
Wire Wire Line
	2750 5650 3850 5650
Wire Wire Line
	1550 5650 1700 5650
Wire Wire Line
	1750 5500 1700 5500
Wire Wire Line
	1700 5500 1700 5650
Connection ~ 1700 5650
Wire Wire Line
	1700 5650 2750 5650
Wire Wire Line
	3650 5500 3750 5500
Wire Wire Line
	3750 5500 3750 5150
Wire Wire Line
	3750 5150 3800 5150
Wire Wire Line
	3150 5500 3250 5500
Wire Wire Line
	4250 5500 4350 5500
Wire Wire Line
	4900 5150 4850 5150
Wire Wire Line
	4850 5150 4850 5500
Wire Wire Line
	4850 5500 4750 5500
Connection ~ 2650 5500
Connection ~ 3750 5500
Connection ~ 4850 5500
$Comp
L Custom:SW_Tact_1105 SW9
U 1 1 66284ADC
P 2350 6100
F 0 "SW9" H 2350 6250 50  0000 C CNN
F 1 "SW_Tact_1105" H 2350 6050 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 2350 6300 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 2350 6300 50  0001 C CNN
F 4 "ITS-1105-5mm" H 2350 6100 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 2350 6100 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 2350 6100 50  0001 C CNN "Maker"
F 7 "SWICH" H 2350 6100 50  0001 C CNN "Type"
	1    2350 6100
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D9
U 1 1 66284AEC
P 1950 6100
F 0 "D9" H 2000 6325 50  0000 C CNN
F 1 "SS14" H 2000 6234 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 2150 6300 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 2150 6400 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 2150 7000 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 2150 7100 60  0001 L CNN "Description"
	1    1950 6100
	-1   0    0    -1  
$EndComp
$Comp
L Custom:SW_Tact_1105 SW10
U 1 1 66284AF6
P 3450 6100
F 0 "SW10" H 3450 6250 50  0000 C CNN
F 1 "SW_Tact_1105" H 3450 6050 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 3450 6300 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 3450 6300 50  0001 C CNN
F 4 "ITS-1105-5mm" H 3450 6100 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 3450 6100 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 3450 6100 50  0001 C CNN "Maker"
F 7 "SWICH" H 3450 6100 50  0001 C CNN "Type"
	1    3450 6100
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D10
U 1 1 66284AFE
P 3050 6100
F 0 "D10" H 3100 6325 50  0000 C CNN
F 1 "SS14" H 3100 6234 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 3250 6300 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 3250 6400 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 3250 7000 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 3250 7100 60  0001 L CNN "Description"
	1    3050 6100
	-1   0    0    -1  
$EndComp
$Comp
L Custom:SW_Tact_1105 SW11
U 1 1 66284B08
P 4550 6100
F 0 "SW11" H 4550 6250 50  0000 C CNN
F 1 "SW_Tact_1105" H 4550 6050 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 4550 6300 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 4550 6300 50  0001 C CNN
F 4 "ITS-1105-5mm" H 4550 6100 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 4550 6100 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 4550 6100 50  0001 C CNN "Maker"
F 7 "SWICH" H 4550 6100 50  0001 C CNN "Type"
	1    4550 6100
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D11
U 1 1 66284B10
P 4150 6100
F 0 "D11" H 4200 6325 50  0000 C CNN
F 1 "SS14" H 4200 6234 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 4350 6300 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 4350 6400 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 4350 7000 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 4350 7100 60  0001 L CNN "Description"
	1    4150 6100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2650 6100 2550 6100
Wire Wire Line
	2050 6100 2150 6100
Wire Wire Line
	3850 6250 3850 6100
Wire Wire Line
	3850 6100 3950 6100
Wire Wire Line
	2850 6100 2750 6100
Wire Wire Line
	2750 6100 2750 6250
Connection ~ 2750 6250
Wire Wire Line
	2750 6250 3850 6250
Wire Wire Line
	1550 6250 1700 6250
Wire Wire Line
	1750 6100 1700 6100
Wire Wire Line
	1700 6100 1700 6250
Connection ~ 1700 6250
Wire Wire Line
	1700 6250 2750 6250
Wire Wire Line
	3650 6100 3750 6100
Wire Wire Line
	3150 6100 3250 6100
Wire Wire Line
	4250 6100 4350 6100
Wire Wire Line
	4850 6100 4750 6100
Connection ~ 2650 6100
Connection ~ 3750 6100
Connection ~ 4850 6100
Wire Wire Line
	2650 5500 2650 6100
Wire Wire Line
	3750 5500 3750 6100
Wire Wire Line
	4850 5500 4850 6100
$Comp
L Custom:SW_Tact_1105 SW5
U 1 1 6628E7EC
P 2350 6700
F 0 "SW5" H 2350 6850 50  0000 C CNN
F 1 "SW_Tact_1105" H 2350 6650 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 2350 6900 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 2350 6900 50  0001 C CNN
F 4 "ITS-1105-5mm" H 2350 6700 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 2350 6700 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 2350 6700 50  0001 C CNN "Maker"
F 7 "SWICH" H 2350 6700 50  0001 C CNN "Type"
	1    2350 6700
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D5
U 1 1 6628E7FC
P 1950 6700
F 0 "D5" H 2000 6925 50  0000 C CNN
F 1 "SS14" H 2000 6834 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 2150 6900 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 2150 7000 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 2150 7600 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 2150 7700 60  0001 L CNN "Description"
	1    1950 6700
	-1   0    0    -1  
$EndComp
$Comp
L Custom:SW_Tact_1105 SW6
U 1 1 6628E806
P 3450 6700
F 0 "SW6" H 3450 6850 50  0000 C CNN
F 1 "SW_Tact_1105" H 3450 6650 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 3450 6900 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 3450 6900 50  0001 C CNN
F 4 "ITS-1105-5mm" H 3450 6700 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 3450 6700 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 3450 6700 50  0001 C CNN "Maker"
F 7 "SWICH" H 3450 6700 50  0001 C CNN "Type"
	1    3450 6700
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D6
U 1 1 6628E80E
P 3050 6700
F 0 "D6" H 3100 6925 50  0000 C CNN
F 1 "SS14" H 3100 6834 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 3250 6900 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 3250 7000 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 3250 7600 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 3250 7700 60  0001 L CNN "Description"
	1    3050 6700
	-1   0    0    -1  
$EndComp
$Comp
L Custom:SW_Tact_1105 SW7
U 1 1 6628E818
P 4550 6700
F 0 "SW7" H 4550 6850 50  0000 C CNN
F 1 "SW_Tact_1105" H 4550 6650 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 4550 6900 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 4550 6900 50  0001 C CNN
F 4 "ITS-1105-5mm" H 4550 6700 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 4550 6700 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 4550 6700 50  0001 C CNN "Maker"
F 7 "SWICH" H 4550 6700 50  0001 C CNN "Type"
	1    4550 6700
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D7
U 1 1 6628E820
P 4150 6700
F 0 "D7" H 4200 6925 50  0000 C CNN
F 1 "SS14" H 4200 6834 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 4350 6900 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 4350 7000 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 4350 7600 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 4350 7700 60  0001 L CNN "Description"
	1    4150 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2650 6700 2550 6700
Wire Wire Line
	2050 6700 2150 6700
Wire Wire Line
	3850 6850 3850 6700
Wire Wire Line
	3850 6700 3950 6700
Wire Wire Line
	2850 6700 2750 6700
Wire Wire Line
	2750 6700 2750 6850
Connection ~ 2750 6850
Wire Wire Line
	2750 6850 3850 6850
Wire Wire Line
	1550 6850 1700 6850
Wire Wire Line
	1750 6700 1700 6700
Wire Wire Line
	1700 6700 1700 6850
Connection ~ 1700 6850
Wire Wire Line
	1700 6850 2750 6850
Wire Wire Line
	3650 6700 3750 6700
Wire Wire Line
	3150 6700 3250 6700
Wire Wire Line
	4250 6700 4350 6700
Wire Wire Line
	4850 6700 4750 6700
Connection ~ 2650 6700
Connection ~ 3750 6700
Connection ~ 4850 6700
Wire Wire Line
	2650 6100 2650 6700
Wire Wire Line
	3750 6100 3750 6700
Wire Wire Line
	4850 6100 4850 6700
$Comp
L Custom:SW_Tact_1105 SW1
U 1 1 6629928D
P 2350 7300
F 0 "SW1" H 2350 7450 50  0000 C CNN
F 1 "SW_Tact_1105" H 2350 7250 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 2350 7500 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 2350 7500 50  0001 C CNN
F 4 "ITS-1105-5mm" H 2350 7300 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 2350 7300 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 2350 7300 50  0001 C CNN "Maker"
F 7 "SWICH" H 2350 7300 50  0001 C CNN "Type"
	1    2350 7300
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D1
U 1 1 6629929D
P 1950 7300
F 0 "D1" H 2000 7525 50  0000 C CNN
F 1 "SS14" H 2000 7434 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 2150 7500 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 2150 7600 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 2150 8200 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 2150 8300 60  0001 L CNN "Description"
	1    1950 7300
	-1   0    0    -1  
$EndComp
$Comp
L Custom:SW_Tact_1105 SW2
U 1 1 662992A7
P 3450 7300
F 0 "SW2" H 3450 7450 50  0000 C CNN
F 1 "SW_Tact_1105" H 3450 7250 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 3450 7500 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 3450 7500 50  0001 C CNN
F 4 "ITS-1105-5mm" H 3450 7300 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 3450 7300 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 3450 7300 50  0001 C CNN "Maker"
F 7 "SWICH" H 3450 7300 50  0001 C CNN "Type"
	1    3450 7300
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D2
U 1 1 662992AF
P 3050 7300
F 0 "D2" H 3100 7525 50  0000 C CNN
F 1 "SS14" H 3100 7434 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 3250 7500 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 3250 7600 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 3250 8200 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 3250 8300 60  0001 L CNN "Description"
	1    3050 7300
	-1   0    0    -1  
$EndComp
$Comp
L Custom:SW_Tact_1105 SW3
U 1 1 662992B9
P 4550 7300
F 0 "SW3" H 4550 7450 50  0000 C CNN
F 1 "SW_Tact_1105" H 4550 7250 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 4550 7500 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 4550 7500 50  0001 C CNN
F 4 "ITS-1105-5mm" H 4550 7300 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 4550 7300 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 4550 7300 50  0001 C CNN "Maker"
F 7 "SWICH" H 4550 7300 50  0001 C CNN "Type"
	1    4550 7300
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D3
U 1 1 662992C1
P 4150 7300
F 0 "D3" H 4200 7525 50  0000 C CNN
F 1 "SS14" H 4200 7434 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 4350 7500 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 4350 7600 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 4350 8200 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 4350 8300 60  0001 L CNN "Description"
	1    4150 7300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2650 7300 2550 7300
Wire Wire Line
	2050 7300 2150 7300
Wire Wire Line
	3850 7450 3850 7300
Wire Wire Line
	3850 7300 3950 7300
Wire Wire Line
	2850 7300 2750 7300
Wire Wire Line
	2750 7300 2750 7450
Connection ~ 2750 7450
Wire Wire Line
	2750 7450 3850 7450
Wire Wire Line
	1550 7450 1700 7450
Wire Wire Line
	1750 7300 1700 7300
Wire Wire Line
	1700 7300 1700 7450
Connection ~ 1700 7450
Wire Wire Line
	1700 7450 2750 7450
Wire Wire Line
	3650 7300 3750 7300
Wire Wire Line
	3150 7300 3250 7300
Wire Wire Line
	4250 7300 4350 7300
Wire Wire Line
	4850 7300 4750 7300
Wire Wire Line
	2650 6700 2650 7300
Wire Wire Line
	3750 6700 3750 7300
Wire Wire Line
	4850 6700 4850 7300
Text GLabel 1200 6250 0    50   BiDi ~ 0
P0.08
Text GLabel 1200 6850 0    50   BiDi ~ 0
P0.07
Text GLabel 1200 7450 0    50   BiDi ~ 0
P0.06
Text GLabel 3100 5150 2    50   BiDi ~ 0
P0.10
Text GLabel 4200 5150 2    50   BiDi ~ 0
P0.13
Text GLabel 5300 5150 2    50   BiDi ~ 0
P0.14
Text GLabel 6400 5150 2    50   BiDi ~ 0
P0.15
Wire Wire Line
	1200 5650 1350 5650
Wire Wire Line
	1200 6250 1350 6250
Wire Wire Line
	1200 6850 1350 6850
Wire Wire Line
	1200 7450 1350 7450
$Comp
L Custom:SW_Tact_1105 SW16
U 1 1 66389A06
P 5650 5500
F 0 "SW16" H 5650 5650 50  0000 C CNN
F 1 "SW_Tact_1105" H 5650 5450 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 5650 5700 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 5650 5700 50  0001 C CNN
F 4 "ITS-1105-5mm" H 5650 5500 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 5650 5500 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 5650 5500 50  0001 C CNN "Maker"
F 7 "SWICH" H 5650 5500 50  0001 C CNN "Type"
	1    5650 5500
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D16
U 1 1 66389A0E
P 5250 5500
F 0 "D16" H 5300 5725 50  0000 C CNN
F 1 "SS14" H 5300 5634 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 5450 5700 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 5450 5800 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 5450 6400 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 5450 6500 60  0001 L CNN "Description"
	1    5250 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 5650 4950 5500
Wire Wire Line
	4950 5500 5050 5500
Wire Wire Line
	5350 5500 5450 5500
Wire Wire Line
	6000 5150 5950 5150
Wire Wire Line
	5950 5150 5950 5500
Wire Wire Line
	5950 5500 5850 5500
Connection ~ 5950 5500
$Comp
L Custom:SW_Tact_1105 SW12
U 1 1 66389A30
P 5650 6100
F 0 "SW12" H 5650 6250 50  0000 C CNN
F 1 "SW_Tact_1105" H 5650 6050 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 5650 6300 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 5650 6300 50  0001 C CNN
F 4 "ITS-1105-5mm" H 5650 6100 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 5650 6100 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 5650 6100 50  0001 C CNN "Maker"
F 7 "SWICH" H 5650 6100 50  0001 C CNN "Type"
	1    5650 6100
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D12
U 1 1 66389A38
P 5250 6100
F 0 "D12" H 5300 6325 50  0000 C CNN
F 1 "SS14" H 5300 6234 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 5450 6300 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 5450 6400 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 5450 7000 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 5450 7100 60  0001 L CNN "Description"
	1    5250 6100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 6250 4950 6100
Wire Wire Line
	4950 6100 5050 6100
Wire Wire Line
	5350 6100 5450 6100
Wire Wire Line
	5950 6100 5850 6100
Connection ~ 5950 6100
Wire Wire Line
	5950 5500 5950 6100
$Comp
L Custom:SW_Tact_1105 SW8
U 1 1 66389A49
P 5650 6700
F 0 "SW8" H 5650 6850 50  0000 C CNN
F 1 "SW_Tact_1105" H 5650 6650 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 5650 6900 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 5650 6900 50  0001 C CNN
F 4 "ITS-1105-5mm" H 5650 6700 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 5650 6700 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 5650 6700 50  0001 C CNN "Maker"
F 7 "SWICH" H 5650 6700 50  0001 C CNN "Type"
	1    5650 6700
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D8
U 1 1 66389A51
P 5250 6700
F 0 "D8" H 5300 6925 50  0000 C CNN
F 1 "SS14" H 5300 6834 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 5450 6900 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 5450 7000 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 5450 7600 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 5450 7700 60  0001 L CNN "Description"
	1    5250 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 6850 4950 6700
Wire Wire Line
	4950 6700 5050 6700
Wire Wire Line
	5350 6700 5450 6700
Wire Wire Line
	5950 6700 5850 6700
Connection ~ 5950 6700
Wire Wire Line
	5950 6100 5950 6700
$Comp
L Custom:SW_Tact_1105 SW4
U 1 1 66389A62
P 5650 7300
F 0 "SW4" H 5650 7450 50  0000 C CNN
F 1 "SW_Tact_1105" H 5650 7250 50  0000 C CNN
F 2 "Custom:SW_PUSH_6mm_H5mm" H 5650 7500 50  0001 C CNN
F 3 "https://www.devicemart.co.kr/goods/view?no=34555" H 5650 7500 50  0001 C CNN
F 4 "ITS-1105-5mm" H 5650 7300 50  0001 C CNN "PartName"
F 5 "https://www.devicemart.co.kr/goods/view?no=34555" H 5650 7300 50  0001 C CNN "Shop"
F 6 "ANY VENDER" H 5650 7300 50  0001 C CNN "Maker"
F 7 "SWICH" H 5650 7300 50  0001 C CNN "Type"
	1    5650 7300
	1    0    0    -1  
$EndComp
$Comp
L Custom:SS14 D4
U 1 1 66389A6A
P 5250 7300
F 0 "D4" H 5300 7525 50  0000 C CNN
F 1 "SS14" H 5300 7434 50  0000 C CNN
F 2 "digikey-footprints:DO-214AC" H 5450 7500 60  0001 L CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 5450 7600 60  0001 L CNN
F 4 "https://www.devicemart.co.kr/order/cart" H 5450 8200 60  0001 L CNN "Shop"
F 5 "DIODE SCHOTTKY 40V 1A SMA" H 5450 8300 60  0001 L CNN "Description"
	1    5250 7300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 7450 4950 7300
Wire Wire Line
	4950 7300 5050 7300
Wire Wire Line
	5350 7300 5450 7300
Wire Wire Line
	5950 7300 5850 7300
Wire Wire Line
	5950 6700 5950 7300
Wire Wire Line
	3850 5650 4950 5650
Connection ~ 3850 5650
Wire Wire Line
	3850 6250 4950 6250
Connection ~ 3850 6250
Wire Wire Line
	3850 6850 4950 6850
Connection ~ 3850 6850
Wire Wire Line
	3850 7450 4950 7450
Connection ~ 3850 7450
Wire Wire Line
	6400 5150 6200 5150
Wire Wire Line
	5100 5150 5300 5150
Wire Wire Line
	4000 5150 4200 5150
Wire Wire Line
	2900 5150 3100 5150
$Comp
L Custom:+3.6V #PWR03
U 1 1 664CC92A
P 2050 1000
F 0 "#PWR03" H 2050 850 50  0001 C CNN
F 1 "+3.6V" H 2065 1173 50  0000 C CNN
F 2 "" H 2050 1000 50  0001 C CNN
F 3 "" H 2050 1000 50  0001 C CNN
	1    2050 1000
	1    0    0    -1  
$EndComp
$Comp
L Custom:+3.6V #PWR01
U 1 1 664DA3A0
P 8750 1350
F 0 "#PWR01" H 8750 1200 50  0001 C CNN
F 1 "+3.6V" H 8765 1523 50  0000 C CNN
F 2 "" H 8750 1350 50  0001 C CNN
F 3 "" H 8750 1350 50  0001 C CNN
	1    8750 1350
	1    0    0    -1  
$EndComp
$Comp
L Custom:LED_1608_R D18
U 1 1 6652415A
P 4200 1750
F 0 "D18" V 4239 1632 50  0000 R CNN
F 1 "LED_1608_R" V 4148 1632 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 4200 1750 50  0001 C CNN
F 3 ".\\Dataseets\\FC-DA1608HRK-620D.pdf" H 4200 1750 50  0001 C CNN
F 4 "https://www.devicemart.co.kr/goods/view?no=14047555" H 4200 1750 50  0001 C CNN "shop"
	1    4200 1750
	0    -1   -1   0   
$EndComp
$Comp
L Custom:LED_1608_B D17
U 1 1 66529B58
P 3550 1750
F 0 "D17" V 3589 1632 50  0000 R CNN
F 1 "LED_1608_B" V 3498 1632 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 3550 1750 50  0001 C CNN
F 3 ".\\Dataseets\\FC-DA1608HRK-620D.pdf" H 3550 1750 50  0001 C CNN
F 4 "https://www.devicemart.co.kr/goods/view?no=14047558" H 3550 1750 50  0001 C CNN "shop"
	1    3550 1750
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDPWR #PWR017
U 1 1 6653B1B1
P 3550 2050
F 0 "#PWR017" H 3550 1850 50  0001 C CNN
F 1 "GNDPWR" H 3554 1896 50  0000 C CNN
F 2 "" H 3550 2000 50  0001 C CNN
F 3 "" H 3550 2000 50  0001 C CNN
	1    3550 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1900 3550 2050
$Comp
L Custom:R_270RF R6
U 1 1 665AC700
P 3550 1350
F 0 "R6" H 3608 1396 50  0000 L CNN
F 1 "R_270RF" V 3550 1350 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 3550 1350 50  0001 C CNN
F 3 "~" H 3550 1350 50  0001 C CNN
F 4 "270RF" H 3608 1305 50  0000 L CNN "PartName"
F 5 "CHIP RESISTOR" H 3550 1350 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 3550 1350 50  0001 C CNN "Maker"
	1    3550 1350
	1    0    0    -1  
$EndComp
$Comp
L Custom:R_270RF R7
U 1 1 665AD7A4
P 4200 1350
F 0 "R7" H 4258 1396 50  0000 L CNN
F 1 "R_270RF" V 4200 1350 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 4200 1350 50  0001 C CNN
F 3 "~" H 4200 1350 50  0001 C CNN
F 4 "270RF" H 4258 1305 50  0000 L CNN "PartName"
F 5 "CHIP RESISTOR" H 4200 1350 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 4200 1350 50  0001 C CNN "Maker"
	1    4200 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1450 3550 1600
Wire Wire Line
	4200 1450 4200 1600
Wire Wire Line
	3550 1250 3550 1100
$Comp
L Custom:+3.6V #PWR015
U 1 1 665D7AD7
P 3550 1100
F 0 "#PWR015" H 3550 950 50  0001 C CNN
F 1 "+3.6V" H 3565 1273 50  0000 C CNN
F 2 "" H 3550 1100 50  0001 C CNN
F 3 "" H 3550 1100 50  0001 C CNN
	1    3550 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1250 4200 1100
$Comp
L Custom:+3.6V #PWR016
U 1 1 66601D68
P 4200 1100
F 0 "#PWR016" H 4200 950 50  0001 C CNN
F 1 "+3.6V" H 4215 1273 50  0000 C CNN
F 2 "" H 4200 1100 50  0001 C CNN
F 3 "" H 4200 1100 50  0001 C CNN
	1    4200 1100
	1    0    0    -1  
$EndComp
Text GLabel 4650 2100 2    50   BiDi ~ 0
P0.22
Wire Wire Line
	4650 2100 4450 2100
Wire Wire Line
	4200 1900 4200 2100
Wire Wire Line
	4200 2100 4250 2100
Wire Notes Line
	800  550  3150 550 
Wire Notes Line
	3150 550  3150 2500
Wire Notes Line
	3150 2500 800  2500
Wire Notes Line
	800  2500 800  550 
Wire Notes Line
	5100 550  6500 550 
Wire Notes Line
	3350 550  4950 550 
Wire Notes Line
	4950 550  4950 2500
Wire Notes Line
	4950 2500 3350 2500
Wire Notes Line
	3350 2500 3350 550 
Wire Notes Line
	800  4650 6750 4650
Wire Notes Line
	6750 4650 6750 7600
Wire Notes Line
	6750 7600 800  7600
Wire Notes Line
	800  7600 800  4650
Wire Notes Line
	800  2650 5350 2650
Wire Notes Line
	800  4450 800  2650
Wire Notes Line
	5350 4450 800  4450
Wire Notes Line
	5350 2650 5350 4450
Wire Notes Line
	5100 2500 5100 550 
Wire Notes Line
	6500 2500 5100 2500
Wire Notes Line
	6500 550  6500 2500
$Comp
L Custom:CAP_220uF_6.3V_SC6.3X5.8 C1
U 1 1 620E7E46
P 3400 3650
F 0 "C1" V 3450 3700 50  0000 L CNN
F 1 "CAP_220uF_6.3V_SC6.3X5.8" V 3500 3650 50  0001 C CNN
F 2 "Custom:C_Elec_6.3x5.8" H 3400 3650 50  0001 C CNN
F 3 ".\\Dataseets\\good-pdf-3369557-1.pdf" H 3400 3650 50  0001 C CNN
F 4 "SAMYOUNG" H 3400 3650 50  0001 C CNN "Maker"
F 5 "220uF/6.3V" V 3450 3375 50  0000 C CNN "PartName"
F 6 "https://www.eleparts.co.kr/goods/view?no=3369557" H 3400 3650 50  0001 C CNN "Shop"
F 7 "SMD ELECT CAPACITOR" H 3400 3650 50  0001 C CNN "Type"
	1    3400 3650
	1    0    0    -1  
$EndComp
$Comp
L Custom:CAP_220uF_6.3V_SC6.3X5.8 C3
U 1 1 6241FD7F
P 5050 3650
F 0 "C3" V 5100 3700 50  0000 L CNN
F 1 "CAP_220uF_6.3V_SC6.3X5.8" V 5150 3650 50  0001 C CNN
F 2 "Custom:C_Elec_6.3x5.8" H 5050 3650 50  0001 C CNN
F 3 ".\\Dataseets\\good-pdf-3369557-1.pdf" H 5050 3650 50  0001 C CNN
F 4 "SAMYOUNG" H 5050 3650 50  0001 C CNN "Maker"
F 5 "220uF/6.3V" V 5100 3375 50  0000 C CNN "PartName"
F 6 "https://www.eleparts.co.kr/goods/view?no=3369557" H 5050 3650 50  0001 C CNN "Shop"
F 7 "SMD ELECT CAPACITOR" H 5050 3650 50  0001 C CNN "Type"
	1    5050 3650
	1    0    0    -1  
$EndComp
$Comp
L Custom:R_270RF R3
U 1 1 622F24B9
P 4550 3650
F 0 "R3" V 4500 3550 50  0000 C CNN
F 1 "R_270RF" V 4550 3650 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 4550 3650 50  0001 C CNN
F 3 "~" H 4550 3650 50  0001 C CNN
F 4 "270RF" V 4500 3750 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 4550 3650 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 4550 3650 50  0001 C CNN "Maker"
	1    4550 3650
	0    1    1    0   
$EndComp
$Comp
L Custom:CAP_104Z_25V_1608 C4
U 1 1 62368666
P 4800 3900
F 0 "C4" V 4850 3950 50  0000 L CNN
F 1 "CAP_104Z_25V_1608" V 4950 3850 50  0001 C CNN
F 2 "Custom:C_0603_1608Metric" V 4850 4000 50  0001 C CNN
F 3 "" V 4850 4000 50  0001 C CNN
F 4 "WALSIN, SAMSUNG" H 4800 3900 50  0001 C CNN "Maker"
F 5 "104Z/25V" V 4925 3900 50  0000 C CNN "PartName"
F 6 "CL10B104KA8NNNC" H 4800 3900 50  0001 C CNN "Replacement"
F 7 "https://www.eleparts.co.kr/goods/view?no=8010066" H 4800 3900 50  0001 C CNN "Shop"
F 8 "CHIP CERAMIC CAP" H 4800 3900 50  0001 C CNN "Type"
	1    4800 3900
	1    0    0    -1  
$EndComp
$Comp
L Custom:R_510RF R4
U 1 1 622F1051
P 4350 3900
F 0 "R4" H 4408 3946 50  0000 L CNN
F 1 "R_510RF" V 4350 3900 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 4350 3900 50  0001 C CNN
F 3 "~" H 4350 3900 50  0001 C CNN
F 4 "510RF" H 4408 3855 50  0000 L CNN "PartName"
F 5 "CHIP RESISTOR" H 4350 3900 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 4350 3900 50  0001 C CNN "Maker"
	1    4350 3900
	1    0    0    -1  
$EndComp
$Comp
L Custom:SMBJ15A TVS1
U 1 1 6217C48E
P 3900 3650
F 0 "TVS1" V 3950 3900 50  0000 R CNN
F 1 "SMBJ15A" V 3850 4050 50  0000 R CNN
F 2 "Custom:D_SMB" H 3900 3650 50  0001 C CNN
F 3 ".\\Dataseets\\SMBJ.pdf" H 3900 3650 50  0001 C CNN
F 4 "SAMYANG ELECTRONICS" H 3900 3650 50  0001 C CNN "Maker"
F 5 "SMBJ15A" H 3900 3650 50  0001 C CNN "PartName"
F 6 "https://www.eleparts.co.kr/goods/view?no=6542453" H 3900 3650 50  0001 C CNN "Shop"
F 7 "SMD DIODE TVS" H 3900 3650 50  0001 C CNN "Type"
	1    3900 3650
	0    1    1    0   
$EndComp
$Comp
L Custom:R_4.7KF R2
U 1 1 61FFD07F
P 2550 3700
F 0 "R2" V 2500 3550 50  0000 C CNN
F 1 "R_4.7KF" V 2550 3700 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 2550 3700 50  0001 C CNN
F 3 "~" H 2550 3700 50  0001 C CNN
F 4 "4.7KF" V 2500 3850 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 2550 3700 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 2550 3700 50  0001 C CNN "Maker"
	1    2550 3700
	0    1    1    0   
$EndComp
$Comp
L Custom:R_4.7KF R1
U 1 1 61FE4178
P 2550 3600
F 0 "R1" V 2500 3450 50  0000 C CNN
F 1 "R_4.7KF" V 2550 3600 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 2550 3600 50  0001 C CNN
F 3 "~" H 2550 3600 50  0001 C CNN
F 4 "4.7KF" V 2500 3750 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 2550 3600 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 2550 3600 50  0001 C CNN "Maker"
	1    2550 3600
	0    1    1    0   
$EndComp
$Comp
L Custom:USB-TYPE-C-31-M-17 J3
U 1 1 61FD82ED
P 1700 3650
F 0 "J3" H 1350 4050 50  0000 C CNN
F 1 "USB-TYPE-C-31-M-17" H 1700 3250 50  0000 C CNN
F 2 "Custom:TYPE-C-31-M-17-1" H 1850 3650 50  0001 C CNN
F 3 ".\\Dataseets\\Korean-Hroparts-Elec-TYPE-C-31-M-17.pdf" H 1850 3650 50  0001 C CNN
F 4 "Korean-Hroparts-Elec" H 1700 3650 50  0001 C CNN "Maker"
F 5 "USB-TYPE-C-31-M-17" H 1700 3650 50  0001 C CNN "PartName"
F 6 "SMD JACK USB C TYPE" H 1700 3650 50  0001 C CNN "Type"
	1    1700 3650
	1    0    0    -1  
$EndComp
$Comp
L Custom:LMT117-ADJ U2
U 1 1 61F9C889
P 4350 3300
F 0 "U2" H 4150 3550 50  0000 L CNN
F 1 "LMT117-ADJ" H 4150 3450 50  0000 L CNN
F 2 "Custom:SOT-223-3_TabPin2" H 4350 3500 50  0001 C CNN
F 3 ".\\Dataseets\\AX1117_LMT117-ADJ.pdf" H 4450 3050 50  0001 C CNN
F 4 "TGS" H 4350 3300 50  0001 C CNN "Maker"
F 5 "LMT117-ADJ" H 4350 3300 50  0001 C CNN "PartName"
F 6 "LM1117S-ADJ" H 4350 3300 50  0001 C CNN "Replacement"
F 7 "https://www.eleparts.co.kr/goods/view?no=6559295" H 4350 3300 50  0001 C CNN "Shop"
F 8 "SMD REGULATOR" H 4350 3300 50  0001 C CNN "Type"
	1    4350 3300
	1    0    0    -1  
$EndComp
$Comp
L Custom:CAP_104Z_25V_1608 C2
U 1 1 621259A9
P 3650 3650
F 0 "C2" V 3700 3700 50  0000 L CNN
F 1 "CAP_104Z_25V_1608" V 3800 3600 50  0001 C CNN
F 2 "Custom:C_0603_1608Metric" V 3700 3750 50  0001 C CNN
F 3 "" V 3700 3750 50  0001 C CNN
F 4 "WALSIN, SAMSUNG" H 3650 3650 50  0001 C CNN "Maker"
F 5 "104Z/25V" V 3700 3400 50  0000 C CNN "PartName"
F 6 "CL10B104KA8NNNC" H 3650 3650 50  0001 C CNN "Replacement"
F 7 "https://www.eleparts.co.kr/goods/view?no=8010066" H 3650 3650 50  0001 C CNN "Shop"
F 8 "CHIP CERAMIC CAP" H 3650 3650 50  0001 C CNN "Type"
	1    3650 3650
	1    0    0    -1  
$EndComp
Connection ~ 5050 3300
Wire Wire Line
	5050 3100 5050 3300
Wire Wire Line
	5050 4100 5050 3750
$Comp
L power:GNDPWR #PWR013
U 1 1 6247F638
P 5050 4100
F 0 "#PWR013" H 5050 3900 50  0001 C CNN
F 1 "GNDPWR" H 5054 3946 50  0001 C CNN
F 2 "" H 5050 4050 50  0001 C CNN
F 3 "" H 5050 4050 50  0001 C CNN
	1    5050 4100
	1    0    0    -1  
$EndComp
Connection ~ 4800 3300
Wire Wire Line
	5050 3300 5050 3550
Wire Wire Line
	4800 3300 5050 3300
Wire Wire Line
	4800 3650 4650 3650
Wire Wire Line
	4800 3650 4800 3800
Wire Wire Line
	4350 3650 4350 3800
Connection ~ 4800 3650
Connection ~ 4350 3650
Wire Wire Line
	4800 3300 4800 3650
Wire Wire Line
	4650 3300 4800 3300
Wire Wire Line
	4800 4000 4800 4100
$Comp
L power:GNDPWR #PWR012
U 1 1 62369A58
P 4800 4100
F 0 "#PWR012" H 4800 3900 50  0001 C CNN
F 1 "GNDPWR" H 4804 3946 50  0001 C CNN
F 2 "" H 4800 4050 50  0001 C CNN
F 3 "" H 4800 4050 50  0001 C CNN
	1    4800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3650 4350 3650
Wire Wire Line
	4350 3600 4350 3650
Wire Wire Line
	4350 4000 4350 4100
$Comp
L power:GNDPWR #PWR011
U 1 1 62311E5D
P 4350 4100
F 0 "#PWR011" H 4350 3900 50  0001 C CNN
F 1 "GNDPWR" H 4354 3946 50  0001 C CNN
F 2 "" H 4350 4050 50  0001 C CNN
F 3 "" H 4350 4050 50  0001 C CNN
	1    4350 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3850 3900 4100
Wire Wire Line
	3900 3450 3900 3300
$Comp
L power:GNDPWR #PWR010
U 1 1 621D1536
P 3900 4100
F 0 "#PWR010" H 3900 3900 50  0001 C CNN
F 1 "GNDPWR" H 3904 3946 50  0001 C CNN
F 2 "" H 3900 4050 50  0001 C CNN
F 3 "" H 3900 4050 50  0001 C CNN
	1    3900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3100 3900 3300
Connection ~ 3900 3300
Wire Wire Line
	3650 3300 3900 3300
Connection ~ 3650 3300
Wire Wire Line
	3650 3550 3650 3300
Wire Wire Line
	3650 4100 3650 3750
$Comp
L power:GNDPWR #PWR09
U 1 1 62143BD4
P 3650 4100
F 0 "#PWR09" H 3650 3900 50  0001 C CNN
F 1 "GNDPWR" H 3654 3946 50  0001 C CNN
F 2 "" H 3650 4050 50  0001 C CNN
F 3 "" H 3650 4050 50  0001 C CNN
	1    3650 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4100 3400 3750
$Comp
L power:GNDPWR #PWR08
U 1 1 62104DE2
P 3400 4100
F 0 "#PWR08" H 3400 3900 50  0001 C CNN
F 1 "GNDPWR" H 3404 3946 50  0001 C CNN
F 2 "" H 3400 4050 50  0001 C CNN
F 3 "" H 3400 4050 50  0001 C CNN
	1    3400 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3550 3400 3300
Connection ~ 3400 3550
Wire Wire Line
	3400 3300 3650 3300
Connection ~ 3400 3300
Wire Wire Line
	3400 3600 3400 3550
Connection ~ 3150 3500
Wire Wire Line
	3150 3800 3150 3500
Wire Wire Line
	2300 3800 3150 3800
Wire Wire Line
	3150 3300 3400 3300
Wire Wire Line
	3150 3500 3150 3300
Wire Wire Line
	2300 3500 3150 3500
Connection ~ 2900 3600
Wire Wire Line
	2900 3400 2900 3600
Wire Wire Line
	2300 3400 2900 3400
Wire Wire Line
	2300 3600 2450 3600
Wire Wire Line
	2300 3700 2450 3700
Wire Wire Line
	2900 3700 2900 3900
Wire Wire Line
	2300 3900 2900 3900
Connection ~ 2900 3700
Wire Wire Line
	2650 3700 2900 3700
Wire Wire Line
	2900 3600 2900 3700
Wire Wire Line
	2650 3600 2900 3600
$Comp
L Custom:+5V #PWR05
U 1 1 61FD6832
P 3900 3100
F 0 "#PWR05" H 3900 2950 50  0001 C CNN
F 1 "+5V" H 3915 3273 50  0000 C CNN
F 2 "" H 3900 3100 50  0001 C CNN
F 3 "" H 3900 3100 50  0001 C CNN
	1    3900 3100
	1    0    0    -1  
$EndComp
$Comp
L Custom:+3.6V #PWR06
U 1 1 61FD5D2C
P 5050 3100
F 0 "#PWR06" H 5050 2950 50  0001 C CNN
F 1 "+3.6V" H 5065 3273 50  0000 C CNN
F 2 "" H 5050 3100 50  0001 C CNN
F 3 "" H 5050 3100 50  0001 C CNN
	1    5050 3100
	1    0    0    -1  
$EndComp
Text Notes 850  700  0    79   ~ 0
Debug Connector
Text Notes 5150 700  0    79   ~ 0
GPIO
Text Notes 3400 700  0    79   ~ 0
LED Display\n
Text Notes 850  2800 0    79   ~ 0
USB Power in
Text Notes 850  4800 0    79   ~ 0
Keyboard Interface
$Comp
L Custom:R_0RJ R8
U 1 1 6613B859
P 4350 2100
F 0 "R8" V 4155 2100 50  0000 C CNN
F 1 "R_0RJ" V 4350 2100 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 4350 2100 50  0001 C CNN
F 3 "~" H 4350 2100 50  0001 C CNN
F 4 "0RJ" V 4246 2100 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 4350 2100 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 4350 2100 50  0001 C CNN "Maker"
	1    4350 2100
	0    1    1    0   
$EndComp
$Comp
L Custom:R_0RJ R13
U 1 1 6617A9C7
P 2800 5150
F 0 "R13" V 2605 5150 50  0000 C CNN
F 1 "R_0RJ" V 2800 5150 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 2800 5150 50  0001 C CNN
F 3 "~" H 2800 5150 50  0001 C CNN
F 4 "0RJ" V 2696 5150 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 2800 5150 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 2800 5150 50  0001 C CNN "Maker"
	1    2800 5150
	0    1    1    0   
$EndComp
$Comp
L Custom:R_0RJ R14
U 1 1 66189FB6
P 3900 5150
F 0 "R14" V 3705 5150 50  0000 C CNN
F 1 "R_0RJ" V 3900 5150 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 3900 5150 50  0001 C CNN
F 3 "~" H 3900 5150 50  0001 C CNN
F 4 "0RJ" V 3796 5150 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 3900 5150 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 3900 5150 50  0001 C CNN "Maker"
	1    3900 5150
	0    1    1    0   
$EndComp
$Comp
L Custom:R_0RJ R15
U 1 1 6619959B
P 5000 5150
F 0 "R15" V 4805 5150 50  0000 C CNN
F 1 "R_0RJ" V 5000 5150 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 5000 5150 50  0001 C CNN
F 3 "~" H 5000 5150 50  0001 C CNN
F 4 "0RJ" V 4896 5150 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 5000 5150 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 5000 5150 50  0001 C CNN "Maker"
	1    5000 5150
	0    1    1    0   
$EndComp
$Comp
L Custom:R_0RJ R16
U 1 1 661A89F8
P 6100 5150
F 0 "R16" V 5905 5150 50  0000 C CNN
F 1 "R_0RJ" V 6100 5150 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 6100 5150 50  0001 C CNN
F 3 "~" H 6100 5150 50  0001 C CNN
F 4 "0RJ" V 5996 5150 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 6100 5150 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 6100 5150 50  0001 C CNN "Maker"
	1    6100 5150
	0    1    1    0   
$EndComp
$Comp
L Custom:R_0RJ R5
U 1 1 66211D18
P 2400 1450
F 0 "R5" V 2205 1450 50  0000 C CNN
F 1 "R_0RJ" V 2400 1450 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 2400 1450 50  0001 C CNN
F 3 "~" H 2400 1450 50  0001 C CNN
F 4 "0RJ" V 2296 1450 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 2400 1450 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 2400 1450 50  0001 C CNN "Maker"
	1    2400 1450
	0    1    1    0   
$EndComp
Text GLabel 1200 5650 0    50   BiDi ~ 0
P0.09
$Comp
L Custom:R_0RJ R12
U 1 1 6613D6CB
P 1450 5650
F 0 "R12" V 1255 5650 50  0000 C CNN
F 1 "R_0RJ" V 1450 5650 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 1450 5650 50  0001 C CNN
F 3 "~" H 1450 5650 50  0001 C CNN
F 4 "0RJ" V 1346 5650 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 1450 5650 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 1450 5650 50  0001 C CNN "Maker"
	1    1450 5650
	0    -1   1    0   
$EndComp
$Comp
L Custom:R_0RJ R11
U 1 1 6614CC28
P 1450 6250
F 0 "R11" V 1255 6250 50  0000 C CNN
F 1 "R_0RJ" V 1450 6250 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 1450 6250 50  0001 C CNN
F 3 "~" H 1450 6250 50  0001 C CNN
F 4 "0RJ" V 1346 6250 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 1450 6250 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 1450 6250 50  0001 C CNN "Maker"
	1    1450 6250
	0    -1   1    0   
$EndComp
$Comp
L Custom:R_0RJ R10
U 1 1 6615BFFD
P 1450 6850
F 0 "R10" V 1255 6850 50  0000 C CNN
F 1 "R_0RJ" V 1450 6850 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 1450 6850 50  0001 C CNN
F 3 "~" H 1450 6850 50  0001 C CNN
F 4 "0RJ" V 1346 6850 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 1450 6850 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 1450 6850 50  0001 C CNN "Maker"
	1    1450 6850
	0    -1   1    0   
$EndComp
$Comp
L power:GNDPWR #PWR07
U 1 1 61FFD2B9
P 2900 4100
F 0 "#PWR07" H 2900 3900 50  0001 C CNN
F 1 "GNDPWR" H 2904 3946 50  0001 C CNN
F 2 "" H 2900 4050 50  0001 C CNN
F 3 "" H 2900 4050 50  0001 C CNN
	1    2900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3300 4050 3300
Wire Wire Line
	8750 5200 8750 5600
$Comp
L Custom:R_0RJ R9
U 1 1 6616B552
P 1450 7450
F 0 "R9" V 1255 7450 50  0000 C CNN
F 1 "R_0RJ" V 1450 7450 50  0001 C CNN
F 2 "Custom:R_0603_1608Metric" H 1450 7450 50  0001 C CNN
F 3 "~" H 1450 7450 50  0001 C CNN
F 4 "0RJ" V 1346 7450 50  0000 C CNN "PartName"
F 5 "CHIP RESISTOR" H 1450 7450 50  0001 C CNN "Type"
F 6 "WALSIN, SAMSUNG" H 1450 7450 50  0001 C CNN "Maker"
	1    1450 7450
	0    -1   1    0   
$EndComp
Connection ~ 2900 3900
Wire Wire Line
	2900 3900 2900 4100
$EndSCHEMATC