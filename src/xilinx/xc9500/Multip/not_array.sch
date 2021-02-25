VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL En
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL Z0
        SIGNAL Z1
        SIGNAL Z2
        SIGNAL Z3
        SIGNAL XLXN_27
        SIGNAL XLXN_28
        SIGNAL XLXN_29
        SIGNAL XLXN_30
        PORT Input En
        PORT Input A0
        PORT Input A1
        PORT Input A2
        PORT Input A3
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
        BEGIN BLOCKDEF inv4
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 224 -32 160 -32 
            LINE N 224 -96 160 -96 
            LINE N 224 -160 160 -160 
            LINE N 224 -224 160 -224 
            LINE N 0 -32 64 -32 
            LINE N 0 -96 64 -96 
            LINE N 0 -160 64 -160 
            LINE N 0 -224 64 -224 
            LINE N 64 -256 128 -224 
            LINE N 128 -224 64 -192 
            LINE N 64 -192 64 -256 
            CIRCLE N 128 -48 160 -16 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 128 -96 64 -64 
            LINE N 64 -64 64 -128 
            CIRCLE N 128 -112 160 -80 
            LINE N 64 -192 128 -160 
            LINE N 128 -160 64 -128 
            LINE N 64 -128 64 -192 
            CIRCLE N 128 -176 160 -144 
            CIRCLE N 128 -240 160 -208 
        END BLOCKDEF
        BEGIN BLOCK XLXI_10 inv4
            PIN I0 A3
            PIN I1 A2
            PIN I2 A1
            PIN I3 A0
            PIN O0 XLXN_30
            PIN O1 XLXN_29
            PIN O2 XLXN_28
            PIN O3 XLXN_27
        END BLOCK
        BEGIN BLOCK XLXI_11 bufe4
            PIN E En
            PIN I0 XLXN_27
            PIN I1 XLXN_28
            PIN I2 XLXN_29
            PIN I3 XLXN_30
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_10 1120 704 R0
        INSTANCE XLXI_11 1760 704 R0
        BEGIN BRANCH En
            WIRE 1008 816 1744 816
            WIRE 1744 416 1760 416
            WIRE 1744 416 1744 816
        END BRANCH
        BEGIN BRANCH A0
            WIRE 1088 480 1120 480
        END BRANCH
        IOMARKER 1088 480 A0 R180 28
        BEGIN BRANCH A1
            WIRE 1088 544 1120 544
        END BRANCH
        IOMARKER 1088 544 A1 R180 28
        BEGIN BRANCH A2
            WIRE 1088 608 1120 608
        END BRANCH
        IOMARKER 1088 608 A2 R180 28
        BEGIN BRANCH A3
            WIRE 1088 672 1120 672
        END BRANCH
        IOMARKER 1088 672 A3 R180 28
        BEGIN BRANCH Z0
            WIRE 1984 480 2016 480
        END BRANCH
        IOMARKER 2016 480 Z0 R0 28
        BEGIN BRANCH Z1
            WIRE 1984 544 2016 544
        END BRANCH
        IOMARKER 2016 544 Z1 R0 28
        BEGIN BRANCH Z2
            WIRE 1984 608 2016 608
        END BRANCH
        IOMARKER 2016 608 Z2 R0 28
        BEGIN BRANCH Z3
            WIRE 1984 672 2016 672
        END BRANCH
        IOMARKER 2016 672 Z3 R0 28
        BEGIN BRANCH XLXN_27
            WIRE 1344 480 1760 480
        END BRANCH
        BEGIN BRANCH XLXN_28
            WIRE 1344 544 1760 544
        END BRANCH
        BEGIN BRANCH XLXN_29
            WIRE 1344 608 1760 608
        END BRANCH
        BEGIN BRANCH XLXN_30
            WIRE 1344 672 1760 672
        END BRANCH
        IOMARKER 1008 816 En R180 28
    END SHEET
END SCHEMATIC
