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
        BEGIN SIGNAL A(7)
        END SIGNAL
        BEGIN SIGNAL A(6)
        END SIGNAL
        BEGIN SIGNAL A(5)
        END SIGNAL
        BEGIN SIGNAL A(4)
        END SIGNAL
        BEGIN SIGNAL A(3)
        END SIGNAL
        BEGIN SIGNAL A(2)
        END SIGNAL
        BEGIN SIGNAL A(1)
        END SIGNAL
        BEGIN SIGNAL A(0)
        END SIGNAL
        BEGIN SIGNAL Z(0)
            BEGIN ATTR loc "p44"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(1)
            BEGIN ATTR loc "p43"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(2)
            BEGIN ATTR loc "p41"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(3)
            BEGIN ATTR LOC "p40"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(4)
            BEGIN ATTR LOC "p39"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(5)
            BEGIN ATTR LOC "p37"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(6)
            BEGIN ATTR loc "p36"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(7)
            BEGIN ATTR LOC "p35"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        SIGNAL Z(0:7)
        SIGNAL A(0:7)
        PORT Input Enable
        PORT Output Z(0:7)
        PORT Input A(0:7)
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
            PIN O0 Z(0)
            PIN O1 Z(1)
            PIN O2 Z(2)
            PIN O3 Z(3)
        END BLOCK
        BEGIN BLOCK XLXI_2 obufe4
            PIN E XLXN_9
            PIN I0 XLXN_4
            PIN I1 XLXN_3
            PIN I2 XLXN_2
            PIN I3 XLXN_1
            PIN O0 Z(4)
            PIN O1 Z(5)
            PIN O2 Z(6)
            PIN O3 Z(7)
        END BLOCK
        BEGIN BLOCK XLXI_3 buf4
            PIN I0 A(0)
            PIN I1 A(1)
            PIN I2 A(2)
            PIN I3 A(3)
            PIN O0 XLXN_8
            PIN O1 XLXN_7
            PIN O2 XLXN_6
            PIN O3 XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_4 buf4
            PIN I0 A(4)
            PIN I1 A(5)
            PIN I2 A(6)
            PIN I3 A(7)
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
        BEGIN BRANCH A(7)
            WIRE 1456 1312 1504 1312
            WIRE 1504 1312 1536 1312
            BEGIN DISPLAY 1504 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(6)
            WIRE 1456 1248 1504 1248
            WIRE 1504 1248 1536 1248
            BEGIN DISPLAY 1504 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(5)
            WIRE 1456 1184 1504 1184
            WIRE 1504 1184 1536 1184
            BEGIN DISPLAY 1504 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(4)
            WIRE 1456 1120 1488 1120
            WIRE 1488 1120 1504 1120
            WIRE 1504 1120 1536 1120
            BEGIN DISPLAY 1488 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 1456 832 1488 832
            WIRE 1488 832 1504 832
            WIRE 1504 832 1536 832
            BEGIN DISPLAY 1488 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 1456 768 1488 768
            WIRE 1488 768 1504 768
            WIRE 1504 768 1536 768
            BEGIN DISPLAY 1488 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 1456 704 1488 704
            WIRE 1488 704 1504 704
            WIRE 1504 704 1536 704
            BEGIN DISPLAY 1488 704 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 1456 640 1488 640
            WIRE 1488 640 1504 640
            WIRE 1504 640 1536 640
            BEGIN DISPLAY 1488 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0)
            WIRE 2240 640 2272 640
            WIRE 2272 640 2304 640
            BEGIN DISPLAY 2272 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 2240 704 2272 704
            WIRE 2272 704 2304 704
            BEGIN DISPLAY 2272 704 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 2240 768 2256 768
            WIRE 2256 768 2272 768
            WIRE 2272 768 2304 768
            BEGIN DISPLAY 2256 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 2240 832 2256 832
            WIRE 2256 832 2272 832
            WIRE 2272 832 2304 832
            BEGIN DISPLAY 2256 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 2240 1120 2256 1120
            WIRE 2256 1120 2272 1120
            WIRE 2272 1120 2304 1120
            BEGIN DISPLAY 2256 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 2240 1184 2256 1184
            WIRE 2256 1184 2272 1184
            WIRE 2272 1184 2304 1184
            BEGIN DISPLAY 2256 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(6)
            WIRE 2240 1248 2256 1248
            WIRE 2256 1248 2272 1248
            WIRE 2272 1248 2304 1248
            BEGIN DISPLAY 2256 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(7)
            WIRE 2240 1312 2256 1312
            WIRE 2256 1312 2272 1312
            WIRE 2272 1312 2304 1312
            BEGIN DISPLAY 2256 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0:7)
            WIRE 2400 400 2560 400
            WIRE 2400 400 2400 640
            WIRE 2400 640 2400 704
            WIRE 2400 704 2400 768
            WIRE 2400 768 2400 832
            WIRE 2400 832 2400 1120
            WIRE 2400 1120 2400 1184
            WIRE 2400 1184 2400 1248
            WIRE 2400 1248 2400 1312
            WIRE 2400 1312 2400 1440
        END BRANCH
        IOMARKER 2560 400 Z(0:7) R0 28
        IOMARKER 1200 464 A(0:7) R180 28
        BEGIN BRANCH A(0:7)
            WIRE 1200 464 1360 464
            WIRE 1360 464 1360 640
            WIRE 1360 640 1360 704
            WIRE 1360 704 1360 704
            WIRE 1360 704 1360 768
            WIRE 1360 768 1360 768
            WIRE 1360 768 1360 832
            WIRE 1360 832 1360 832
            WIRE 1360 832 1360 1120
            WIRE 1360 1120 1360 1184
            WIRE 1360 1184 1360 1248
            WIRE 1360 1248 1360 1312
            WIRE 1360 1312 1360 1440
        END BRANCH
        BUSTAP 1360 640 1456 640
        BUSTAP 1360 704 1456 704
        BUSTAP 1360 768 1456 768
        BUSTAP 1360 832 1456 832
        BUSTAP 1360 1120 1456 1120
        BUSTAP 1360 1184 1456 1184
        BUSTAP 1360 1248 1456 1248
        BUSTAP 1360 1312 1456 1312
        BUSTAP 2400 640 2304 640
        BUSTAP 2400 704 2304 704
        BUSTAP 2400 768 2304 768
        BUSTAP 2400 832 2304 832
        BUSTAP 2400 1120 2304 1120
        BUSTAP 2400 1184 2304 1184
        BUSTAP 2400 1248 2304 1248
        BUSTAP 2400 1312 2304 1312
    END SHEET
END SCHEMATIC
