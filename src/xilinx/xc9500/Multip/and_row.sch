VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL B
        SIGNAL Z(0:3)
        SIGNAL Z(0)
        SIGNAL Z(1)
        SIGNAL Z(2)
        SIGNAL XLXN_8
        SIGNAL Z(3)
        SIGNAL A(0:3)
        SIGNAL A(0)
        SIGNAL A(1)
        SIGNAL A(2)
        SIGNAL A(3)
        PORT Input B
        PORT Output Z(0:3)
        PORT Input A(0:3)
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
        BEGIN BLOCK and_1 and2
            PIN I0 B
            PIN I1 A(0)
            PIN O Z(0)
        END BLOCK
        BEGIN BLOCK and_2 and2
            PIN I0 B
            PIN I1 A(1)
            PIN O Z(1)
        END BLOCK
        BEGIN BLOCK and_3 and2
            PIN I0 B
            PIN I1 A(2)
            PIN O Z(2)
        END BLOCK
        BEGIN BLOCK and_4 and2
            PIN I0 B
            PIN I1 A(3)
            PIN O Z(3)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE and_1 800 448 R0
        INSTANCE and_2 800 768 R0
        INSTANCE and_3 800 1088 R0
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
        INSTANCE and_4 800 1408 R0
        IOMARKER 272 1344 B R180 28
        BEGIN BRANCH Z(0:3)
            WIRE 1280 144 1440 144
            WIRE 1280 144 1280 352
            WIRE 1280 352 1280 672
            WIRE 1280 672 1280 992
            WIRE 1280 992 1280 1312
            WIRE 1280 1312 1280 1456
        END BRANCH
        IOMARKER 1440 144 Z(0:3) R0 28
        BEGIN BRANCH Z(0)
            WIRE 1056 352 1136 352
            WIRE 1136 352 1184 352
            BEGIN DISPLAY 1136 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 1056 672 1136 672
            WIRE 1136 672 1184 672
            BEGIN DISPLAY 1136 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 1056 992 1120 992
            WIRE 1120 992 1184 992
            BEGIN DISPLAY 1120 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 1056 1312 1120 1312
            WIRE 1120 1312 1184 1312
            BEGIN DISPLAY 1120 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1280 1312 1184 1312
        BUSTAP 1280 992 1184 992
        BUSTAP 1280 672 1184 672
        BUSTAP 1280 352 1184 352
        BEGIN BRANCH A(0:3)
            WIRE 160 160 480 160
            WIRE 480 160 480 320
            WIRE 480 320 480 640
            WIRE 480 640 480 960
            WIRE 480 960 480 1280
            WIRE 480 1280 480 1440
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 576 320 672 320
            WIRE 672 320 800 320
            BEGIN DISPLAY 672 320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 576 640 672 640
            WIRE 672 640 800 640
            BEGIN DISPLAY 672 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 576 960 672 960
            WIRE 672 960 800 960
            BEGIN DISPLAY 672 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 576 1280 672 1280
            WIRE 672 1280 800 1280
            BEGIN DISPLAY 672 1280 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 480 640 576 640
        BUSTAP 480 960 576 960
        BUSTAP 480 1280 576 1280
        BUSTAP 480 320 576 320
        IOMARKER 160 160 A(0:3) R180 28
    END SHEET
END SCHEMATIC
