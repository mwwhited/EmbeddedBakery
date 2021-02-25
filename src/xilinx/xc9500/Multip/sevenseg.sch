VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL XLXN_11
        BEGIN SIGNAL A(0)
        END SIGNAL
        BEGIN SIGNAL A(1)
        END SIGNAL
        BEGIN SIGNAL A(2)
        END SIGNAL
        BEGIN SIGNAL A(3)
        END SIGNAL
        BEGIN SIGNAL A(4)
        END SIGNAL
        BEGIN SIGNAL A(5)
        END SIGNAL
        BEGIN SIGNAL A(6)
        END SIGNAL
        BEGIN SIGNAL A(7)
        END SIGNAL
        BEGIN SIGNAL Z(0)
            BEGIN ATTR LOC "p15"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(1)
            BEGIN ATTR LOC "p18"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(2)
            BEGIN ATTR LOC "p23"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(3)
            BEGIN ATTR LOC "p21"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(4)
            BEGIN ATTR LOC "p19"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(5)
            BEGIN ATTR LOC "p14"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(6)
            BEGIN ATTR LOC "p17"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Z(7)
            BEGIN ATTR LOC "p24"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        SIGNAL En
        SIGNAL A(0:7)
        SIGNAL Z(0:7)
        PORT Input En
        PORT Input A(0:7)
        PORT Output Z(0:7)
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
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
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
        BEGIN BLOCK XLXI_4 obufe4
            PIN E XLXN_11
            PIN I0 XLXN_3
            PIN I1 XLXN_4
            PIN I2 XLXN_5
            PIN I3 XLXN_6
            PIN O0 Z(0)
            PIN O1 Z(1)
            PIN O2 Z(2)
            PIN O3 Z(3)
        END BLOCK
        BEGIN BLOCK XLXI_5 obufe4
            PIN E XLXN_11
            PIN I0 XLXN_7
            PIN I1 XLXN_8
            PIN I2 XLXN_9
            PIN I3 XLXN_10
            PIN O0 Z(4)
            PIN O1 Z(5)
            PIN O2 Z(6)
            PIN O3 Z(7)
        END BLOCK
        BEGIN BLOCK XLXI_14 buf
            PIN I En
            PIN O XLXN_11
        END BLOCK
        BEGIN BLOCK XLXI_15 buf4
            PIN I0 A(4)
            PIN I1 A(5)
            PIN I2 A(6)
            PIN I3 A(7)
            PIN O0 XLXN_7
            PIN O1 XLXN_8
            PIN O2 XLXN_9
            PIN O3 XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_16 buf4
            PIN I0 A(0)
            PIN I1 A(1)
            PIN I2 A(2)
            PIN I3 A(3)
            PIN O0 XLXN_3
            PIN O1 XLXN_4
            PIN O2 XLXN_5
            PIN O3 XLXN_6
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_4 2080 1344 R0
        INSTANCE XLXI_5 2080 1824 R0
        BEGIN BRANCH XLXN_3
            WIRE 1504 1120 2080 1120
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1504 1184 2080 1184
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1504 1248 2080 1248
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1504 1312 2080 1312
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1504 1600 2080 1600
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1504 1664 2080 1664
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 1504 1728 2080 1728
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 1504 1792 2080 1792
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 1216 1120 1232 1120
            WIRE 1232 1120 1248 1120
            WIRE 1248 1120 1280 1120
            BEGIN DISPLAY 1232 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 1216 1184 1232 1184
            WIRE 1232 1184 1248 1184
            WIRE 1248 1184 1280 1184
            BEGIN DISPLAY 1232 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 1216 1248 1248 1248
            WIRE 1248 1248 1280 1248
            BEGIN DISPLAY 1248 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 1216 1312 1232 1312
            WIRE 1232 1312 1248 1312
            WIRE 1248 1312 1280 1312
            BEGIN DISPLAY 1232 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(4)
            WIRE 1216 1600 1248 1600
            WIRE 1248 1600 1280 1600
            BEGIN DISPLAY 1248 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(5)
            WIRE 1216 1664 1248 1664
            WIRE 1248 1664 1280 1664
            BEGIN DISPLAY 1248 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(6)
            WIRE 1216 1728 1248 1728
            WIRE 1248 1728 1280 1728
            BEGIN DISPLAY 1248 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(7)
            WIRE 1216 1792 1248 1792
            WIRE 1248 1792 1280 1792
            BEGIN DISPLAY 1248 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0)
            WIRE 2304 1120 2320 1120
            WIRE 2320 1120 2336 1120
            WIRE 2336 1120 2384 1120
            BEGIN DISPLAY 2320 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 2304 1184 2320 1184
            WIRE 2320 1184 2336 1184
            WIRE 2336 1184 2384 1184
            BEGIN DISPLAY 2320 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 2304 1248 2320 1248
            WIRE 2320 1248 2336 1248
            WIRE 2336 1248 2384 1248
            BEGIN DISPLAY 2320 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 2304 1312 2336 1312
            WIRE 2336 1312 2384 1312
            BEGIN DISPLAY 2336 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 2304 1600 2320 1600
            WIRE 2320 1600 2336 1600
            WIRE 2336 1600 2384 1600
            BEGIN DISPLAY 2320 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 2304 1664 2320 1664
            WIRE 2320 1664 2336 1664
            WIRE 2336 1664 2384 1664
            BEGIN DISPLAY 2320 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(6)
            WIRE 2304 1728 2320 1728
            WIRE 2320 1728 2336 1728
            WIRE 2336 1728 2384 1728
            BEGIN DISPLAY 2320 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(7)
            WIRE 2304 1792 2320 1792
            WIRE 2320 1792 2336 1792
            WIRE 2336 1792 2384 1792
            BEGIN DISPLAY 2320 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH En
            WIRE 1248 1984 1280 1984
        END BRANCH
        IOMARKER 1248 1984 En R180 28
        BEGIN BRANCH XLXN_11
            WIRE 1504 1984 1760 1984
            WIRE 1760 1056 1760 1536
            WIRE 1760 1536 2080 1536
            WIRE 1760 1056 2080 1056
            WIRE 1760 1056 1760 1984
        END BRANCH
        INSTANCE XLXI_14 1280 2016 R0
        INSTANCE XLXI_15 1280 1824 R0
        INSTANCE XLXI_16 1280 1344 R0
        BEGIN BRANCH A(0:7)
            WIRE 960 960 1120 960
            WIRE 1120 960 1120 1120
            WIRE 1120 1120 1120 1184
            WIRE 1120 1184 1120 1248
            WIRE 1120 1248 1120 1312
            WIRE 1120 1312 1120 1600
            WIRE 1120 1600 1120 1664
            WIRE 1120 1664 1120 1728
            WIRE 1120 1728 1120 1792
            WIRE 1120 1792 1120 1840
        END BRANCH
        BEGIN BRANCH Z(0:7)
            WIRE 2480 880 2640 880
            WIRE 2480 880 2480 1120
            WIRE 2480 1120 2480 1120
            WIRE 2480 1120 2480 1184
            WIRE 2480 1184 2480 1184
            WIRE 2480 1184 2480 1248
            WIRE 2480 1248 2480 1248
            WIRE 2480 1248 2480 1312
            WIRE 2480 1312 2480 1600
            WIRE 2480 1600 2480 1600
            WIRE 2480 1600 2480 1664
            WIRE 2480 1664 2480 1664
            WIRE 2480 1664 2480 1728
            WIRE 2480 1728 2480 1728
            WIRE 2480 1728 2480 1792
            WIRE 2480 1792 2480 1792
            WIRE 2480 1792 2480 1840
        END BRANCH
        IOMARKER 2640 880 Z(0:7) R0 28
        IOMARKER 960 960 A(0:7) R180 28
        BUSTAP 1120 1120 1216 1120
        BUSTAP 1120 1184 1216 1184
        BUSTAP 1120 1248 1216 1248
        BUSTAP 1120 1312 1216 1312
        BUSTAP 1120 1600 1216 1600
        BUSTAP 1120 1664 1216 1664
        BUSTAP 1120 1728 1216 1728
        BUSTAP 1120 1792 1216 1792
        BUSTAP 2480 1120 2384 1120
        BUSTAP 2480 1184 2384 1184
        BUSTAP 2480 1248 2384 1248
        BUSTAP 2480 1312 2384 1312
        BUSTAP 2480 1664 2384 1664
        BUSTAP 2480 1728 2384 1728
        BUSTAP 2480 1792 2384 1792
        BUSTAP 2480 1600 2384 1600
    END SHEET
END SCHEMATIC
