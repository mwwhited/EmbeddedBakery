VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL A3
        SIGNAL A2
        SIGNAL A1
        SIGNAL A0
        SIGNAL B3
        SIGNAL B2
        SIGNAL B1
        SIGNAL B0
        SIGNAL XLXN_19
        SIGNAL XLXN_20
        SIGNAL XLXN_21
        SIGNAL XLXN_22
        SIGNAL XLXN_23
        SIGNAL XLXN_27
        SIGNAL XLXN_28
        SIGNAL XLXN_30
        SIGNAL XLXN_31
        SIGNAL XLXN_32
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL En
        SIGNAL Z4
        SIGNAL Z3
        SIGNAL Z2
        SIGNAL Z1
        SIGNAL Z0
        PORT Input A3
        PORT Input A2
        PORT Input A1
        PORT Input A0
        PORT Input B3
        PORT Input B2
        PORT Input B1
        PORT Input B0
        PORT Input En
        PORT Output Z4
        PORT Output Z3
        PORT Output Z2
        PORT Output Z1
        PORT Output Z0
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
        BEGIN BLOCK XLXI_3 add4
            PIN A0 A0
            PIN A1 A1
            PIN A2 A2
            PIN A3 A3
            PIN B0 XLXN_6
            PIN B1 XLXN_5
            PIN B2 XLXN_4
            PIN B3 XLXN_3
            PIN CI XLXN_28
            PIN CO XLXN_1
            PIN OFL
            PIN S0 XLXN_23
            PIN S1 XLXN_22
            PIN S2 XLXN_21
            PIN S3 XLXN_20
        END BLOCK
        BEGIN BLOCK XLXI_4 add1
            PIN A0 XLXN_28
            PIN B0 XLXN_2
            PIN CI XLXN_1
            PIN CO
            PIN S0 XLXN_19
        END BLOCK
        BEGIN BLOCK XLXI_5 twocompl
            PIN A0 B0
            PIN A1 B1
            PIN A2 B2
            PIN A3 B3
            PIN A4 XLXN_28
            PIN En XLXN_7
            PIN Z0 XLXN_6
            PIN Z1 XLXN_5
            PIN Z2 XLXN_4
            PIN Z3 XLXN_3
            PIN Z4 XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_6 gnd
            PIN G XLXN_28
        END BLOCK
        BEGIN BLOCK XLXI_7 vcc
            PIN P XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_8 twocompl
            PIN A0 XLXN_23
            PIN A1 XLXN_22
            PIN A2 XLXN_21
            PIN A3 XLXN_20
            PIN A4 XLXN_19
            PIN En XLXN_7
            PIN Z0 XLXN_30
            PIN Z1 XLXN_31
            PIN Z2 XLXN_32
            PIN Z3 XLXN_33
            PIN Z4 XLXN_34
        END BLOCK
        BEGIN BLOCK XLXI_9 bufe4
            PIN E En
            PIN I0 XLXN_30
            PIN I1 XLXN_31
            PIN I2 XLXN_32
            PIN I3 XLXN_33
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
        BEGIN BLOCK XLXI_10 bufe
            PIN E En
            PIN I XLXN_34
            PIN O Z4
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_3 1120 1152 R0
        BEGIN BRANCH XLXN_1
            WIRE 1568 1088 1600 1088
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 864 960 1120 960
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 864 896 1120 896
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 864 832 1120 832
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 864 768 1120 768
        END BRANCH
        INSTANCE XLXI_4 1600 1536 R0
        BEGIN BRANCH XLXN_2
            WIRE 864 1024 880 1024
            WIRE 880 1024 880 1344
            WIRE 880 1344 1600 1344
        END BRANCH
        BEGIN INSTANCE XLXI_5 480 1120 R0
        END INSTANCE
        INSTANCE XLXI_7 96 960 R0
        BEGIN BRANCH XLXN_7
            WIRE 160 960 160 1088
            WIRE 160 1088 480 1088
            WIRE 160 1088 160 1520
            WIRE 160 1520 2080 1520
            WIRE 2080 928 2160 928
            WIRE 2080 928 2080 1520
        END BRANCH
        BEGIN BRANCH A3
            WIRE 1088 640 1120 640
        END BRANCH
        IOMARKER 1088 640 A3 R180 28
        BEGIN BRANCH A2
            WIRE 1088 576 1120 576
        END BRANCH
        IOMARKER 1088 576 A2 R180 28
        BEGIN BRANCH A1
            WIRE 1088 512 1120 512
        END BRANCH
        IOMARKER 1088 512 A1 R180 28
        BEGIN BRANCH A0
            WIRE 1088 448 1120 448
        END BRANCH
        IOMARKER 1088 448 A0 R180 28
        BEGIN BRANCH B3
            WIRE 448 960 480 960
        END BRANCH
        IOMARKER 448 960 B3 R180 28
        BEGIN BRANCH B2
            WIRE 448 896 480 896
        END BRANCH
        IOMARKER 448 896 B2 R180 28
        BEGIN BRANCH B1
            WIRE 448 832 480 832
        END BRANCH
        IOMARKER 448 832 B1 R180 28
        BEGIN BRANCH B0
            WIRE 448 768 480 768
        END BRANCH
        IOMARKER 448 768 B0 R180 28
        BEGIN BRANCH XLXN_20
            WIRE 1568 800 2160 800
        END BRANCH
        BEGIN BRANCH XLXN_21
            WIRE 1568 736 2160 736
        END BRANCH
        BEGIN BRANCH XLXN_22
            WIRE 1568 672 2160 672
        END BRANCH
        BEGIN BRANCH XLXN_23
            WIRE 1568 608 2160 608
        END BRANCH
        BEGIN INSTANCE XLXI_8 2160 960 R0
        END INSTANCE
        BEGIN BRANCH XLXN_19
            WIRE 1984 1280 2000 1280
            WIRE 2000 864 2160 864
            WIRE 2000 864 2000 1280
        END BRANCH
        INSTANCE XLXI_6 256 1456 R0
        BEGIN BRANCH XLXN_28
            WIRE 320 320 1120 320
            WIRE 320 320 320 1024
            WIRE 320 1024 320 1216
            WIRE 320 1216 320 1328
            WIRE 320 1216 1600 1216
            WIRE 320 1024 480 1024
        END BRANCH
        INSTANCE XLXI_9 2848 832 R0
        INSTANCE XLXI_10 2848 960 R0
        BEGIN BRANCH XLXN_30
            WIRE 2544 608 2848 608
        END BRANCH
        BEGIN BRANCH XLXN_31
            WIRE 2544 672 2848 672
        END BRANCH
        BEGIN BRANCH XLXN_32
            WIRE 2544 736 2848 736
        END BRANCH
        BEGIN BRANCH XLXN_33
            WIRE 2544 800 2848 800
        END BRANCH
        BEGIN BRANCH XLXN_34
            WIRE 2544 864 2688 864
            WIRE 2688 864 2688 928
            WIRE 2688 928 2848 928
        END BRANCH
        BEGIN BRANCH En
            WIRE 480 1680 2832 1680
            WIRE 2832 544 2848 544
            WIRE 2832 544 2832 864
            WIRE 2832 864 2848 864
            WIRE 2832 864 2832 1680
        END BRANCH
        IOMARKER 480 1680 En R180 28
        BEGIN BRANCH Z4
            WIRE 3072 928 3104 928
        END BRANCH
        IOMARKER 3104 928 Z4 R0 28
        BEGIN BRANCH Z3
            WIRE 3072 800 3104 800
        END BRANCH
        IOMARKER 3104 800 Z3 R0 28
        BEGIN BRANCH Z2
            WIRE 3072 736 3104 736
        END BRANCH
        IOMARKER 3104 736 Z2 R0 28
        BEGIN BRANCH Z1
            WIRE 3072 672 3104 672
        END BRANCH
        IOMARKER 3104 672 Z1 R0 28
        BEGIN BRANCH Z0
            WIRE 3072 608 3104 608
        END BRANCH
        IOMARKER 3104 608 Z0 R0 28
    END SHEET
END SCHEMATIC
