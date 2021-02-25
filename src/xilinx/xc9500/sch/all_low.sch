VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_8
        SIGNAL En
        SIGNAL Z0
        SIGNAL Z1
        SIGNAL Z2
        SIGNAL Z3
        SIGNAL XLXN_9
        PORT Input En
        PORT Output Z0
        PORT Output Z1
        PORT Output Z2
        PORT Output Z3
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 bufe4
            PIN E En
            PIN I0 XLXN_8
            PIN I1 XLXN_8
            PIN I2 XLXN_8
            PIN I3 XLXN_8
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
        BEGIN BLOCK XLXI_3 gnd
            PIN G XLXN_8
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1760 928 R0
        BEGIN BRANCH XLXN_8
            WIRE 1440 704 1760 704
            WIRE 1440 704 1440 768
            WIRE 1440 768 1760 768
            WIRE 1440 768 1440 832
            WIRE 1440 832 1760 832
            WIRE 1440 832 1440 896
            WIRE 1440 896 1760 896
            WIRE 1440 896 1440 960
        END BRANCH
        BEGIN BRANCH En
            WIRE 1616 640 1744 640
            WIRE 1744 640 1760 640
        END BRANCH
        BEGIN BRANCH Z0
            WIRE 1984 704 2016 704
        END BRANCH
        IOMARKER 2016 704 Z0 R0 28
        BEGIN BRANCH Z1
            WIRE 1984 768 2016 768
        END BRANCH
        IOMARKER 2016 768 Z1 R0 28
        BEGIN BRANCH Z2
            WIRE 1984 832 2016 832
        END BRANCH
        IOMARKER 2016 832 Z2 R0 28
        BEGIN BRANCH Z3
            WIRE 1984 896 2016 896
        END BRANCH
        IOMARKER 2016 896 Z3 R0 28
        IOMARKER 1616 640 En R180 28
        INSTANCE XLXI_3 1376 1088 R0
    END SHEET
END SCHEMATIC
