VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A(0:3)
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL A(0)
        SIGNAL A(1)
        SIGNAL A(2)
        SIGNAL A(3)
        SIGNAL Z(0:5)
        SIGNAL Zo0
        SIGNAL Zo1
        SIGNAL Zo2
        SIGNAL Z(0)
        SIGNAL Z(1)
        SIGNAL Z(2)
        SIGNAL Z(3)
        SIGNAL Z(4)
        SIGNAL Z(5)
        PORT Input A(0:3)
        PORT Output Z(0:5)
        PORT Output Zo0
        PORT Output Zo1
        PORT Output Zo2
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 buf4
            PIN I0 A(0)
            PIN I1 A(1)
            PIN I2 A(2)
            PIN I3 A(3)
            PIN O0 Zo0
            PIN O1 Zo1
            PIN O2 Zo2
            PIN O3 Z(0)
        END BLOCK
        BEGIN BLOCK XLXI_2 buf4
            PIN I0 XLXN_5
            PIN I1 XLXN_5
            PIN I2 XLXN_5
            PIN I3 XLXN_5
            PIN O0 Z(1)
            PIN O1 Z(2)
            PIN O2 Z(3)
            PIN O3 Z(4)
        END BLOCK
        BEGIN BLOCK XLXI_3 gnd
            PIN G XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_4 buf
            PIN I XLXN_5
            PIN O Z(5)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 960 704 R0
        INSTANCE XLXI_2 960 1024 R0
        BEGIN BRANCH A(0:3)
            WIRE 480 320 640 320
            WIRE 640 320 640 480
            WIRE 640 480 640 480
            WIRE 640 480 640 544
            WIRE 640 544 640 608
            WIRE 640 608 640 672
            WIRE 640 672 640 752
        END BRANCH
        IOMARKER 480 320 A(0:3) R180 28
        INSTANCE XLXI_3 736 1408 R0
        BEGIN BRANCH XLXN_5
            WIRE 800 800 960 800
            WIRE 800 800 800 864
            WIRE 800 864 960 864
            WIRE 800 864 800 928
            WIRE 800 928 960 928
            WIRE 800 928 800 992
            WIRE 800 992 960 992
            WIRE 800 992 800 1072
            WIRE 800 1072 800 1280
            WIRE 800 1072 960 1072
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 736 480 848 480
            WIRE 848 480 960 480
            BEGIN DISPLAY 848 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 736 544 848 544
            WIRE 848 544 960 544
            BEGIN DISPLAY 848 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 736 608 848 608
            WIRE 848 608 960 608
            BEGIN DISPLAY 848 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 736 672 848 672
            WIRE 848 672 960 672
            BEGIN DISPLAY 848 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 640 480 736 480
        BUSTAP 640 544 736 544
        BUSTAP 640 608 736 608
        BUSTAP 640 672 736 672
        BEGIN BRANCH Z(0:5)
            WIRE 1440 640 1440 672
            WIRE 1440 672 1440 800
            WIRE 1440 800 1440 864
            WIRE 1440 864 1440 928
            WIRE 1440 928 1440 992
            WIRE 1440 992 1440 1072
            WIRE 1440 1072 1440 1120
            WIRE 1440 1120 1600 1120
        END BRANCH
        INSTANCE XLXI_4 960 1104 R0
        BEGIN BRANCH Zo0
            WIRE 1184 480 1216 480
        END BRANCH
        IOMARKER 1216 480 Zo0 R0 28
        BEGIN BRANCH Zo1
            WIRE 1184 544 1216 544
        END BRANCH
        IOMARKER 1216 544 Zo1 R0 28
        BEGIN BRANCH Zo2
            WIRE 1184 608 1216 608
        END BRANCH
        IOMARKER 1216 608 Zo2 R0 28
        IOMARKER 1600 1120 Z(0:5) R0 28
        BEGIN BRANCH Z(0)
            WIRE 1184 672 1248 672
            WIRE 1248 672 1344 672
            BEGIN DISPLAY 1248 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 1184 800 1248 800
            WIRE 1248 800 1344 800
            BEGIN DISPLAY 1248 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 1184 864 1248 864
            WIRE 1248 864 1344 864
            BEGIN DISPLAY 1248 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 1184 928 1248 928
            WIRE 1248 928 1344 928
            BEGIN DISPLAY 1248 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 1184 992 1248 992
            WIRE 1248 992 1344 992
            BEGIN DISPLAY 1248 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 1184 1072 1248 1072
            WIRE 1248 1072 1344 1072
            BEGIN DISPLAY 1248 1072 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1440 672 1344 672
        BUSTAP 1440 800 1344 800
        BUSTAP 1440 992 1344 992
        BUSTAP 1440 1072 1344 1072
        BUSTAP 1440 864 1344 864
        BUSTAP 1440 928 1344 928
    END SHEET
END SCHEMATIC
