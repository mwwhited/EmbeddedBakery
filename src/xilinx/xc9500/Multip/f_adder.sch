VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL B(0:5)
        SIGNAL A(0:5)
        SIGNAL XLXN_3
        SIGNAL Z(0:5)
        SIGNAL A(0)
        SIGNAL A(1)
        SIGNAL A(2)
        SIGNAL B(0)
        SIGNAL B(1)
        SIGNAL B(2)
        SIGNAL B(3)
        SIGNAL B(4)
        SIGNAL A(3)
        SIGNAL A(4)
        SIGNAL Z(0)
        SIGNAL Z(1)
        SIGNAL Z(2)
        SIGNAL Z(3)
        SIGNAL Z(4)
        SIGNAL Z(5)
        SIGNAL XLXN_23
        PORT Input B(0:5)
        PORT Input A(0:5)
        PORT Output Z(0:5)
        BEGIN BLOCKDEF add4
            TIMESTAMP 2001 5 11 10 37 7
            LINE N 448 -128 384 -128 
            LINE N 448 -64 384 -64 
            LINE N 64 -816 64 -480 
            LINE N 64 -480 144 -448 
            LINE N 144 -448 64 -416 
            LINE N 64 -416 64 -80 
            LINE N 64 -80 384 -160 
            LINE N 384 -160 384 -736 
            LINE N 384 -736 64 -816 
            LINE N 384 -128 336 -128 
            LINE N 336 -128 336 -148 
            LINE N 240 -124 240 -64 
            LINE N 240 -64 384 -64 
            LINE N 0 -704 64 -704 
            LINE N 0 -640 64 -640 
            LINE N 0 -576 64 -576 
            LINE N 0 -512 64 -512 
            LINE N 0 -384 64 -384 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 64 -256 
            LINE N 448 -544 384 -544 
            LINE N 448 -480 384 -480 
            LINE N 448 -416 384 -416 
            LINE N 448 -352 384 -352 
            LINE N 0 -192 64 -192 
            LINE N 0 -832 64 -832 
            LINE N 64 -832 112 -832 
            LINE N 112 -832 112 -804 
        END BLOCKDEF
        BEGIN BLOCKDEF add1
            TIMESTAMP 2001 5 11 10 36 8
            LINE N 384 -256 320 -256 
            LINE N 0 -192 64 -192 
            LINE N 0 -320 64 -320 
            LINE N 192 -64 192 -112 
            LINE N 320 -64 192 -64 
            LINE N 384 -64 320 -64 
            LINE N 0 -448 64 -448 
            LINE N 192 -448 64 -448 
            LINE N 192 -400 192 -448 
            LINE N 320 -368 64 -432 
            LINE N 320 -144 320 -368 
            LINE N 64 -80 320 -144 
            LINE N 64 -240 64 -80 
            LINE N 96 -256 64 -240 
            LINE N 64 -272 96 -256 
            LINE N 64 -432 64 -272 
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
        BEGIN BLOCK XLXI_1 add4
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN B0 B(0)
            PIN B1 B(1)
            PIN B2 B(2)
            PIN B3 B(3)
            PIN CI XLXN_23
            PIN CO XLXN_3
            PIN OFL
            PIN S0 Z(0)
            PIN S1 Z(1)
            PIN S2 Z(2)
            PIN S3 Z(3)
        END BLOCK
        BEGIN BLOCK XLXI_2 add1
            PIN A0 A(4)
            PIN B0 B(4)
            PIN CI XLXN_3
            PIN CO Z(5)
            PIN S0 Z(4)
        END BLOCK
        BEGIN BLOCK XLXI_3 gnd
            PIN G XLXN_23
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1296 1152 R0
        INSTANCE XLXI_2 1872 1536 R0
        BEGIN BRANCH XLXN_3
            WIRE 1744 1088 1872 1088
        END BRANCH
        BEGIN BRANCH Z(0:5)
            WIRE 2560 240 2752 240
            WIRE 2560 240 2560 608
            WIRE 2560 608 2560 672
            WIRE 2560 672 2560 736
            WIRE 2560 736 2560 800
            WIRE 2560 800 2560 1280
            WIRE 2560 1280 2560 1472
            WIRE 2560 1472 2560 1600
        END BRANCH
        IOMARKER 2752 240 Z(0:5) R0 28
        IOMARKER 880 224 B(0:5) R180 28
        BEGIN BRANCH B(0:5)
            WIRE 880 224 1040 224
            WIRE 1040 224 1040 768
            WIRE 1040 768 1040 832
            WIRE 1040 832 1040 896
            WIRE 1040 896 1040 960
            WIRE 1040 960 1040 1344
            WIRE 1040 1344 1040 1600
        END BRANCH
        IOMARKER 560 240 A(0:5) R180 28
        BEGIN BRANCH A(0:5)
            WIRE 560 240 720 240
            WIRE 720 240 720 448
            WIRE 720 448 720 512
            WIRE 720 512 720 576
            WIRE 720 576 720 640
            WIRE 720 640 720 1216
            WIRE 720 1216 720 1216
            WIRE 720 1216 720 1616
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 816 448 832 448
            WIRE 832 448 1296 448
            BEGIN DISPLAY 832 448 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 816 512 848 512
            WIRE 848 512 1296 512
            BEGIN DISPLAY 848 512 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 816 576 848 576
            WIRE 848 576 1296 576
            BEGIN DISPLAY 848 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 816 640 848 640
            WIRE 848 640 1296 640
            BEGIN DISPLAY 848 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 1136 768 1216 768
            WIRE 1216 768 1296 768
            BEGIN DISPLAY 1216 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 1136 832 1216 832
            WIRE 1216 832 1296 832
            BEGIN DISPLAY 1216 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 1136 896 1216 896
            WIRE 1216 896 1296 896
            BEGIN DISPLAY 1216 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 1136 960 1200 960
            WIRE 1200 960 1296 960
            BEGIN DISPLAY 1200 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(4)
            WIRE 1136 1344 1280 1344
            WIRE 1280 1344 1872 1344
            BEGIN DISPLAY 1280 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(4)
            WIRE 816 1216 880 1216
            WIRE 880 1216 1872 1216
            BEGIN DISPLAY 880 1216 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 720 448 816 448
        BUSTAP 720 512 816 512
        BUSTAP 720 576 816 576
        BUSTAP 720 640 816 640
        BUSTAP 1040 768 1136 768
        BUSTAP 1040 832 1136 832
        BUSTAP 1040 896 1136 896
        BUSTAP 1040 960 1136 960
        BUSTAP 1040 1344 1136 1344
        BUSTAP 720 1216 816 1216
        BEGIN BRANCH Z(0)
            WIRE 1744 608 2384 608
            WIRE 2384 608 2464 608
            BEGIN DISPLAY 2384 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 1744 672 2384 672
            WIRE 2384 672 2464 672
            BEGIN DISPLAY 2384 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 1744 736 2384 736
            WIRE 2384 736 2464 736
            BEGIN DISPLAY 2384 736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 1744 800 2384 800
            WIRE 2384 800 2464 800
            BEGIN DISPLAY 2384 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 2256 1280 2400 1280
            WIRE 2400 1280 2464 1280
            BEGIN DISPLAY 2400 1280 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 2256 1472 2384 1472
            WIRE 2384 1472 2464 1472
            BEGIN DISPLAY 2384 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_3 448 528 R0
        BEGIN BRANCH XLXN_23
            WIRE 512 320 1296 320
            WIRE 512 320 512 400
        END BRANCH
        BUSTAP 2560 608 2464 608
        BUSTAP 2560 672 2464 672
        BUSTAP 2560 736 2464 736
        BUSTAP 2560 800 2464 800
        BUSTAP 2560 1280 2464 1280
        BUSTAP 2560 1472 2464 1472
    END SHEET
END SCHEMATIC
