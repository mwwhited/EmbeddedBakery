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
        SIGNAL A8
        SIGNAL A7
        SIGNAL A6
        SIGNAL A5
        SIGNAL A4
        SIGNAL A3
        SIGNAL A2
        SIGNAL A1
        BEGIN SIGNAL Z1
            BEGIN ATTR loc "p44"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z2
            BEGIN ATTR loc "p43"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z3
            BEGIN ATTR loc "p41"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z4
            BEGIN ATTR LOC "p40"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z5
            BEGIN ATTR LOC "p39"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z6
            BEGIN ATTR LOC "p37"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z7
            BEGIN ATTR loc "p36"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z8
            BEGIN ATTR LOC "p35"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        PORT Input Enable
        PORT Input A8
        PORT Input A7
        PORT Input A6
        PORT Input A5
        PORT Input A4
        PORT Input A3
        PORT Input A2
        PORT Input A1
        PORT Output Z1
        PORT Output Z2
        PORT Output Z3
        PORT Output Z4
        PORT Output Z5
        PORT Output Z6
        PORT Output Z7
        PORT Output Z8
        BEGIN BLOCKDEF obufe4
            TIMESTAMP 2001 3 9 11 23 23
            LINE N 0 -288 64 -288 
            LINE N 0 -224 64 -224 
            LINE N 0 -160 64 -160 
            LINE N 0 -96 64 -96 
            LINE N 0 -32 64 -32 
            LINE N 224 -224 128 -224 
            LINE N 224 -160 128 -160 
            LINE N 224 -96 128 -96 
            LINE N 224 -32 128 -32 
            LINE N 96 -176 96 -208 
            LINE N 96 -288 64 -288 
            LINE N 96 -240 96 -288 
            LINE N 96 -112 96 -144 
            LINE N 96 -48 96 -80 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 64 -256 64 -192 
            LINE N 128 -224 64 -256 
            LINE N 64 -192 128 -224 
            LINE N 64 -128 64 -64 
            LINE N 128 -96 64 -128 
            LINE N 64 -64 128 -96 
            LINE N 64 -192 64 -128 
            LINE N 128 -160 64 -192 
            LINE N 64 -128 128 -160 
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
        BEGIN BLOCK XLXI_1 obufe4
            PIN E XLXN_9
            PIN I0 XLXN_8
            PIN I1 XLXN_7
            PIN I2 XLXN_6
            PIN I3 XLXN_5
            PIN O0 Z1
            PIN O1 Z2
            PIN O2 Z3
            PIN O3 Z4
        END BLOCK
        BEGIN BLOCK XLXI_2 obufe4
            PIN E XLXN_9
            PIN I0 XLXN_4
            PIN I1 XLXN_3
            PIN I2 XLXN_2
            PIN I3 XLXN_1
            PIN O0 Z5
            PIN O1 Z6
            PIN O2 Z7
            PIN O3 Z8
        END BLOCK
        BEGIN BLOCK XLXI_3 buf4
            PIN I0 A1
            PIN I1 A2
            PIN I2 A3
            PIN I3 A4
            PIN O0 XLXN_8
            PIN O1 XLXN_7
            PIN O2 XLXN_6
            PIN O3 XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_4 buf4
            PIN I0 A5
            PIN I1 A6
            PIN I2 A7
            PIN I3 A8
            PIN O0 XLXN_4
            PIN O1 XLXN_3
            PIN O2 XLXN_2
            PIN O3 XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_5 buf
            PIN I Enable
            PIN O XLXN_9
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 2016 864 R0
        INSTANCE XLXI_2 2016 1344 R0
        INSTANCE XLXI_3 1536 864 R0
        INSTANCE XLXI_4 1536 1344 R0
        INSTANCE XLXI_5 1536 1632 R0
        BEGIN BRANCH XLXN_1
            WIRE 1760 1312 2016 1312
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 1760 1248 2016 1248
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1760 1184 2016 1184
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1760 1120 2016 1120
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1760 832 2016 832
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1760 768 2016 768
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1760 704 2016 704
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1760 640 2016 640
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 1760 1600 1888 1600
            WIRE 1888 576 2016 576
            WIRE 1888 576 1888 1056
            WIRE 1888 1056 1888 1600
            WIRE 1888 1056 2016 1056
        END BRANCH
        BEGIN BRANCH Enable
            WIRE 1504 1600 1536 1600
        END BRANCH
        IOMARKER 1504 1600 Enable R180 28
        BEGIN BRANCH A8
            WIRE 1504 1312 1536 1312
        END BRANCH
        IOMARKER 1504 1312 A8 R180 28
        BEGIN BRANCH A7
            WIRE 1504 1248 1536 1248
        END BRANCH
        IOMARKER 1504 1248 A7 R180 28
        BEGIN BRANCH A6
            WIRE 1504 1184 1536 1184
        END BRANCH
        IOMARKER 1504 1184 A6 R180 28
        BEGIN BRANCH A5
            WIRE 1504 1120 1536 1120
        END BRANCH
        IOMARKER 1504 1120 A5 R180 28
        BEGIN BRANCH A4
            WIRE 1504 832 1536 832
        END BRANCH
        IOMARKER 1504 832 A4 R180 28
        BEGIN BRANCH A3
            WIRE 1504 768 1536 768
        END BRANCH
        IOMARKER 1504 768 A3 R180 28
        BEGIN BRANCH A2
            WIRE 1504 704 1536 704
        END BRANCH
        IOMARKER 1504 704 A2 R180 28
        BEGIN BRANCH A1
            WIRE 1504 640 1536 640
        END BRANCH
        IOMARKER 1504 640 A1 R180 28
        BEGIN BRANCH Z1
            WIRE 2240 640 2272 640
        END BRANCH
        IOMARKER 2272 640 Z1 R0 28
        BEGIN BRANCH Z2
            WIRE 2240 704 2272 704
        END BRANCH
        IOMARKER 2272 704 Z2 R0 28
        BEGIN BRANCH Z3
            WIRE 2240 768 2272 768
        END BRANCH
        IOMARKER 2272 768 Z3 R0 28
        BEGIN BRANCH Z4
            WIRE 2240 832 2272 832
        END BRANCH
        IOMARKER 2272 832 Z4 R0 28
        BEGIN BRANCH Z5
            WIRE 2240 1120 2272 1120
        END BRANCH
        IOMARKER 2272 1120 Z5 R0 28
        BEGIN BRANCH Z6
            WIRE 2240 1184 2272 1184
        END BRANCH
        IOMARKER 2272 1184 Z6 R0 28
        BEGIN BRANCH Z7
            WIRE 2240 1248 2272 1248
        END BRANCH
        IOMARKER 2272 1248 Z7 R0 28
        BEGIN BRANCH Z8
            WIRE 2240 1312 2272 1312
        END BRANCH
        IOMARKER 2272 1312 Z8 R0 28
    END SHEET
END SCHEMATIC
