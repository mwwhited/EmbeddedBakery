VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A0
        SIGNAL B0
        SIGNAL A1
        SIGNAL B1
        SIGNAL A2
        SIGNAL B2
        SIGNAL A3
        SIGNAL B3
        SIGNAL En
        SIGNAL Z0
        SIGNAL Z1
        SIGNAL Z2
        SIGNAL Z3
        SIGNAL XLXN_14
        SIGNAL XLXN_15
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        PORT Input A0
        PORT Input B0
        PORT Input A1
        PORT Input B1
        PORT Input A2
        PORT Input B2
        PORT Input A3
        PORT Input B3
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
        BEGIN BLOCKDEF nand2
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 216 -96 
            CIRCLE N 192 -108 216 -84 
            LINE N 64 -48 64 -144 
            LINE N 64 -144 144 -144 
            LINE N 144 -48 64 -48 
            ARC N 96 -144 192 -48 144 -48 144 -144 
        END BLOCKDEF
        BEGIN BLOCK XLXI_5 bufe4
            PIN E En
            PIN I0 XLXN_14
            PIN I1 XLXN_15
            PIN I2 XLXN_16
            PIN I3 XLXN_17
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
        BEGIN BLOCK XLXI_6 nand2
            PIN I0 B0
            PIN I1 A0
            PIN O XLXN_14
        END BLOCK
        BEGIN BLOCK XLXI_7 nand2
            PIN I0 B1
            PIN I1 A1
            PIN O XLXN_15
        END BLOCK
        BEGIN BLOCK XLXI_8 nand2
            PIN I0 B2
            PIN I1 A2
            PIN O XLXN_16
        END BLOCK
        BEGIN BLOCK XLXI_9 nand2
            PIN I0 B3
            PIN I1 A3
            PIN O XLXN_17
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH A0
            WIRE 432 176 944 176
            WIRE 944 176 944 320
            WIRE 944 320 960 320
        END BRANCH
        BEGIN BRANCH A1
            WIRE 432 336 944 336
            WIRE 944 336 944 640
            WIRE 944 640 960 640
        END BRANCH
        BEGIN BRANCH B3
            WIRE 432 1456 944 1456
            WIRE 944 1344 960 1344
            WIRE 944 1344 944 1456
        END BRANCH
        INSTANCE XLXI_5 1760 864 R0
        BEGIN BRANCH En
            WIRE 432 1776 1744 1776
            WIRE 1744 576 1760 576
            WIRE 1744 576 1744 1776
        END BRANCH
        BEGIN BRANCH Z0
            WIRE 1984 640 2016 640
        END BRANCH
        IOMARKER 2016 640 Z0 R0 28
        BEGIN BRANCH Z1
            WIRE 1984 704 2016 704
        END BRANCH
        IOMARKER 2016 704 Z1 R0 28
        BEGIN BRANCH Z2
            WIRE 1984 768 2016 768
        END BRANCH
        IOMARKER 2016 768 Z2 R0 28
        BEGIN BRANCH Z3
            WIRE 1984 832 2016 832
        END BRANCH
        IOMARKER 2016 832 Z3 R0 28
        BEGIN BRANCH XLXN_14
            WIRE 1216 352 1488 352
            WIRE 1488 352 1488 640
            WIRE 1488 640 1760 640
        END BRANCH
        BEGIN BRANCH XLXN_15
            WIRE 1216 672 1488 672
            WIRE 1488 672 1488 704
            WIRE 1488 704 1760 704
        END BRANCH
        BEGIN BRANCH XLXN_16
            WIRE 1216 992 1488 992
            WIRE 1488 768 1488 992
            WIRE 1488 768 1760 768
        END BRANCH
        BEGIN BRANCH XLXN_17
            WIRE 1216 1312 1504 1312
            WIRE 1504 832 1504 1312
            WIRE 1504 832 1760 832
        END BRANCH
        IOMARKER 432 176 A0 R180 28
        IOMARKER 432 336 A1 R180 28
        IOMARKER 416 496 A2 R180 28
        BEGIN BRANCH A2
            WIRE 416 496 672 496
            WIRE 672 496 672 960
            WIRE 672 960 944 960
            WIRE 944 960 960 960
        END BRANCH
        IOMARKER 432 656 A3 R180 28
        BEGIN BRANCH A3
            WIRE 432 656 656 656
            WIRE 656 656 656 1280
            WIRE 656 1280 944 1280
            WIRE 944 1280 960 1280
        END BRANCH
        IOMARKER 432 976 B0 R180 28
        BEGIN BRANCH B0
            WIRE 432 976 688 976
            WIRE 688 384 688 976
            WIRE 688 384 944 384
            WIRE 944 384 960 384
        END BRANCH
        IOMARKER 432 1136 B1 R180 28
        BEGIN BRANCH B1
            WIRE 432 1136 640 1136
            WIRE 640 704 640 1136
            WIRE 640 704 944 704
            WIRE 944 704 960 704
        END BRANCH
        IOMARKER 432 1296 B2 R180 28
        BEGIN BRANCH B2
            WIRE 432 1296 496 1296
            WIRE 496 1200 496 1296
            WIRE 496 1200 944 1200
            WIRE 944 1024 960 1024
            WIRE 944 1024 944 1200
        END BRANCH
        IOMARKER 432 1456 B3 R180 28
        IOMARKER 432 1776 En R180 28
        INSTANCE XLXI_6 960 448 R0
        INSTANCE XLXI_7 960 768 R0
        INSTANCE XLXI_8 960 1088 R0
        INSTANCE XLXI_9 960 1408 R0
    END SHEET
END SCHEMATIC
