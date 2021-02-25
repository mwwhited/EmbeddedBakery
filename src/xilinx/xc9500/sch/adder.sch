VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL B3
        SIGNAL B2
        SIGNAL B1
        SIGNAL B0
        SIGNAL A3
        SIGNAL A2
        SIGNAL A1
        SIGNAL A0
        SIGNAL XLXN_14
        SIGNAL XLXN_15
        SIGNAL En
        SIGNAL Z4
        SIGNAL Z3
        SIGNAL Z2
        SIGNAL Z1
        SIGNAL Z0
        PORT Input B3
        PORT Input B2
        PORT Input B1
        PORT Input B0
        PORT Input A3
        PORT Input A2
        PORT Input A1
        PORT Input A0
        PORT Input En
        PORT Output Z4
        PORT Output Z3
        PORT Output Z2
        PORT Output Z1
        PORT Output Z0
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
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
        BEGIN BLOCK XLXI_1 add4
            PIN A0 A0
            PIN A1 A1
            PIN A2 A2
            PIN A3 A3
            PIN B0 B0
            PIN B1 B1
            PIN B2 B2
            PIN B3 B3
            PIN CI XLXN_14
            PIN CO XLXN_15
            PIN OFL
            PIN S0 XLXN_5
            PIN S1 XLXN_4
            PIN S2 XLXN_3
            PIN S3 XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_3 gnd
            PIN G XLXN_14
        END BLOCK
        BEGIN BLOCK XLXI_4 bufe4
            PIN E En
            PIN I0 XLXN_5
            PIN I1 XLXN_4
            PIN I2 XLXN_3
            PIN I3 XLXN_2
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
        BEGIN BLOCK XLXI_5 bufe
            PIN E En
            PIN I XLXN_15
            PIN O Z4
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1280 1152 R0
        BEGIN BRANCH XLXN_2
            WIRE 1728 800 2080 800
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1728 736 2080 736
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1728 672 2080 672
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1728 608 2080 608
        END BRANCH
        BEGIN BRANCH B3
            WIRE 1248 960 1280 960
        END BRANCH
        IOMARKER 1248 960 B3 R180 28
        BEGIN BRANCH B2
            WIRE 1248 896 1280 896
        END BRANCH
        IOMARKER 1248 896 B2 R180 28
        BEGIN BRANCH B1
            WIRE 1248 832 1280 832
        END BRANCH
        IOMARKER 1248 832 B1 R180 28
        BEGIN BRANCH B0
            WIRE 1248 768 1280 768
        END BRANCH
        IOMARKER 1248 768 B0 R180 28
        BEGIN BRANCH A3
            WIRE 1248 640 1280 640
        END BRANCH
        IOMARKER 1248 640 A3 R180 28
        BEGIN BRANCH A2
            WIRE 1248 576 1280 576
        END BRANCH
        IOMARKER 1248 576 A2 R180 28
        BEGIN BRANCH A1
            WIRE 1248 512 1280 512
        END BRANCH
        IOMARKER 1248 512 A1 R180 28
        BEGIN BRANCH A0
            WIRE 1248 448 1280 448
        END BRANCH
        IOMARKER 1248 448 A0 R180 28
        BEGIN BRANCH XLXN_14
            WIRE 880 320 880 384
            WIRE 880 320 1280 320
        END BRANCH
        INSTANCE XLXI_3 816 512 R0
        INSTANCE XLXI_4 2080 832 R0
        BEGIN BRANCH XLXN_15
            WIRE 1728 1088 2080 1088
        END BRANCH
        BEGIN BRANCH En
            WIRE 1280 1200 2016 1200
            WIRE 2016 544 2080 544
            WIRE 2016 544 2016 1024
            WIRE 2016 1024 2080 1024
            WIRE 2016 1024 2016 1200
        END BRANCH
        INSTANCE XLXI_5 2080 1120 R0
        IOMARKER 1280 1200 En R180 28
        BEGIN BRANCH Z4
            WIRE 2304 1088 2336 1088
        END BRANCH
        IOMARKER 2336 1088 Z4 R0 28
        BEGIN BRANCH Z3
            WIRE 2304 800 2336 800
        END BRANCH
        IOMARKER 2336 800 Z3 R0 28
        BEGIN BRANCH Z2
            WIRE 2304 736 2336 736
        END BRANCH
        IOMARKER 2336 736 Z2 R0 28
        BEGIN BRANCH Z1
            WIRE 2304 672 2336 672
        END BRANCH
        IOMARKER 2336 672 Z1 R0 28
        BEGIN BRANCH Z0
            WIRE 2304 608 2336 608
        END BRANCH
        IOMARKER 2336 608 Z0 R0 28
    END SHEET
END SCHEMATIC
