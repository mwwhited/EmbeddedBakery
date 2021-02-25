VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL aout2(0:4)
        SIGNAL aout1(0:4)
        SIGNAL R3(0:3)
        SIGNAL R2(0:3)
        SIGNAL R1(0:3)
        SIGNAL Q(0:7)
        SIGNAL Z(0:7)
        SIGNAL Q(0)
        SIGNAL Q(1)
        SIGNAL Q(2)
        SIGNAL Q(3:7)
        SIGNAL R0(0:4)
        SIGNAL R0(0:3)
        SIGNAL R0(4)
        SIGNAL A(0:3)
        SIGNAL B(3)
        SIGNAL B(2)
        SIGNAL B(1)
        SIGNAL B(0)
        SIGNAL B(0:3)
        SIGNAL En
        PORT Output Z(0:7)
        PORT Input A(0:3)
        PORT Input B(0:3)
        PORT Input En
        BEGIN BLOCKDEF and_row
            TIMESTAMP 2004 10 24 23 57 23
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
        END BLOCKDEF
        BEGIN BLOCKDEF e_adder
            TIMESTAMP 2004 10 24 23 12 5
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCK ea1 e_adder
            PIN A(0:4) R0(0:4)
            PIN B(0:3) R1(0:3)
            PIN Y Q(0)
            PIN Z(0:4) aout1(0:4)
        END BLOCK
        BEGIN BLOCK ar1 and_row
            PIN A(0:3) A(0:3)
            PIN B B(0)
            PIN Z(0:3) R0(0:3)
        END BLOCK
        BEGIN BLOCK ar2 and_row
            PIN A(0:3) A(0:3)
            PIN B B(1)
            PIN Z(0:3) R1(0:3)
        END BLOCK
        BEGIN BLOCK ar3 and_row
            PIN A(0:3) A(0:3)
            PIN B B(2)
            PIN Z(0:3) R2(0:3)
        END BLOCK
        BEGIN BLOCK ar4 and_row
            PIN A(0:3) A(0:3)
            PIN B B(3)
            PIN Z(0:3) R3(0:3)
        END BLOCK
        BEGIN BLOCK ea2 e_adder
            PIN A(0:4) aout1(0:4)
            PIN B(0:3) R2(0:3)
            PIN Y Q(1)
            PIN Z(0:4) aout2(0:4)
        END BLOCK
        BEGIN BLOCK ea3 e_adder
            PIN A(0:4) aout2(0:4)
            PIN B(0:3) R3(0:3)
            PIN Y Q(2)
            PIN Z(0:4) Q(3:7)
        END BLOCK
        BEGIN BLOCK obufz bufe8
            PIN E En
            PIN I(7:0) Q(0:7)
            PIN O(7:0) Z(0:7)
        END BLOCK
        BEGIN BLOCK holdlow gnd
            PIN G R0(4)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE ea1 1696 768 R0
        END INSTANCE
        BEGIN INSTANCE ar2 1056 1088 R0
        END INSTANCE
        BEGIN BRANCH aout2(0:4)
            WIRE 1616 1440 2096 1440
            WIRE 1616 1440 1616 1632
            WIRE 1616 1632 1696 1632
            WIRE 2080 1216 2096 1216
            WIRE 2096 1216 2096 1440
        END BRANCH
        BEGIN BRANCH aout1(0:4)
            WIRE 1632 960 2096 960
            WIRE 1632 960 1632 1152
            WIRE 1632 1152 1696 1152
            WIRE 2080 736 2096 736
            WIRE 2096 736 2096 960
        END BRANCH
        BEGIN BRANCH R3(0:3)
            WIRE 1440 1632 1520 1632
            WIRE 1520 1632 1520 1696
            WIRE 1520 1696 1696 1696
        END BRANCH
        BEGIN BRANCH R2(0:3)
            WIRE 1440 1312 1456 1312
            WIRE 1456 1216 1696 1216
            WIRE 1456 1216 1456 1312
        END BRANCH
        BEGIN BRANCH R1(0:3)
            WIRE 1440 992 1568 992
            WIRE 1568 736 1568 992
            WIRE 1568 736 1696 736
        END BRANCH
        BEGIN INSTANCE ar3 1056 1408 R0
        END INSTANCE
        BEGIN INSTANCE ar4 1056 1728 R0
        END INSTANCE
        BEGIN INSTANCE ea2 1696 1248 R0
        END INSTANCE
        BEGIN INSTANCE ea3 1696 1728 R0
        END INSTANCE
        BEGIN BRANCH Q(0:7)
            WIRE 2400 560 2400 672
            WIRE 2400 672 2400 1152
            WIRE 2400 1152 2400 1632
            WIRE 2400 1632 2400 1696
            WIRE 2400 1696 2400 1856
            WIRE 2400 1856 2672 1856
        END BRANCH
        INSTANCE obufz 2672 1888 R0
        BEGIN BRANCH Z(0:7)
            WIRE 2896 1856 2928 1856
        END BRANCH
        IOMARKER 2928 1856 Z(0:7) R0 28
        BEGIN BRANCH Q(0)
            WIRE 2080 672 2224 672
            WIRE 2224 672 2304 672
            BEGIN DISPLAY 2224 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 2080 1152 2208 1152
            WIRE 2208 1152 2304 1152
            BEGIN DISPLAY 2208 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 2080 1632 2208 1632
            WIRE 2208 1632 2304 1632
            BEGIN DISPLAY 2208 1632 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3:7)
            WIRE 2080 1696 2224 1696
            WIRE 2224 1696 2304 1696
            BEGIN DISPLAY 2224 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH R0(0:4)
            WIRE 1600 240 1600 352
            WIRE 1600 352 1600 480
            WIRE 1600 480 1600 672
            WIRE 1600 672 1696 672
        END BRANCH
        BEGIN BRANCH R0(0:3)
            WIRE 1120 352 1280 352
            WIRE 1280 352 1504 352
            BEGIN DISPLAY 1280 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE holdlow 1216 736 R0
        BEGIN BRANCH R0(4)
            WIRE 1280 480 1280 608
            WIRE 1280 480 1408 480
            WIRE 1408 480 1504 480
            BEGIN DISPLAY 1408 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 352 1504 352
        BUSTAP 1600 480 1504 480
        BEGIN BRANCH A(0:3)
            WIRE 320 160 640 160
            WIRE 640 160 640 352
            WIRE 640 352 640 992
            WIRE 640 992 640 1312
            WIRE 640 1312 640 1632
            WIRE 640 1632 1056 1632
            WIRE 640 1312 1056 1312
            WIRE 640 992 1056 992
            WIRE 640 352 736 352
        END BRANCH
        BEGIN INSTANCE ar1 736 448 R0
        END INSTANCE
        IOMARKER 320 160 A(0:3) R180 28
        BEGIN BRANCH B(3)
            WIRE 496 1696 576 1696
            WIRE 576 1696 1056 1696
            BEGIN DISPLAY 576 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 496 1376 592 1376
            WIRE 592 1376 1056 1376
            BEGIN DISPLAY 592 1376 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 496 1056 576 1056
            WIRE 576 1056 1056 1056
            BEGIN DISPLAY 576 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 496 416 560 416
            WIRE 560 416 736 416
            BEGIN DISPLAY 560 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0:3)
            WIRE 256 1760 400 1760
            WIRE 400 320 400 416
            WIRE 400 416 400 1056
            WIRE 400 1056 400 1376
            WIRE 400 1376 400 1696
            WIRE 400 1696 400 1760
        END BRANCH
        IOMARKER 256 1760 B(0:3) R180 28
        BUSTAP 400 416 496 416
        BUSTAP 400 1056 496 1056
        BUSTAP 400 1376 496 1376
        BUSTAP 400 1696 496 1696
        BEGIN BRANCH En
            WIRE 304 2016 2512 2016
            WIRE 2512 1792 2512 2016
            WIRE 2512 1792 2672 1792
        END BRANCH
        IOMARKER 304 2016 En R180 28
        BUSTAP 2400 672 2304 672
        BUSTAP 2400 1152 2304 1152
        BUSTAP 2400 1696 2304 1696
        BUSTAP 2400 1632 2304 1632
    END SHEET
END SCHEMATIC
