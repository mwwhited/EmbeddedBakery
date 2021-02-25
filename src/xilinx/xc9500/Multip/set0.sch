VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Zn(7:0)
        SIGNAL Zn(6)
        SIGNAL A(0:3)
        SIGNAL B(0:3)
        SIGNAL FnZ(0:4)
        SIGNAL XLXN_37
        SIGNAL XLXN_41
        SIGNAL FnZ(0)
        SIGNAL FnZ(1)
        SIGNAL FnZ(2)
        SIGNAL FnZ(3)
        SIGNAL FnZ(4)
        SIGNAL Zn(5)
        SIGNAL Zn(7)
        SIGNAL Z(7:0)
        SIGNAL En
        SIGNAL Fn(0:1)
        SIGNAL Fn(0)
        SIGNAL Fn(1)
        SIGNAL Zn(0:4)
        PORT Input A(0:3)
        PORT Input B(0:3)
        PORT Output Z(7:0)
        PORT Input En
        PORT Input Fn(0:1)
        BEGIN BLOCKDEF adder
            TIMESTAMP 2004 10 24 1 35 58
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF subtract
            TIMESTAMP 2004 10 24 2 5 31
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
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
        BEGIN BLOCKDEF multip
            TIMESTAMP 2004 10 24 23 59 37
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF divider
            TIMESTAMP 2004 10 21 3 5 50
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF bufe
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 96 -96 64 -96 
            LINE N 96 -48 96 -96 
            LINE N 0 -96 64 -96 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF or2
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
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
        BEGIN BLOCK XLXI_3 d2_4e
            PIN A0 Fn(0)
            PIN A1 Fn(1)
            PIN E En
            PIN D0 FnZ(0)
            PIN D1 FnZ(1)
            PIN D2 FnZ(2)
            PIN D3 FnZ(3)
        END BLOCK
        BEGIN BLOCK XLXI_4 multip
            PIN A(0:3) A(0:3)
            PIN B(0:3) B(0:3)
            PIN En FnZ(2)
            PIN Z(0:7) Zn(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 divider
            PIN A(0:3) A(0:3)
            PIN B(0:3) B(0:3)
            PIN En FnZ(3)
            PIN Z(7:0) Zn(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_6 bufe
            PIN E XLXN_37
            PIN I XLXN_41
            PIN O Zn(5)
        END BLOCK
        BEGIN BLOCK XLXI_7 bufe
            PIN E XLXN_37
            PIN I XLXN_41
            PIN O Zn(6)
        END BLOCK
        BEGIN BLOCK XLXI_8 bufe
            PIN E XLXN_37
            PIN I XLXN_41
            PIN O Zn(7)
        END BLOCK
        BEGIN BLOCK XLXI_9 or2
            PIN I0 FnZ(0)
            PIN I1 FnZ(1)
            PIN O XLXN_37
        END BLOCK
        BEGIN BLOCK XLXI_10 gnd
            PIN G XLXN_41
        END BLOCK
        BEGIN BLOCK XLXI_11 buf
            PIN I En
            PIN O FnZ(4)
        END BLOCK
        BEGIN BLOCK XLXI_12 bufe8
            PIN E FnZ(4)
            PIN I(7:0) Zn(7:0)
            PIN O(7:0) Z(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_13 adder
            PIN A(0:3) A(0:3)
            PIN B(0:3) B(0:3)
            PIN En FnZ(0)
            PIN Z(0:4) Zn(0:4)
        END BLOCK
        BEGIN BLOCK XLXI_14 subtract
            PIN A(0:3) A(0:3)
            PIN B(0:3) B(0:3)
            PIN En FnZ(1)
            PIN Z(0:4) Zn(0:4)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH Zn(7:0)
            WIRE 2160 288 2160 352
            WIRE 2160 352 2160 672
            WIRE 2160 672 2160 1680
            WIRE 2160 1680 3408 1680
            WIRE 2160 1680 2160 1824
            WIRE 2160 1824 2160 1952
            WIRE 2160 1952 2160 2080
            WIRE 2160 2080 2160 2128
            WIRE 2912 176 2976 176
            WIRE 2912 176 2912 288
            WIRE 2912 288 3408 288
            WIRE 3408 288 3408 512
            WIRE 3408 512 3408 576
            WIRE 3408 576 3408 640
            WIRE 3408 640 3408 704
            WIRE 3408 704 3408 768
            WIRE 3408 768 3408 832
            WIRE 3408 832 3408 896
            WIRE 3408 896 3408 960
            WIRE 3408 960 3408 1472
            WIRE 3408 1472 3408 1680
            WIRE 3200 896 3408 896
            WIRE 3200 1472 3408 1472
        END BRANCH
        BEGIN INSTANCE XLXI_5 2816 1632 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 2816 1056 R0
        END INSTANCE
        BEGIN BRANCH A(0:3)
            WIRE 640 240 1280 240
            WIRE 1280 240 2560 240
            WIRE 2560 240 2560 512
            WIRE 2560 512 2560 576
            WIRE 2560 576 2560 640
            WIRE 2560 640 2560 704
            WIRE 2560 704 2560 896
            WIRE 2560 896 2560 1472
            WIRE 2560 1472 2816 1472
            WIRE 2560 896 2816 896
            WIRE 1280 240 1280 352
            WIRE 1280 352 1536 352
            WIRE 1280 352 1280 672
            WIRE 1280 672 1536 672
        END BRANCH
        BEGIN BRANCH B(0:3)
            WIRE 640 320 1120 320
            WIRE 1120 320 1120 416
            WIRE 1120 416 1536 416
            WIRE 1120 416 1120 736
            WIRE 1120 736 1536 736
            WIRE 1120 160 2400 160
            WIRE 2400 160 2400 768
            WIRE 2400 768 2400 832
            WIRE 2400 832 2400 896
            WIRE 2400 896 2400 960
            WIRE 2400 960 2400 1536
            WIRE 2400 1536 2816 1536
            WIRE 2400 960 2816 960
            WIRE 1120 160 1120 320
        END BRANCH
        BEGIN BRANCH FnZ(2)
            WIRE 2336 1024 2704 1024
            WIRE 2704 1024 2816 1024
            BEGIN DISPLAY 2704 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FnZ(3)
            WIRE 2336 1600 2608 1600
            WIRE 2608 1600 2816 1600
            BEGIN DISPLAY 2608 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FnZ(0:4)
            WIRE 880 80 2240 80
            WIRE 2240 80 2240 112
            WIRE 2240 112 2240 1024
            WIRE 2240 1024 2240 1600
            WIRE 2240 1600 2240 1632
            WIRE 880 80 880 928
            WIRE 880 928 880 1632
            WIRE 880 1632 880 1952
            WIRE 880 1952 880 2016
            WIRE 880 2016 880 2080
            WIRE 880 2080 880 2144
            WIRE 880 2144 880 2320
            WIRE 880 2320 880 2368
        END BRANCH
        INSTANCE XLXI_6 1744 1856 R0
        INSTANCE XLXI_7 1744 1984 R0
        INSTANCE XLXI_8 1744 2112 R0
        INSTANCE XLXI_9 1296 1856 R0
        BEGIN BRANCH XLXN_37
            WIRE 1552 1760 1600 1760
            WIRE 1600 1760 1744 1760
            WIRE 1600 1760 1600 1888
            WIRE 1600 1888 1744 1888
            WIRE 1600 1888 1600 2016
            WIRE 1600 2016 1744 2016
        END BRANCH
        INSTANCE XLXI_10 1616 2272 R0
        BEGIN BRANCH XLXN_41
            WIRE 1680 1824 1744 1824
            WIRE 1680 1824 1680 1952
            WIRE 1680 1952 1744 1952
            WIRE 1680 1952 1680 2080
            WIRE 1680 2080 1744 2080
            WIRE 1680 2080 1680 2144
        END BRANCH
        BEGIN BRANCH Zn(5)
            WIRE 1968 1824 2016 1824
            WIRE 2016 1824 2064 1824
            BEGIN DISPLAY 2016 1824 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Zn(6)
            WIRE 1968 1952 2032 1952
            WIRE 2032 1952 2064 1952
            BEGIN DISPLAY 2032 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Zn(7)
            WIRE 1968 2080 2016 2080
            WIRE 2016 2080 2064 2080
            BEGIN DISPLAY 2016 2080 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FnZ(1)
            WIRE 976 1632 1120 1632
            WIRE 1120 1632 1120 1728
            WIRE 1120 1728 1296 1728
            WIRE 1120 800 1120 1632
            WIRE 1120 800 1328 800
            WIRE 1328 800 1536 800
            BEGIN DISPLAY 1328 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FnZ(0)
            WIRE 976 928 1040 928
            WIRE 1040 928 1040 1792
            WIRE 1040 1792 1296 1792
            WIRE 1040 480 1040 928
            WIRE 1040 480 1456 480
            WIRE 1456 480 1536 480
            BEGIN DISPLAY 1456 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_3 288 2272 R0
        BEGIN BRANCH FnZ(0)
            WIRE 672 1952 736 1952
            WIRE 736 1952 784 1952
            BEGIN DISPLAY 736 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FnZ(1)
            WIRE 672 2016 736 2016
            WIRE 736 2016 784 2016
            BEGIN DISPLAY 736 2016 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FnZ(2)
            WIRE 672 2080 736 2080
            WIRE 736 2080 784 2080
            BEGIN DISPLAY 736 2080 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FnZ(3)
            WIRE 672 2144 736 2144
            WIRE 736 2144 784 2144
            BEGIN DISPLAY 736 2144 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_11 464 2352 R0
        BEGIN BRANCH FnZ(4)
            WIRE 688 2320 736 2320
            WIRE 736 2320 784 2320
            BEGIN DISPLAY 736 2320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_12 2976 208 R0
        BEGIN BRANCH FnZ(4)
            WIRE 2336 112 2624 112
            WIRE 2624 112 2976 112
            BEGIN DISPLAY 2624 112 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(7:0)
            WIRE 3200 176 3232 176
        END BRANCH
        IOMARKER 3232 176 Z(7:0) R0 28
        BUSTAP 2240 112 2336 112
        BEGIN BRANCH En
            WIRE 240 2144 272 2144
            WIRE 272 2144 288 2144
            WIRE 272 2144 272 2320
            WIRE 272 2320 464 2320
        END BRANCH
        IOMARKER 240 2144 En R180 28
        IOMARKER 640 240 A(0:3) R180 28
        IOMARKER 640 320 B(0:3) R180 28
        BUSTAP 880 928 976 928
        BUSTAP 880 1632 976 1632
        BUSTAP 2240 1600 2336 1600
        BUSTAP 2240 1024 2336 1024
        BUSTAP 2160 2080 2064 2080
        BUSTAP 2160 1952 2064 1952
        BUSTAP 2160 1824 2064 1824
        BUSTAP 880 1952 784 1952
        BUSTAP 880 2016 784 2016
        BUSTAP 880 2080 784 2080
        BUSTAP 880 2144 784 2144
        BUSTAP 880 2320 784 2320
        BEGIN BRANCH Fn(0:1)
            WIRE 80 1760 320 1760
            WIRE 80 1760 80 1952
            WIRE 80 1952 80 2016
            WIRE 80 2016 80 2080
            WIRE 240 1664 320 1664
            WIRE 320 1664 320 1760
        END BRANCH
        BEGIN BRANCH Fn(0)
            WIRE 176 1952 224 1952
            WIRE 224 1952 288 1952
            BEGIN DISPLAY 224 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(1)
            WIRE 176 2016 224 2016
            WIRE 224 2016 288 2016
            BEGIN DISPLAY 224 2016 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 240 1664 Fn(0:1) R180 28
        BUSTAP 80 1952 176 1952
        BUSTAP 80 2016 176 2016
        BEGIN INSTANCE XLXI_13 1536 512 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_14 1536 832 R0
        END INSTANCE
        BEGIN BRANCH Zn(0:4)
            WIRE 1920 672 1984 672
            WIRE 1984 672 2064 672
            BEGIN DISPLAY 1984 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Zn(0:4)
            WIRE 1920 352 1984 352
            WIRE 1984 352 2064 352
            BEGIN DISPLAY 1984 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2160 352 2064 352
        BUSTAP 2160 672 2064 672
    END SHEET
END SCHEMATIC
