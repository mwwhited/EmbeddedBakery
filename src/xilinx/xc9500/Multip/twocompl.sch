VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_5
        SIGNAL XLXN_10
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_15
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL XLXN_21
        SIGNAL XLXN_22
        SIGNAL XLXN_23
        SIGNAL XLXN_24
        SIGNAL XLXN_25
        SIGNAL En
        SIGNAL Z0
        SIGNAL Z1
        SIGNAL Z2
        SIGNAL Z3
        SIGNAL Z4
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL A4
        PORT Input A0
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Input En
        PORT Output Z0
        PORT Output Z1
        PORT Output Z2
        PORT Output Z3
        PORT Output Z4
        PORT Input A4
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
        BEGIN BLOCK XLXI_4 and2
            PIN I0 XLXN_12
            PIN I1 XLXN_10
            PIN O XLXN_13
        END BLOCK
        BEGIN BLOCK XLXI_3 and2
            PIN I0 XLXN_13
            PIN I1 XLXN_14
            PIN O XLXN_15
        END BLOCK
        BEGIN BLOCK XLXI_2 and2
            PIN I0 XLXN_5
            PIN I1 XLXN_3
            PIN O XLXN_12
        END BLOCK
        BEGIN BLOCK XLXI_1 and2
            PIN I0 XLXN_26
            PIN I1 XLXN_2
            PIN O XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_13 inv
            PIN I A3
            PIN O XLXN_14
        END BLOCK
        BEGIN BLOCK XLXI_12 inv
            PIN I A2
            PIN O XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_11 inv
            PIN I A1
            PIN O XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_10 inv
            PIN I A0
            PIN O XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_14 vcc
            PIN P XLXN_26
        END BLOCK
        BEGIN BLOCK XLXI_36 xor2
            PIN I0 XLXN_26
            PIN I1 XLXN_2
            PIN O XLXN_21
        END BLOCK
        BEGIN BLOCK XLXI_37 xor2
            PIN I0 XLXN_5
            PIN I1 XLXN_3
            PIN O XLXN_22
        END BLOCK
        BEGIN BLOCK XLXI_38 xor2
            PIN I0 XLXN_13
            PIN I1 XLXN_14
            PIN O XLXN_24
        END BLOCK
        BEGIN BLOCK XLXI_39 xor2
            PIN I0 XLXN_12
            PIN I1 XLXN_10
            PIN O XLXN_23
        END BLOCK
        BEGIN BLOCK XLXI_40 xor2
            PIN I0 XLXN_15
            PIN I1 XLXN_27
            PIN O XLXN_25
        END BLOCK
        BEGIN BLOCK XLXI_43 bufe4
            PIN E En
            PIN I0 XLXN_21
            PIN I1 XLXN_22
            PIN I2 XLXN_23
            PIN I3 XLXN_24
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
        BEGIN BLOCK XLXI_45 bufe
            PIN E En
            PIN I XLXN_25
            PIN O Z4
        END BLOCK
        BEGIN BLOCK XLXI_47 inv
            PIN I A4
            PIN O XLXN_27
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_36 800 288 R0
        INSTANCE XLXI_1 800 448 R0
        BEGIN BRANCH XLXN_2
            WIRE 624 160 720 160
            WIRE 720 160 800 160
            WIRE 720 160 720 320
            WIRE 720 320 800 320
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1056 352 1168 352
            WIRE 1168 352 1168 544
            WIRE 1168 544 1168 720
            WIRE 1168 720 1200 720
            WIRE 1168 544 1200 544
        END BRANCH
        INSTANCE XLXI_37 1200 608 R0
        INSTANCE XLXI_2 1200 784 R0
        BEGIN BRANCH XLXN_3
            WIRE 624 480 1120 480
            WIRE 1120 480 1200 480
            WIRE 1120 480 1120 656
            WIRE 1120 656 1200 656
        END BRANCH
        INSTANCE XLXI_39 1200 1008 R0
        INSTANCE XLXI_4 1200 1168 R0
        BEGIN BRANCH XLXN_10
            WIRE 624 880 1120 880
            WIRE 1120 880 1120 1040
            WIRE 1120 1040 1200 1040
            WIRE 1120 880 1200 880
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 1168 800 1520 800
            WIRE 1168 800 1168 944
            WIRE 1168 944 1200 944
            WIRE 1168 944 1168 1104
            WIRE 1168 1104 1200 1104
            WIRE 1456 688 1520 688
            WIRE 1520 688 1520 800
        END BRANCH
        INSTANCE XLXI_38 1200 1408 R0
        INSTANCE XLXI_13 400 1312 R0
        INSTANCE XLXI_12 400 912 R0
        INSTANCE XLXI_11 400 512 R0
        INSTANCE XLXI_10 400 192 R0
        INSTANCE XLXI_3 1200 1568 R0
        INSTANCE XLXI_40 1200 1808 R0
        BEGIN BRANCH XLXN_13
            WIRE 1168 1200 1520 1200
            WIRE 1168 1200 1168 1344
            WIRE 1168 1344 1168 1504
            WIRE 1168 1504 1200 1504
            WIRE 1168 1344 1200 1344
            WIRE 1456 1072 1520 1072
            WIRE 1520 1072 1520 1200
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 624 1280 1120 1280
            WIRE 1120 1280 1120 1440
            WIRE 1120 1440 1200 1440
            WIRE 1120 1280 1200 1280
        END BRANCH
        BEGIN BRANCH XLXN_15
            WIRE 1120 1600 1520 1600
            WIRE 1120 1600 1120 1744
            WIRE 1120 1744 1200 1744
            WIRE 1456 1472 1520 1472
            WIRE 1520 1472 1520 1600
        END BRANCH
        BEGIN BRANCH A0
            WIRE 368 160 400 160
        END BRANCH
        IOMARKER 368 160 A0 R180 28
        BEGIN BRANCH A1
            WIRE 368 480 400 480
        END BRANCH
        IOMARKER 368 480 A1 R180 28
        BEGIN BRANCH A2
            WIRE 368 880 400 880
        END BRANCH
        IOMARKER 368 880 A2 R180 28
        BEGIN BRANCH A3
            WIRE 368 1280 400 1280
        END BRANCH
        IOMARKER 368 1280 A3 R180 28
        INSTANCE XLXI_14 176 160 R0
        INSTANCE XLXI_43 1920 384 R0
        BEGIN BRANCH XLXN_21
            WIRE 1056 192 1600 192
            WIRE 1600 160 1920 160
            WIRE 1600 160 1600 192
        END BRANCH
        BEGIN BRANCH XLXN_22
            WIRE 1456 512 1616 512
            WIRE 1616 224 1616 512
            WIRE 1616 224 1920 224
        END BRANCH
        BEGIN BRANCH XLXN_23
            WIRE 1456 912 1632 912
            WIRE 1632 288 1632 912
            WIRE 1632 288 1920 288
        END BRANCH
        BEGIN BRANCH XLXN_24
            WIRE 1456 1312 1648 1312
            WIRE 1648 352 1648 1312
            WIRE 1648 352 1920 352
        END BRANCH
        BEGIN BRANCH XLXN_25
            WIRE 1456 1712 1664 1712
            WIRE 1664 560 1664 1712
            WIRE 1664 560 1920 560
        END BRANCH
        BEGIN BRANCH En
            WIRE 400 2080 1904 2080
            WIRE 1904 96 1920 96
            WIRE 1904 96 1904 496
            WIRE 1904 496 1920 496
            WIRE 1904 496 1904 2080
        END BRANCH
        BEGIN BRANCH Z0
            WIRE 2144 160 2176 160
        END BRANCH
        IOMARKER 2176 160 Z0 R0 28
        BEGIN BRANCH Z1
            WIRE 2144 224 2176 224
        END BRANCH
        IOMARKER 2176 224 Z1 R0 28
        BEGIN BRANCH Z2
            WIRE 2144 288 2176 288
        END BRANCH
        IOMARKER 2176 288 Z2 R0 28
        BEGIN BRANCH Z3
            WIRE 2144 352 2176 352
        END BRANCH
        IOMARKER 2176 352 Z3 R0 28
        BEGIN BRANCH Z4
            WIRE 2144 560 2176 560
        END BRANCH
        IOMARKER 2176 560 Z4 R0 28
        INSTANCE XLXI_45 1920 592 R0
        IOMARKER 400 2080 En R180 28
        BEGIN BRANCH XLXN_26
            WIRE 240 160 240 224
            WIRE 240 224 768 224
            WIRE 768 224 800 224
            WIRE 768 224 768 384
            WIRE 768 384 800 384
        END BRANCH
        INSTANCE XLXI_47 400 1712 R0
        BEGIN BRANCH XLXN_27
            WIRE 624 1680 1200 1680
        END BRANCH
        BEGIN BRANCH A4
            WIRE 368 1680 400 1680
        END BRANCH
        IOMARKER 368 1680 A4 R180 28
    END SHEET
END SCHEMATIC
