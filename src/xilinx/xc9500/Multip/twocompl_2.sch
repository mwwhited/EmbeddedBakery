VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_5
        SIGNAL XLXN_3
        SIGNAL XLXN_10
        SIGNAL XLXN_32
        SIGNAL XLXN_12
        SIGNAL XLXN_34
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_37
        SIGNAL Z(4)
        BEGIN SIGNAL A(0)
        END SIGNAL
        BEGIN SIGNAL A(1)
        END SIGNAL
        BEGIN SIGNAL A(2)
        END SIGNAL
        BEGIN SIGNAL A(3)
        END SIGNAL
        SIGNAL XLXN_43
        SIGNAL Z(0)
        SIGNAL XLXN_49
        SIGNAL A(0:3)
        SIGNAL Z(3)
        SIGNAL Z(2)
        SIGNAL Z(1)
        SIGNAL XLXN_64
        SIGNAL XLXN_67
        SIGNAL XLXN_68
        SIGNAL XLXN_69
        SIGNAL XLXN_70
        SIGNAL Z(0:5)
        SIGNAL Z(5)
        PORT Input A(0:3)
        PORT Output Z(0:5)
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
        BEGIN BLOCKDEF inv
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 96 -64 32 -64 
            LINE N 64 0 64 -32 
            LINE N 64 -32 64 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
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
        BEGIN BLOCK XLXI_36 xor2
            PIN I0 XLXN_68
            PIN I1 XLXN_69
            PIN O Z(0)
        END BLOCK
        BEGIN BLOCK XLXI_1 and2
            PIN I0 XLXN_69
            PIN I1 XLXN_68
            PIN O XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_37 xor2
            PIN I0 XLXN_5
            PIN I1 XLXN_3
            PIN O Z(1)
        END BLOCK
        BEGIN BLOCK XLXI_2 and2
            PIN I0 XLXN_5
            PIN I1 XLXN_3
            PIN O XLXN_12
        END BLOCK
        BEGIN BLOCK XLXI_39 xor2
            PIN I0 XLXN_12
            PIN I1 XLXN_10
            PIN O Z(2)
        END BLOCK
        BEGIN BLOCK XLXI_4 and2
            PIN I0 XLXN_12
            PIN I1 XLXN_10
            PIN O XLXN_13
        END BLOCK
        BEGIN BLOCK XLXI_38 xor2
            PIN I0 XLXN_13
            PIN I1 XLXN_14
            PIN O Z(3)
        END BLOCK
        BEGIN BLOCK XLXI_13 inv
            PIN I A(3)
            PIN O XLXN_14
        END BLOCK
        BEGIN BLOCK XLXI_12 inv
            PIN I A(2)
            PIN O XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_11 inv
            PIN I A(1)
            PIN O XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_10 inv
            PIN I A(0)
            PIN O XLXN_68
        END BLOCK
        BEGIN BLOCK XLXI_3 and2
            PIN I0 XLXN_13
            PIN I1 XLXN_14
            PIN O Z(4)
        END BLOCK
        BEGIN BLOCK XLXI_14 vcc
            PIN P XLXN_69
        END BLOCK
        BEGIN BLOCK XLXI_65 buf
            PIN I XLXN_70
            PIN O Z(5)
        END BLOCK
        BEGIN BLOCK XLXI_66 gnd
            PIN G XLXN_70
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_36 1456 448 R0
        INSTANCE XLXI_1 1456 608 R0
        BEGIN BRANCH XLXN_5
            WIRE 1712 512 1824 512
            WIRE 1824 512 1824 704
            WIRE 1824 704 1824 880
            WIRE 1824 880 1856 880
            WIRE 1824 704 1856 704
        END BRANCH
        INSTANCE XLXI_37 1856 768 R0
        INSTANCE XLXI_2 1856 944 R0
        BEGIN BRANCH XLXN_3
            WIRE 1280 640 1776 640
            WIRE 1776 640 1856 640
            WIRE 1776 640 1776 816
            WIRE 1776 816 1856 816
        END BRANCH
        INSTANCE XLXI_39 1856 1168 R0
        INSTANCE XLXI_4 1856 1328 R0
        BEGIN BRANCH XLXN_10
            WIRE 1280 1040 1776 1040
            WIRE 1776 1040 1776 1200
            WIRE 1776 1200 1856 1200
            WIRE 1776 1040 1856 1040
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 1824 960 2176 960
            WIRE 1824 960 1824 1104
            WIRE 1824 1104 1856 1104
            WIRE 1824 1104 1824 1264
            WIRE 1824 1264 1856 1264
            WIRE 2112 848 2176 848
            WIRE 2176 848 2176 960
        END BRANCH
        INSTANCE XLXI_38 1856 1568 R0
        INSTANCE XLXI_13 1056 1472 R0
        INSTANCE XLXI_12 1056 1072 R0
        INSTANCE XLXI_11 1056 672 R0
        INSTANCE XLXI_3 1856 1728 R0
        BEGIN BRANCH XLXN_13
            WIRE 1824 1360 2176 1360
            WIRE 1824 1360 1824 1504
            WIRE 1824 1504 1824 1664
            WIRE 1824 1664 1856 1664
            WIRE 1824 1504 1856 1504
            WIRE 2112 1232 2176 1232
            WIRE 2176 1232 2176 1360
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 1280 1440 1776 1440
            WIRE 1776 1440 1776 1600
            WIRE 1776 1600 1856 1600
            WIRE 1776 1440 1856 1440
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 2112 1632 2496 1632
            WIRE 2496 1632 2544 1632
            WIRE 2544 1632 2624 1632
            BEGIN DISPLAY 2496 1632 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 736 640 832 640
            WIRE 832 640 1056 640
            BEGIN DISPLAY 832 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 736 1040 832 1040
            WIRE 832 1040 1056 1040
            BEGIN DISPLAY 832 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 736 1440 832 1440
            WIRE 832 1440 1056 1440
            BEGIN DISPLAY 832 1440 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0)
            WIRE 1712 352 2416 352
            WIRE 2416 352 2560 352
            WIRE 2560 352 2624 352
            BEGIN DISPLAY 2416 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(0:3)
            WIRE 320 192 640 192
            WIRE 640 192 640 480
            WIRE 640 480 640 640
            WIRE 640 640 640 1040
            WIRE 640 1040 640 1440
            WIRE 640 1440 640 1616
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 2112 1472 2512 1472
            WIRE 2512 1472 2560 1472
            WIRE 2560 1472 2624 1472
            BEGIN DISPLAY 2512 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 2112 1072 2496 1072
            WIRE 2496 1072 2560 1072
            WIRE 2560 1072 2624 1072
            BEGIN DISPLAY 2496 1072 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 2112 672 2496 672
            WIRE 2496 672 2560 672
            WIRE 2560 672 2624 672
            BEGIN DISPLAY 2496 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_14 832 256 R0
        INSTANCE XLXI_10 1056 512 R0
        BEGIN BRANCH A(0)
            WIRE 736 480 864 480
            WIRE 864 480 1056 480
            BEGIN DISPLAY 864 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_68
            WIRE 1280 480 1392 480
            WIRE 1392 480 1456 480
            WIRE 1392 384 1456 384
            WIRE 1392 384 1392 480
        END BRANCH
        BEGIN BRANCH XLXN_69
            WIRE 896 256 896 320
            WIRE 896 320 1440 320
            WIRE 1440 320 1456 320
            WIRE 1440 320 1440 544
            WIRE 1440 544 1456 544
        END BRANCH
        IOMARKER 320 192 A(0:3) R180 28
        BUSTAP 640 480 736 480
        BUSTAP 640 640 736 640
        BUSTAP 640 1040 736 1040
        BUSTAP 640 1440 736 1440
        INSTANCE XLXI_65 2176 1952 R0
        INSTANCE XLXI_66 1936 2144 R0
        BEGIN BRANCH XLXN_70
            WIRE 2000 1920 2176 1920
            WIRE 2000 1920 2000 2016
        END BRANCH
        BEGIN BRANCH Z(0:5)
            WIRE 2720 176 2944 176
            WIRE 2720 176 2720 352
            WIRE 2720 352 2720 352
            WIRE 2720 352 2720 672
            WIRE 2720 672 2720 1072
            WIRE 2720 1072 2720 1072
            WIRE 2720 1072 2720 1472
            WIRE 2720 1472 2720 1632
            WIRE 2720 1632 2720 1632
            WIRE 2720 1632 2720 1920
            WIRE 2720 1920 2720 1920
            WIRE 2720 1920 2720 2080
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 2400 1920 2496 1920
            WIRE 2496 1920 2624 1920
            BEGIN DISPLAY 2496 1920 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2720 1920 2624 1920
        BUSTAP 2720 1632 2624 1632
        BUSTAP 2720 1472 2624 1472
        BUSTAP 2720 1072 2624 1072
        BUSTAP 2720 672 2624 672
        BUSTAP 2720 352 2624 352
        IOMARKER 2944 176 Z(0:5) R0 28
    END SHEET
END SCHEMATIC
