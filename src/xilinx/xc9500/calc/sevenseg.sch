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
        SIGNAL Aa
        SIGNAL Ab
        SIGNAL Ac
        SIGNAL Ad
        SIGNAL Ae
        SIGNAL Af
        SIGNAL Ag
        SIGNAL Adp
        BEGIN SIGNAL Za
            BEGIN ATTR LOC "p15"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Zb
            BEGIN ATTR LOC "p18"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Zc
            BEGIN ATTR LOC "p23"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Zd
            BEGIN ATTR LOC "p21"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Ze
            BEGIN ATTR LOC "p19"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Zf
            BEGIN ATTR LOC "p14"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Zg
            BEGIN ATTR LOC "p17"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL Zdp
            BEGIN ATTR LOC "p24"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        SIGNAL Enable
        PORT Input Aa
        PORT Input Ab
        PORT Input Ac
        PORT Input Ad
        PORT Input Ae
        PORT Input Af
        PORT Input Ag
        PORT Input Adp
        PORT Output Za
        PORT Output Zb
        PORT Output Zc
        PORT Output Zd
        PORT Output Ze
        PORT Output Zf
        PORT Output Zg
        PORT Output Zdp
        PORT Input Enable
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
            PIN O0 Za
            PIN O1 Zb
            PIN O2 Zc
            PIN O3 Zd
        END BLOCK
        BEGIN BLOCK XLXI_5 obufe4
            PIN E XLXN_11
            PIN I0 XLXN_7
            PIN I1 XLXN_8
            PIN I2 XLXN_9
            PIN I3 XLXN_10
            PIN O0 Ze
            PIN O1 Zf
            PIN O2 Zg
            PIN O3 Zdp
        END BLOCK
        BEGIN BLOCK XLXI_14 buf
            PIN I Enable
            PIN O XLXN_11
        END BLOCK
        BEGIN BLOCK XLXI_15 buf4
            PIN I0 Ae
            PIN I1 Af
            PIN I2 Ag
            PIN I3 Adp
            PIN O0 XLXN_7
            PIN O1 XLXN_8
            PIN O2 XLXN_9
            PIN O3 XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_16 buf4
            PIN I0 Aa
            PIN I1 Ab
            PIN I2 Ac
            PIN I3 Ad
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
        BEGIN BRANCH Aa
            WIRE 1248 1120 1280 1120
        END BRANCH
        IOMARKER 1248 1120 Aa R180 28
        BEGIN BRANCH Ab
            WIRE 1248 1184 1280 1184
        END BRANCH
        IOMARKER 1248 1184 Ab R180 28
        BEGIN BRANCH Ac
            WIRE 1248 1248 1280 1248
        END BRANCH
        IOMARKER 1248 1248 Ac R180 28
        BEGIN BRANCH Ad
            WIRE 1248 1312 1280 1312
        END BRANCH
        IOMARKER 1248 1312 Ad R180 28
        BEGIN BRANCH Ae
            WIRE 1248 1600 1280 1600
        END BRANCH
        IOMARKER 1248 1600 Ae R180 28
        BEGIN BRANCH Af
            WIRE 1248 1664 1280 1664
        END BRANCH
        IOMARKER 1248 1664 Af R180 28
        BEGIN BRANCH Ag
            WIRE 1248 1728 1280 1728
        END BRANCH
        IOMARKER 1248 1728 Ag R180 28
        BEGIN BRANCH Adp
            WIRE 1248 1792 1280 1792
        END BRANCH
        IOMARKER 1248 1792 Adp R180 28
        BEGIN BRANCH Za
            WIRE 2304 1120 2336 1120
        END BRANCH
        IOMARKER 2336 1120 Za R0 28
        BEGIN BRANCH Zb
            WIRE 2304 1184 2336 1184
        END BRANCH
        IOMARKER 2336 1184 Zb R0 28
        BEGIN BRANCH Zc
            WIRE 2304 1248 2336 1248
        END BRANCH
        IOMARKER 2336 1248 Zc R0 28
        BEGIN BRANCH Zd
            WIRE 2304 1312 2336 1312
        END BRANCH
        IOMARKER 2336 1312 Zd R0 28
        BEGIN BRANCH Ze
            WIRE 2304 1600 2336 1600
        END BRANCH
        IOMARKER 2336 1600 Ze R0 28
        BEGIN BRANCH Zf
            WIRE 2304 1664 2336 1664
        END BRANCH
        IOMARKER 2336 1664 Zf R0 28
        BEGIN BRANCH Zg
            WIRE 2304 1728 2336 1728
        END BRANCH
        IOMARKER 2336 1728 Zg R0 28
        BEGIN BRANCH Zdp
            WIRE 2304 1792 2336 1792
        END BRANCH
        IOMARKER 2336 1792 Zdp R0 28
        BEGIN BRANCH Enable
            WIRE 1248 1984 1280 1984
        END BRANCH
        IOMARKER 1248 1984 Enable R180 28
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
    END SHEET
END SCHEMATIC
