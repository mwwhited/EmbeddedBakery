VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL Z(0)
        END SIGNAL
        BEGIN SIGNAL Z(1)
        END SIGNAL
        BEGIN SIGNAL Z(2)
        END SIGNAL
        BEGIN SIGNAL Z(3)
        END SIGNAL
        BEGIN SIGNAL Z(4)
        END SIGNAL
        SIGNAL XLXN_11
        SIGNAL Cin
        BEGIN SIGNAL B(5)
        END SIGNAL
        BEGIN SIGNAL A(0)
        END SIGNAL
        BEGIN SIGNAL B(0)
        END SIGNAL
        BEGIN SIGNAL B(1)
        END SIGNAL
        BEGIN SIGNAL B(2)
        END SIGNAL
        BEGIN SIGNAL B(3)
        END SIGNAL
        SIGNAL Z(0:5)
        SIGNAL XLXN_26
        SIGNAL B(0:5)
        SIGNAL A(0:5)
        SIGNAL A(1)
        SIGNAL A(2)
        SIGNAL A(3)
        SIGNAL XLXN_30
        SIGNAL Z(5)
        PORT Input Cin
        PORT Output Z(0:5)
        PORT Input B(0:5)
        PORT Input A(0:5)
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
        END BLOCKDEF
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
        BEGIN BLOCKDEF inv
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
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
        BEGIN BLOCK XLXI_1 buf
            PIN I Cin
            PIN O Z(0)
        END BLOCK
        BEGIN BLOCK XLXI_2 bufe4
            PIN E B(5)
            PIN I0 A(0)
            PIN I1 A(1)
            PIN I2 A(2)
            PIN I3 A(3)
            PIN O0 Z(1)
            PIN O1 Z(2)
            PIN O2 Z(3)
            PIN O3 Z(4)
        END BLOCK
        BEGIN BLOCK XLXI_3 bufe4
            PIN E XLXN_11
            PIN I0 B(0)
            PIN I1 B(1)
            PIN I2 B(2)
            PIN I3 B(3)
            PIN O0 Z(1)
            PIN O1 Z(2)
            PIN O2 Z(3)
            PIN O3 Z(4)
        END BLOCK
        BEGIN BLOCK XLXI_4 inv
            PIN I B(5)
            PIN O XLXN_11
        END BLOCK
        BEGIN BLOCK XLXI_5 buf
            PIN I XLXN_30
            PIN O Z(5)
        END BLOCK
        BEGIN BLOCK XLXI_6 gnd
            PIN G XLXN_30
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH Z(0)
            WIRE 1872 320 1888 320
            WIRE 1888 320 1984 320
            WIRE 1984 320 2304 320
            BEGIN DISPLAY 1888 320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_3 1648 1344 R0
        INSTANCE XLXI_2 1648 864 R0
        INSTANCE XLXI_1 1648 352 R0
        BEGIN BRANCH XLXN_11
            WIRE 1456 1056 1648 1056
        END BRANCH
        INSTANCE XLXI_4 1232 1088 R0
        BEGIN BRANCH Cin
            WIRE 1616 320 1648 320
        END BRANCH
        IOMARKER 1616 320 Cin R180 28
        BEGIN BRANCH B(5)
            WIRE 1056 1056 1104 1056
            WIRE 1104 1056 1200 1056
            WIRE 1200 1056 1232 1056
            WIRE 1200 576 1200 1056
            WIRE 1200 576 1616 576
            WIRE 1616 576 1648 576
            BEGIN DISPLAY 1104 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 1056 640 1360 640
            WIRE 1360 640 1616 640
            WIRE 1616 640 1648 640
            BEGIN DISPLAY 1360 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 1056 704 1312 704
            WIRE 1312 704 1616 704
            WIRE 1616 704 1648 704
            BEGIN DISPLAY 1312 704 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 1056 768 1312 768
            WIRE 1312 768 1616 768
            WIRE 1616 768 1648 768
            BEGIN DISPLAY 1312 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 1056 1120 1072 1120
            WIRE 1072 1120 1232 1120
            WIRE 1232 1120 1616 1120
            WIRE 1616 1120 1648 1120
            BEGIN DISPLAY 1232 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 1056 1184 1216 1184
            WIRE 1216 1184 1616 1184
            WIRE 1616 1184 1648 1184
            BEGIN DISPLAY 1216 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 1056 1248 1200 1248
            WIRE 1200 1248 1616 1248
            WIRE 1616 1248 1648 1248
            BEGIN DISPLAY 1200 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 1056 1312 1200 1312
            WIRE 1200 1312 1616 1312
            WIRE 1616 1312 1648 1312
            BEGIN DISPLAY 1200 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 1872 640 1920 640
            WIRE 1920 640 1984 640
            WIRE 1984 640 2000 640
            WIRE 2000 640 2000 1120
            WIRE 2000 640 2240 640
            WIRE 2240 640 2256 640
            WIRE 2256 640 2304 640
            WIRE 1872 1120 1904 1120
            WIRE 1904 1120 1984 1120
            WIRE 1984 1120 2000 1120
            BEGIN DISPLAY 1904 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
            BEGIN DISPLAY 1920 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 1872 704 1920 704
            WIRE 1920 704 1984 704
            WIRE 1984 704 2016 704
            WIRE 2016 704 2016 1184
            WIRE 2016 704 2256 704
            WIRE 2256 704 2304 704
            WIRE 1872 1184 1904 1184
            WIRE 1904 1184 1984 1184
            WIRE 1984 1184 2016 1184
            BEGIN DISPLAY 1904 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
            BEGIN DISPLAY 1920 704 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 1872 768 1920 768
            WIRE 1920 768 1984 768
            WIRE 1984 768 2032 768
            WIRE 2032 768 2032 1248
            WIRE 2032 768 2256 768
            WIRE 2256 768 2304 768
            WIRE 1872 1248 1904 1248
            WIRE 1904 1248 1984 1248
            WIRE 1984 1248 2032 1248
            BEGIN DISPLAY 1904 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
            BEGIN DISPLAY 1920 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 1872 832 1920 832
            WIRE 1920 832 1984 832
            WIRE 1984 832 2048 832
            WIRE 2048 832 2048 1312
            WIRE 2048 832 2256 832
            WIRE 2256 832 2304 832
            WIRE 1872 1312 1904 1312
            WIRE 1904 1312 1984 1312
            WIRE 1984 1312 2048 1312
            BEGIN DISPLAY 1904 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
            BEGIN DISPLAY 1920 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0:5)
            WIRE 2400 176 2608 176
            WIRE 2400 176 2400 320
            WIRE 2400 320 2400 640
            WIRE 2400 640 2400 704
            WIRE 2400 704 2400 768
            WIRE 2400 768 2400 832
            WIRE 2400 832 2400 960
            WIRE 2400 960 2400 976
            WIRE 2400 976 2400 1520
            WIRE 2400 1520 2400 1600
        END BRANCH
        BEGIN BRANCH B(0:5)
            WIRE 800 1456 960 1456
            WIRE 960 960 960 1056
            WIRE 960 1056 960 1056
            WIRE 960 1056 960 1120
            WIRE 960 1120 960 1120
            WIRE 960 1120 960 1184
            WIRE 960 1184 960 1184
            WIRE 960 1184 960 1248
            WIRE 960 1248 960 1248
            WIRE 960 1248 960 1312
            WIRE 960 1312 960 1312
            WIRE 960 1312 960 1456
        END BRANCH
        BEGIN BRANCH A(0:5)
            WIRE 800 448 960 448
            WIRE 960 448 960 640
            WIRE 960 640 960 704
            WIRE 960 704 960 768
            WIRE 960 768 960 832
            WIRE 960 832 960 880
        END BRANCH
        IOMARKER 800 448 A(0:5) R180 28
        IOMARKER 800 1456 B(0:5) R180 28
        BEGIN BRANCH A(3)
            WIRE 1056 832 1312 832
            WIRE 1312 832 1648 832
            BEGIN DISPLAY 1312 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 960 1312 1056 1312
        BUSTAP 960 1248 1056 1248
        BUSTAP 960 1184 1056 1184
        BUSTAP 960 1120 1056 1120
        BUSTAP 960 1056 1056 1056
        BUSTAP 960 832 1056 832
        BUSTAP 960 768 1056 768
        BUSTAP 960 704 1056 704
        BUSTAP 960 640 1056 640
        BUSTAP 2400 320 2304 320
        BUSTAP 2400 640 2304 640
        BUSTAP 2400 704 2304 704
        BUSTAP 2400 768 2304 768
        BUSTAP 2400 832 2304 832
        IOMARKER 2608 176 Z(0:5) R0 28
        INSTANCE XLXI_5 1856 1552 R0
        INSTANCE XLXI_6 1616 1744 R0
        BEGIN BRANCH XLXN_30
            WIRE 1680 1520 1856 1520
            WIRE 1680 1520 1680 1616
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 2080 1520 2224 1520
            WIRE 2224 1520 2304 1520
            BEGIN DISPLAY 2224 1520 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2400 1520 2304 1520
    END SHEET
END SCHEMATIC
