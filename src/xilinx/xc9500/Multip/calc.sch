VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Zn(0:7)
        SIGNAL A(0:3)
        SIGNAL B(0:3)
        SIGNAL Fn2(0:1)
        SIGNAL Fn2(0)
        SIGNAL Fn2(1)
        SIGNAL Fn(0:3)
        SIGNAL Fn(2)
        SIGNAL Fn(3)
        SIGNAL Fn(1)
        SIGNAL Fn(0)
        SIGNAL EnSet0
        SIGNAL Z(7:0)
        SIGNAL En
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        PORT Input A(0:3)
        PORT Input B(0:3)
        PORT Input Fn(0:3)
        PORT Output Z(7:0)
        PORT Input En
        BEGIN BLOCKDEF d2_4e
            TIMESTAMP 2001 3 9 11 22 33
            RECTANGLE N 64 -384 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            LINE N 384 -128 320 -128 
            LINE N 384 -192 320 -192 
            LINE N 384 -256 320 -256 
            LINE N 384 -320 320 -320 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF set0
            TIMESTAMP 2004 10 25 0 0 45
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF bufe8
            TIMESTAMP 2001 3 9 11 21 49
            RECTANGLE N 128 -44 224 -20 
            LINE N 0 -32 64 -32 
            LINE N 0 -96 64 -96 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 224 -32 128 -32 
            LINE N 96 -96 64 -96 
            LINE N 96 -48 96 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF set1
            TIMESTAMP 2004 10 21 1 11 45
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF set2
            TIMESTAMP 2004 10 21 1 3 36
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF set3
            TIMESTAMP 2004 10 21 0 55 41
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCK XLXI_3 d2_4e
            PIN A0 Fn(0)
            PIN A1 Fn(1)
            PIN E En
            PIN D0 EnSet0
            PIN D1 XLXN_1
            PIN D2 XLXN_2
            PIN D3 XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_8 buf
            PIN I Fn(3)
            PIN O Fn2(1)
        END BLOCK
        BEGIN BLOCK XLXI_9 buf
            PIN I Fn(2)
            PIN O Fn2(0)
        END BLOCK
        BEGIN BLOCK XLXI_11 set0
            PIN A(0:3) A(0:3)
            PIN B(0:3) B(0:3)
            PIN Fn(0:1) Fn2(0:1)
            PIN En EnSet0
            PIN Z(7:0) Zn(0:7)
        END BLOCK
        BEGIN BLOCK XLXI_12 bufe8
            PIN E En
            PIN I(7:0) Zn(0:7)
            PIN O(7:0) Z(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_13 set1
            PIN A(0:3) A(0:3)
            PIN B(0:3) B(0:3)
            PIN Fn(0:1) Fn2(0:1)
            PIN En XLXN_1
            PIN Z(0:7) Zn(0:7)
        END BLOCK
        BEGIN BLOCK XLXI_14 set2
            PIN A(0:3) A(0:3)
            PIN B(0:3) B(0:3)
            PIN Fn(0:1) Fn2(0:1)
            PIN En XLXN_2
            PIN Z(0:7) Zn(0:7)
        END BLOCK
        BEGIN BLOCK XLXI_15 set3
            PIN A(0:3) A(0:3)
            PIN Fn(0:1) Fn2(0:1)
            PIN En XLXN_3
            PIN Z(0:7) Zn(0:7)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_3 576 2464 R0
        BEGIN BRANCH Zn(0:7)
            WIRE 1600 352 1920 352
            WIRE 1920 352 1920 832
            WIRE 1920 832 1920 1312
            WIRE 1920 1312 1920 1792
            WIRE 1920 1792 2176 1792
            WIRE 1920 1792 1920 1984
            WIRE 1600 832 1920 832
            WIRE 1600 1312 1920 1312
            WIRE 1600 1792 1920 1792
        END BRANCH
        BEGIN BRANCH A(0:3)
            WIRE 240 80 1120 80
            WIRE 1120 80 1120 352
            WIRE 1120 352 1120 832
            WIRE 1120 832 1120 1312
            WIRE 1120 1312 1120 1792
            WIRE 1120 1792 1120 1952
            WIRE 1120 1792 1216 1792
            WIRE 1120 1312 1216 1312
            WIRE 1120 832 1216 832
            WIRE 1120 352 1216 352
        END BRANCH
        BEGIN BRANCH B(0:3)
            WIRE 240 240 960 240
            WIRE 960 240 960 416
            WIRE 960 416 960 896
            WIRE 960 896 1216 896
            WIRE 960 896 960 1376
            WIRE 960 1376 1216 1376
            WIRE 960 416 1216 416
        END BRANCH
        BEGIN BRANCH Fn2(0:1)
            WIRE 800 480 1216 480
            WIRE 800 480 800 960
            WIRE 800 960 800 1440
            WIRE 800 1440 1216 1440
            WIRE 800 1440 800 1600
            WIRE 800 1600 800 1760
            WIRE 800 1760 800 1856
            WIRE 800 1856 800 1904
            WIRE 800 1856 1216 1856
            WIRE 800 960 1216 960
        END BRANCH
        INSTANCE XLXI_8 416 1792 R0
        INSTANCE XLXI_9 416 1632 R0
        BEGIN BRANCH Fn2(0)
            WIRE 640 1600 656 1600
            WIRE 656 1600 704 1600
            BEGIN DISPLAY 656 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn2(1)
            WIRE 640 1760 672 1760
            WIRE 672 1760 704 1760
            BEGIN DISPLAY 672 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(0:3)
            WIRE 176 1424 272 1424
            WIRE 272 1424 272 1600
            WIRE 272 1600 272 1760
            WIRE 272 1760 272 2144
            WIRE 272 2144 272 2208
            WIRE 272 2208 272 2256
        END BRANCH
        BEGIN BRANCH Fn(2)
            WIRE 368 1600 384 1600
            WIRE 384 1600 416 1600
            BEGIN DISPLAY 384 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(3)
            WIRE 368 1760 400 1760
            WIRE 400 1760 416 1760
            BEGIN DISPLAY 400 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(1)
            WIRE 368 2208 416 2208
            WIRE 416 2208 576 2208
            BEGIN DISPLAY 416 2208 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(0)
            WIRE 368 2144 400 2144
            WIRE 400 2144 576 2144
            BEGIN DISPLAY 400 2144 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 176 1424 Fn(0:3) R180 28
        BUSTAP 272 1600 368 1600
        BUSTAP 272 1760 368 1760
        BUSTAP 272 2144 368 2144
        BUSTAP 272 2208 368 2208
        BUSTAP 800 1600 704 1600
        BUSTAP 800 1760 704 1760
        IOMARKER 240 80 A(0:3) R180 28
        IOMARKER 240 240 B(0:3) R180 28
        BEGIN INSTANCE XLXI_11 1216 576 R0
        END INSTANCE
        BEGIN BRANCH EnSet0
            WIRE 960 2144 1040 2144
            WIRE 1040 544 1040 2144
            WIRE 1040 544 1216 544
        END BRANCH
        INSTANCE XLXI_12 2176 1824 R0
        BEGIN BRANCH Z(7:0)
            WIRE 2400 1792 2432 1792
        END BRANCH
        IOMARKER 2432 1792 Z(7:0) R0 28
        BEGIN BRANCH En
            WIRE 144 2608 544 2608
            WIRE 544 2608 2048 2608
            WIRE 544 2336 576 2336
            WIRE 544 2336 544 2608
            WIRE 2048 1728 2048 2608
            WIRE 2048 1728 2176 1728
        END BRANCH
        IOMARKER 144 2608 En R180 28
        BEGIN INSTANCE XLXI_13 1216 1056 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_14 1216 1536 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_15 1216 1952 R0
        END INSTANCE
        BEGIN BRANCH XLXN_1
            WIRE 960 2208 1088 2208
            WIRE 1088 1024 1088 2208
            WIRE 1088 1024 1216 1024
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 960 2272 1072 2272
            WIRE 1072 1504 1072 2272
            WIRE 1072 1504 1216 1504
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 960 2336 1104 2336
            WIRE 1104 1920 1104 2336
            WIRE 1104 1920 1216 1920
        END BRANCH
    END SHEET
END SCHEMATIC
