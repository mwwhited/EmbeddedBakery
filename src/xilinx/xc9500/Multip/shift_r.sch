VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Z3
        SIGNAL Z0
        SIGNAL A3
        SIGNAL A2
        SIGNAL A0
        SIGNAL En
        SIGNAL A1
        SIGNAL Z2
        SIGNAL Z1
        PORT Output Z3
        PORT Output Z0
        PORT Input A3
        PORT Input A2
        PORT Input A0
        PORT Input En
        PORT Input A1
        PORT Output Z2
        PORT Output Z1
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
        BEGIN BLOCK XLXI_1 bufe4
            PIN E En
            PIN I0 A0
            PIN I1 A1
            PIN I2 A2
            PIN I3 A3
            PIN O0 Z1
            PIN O1 Z2
            PIN O2 Z3
            PIN O3 Z0
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1600 1088 R0
        BEGIN BRANCH Z3
            WIRE 1824 992 2016 992
            WIRE 2016 992 2016 1056
            WIRE 2016 1056 2176 1056
        END BRANCH
        BEGIN BRANCH Z0
            WIRE 1824 1056 1840 1056
            WIRE 1840 1056 2000 1056
            WIRE 2000 848 2000 1056
            WIRE 2000 848 2160 848
        END BRANCH
        BEGIN BRANCH A3
            WIRE 736 1056 1600 1056
        END BRANCH
        BEGIN BRANCH A2
            WIRE 736 992 1600 992
        END BRANCH
        BEGIN BRANCH A0
            WIRE 736 864 1600 864
        END BRANCH
        BEGIN BRANCH En
            WIRE 736 1280 1440 1280
            WIRE 1440 800 1600 800
            WIRE 1440 800 1440 1280
        END BRANCH
        BEGIN BRANCH A1
            WIRE 736 928 1600 928
        END BRANCH
        BEGIN BRANCH Z2
            WIRE 1824 928 1840 928
            WIRE 1840 928 2032 928
            WIRE 2032 928 2032 992
            WIRE 2032 992 2176 992
        END BRANCH
        BEGIN BRANCH Z1
            WIRE 1824 864 1840 864
            WIRE 1840 864 2048 864
            WIRE 2048 864 2048 928
            WIRE 2048 928 2160 928
        END BRANCH
        IOMARKER 736 864 A0 R180 28
        IOMARKER 736 928 A1 R180 28
        IOMARKER 736 992 A2 R180 28
        IOMARKER 736 1056 A3 R180 28
        IOMARKER 736 1280 En R180 28
        IOMARKER 2176 1056 Z3 R0 28
        IOMARKER 2176 992 Z2 R0 28
        IOMARKER 2160 928 Z1 R0 28
        IOMARKER 2160 848 Z0 R0 28
    END SHEET
END SCHEMATIC
