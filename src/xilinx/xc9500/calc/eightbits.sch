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
        SIGNAL XLXN_9
        SIGNAL Enable
        BEGIN SIGNAL A8
            BEGIN ATTR LOC "p70"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A7
            BEGIN ATTR LOC "p66"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A6
            BEGIN ATTR LOC "p71"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A5
            BEGIN ATTR LOC "p72"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A4
            BEGIN ATTR LOC "p5"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A3
            BEGIN ATTR LOC "p11"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A2
            BEGIN ATTR LOC "p7"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A1
            BEGIN ATTR LOC "p6"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        SIGNAL Z0
        SIGNAL Z1
        SIGNAL Z2
        SIGNAL Z3
        SIGNAL Z4
        SIGNAL Z5
        SIGNAL Z6
        SIGNAL Z7
        PORT Input Enable
        PORT Input A8
        PORT Input A7
        PORT Input A6
        PORT Input A5
        PORT Input A4
        PORT Input A3
        PORT Input A2
        PORT Input A1
        PORT Output Z0
        PORT Output Z1
        PORT Output Z2
        PORT Output Z3
        PORT Output Z4
        PORT Output Z5
        PORT Output Z6
        PORT Output Z7
        BEGIN BLOCKDEF ibuf4
            TIMESTAMP 2001 3 9 11 23 23
            LINE N 0 -224 64 -224 
            LINE N 224 -160 128 -160 
            LINE N 0 -32 64 -32 
            LINE N 64 -192 64 -256 
            LINE N 128 -224 64 -192 
            LINE N 64 -256 128 -224 
            LINE N 64 -128 64 -192 
            LINE N 128 -160 64 -128 
            LINE N 64 -192 128 -160 
            LINE N 64 -64 64 -128 
            LINE N 128 -96 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -96 64 -96 
            LINE N 0 -160 64 -160 
            LINE N 224 -224 128 -224 
            LINE N 224 -96 128 -96 
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
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_3 ibuf4
            PIN I0 A1
            PIN I1 A2
            PIN I2 A3
            PIN I3 A4
            PIN O0 XLXN_2
            PIN O1 XLXN_3
            PIN O2 XLXN_4
            PIN O3 XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_4 ibuf4
            PIN I0 A5
            PIN I1 A6
            PIN I2 A7
            PIN I3 A8
            PIN O0 XLXN_6
            PIN O1 XLXN_7
            PIN O2 XLXN_8
            PIN O3 XLXN_9
        END BLOCK
        BEGIN BLOCK XLXI_6 bufe4
            PIN E XLXN_1
            PIN I0 XLXN_6
            PIN I1 XLXN_7
            PIN I2 XLXN_8
            PIN I3 XLXN_9
            PIN O0 Z4
            PIN O1 Z5
            PIN O2 Z6
            PIN O3 Z7
        END BLOCK
        BEGIN BLOCK XLXI_7 bufe4
            PIN E XLXN_1
            PIN I0 XLXN_2
            PIN I1 XLXN_3
            PIN I2 XLXN_4
            PIN I3 XLXN_5
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
        BEGIN BLOCK XLXI_8 buf
            PIN I Enable
            PIN O XLXN_1
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_3 1376 704 R0
        INSTANCE XLXI_4 1376 1184 R0
        BEGIN BRANCH XLXN_1
            WIRE 1600 1440 1808 1440
            WIRE 1808 416 2016 416
            WIRE 1808 416 1808 896
            WIRE 1808 896 1808 1440
            WIRE 1808 896 2016 896
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 1600 480 2016 480
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1600 544 2016 544
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1600 608 2016 608
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1600 672 2016 672
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1600 960 2016 960
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1600 1024 2016 1024
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1600 1088 2016 1088
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 1600 1152 2016 1152
        END BRANCH
        BEGIN BRANCH Enable
            WIRE 1344 1440 1376 1440
        END BRANCH
        IOMARKER 1344 1440 Enable R180 28
        BEGIN BRANCH A8
            WIRE 1344 1152 1376 1152
        END BRANCH
        IOMARKER 1344 1152 A8 R180 28
        BEGIN BRANCH A7
            WIRE 1344 1088 1376 1088
        END BRANCH
        IOMARKER 1344 1088 A7 R180 28
        BEGIN BRANCH A6
            WIRE 1344 1024 1376 1024
        END BRANCH
        IOMARKER 1344 1024 A6 R180 28
        BEGIN BRANCH A5
            WIRE 1344 960 1376 960
        END BRANCH
        IOMARKER 1344 960 A5 R180 28
        BEGIN BRANCH A4
            WIRE 1344 672 1376 672
        END BRANCH
        IOMARKER 1344 672 A4 R180 28
        BEGIN BRANCH A3
            WIRE 1344 608 1376 608
        END BRANCH
        IOMARKER 1344 608 A3 R180 28
        BEGIN BRANCH A2
            WIRE 1344 544 1376 544
        END BRANCH
        IOMARKER 1344 544 A2 R180 28
        BEGIN BRANCH A1
            WIRE 1344 480 1376 480
        END BRANCH
        IOMARKER 1344 480 A1 R180 28
        BEGIN BRANCH Z0
            WIRE 2240 480 2272 480
        END BRANCH
        IOMARKER 2272 480 Z0 R0 28
        BEGIN BRANCH Z1
            WIRE 2240 544 2272 544
        END BRANCH
        IOMARKER 2272 544 Z1 R0 28
        BEGIN BRANCH Z2
            WIRE 2240 608 2272 608
        END BRANCH
        IOMARKER 2272 608 Z2 R0 28
        BEGIN BRANCH Z3
            WIRE 2240 672 2272 672
        END BRANCH
        IOMARKER 2272 672 Z3 R0 28
        BEGIN BRANCH Z4
            WIRE 2240 960 2272 960
        END BRANCH
        IOMARKER 2272 960 Z4 R0 28
        BEGIN BRANCH Z5
            WIRE 2240 1024 2272 1024
        END BRANCH
        IOMARKER 2272 1024 Z5 R0 28
        BEGIN BRANCH Z6
            WIRE 2240 1088 2272 1088
        END BRANCH
        IOMARKER 2272 1088 Z6 R0 28
        BEGIN BRANCH Z7
            WIRE 2240 1152 2272 1152
        END BRANCH
        IOMARKER 2272 1152 Z7 R0 28
        INSTANCE XLXI_6 2016 1184 R0
        INSTANCE XLXI_7 2016 704 R0
        INSTANCE XLXI_8 1376 1472 R0
    END SHEET
END SCHEMATIC
