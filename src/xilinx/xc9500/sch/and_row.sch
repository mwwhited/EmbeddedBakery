VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL B
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL Z3
        SIGNAL Z2
        SIGNAL Z1
        SIGNAL Z0
        PORT Input B
        PORT Input A0
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Output Z3
        PORT Output Z2
        PORT Output Z1
        PORT Output Z0
        BEGIN BLOCKDEF and2
            TIMESTAMP 2001 5 11 10 41 37
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 and2
            PIN I0 B
            PIN I1 A0
            PIN O Z0
        END BLOCK
        BEGIN BLOCK XLXI_2 and2
            PIN I0 B
            PIN I1 A1
            PIN O Z1
        END BLOCK
        BEGIN BLOCK XLXI_3 and2
            PIN I0 B
            PIN I1 A2
            PIN O Z2
        END BLOCK
        BEGIN BLOCK XLXI_4 and2
            PIN I0 B
            PIN I1 A3
            PIN O Z3
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 800 448 R0
        INSTANCE XLXI_2 800 768 R0
        INSTANCE XLXI_3 800 1088 R0
        BEGIN BRANCH B
            WIRE 272 1344 320 1344
            WIRE 320 1344 800 1344
            WIRE 320 384 320 704
            WIRE 320 704 320 1024
            WIRE 320 1024 320 1344
            WIRE 320 1024 800 1024
            WIRE 320 704 800 704
            WIRE 320 384 800 384
        END BRANCH
        INSTANCE XLXI_4 800 1408 R0
        BEGIN BRANCH A0
            WIRE 768 320 800 320
        END BRANCH
        IOMARKER 768 320 A0 R180 28
        BEGIN BRANCH A1
            WIRE 768 640 800 640
        END BRANCH
        IOMARKER 768 640 A1 R180 28
        BEGIN BRANCH A2
            WIRE 768 960 800 960
        END BRANCH
        IOMARKER 768 960 A2 R180 28
        BEGIN BRANCH A3
            WIRE 768 1280 800 1280
        END BRANCH
        IOMARKER 768 1280 A3 R180 28
        IOMARKER 272 1344 B R180 28
        BEGIN BRANCH Z3
            WIRE 1056 1312 1088 1312
        END BRANCH
        IOMARKER 1088 1312 Z3 R0 28
        BEGIN BRANCH Z2
            WIRE 1056 992 1088 992
        END BRANCH
        IOMARKER 1088 992 Z2 R0 28
        BEGIN BRANCH Z1
            WIRE 1056 672 1088 672
        END BRANCH
        IOMARKER 1088 672 Z1 R0 28
        BEGIN BRANCH Z0
            WIRE 1056 352 1088 352
        END BRANCH
        IOMARKER 1088 352 Z0 R0 28
    END SHEET
END SCHEMATIC
