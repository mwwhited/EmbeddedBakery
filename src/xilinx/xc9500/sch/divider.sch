VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL B(0:3)
        SIGNAL Divisor(0:5)
        SIGNAL OR3(0:5)
        SIGNAL OR6(0:5)
        SIGNAL OR9(0:5)
        SIGNAL OR12(0:5)
        SIGNAL XLXN_6(0:5)
        SIGNAL XLXN_7(0:5)
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL A(0:3)
        SIGNAL IR4(0:5)
        SIGNAL IR7(0:5)
        SIGNAL XLXN_14(0:5)
        SIGNAL XLXN_15
        SIGNAL Modulas(0:5)
        SIGNAL OR6(5)
        SIGNAL OR9(5)
        SIGNAL Modulas(1)
        SIGNAL Modulas(2)
        SIGNAL Modulas(3)
        SIGNAL Modulas(4)
        SIGNAL OR3(5)
        SIGNAL OR13(0:7)
        SIGNAL OR13(0)
        SIGNAL OR13(1)
        SIGNAL OR13(2)
        SIGNAL OR13(3)
        SIGNAL OR13(4)
        SIGNAL OR13(5)
        SIGNAL OR13(6)
        SIGNAL OR13(7)
        SIGNAL XLXN_39(7:0)
        SIGNAL Z(7:0)
        SIGNAL En
        SIGNAL XLXN_42
        SIGNAL OR12(5)
        PORT Input B(0:3)
        PORT Input A(0:3)
        PORT Output Z(7:0)
        PORT Input En
        BEGIN BLOCKDEF div_buff
            TIMESTAMP 2004 10 21 2 7 48
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF f_adder
            TIMESTAMP 2004 10 21 1 57 6
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
        END BLOCKDEF
        BEGIN BLOCKDEF twocompl_2
            TIMESTAMP 2004 10 21 2 18 30
            RECTANGLE N 64 -64 320 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF div_inp
            TIMESTAMP 2004 10 21 2 36 46
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF buf4
            TIMESTAMP 2001 5 18 10 41 48
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 64 -128 64 -192 
            LINE N 128 -160 64 -128 
            LINE N 64 -192 128 -160 
            LINE N 64 -192 64 -256 
            LINE N 128 -224 64 -192 
            LINE N 64 -256 128 -224 
            LINE N 224 -224 128 -224 
            LINE N 224 -160 128 -160 
            LINE N 0 -96 64 -96 
            LINE N 224 -96 128 -96 
            LINE N 64 -64 64 -128 
            LINE N 128 -96 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 0 -160 64 -160 
            LINE N 0 -224 64 -224 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF bufe8
            TIMESTAMP 2001 3 9 11 21 49
            RECTANGLE N 128 -44 224 -20 
            LINE N 0 -32 64 -32 
            LINE N 0 -96 64 -96 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 224 -32 128 -32 
            LINE N 96 -96 64 -96 
            LINE N 96 -48 96 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_5 div_buff
            PIN Cin XLXN_8
            PIN A(0:5) XLXN_6(0:5)
            PIN B(0:5) OR3(0:5)
            PIN Z(0:5) IR4(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_12 f_adder
            PIN B(0:5) XLXN_6(0:5)
            PIN A(0:5) Divisor(0:5)
            PIN Z(0:5) OR3(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_13 f_adder
            PIN B(0:5) IR4(0:5)
            PIN A(0:5) Divisor(0:5)
            PIN Z(0:5) OR6(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_14 f_adder
            PIN B(0:5) IR7(0:5)
            PIN A(0:5) Divisor(0:5)
            PIN Z(0:5) OR9(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_15 f_adder
            PIN B(0:5) XLXN_14(0:5)
            PIN A(0:5) Divisor(0:5)
            PIN Z(0:5) OR12(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_16 twocompl_2
            PIN A(0:3) B(0:3)
            PIN Z(0:5) Divisor(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_6 div_buff
            PIN Cin XLXN_9
            PIN A(0:5) IR4(0:5)
            PIN B(0:5) OR6(0:5)
            PIN Z(0:5) IR7(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_8 div_buff
            PIN Cin XLXN_10
            PIN A(0:5) IR7(0:5)
            PIN B(0:5) OR9(0:5)
            PIN Z(0:5) XLXN_14(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_7 div_buff
            PIN Cin XLXN_15
            PIN A(0:5) XLXN_14(0:5)
            PIN B(0:5) OR12(0:5)
            PIN Z(0:5) Modulas(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_17 div_inp
            PIN A(0:3) A(0:3)
            PIN Zo0 XLXN_10
            PIN Zo1 XLXN_9
            PIN Zo2 XLXN_8
            PIN Z(0:5) XLXN_6(0:5)
        END BLOCK
        BEGIN BLOCK XLXI_18 gnd
            PIN G XLXN_15
        END BLOCK
        BEGIN BLOCK XLXI_21 buf4
            PIN I0 Modulas(4)
            PIN I1 Modulas(3)
            PIN I2 Modulas(2)
            PIN I3 Modulas(1)
            PIN O0 OR13(3)
            PIN O1 OR13(2)
            PIN O2 OR13(1)
            PIN O3 OR13(0)
        END BLOCK
        BEGIN BLOCK XLXI_22 buf
            PIN I OR12(5)
            PIN O OR13(4)
        END BLOCK
        BEGIN BLOCK XLXI_23 buf
            PIN I OR6(5)
            PIN O OR13(6)
        END BLOCK
        BEGIN BLOCK XLXI_24 buf
            PIN I OR9(5)
            PIN O OR13(5)
        END BLOCK
        BEGIN BLOCK XLXI_25 buf
            PIN I OR3(5)
            PIN O OR13(7)
        END BLOCK
        BEGIN BLOCK XLXI_26 bufe8
            PIN E En
            PIN I(7:0) OR13(0:7)
            PIN O(7:0) Z(7:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_16 320 1984 R0
        END INSTANCE
        BEGIN BRANCH B(0:3)
            WIRE 176 912 176 1952
            WIRE 176 1952 320 1952
            WIRE 176 912 512 912
            WIRE 272 336 512 336
            WIRE 512 336 512 912
        END BRANCH
        BEGIN INSTANCE XLXI_12 896 1888 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_13 1536 1888 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_14 2176 1888 R0
        END INSTANCE
        BEGIN BRANCH Divisor(0:5)
            WIRE 704 1952 768 1952
            WIRE 768 1952 1472 1952
            WIRE 1472 1952 2128 1952
            WIRE 2128 1952 2768 1952
            WIRE 768 1856 768 1952
            WIRE 768 1856 896 1856
            WIRE 1472 1856 1536 1856
            WIRE 1472 1856 1472 1952
            WIRE 2128 1856 2176 1856
            WIRE 2128 1856 2128 1952
            WIRE 2768 1856 2816 1856
            WIRE 2768 1856 2768 1952
        END BRANCH
        BEGIN INSTANCE XLXI_15 2816 1888 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_5 896 1472 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 1520 1472 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_8 2176 1472 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_7 2816 1472 R0
        END INSTANCE
        BEGIN BRANCH OR3(0:5)
            WIRE 864 1440 896 1440
            WIRE 864 1440 864 1600
            WIRE 864 1600 1328 1600
            WIRE 1328 1600 1360 1600
            WIRE 1360 1600 1360 1792
            WIRE 1280 1792 1360 1792
        END BRANCH
        BEGIN BRANCH OR6(0:5)
            WIRE 1488 1440 1488 1600
            WIRE 1488 1600 1968 1600
            WIRE 1968 1600 2000 1600
            WIRE 2000 1600 2000 1792
            WIRE 1488 1440 1520 1440
            WIRE 1920 1792 2000 1792
        END BRANCH
        BEGIN BRANCH OR9(0:5)
            WIRE 2144 1440 2176 1440
            WIRE 2144 1440 2144 1600
            WIRE 2144 1600 2608 1600
            WIRE 2608 1600 2640 1600
            WIRE 2640 1600 2640 1792
            WIRE 2560 1792 2640 1792
        END BRANCH
        BEGIN BRANCH OR12(0:5)
            WIRE 2800 1440 2816 1440
            WIRE 2800 1440 2800 1600
            WIRE 2800 1600 3232 1600
            WIRE 3232 1600 3232 1600
            WIRE 3232 1600 3264 1600
            WIRE 3264 1600 3264 1792
            WIRE 3200 1792 3264 1792
        END BRANCH
        BEGIN INSTANCE XLXI_17 256 1696 R0
        END INSTANCE
        BEGIN BRANCH XLXN_6(0:5)
            WIRE 640 1664 768 1664
            WIRE 768 1664 768 1792
            WIRE 768 1792 896 1792
            WIRE 768 1376 768 1664
            WIRE 768 1376 896 1376
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 640 1600 752 1600
            WIRE 752 1312 752 1600
            WIRE 752 1312 896 1312
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 640 1536 736 1536
            WIRE 736 1200 736 1536
            WIRE 736 1200 1488 1200
            WIRE 1488 1200 1488 1312
            WIRE 1488 1312 1520 1312
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 640 1472 720 1472
            WIRE 720 1184 720 1472
            WIRE 720 1184 2144 1184
            WIRE 2144 1184 2144 1312
            WIRE 2144 1312 2176 1312
        END BRANCH
        BEGIN BRANCH A(0:3)
            WIRE 224 1280 224 1472
            WIRE 224 1472 256 1472
            WIRE 224 1280 560 1280
            WIRE 288 144 560 144
            WIRE 560 144 560 1280
        END BRANCH
        BEGIN BRANCH IR4(0:5)
            WIRE 1280 1312 1472 1312
            WIRE 1472 1312 1472 1376
            WIRE 1472 1376 1520 1376
            WIRE 1472 1376 1472 1792
            WIRE 1472 1792 1536 1792
        END BRANCH
        BEGIN BRANCH IR7(0:5)
            WIRE 1904 1312 2128 1312
            WIRE 2128 1312 2128 1376
            WIRE 2128 1376 2176 1376
            WIRE 2128 1376 2128 1792
            WIRE 2128 1792 2176 1792
        END BRANCH
        BEGIN BRANCH XLXN_14(0:5)
            WIRE 2560 1312 2768 1312
            WIRE 2768 1312 2768 1376
            WIRE 2768 1376 2816 1376
            WIRE 2768 1376 2768 1792
            WIRE 2768 1792 2816 1792
        END BRANCH
        BEGIN BRANCH XLXN_15
            WIRE 2784 1312 2784 2048
            WIRE 2784 1312 2816 1312
        END BRANCH
        INSTANCE XLXI_18 2720 2176 R0
        BEGIN BRANCH Modulas(0:5)
            WIRE 3200 1312 3280 1312
            WIRE 3280 1312 3344 1312
            WIRE 3344 1312 3408 1312
            WIRE 3408 1312 3472 1312
            WIRE 3472 1312 3504 1312
        END BRANCH
        INSTANCE XLXI_21 3504 944 R270
        INSTANCE XLXI_22 3072 960 R270
        INSTANCE XLXI_24 2640 960 R270
        INSTANCE XLXI_25 1360 960 R270
        INSTANCE XLXI_23 2000 960 R270
        BEGIN BRANCH OR6(5)
            WIRE 1968 960 1968 1472
            WIRE 1968 1472 1968 1504
            BEGIN DISPLAY 1968 1472 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR9(5)
            WIRE 2608 960 2608 1472
            WIRE 2608 1472 2608 1504
            BEGIN DISPLAY 2608 1472 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Modulas(1)
            WIRE 3472 944 3472 1088
            WIRE 3472 1088 3472 1216
            BEGIN DISPLAY 3472 1088 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Modulas(2)
            WIRE 3408 944 3408 1072
            WIRE 3408 1072 3408 1216
            BEGIN DISPLAY 3408 1072 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Modulas(3)
            WIRE 3344 944 3344 1088
            WIRE 3344 1088 3344 1216
            BEGIN DISPLAY 3344 1088 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Modulas(4)
            WIRE 3280 944 3280 1088
            WIRE 3280 1088 3280 1216
            BEGIN DISPLAY 3280 1088 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR3(5)
            WIRE 1328 960 1328 1424
            WIRE 1328 1424 1328 1504
            BEGIN DISPLAY 1328 1424 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR13(0:7)
            WIRE 1120 208 1200 208
            WIRE 1120 208 1120 480
            WIRE 1120 480 1328 480
            WIRE 1328 480 1968 480
            WIRE 1968 480 2608 480
            WIRE 2608 480 3040 480
            WIRE 3040 480 3280 480
            WIRE 3280 480 3344 480
            WIRE 3344 480 3408 480
            WIRE 3408 480 3472 480
            WIRE 3472 480 3504 480
        END BRANCH
        BEGIN BRANCH OR13(0)
            WIRE 3472 576 3472 624
            WIRE 3472 624 3472 720
            BEGIN DISPLAY 3472 624 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR13(1)
            WIRE 3408 576 3408 608
            WIRE 3408 608 3408 720
            BEGIN DISPLAY 3408 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR13(2)
            WIRE 3344 576 3344 608
            WIRE 3344 608 3344 720
            BEGIN DISPLAY 3344 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR13(3)
            WIRE 3280 576 3280 608
            WIRE 3280 608 3280 720
            BEGIN DISPLAY 3280 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR13(4)
            WIRE 3040 576 3040 608
            WIRE 3040 608 3040 736
            BEGIN DISPLAY 3040 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR13(5)
            WIRE 2608 576 2608 608
            WIRE 2608 608 2608 736
            BEGIN DISPLAY 2608 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR13(6)
            WIRE 1968 576 1968 608
            WIRE 1968 608 1968 736
            BEGIN DISPLAY 1968 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OR13(7)
            WIRE 1328 576 1328 608
            WIRE 1328 608 1328 736
            BEGIN DISPLAY 1328 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1328 1600 1328 1504
        INSTANCE XLXI_26 1200 240 R0
        BEGIN BRANCH Z(7:0)
            WIRE 1424 208 1456 208
        END BRANCH
        IOMARKER 1456 208 Z(7:0) R0 28
        BUSTAP 3472 480 3472 576
        BUSTAP 3408 480 3408 576
        BUSTAP 3344 480 3344 576
        BUSTAP 3280 480 3280 576
        BUSTAP 3040 480 3040 576
        BUSTAP 2608 480 2608 576
        BUSTAP 1968 480 1968 576
        BUSTAP 1328 480 1328 576
        BEGIN BRANCH En
            WIRE 704 640 1040 640
            WIRE 1040 144 1040 640
            WIRE 1040 144 1200 144
        END BRANCH
        IOMARKER 704 640 En R180 28
        IOMARKER 288 144 A(0:3) R180 28
        IOMARKER 272 336 B(0:3) R180 28
        BUSTAP 3472 1312 3472 1216
        BUSTAP 3408 1312 3408 1216
        BUSTAP 3344 1312 3344 1216
        BUSTAP 3280 1312 3280 1216
        BUSTAP 1968 1600 1968 1504
        BUSTAP 2608 1600 2608 1504
        BEGIN BRANCH OR12(5)
            WIRE 3040 960 3040 1200
            WIRE 3040 1200 3232 1200
            WIRE 3232 1200 3232 1456
            WIRE 3232 1456 3232 1504
            BEGIN DISPLAY 3232 1456 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 3232 1600 3232 1504
    END SHEET
END SCHEMATIC
