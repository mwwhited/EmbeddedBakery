VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL y4
        SIGNAL y3
        SIGNAL y2
        SIGNAL y1
        SIGNAL y0
        SIGNAL holdhigh
        BEGIN SIGNAL A(3)
        END SIGNAL
        BEGIN SIGNAL A(2)
        END SIGNAL
        BEGIN SIGNAL A(1)
        END SIGNAL
        BEGIN SIGNAL A(0)
        END SIGNAL
        SIGNAL q4
        SIGNAL q3
        SIGNAL q2
        SIGNAL q1
        SIGNAL q0
        SIGNAL holdlow
        SIGNAL XLXN_30
        SIGNAL XLXN_31
        SIGNAL XLXN_32
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL En
        BEGIN SIGNAL Z(4)
        END SIGNAL
        BEGIN SIGNAL Z(3)
        END SIGNAL
        BEGIN SIGNAL Z(2)
        END SIGNAL
        BEGIN SIGNAL Z(1)
        END SIGNAL
        BEGIN SIGNAL Z(0)
        END SIGNAL
        SIGNAL XLXN_35
        SIGNAL XLXN_37
        SIGNAL Z(0:4)
        SIGNAL A(0:3)
        SIGNAL B(0:3)
        SIGNAL B(0)
        SIGNAL B(1)
        SIGNAL B(2)
        SIGNAL XLXN_44
        SIGNAL B(3)
        PORT Input En
        PORT Output Z(0:4)
        PORT Input A(0:3)
        PORT Input B(0:3)
        BEGIN BLOCKDEF twocompl
            TIMESTAMP 2004 10 18 23 21 0
            RECTANGLE N 64 -384 320 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
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
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 96 -64 32 -64 
            LINE N 64 0 64 -32 
            LINE N 64 -32 64 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF bufe4
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -224 64 -224 
            LINE N 224 -224 128 -224 
            LINE N 96 -288 64 -288 
            LINE N 96 -240 96 -288 
            LINE N 0 -288 64 -288 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 64 -128 64 -64 
            LINE N 128 -96 64 -128 
            LINE N 64 -64 128 -96 
            LINE N 64 -192 64 -128 
            LINE N 128 -160 64 -192 
            LINE N 64 -128 128 -160 
            LINE N 64 -256 64 -192 
            LINE N 128 -224 64 -256 
            LINE N 64 -192 128 -224 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -96 64 -96 
            LINE N 224 -96 128 -96 
            LINE N 0 -160 64 -160 
            LINE N 224 -160 128 -160 
            LINE N 96 -176 96 -208 
            LINE N 96 -112 96 -144 
            LINE N 96 -48 96 -80 
        END BLOCKDEF
        BEGIN BLOCKDEF bufe
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 96 -96 64 -96 
            LINE N 96 -48 96 -96 
            LINE N 0 -96 64 -96 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCK add_0 add4
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN B0 y0
            PIN B1 y1
            PIN B2 y2
            PIN B3 y3
            PIN CI holdlow
            PIN CO XLXN_1
            PIN OFL
            PIN S0 q0
            PIN S1 q1
            PIN S2 q2
            PIN S3 q3
        END BLOCK
        BEGIN BLOCK add_1 add1
            PIN A0 holdlow
            PIN B0 y4
            PIN CI XLXN_1
            PIN CO
            PIN S0 q4
        END BLOCK
        BEGIN BLOCK XLXI_5 twocompl
            PIN A0 B(0)
            PIN A1 B(1)
            PIN A2 B(2)
            PIN A3 B(3)
            PIN A4 holdlow
            PIN En holdhigh
            PIN Z0 y0
            PIN Z1 y1
            PIN Z2 y2
            PIN Z3 y3
            PIN Z4 y4
        END BLOCK
        BEGIN BLOCK XLXI_6 gnd
            PIN G holdlow
        END BLOCK
        BEGIN BLOCK XLXI_7 vcc
            PIN P holdhigh
        END BLOCK
        BEGIN BLOCK o_buf0 bufe4
            PIN E En
            PIN I0 q0
            PIN I1 q1
            PIN I2 q2
            PIN I3 q3
            PIN O0 Z(0)
            PIN O1 Z(1)
            PIN O2 Z(2)
            PIN O3 Z(3)
        END BLOCK
        BEGIN BLOCK o_buf1 bufe
            PIN E En
            PIN I q4
            PIN O Z(4)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE add_0 1120 1152 R0
        BEGIN BRANCH XLXN_1
            WIRE 1568 1088 1600 1088
        END BRANCH
        BEGIN BRANCH y3
            WIRE 1040 960 1120 960
        END BRANCH
        BEGIN BRANCH y2
            WIRE 1040 896 1120 896
        END BRANCH
        BEGIN BRANCH y1
            WIRE 1040 832 1120 832
        END BRANCH
        BEGIN BRANCH y0
            WIRE 1040 768 1120 768
        END BRANCH
        INSTANCE add_1 1600 1536 R0
        BEGIN BRANCH holdhigh
            WIRE 80 960 80 1088
            WIRE 80 1088 656 1088
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 976 640 1056 640
            WIRE 1056 640 1120 640
            BEGIN DISPLAY 1056 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 976 576 1056 576
            WIRE 1056 576 1120 576
            BEGIN DISPLAY 1056 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 976 512 1072 512
            WIRE 1072 512 1120 512
            BEGIN DISPLAY 1072 512 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 976 448 1056 448
            WIRE 1056 448 1120 448
            BEGIN DISPLAY 1056 448 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q3
            WIRE 1568 800 2848 800
        END BRANCH
        BEGIN BRANCH q2
            WIRE 1568 736 2848 736
        END BRANCH
        BEGIN BRANCH q1
            WIRE 1568 672 2848 672
        END BRANCH
        BEGIN BRANCH q0
            WIRE 1568 608 2848 608
        END BRANCH
        BEGIN BRANCH q4
            WIRE 1984 1280 2000 1280
            WIRE 2000 928 2000 1280
            WIRE 2000 928 2848 928
        END BRANCH
        BEGIN BRANCH holdlow
            WIRE 160 320 160 1024
            WIRE 160 1024 160 1216
            WIRE 160 1216 160 1360
            WIRE 160 1216 1600 1216
            WIRE 160 1024 656 1024
            WIRE 160 320 1120 320
        END BRANCH
        INSTANCE o_buf0 2848 832 R0
        INSTANCE o_buf1 2848 960 R0
        BEGIN BRANCH En
            WIRE 480 1680 2832 1680
            WIRE 2832 544 2848 544
            WIRE 2832 544 2832 864
            WIRE 2832 864 2848 864
            WIRE 2832 864 2832 1680
        END BRANCH
        IOMARKER 480 1680 En R180 28
        BEGIN BRANCH Z(4)
            WIRE 3072 928 3120 928
            WIRE 3120 928 3184 928
            BEGIN DISPLAY 3120 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 3072 800 3120 800
            WIRE 3120 800 3184 800
            BEGIN DISPLAY 3120 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 3072 736 3104 736
            WIRE 3104 736 3184 736
            BEGIN DISPLAY 3104 736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 3072 672 3104 672
            WIRE 3104 672 3184 672
            BEGIN DISPLAY 3104 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0)
            WIRE 3072 608 3120 608
            WIRE 3120 608 3184 608
            BEGIN DISPLAY 3120 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_5 656 1120 R0
        END INSTANCE
        BEGIN BRANCH y4
            WIRE 1040 1024 1072 1024
            WIRE 1072 1024 1072 1344
            WIRE 1072 1344 1600 1344
        END BRANCH
        INSTANCE XLXI_7 16 960 R0
        INSTANCE XLXI_6 96 1488 R0
        BEGIN BRANCH Z(0:4)
            WIRE 3280 480 3360 480
            WIRE 3280 480 3280 608
            WIRE 3280 608 3280 672
            WIRE 3280 672 3280 736
            WIRE 3280 736 3280 800
            WIRE 3280 800 3280 928
            WIRE 3280 928 3280 1040
        END BRANCH
        IOMARKER 3360 480 Z(0:4) R0 28
        BUSTAP 3280 608 3184 608
        BUSTAP 3280 672 3184 672
        BUSTAP 3280 736 3184 736
        BUSTAP 3280 800 3184 800
        BUSTAP 3280 928 3184 928
        BEGIN BRANCH A(0:3)
            WIRE 800 240 880 240
            WIRE 880 240 880 448
            WIRE 880 448 880 512
            WIRE 880 512 880 576
            WIRE 880 576 880 640
            WIRE 880 640 880 672
        END BRANCH
        BUSTAP 880 448 976 448
        BUSTAP 880 512 976 512
        BUSTAP 880 576 976 576
        BUSTAP 880 640 976 640
        IOMARKER 800 240 A(0:3) R180 28
        BEGIN BRANCH B(0:3)
            WIRE 320 720 400 720
            WIRE 400 720 400 768
            WIRE 400 768 400 832
            WIRE 400 832 400 896
            WIRE 400 896 400 960
            WIRE 400 960 400 992
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 496 768 592 768
            WIRE 592 768 656 768
            BEGIN DISPLAY 592 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 496 832 592 832
            WIRE 592 832 656 832
            BEGIN DISPLAY 592 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 496 896 592 896
            WIRE 592 896 656 896
            BEGIN DISPLAY 592 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 496 960 592 960
            WIRE 592 960 656 960
            BEGIN DISPLAY 592 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 400 768 496 768
        BUSTAP 400 832 496 832
        BUSTAP 400 896 496 896
        BUSTAP 400 960 496 960
        IOMARKER 320 720 B(0:3) R180 28
    END SHEET
END SCHEMATIC
