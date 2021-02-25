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
        SIGNAL Z1
        SIGNAL Z2
        SIGNAL A3
        SIGNAL A2
        SIGNAL A1
        SIGNAL A0
        SIGNAL En
        PORT Output Z3
        PORT Output Z0
        PORT Output Z1
        PORT Output Z2
        PORT Input A3
        PORT Input A2
        PORT Input A1
        PORT Input A0
        PORT Input En
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
            PIN O0 Z3
            PIN O1 Z0
            PIN O2 Z1
            PIN O3 Z2
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1440 928 R0
        BEGIN BRANCH Z1
            WIRE 1664 832 1792 832
            WIRE 1792 768 1792 832
            WIRE 1792 768 2016 768
        END BRANCH
        BEGIN BRANCH Z2
            WIRE 1664 896 1824 896
            WIRE 1824 832 1824 896
            WIRE 1824 832 2000 832
        END BRANCH
        BEGIN BRANCH A3
            WIRE 576 896 1440 896
        END BRANCH
        BEGIN BRANCH A2
            WIRE 576 832 1440 832
        END BRANCH
        BEGIN BRANCH A0
            WIRE 576 704 1440 704
        END BRANCH
        BEGIN BRANCH En
            WIRE 576 1120 1280 1120
            WIRE 1280 640 1440 640
            WIRE 1280 640 1280 1120
        END BRANCH
        BEGIN BRANCH A1
            WIRE 576 768 1440 768
        END BRANCH
        IOMARKER 576 704 A0 R180 28
        IOMARKER 576 768 A1 R180 28
        IOMARKER 576 832 A2 R180 28
        IOMARKER 576 896 A3 R180 28
        IOMARKER 576 1120 En R180 28
        BEGIN BRANCH Z0
            WIRE 1664 768 1760 768
            WIRE 1760 704 1760 768
            WIRE 1760 704 2016 704
        END BRANCH
        IOMARKER 2016 704 Z0 R0 28
        IOMARKER 2016 768 Z1 R0 28
        IOMARKER 2000 832 Z2 R0 28
        BEGIN BRANCH Z3
            WIRE 1664 704 1680 704
            WIRE 1680 704 1680 912
            WIRE 1680 912 2048 912
        END BRANCH
        IOMARKER 2048 912 Z3 R0 28
    END SHEET
END SCHEMATIC
