VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL A(1)
        END SIGNAL
        BEGIN SIGNAL A(2)
        END SIGNAL
        BEGIN SIGNAL A(3)
        END SIGNAL
        BEGIN SIGNAL B(1)
        END SIGNAL
        BEGIN SIGNAL B(2)
        END SIGNAL
        SIGNAL XLXN_9
        BEGIN SIGNAL Fn(0)
        END SIGNAL
        BEGIN SIGNAL Fn(1)
        END SIGNAL
        SIGNAL En
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_15
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL XLXN_35
        SIGNAL XLXN_36
        BEGIN SIGNAL A(0)
        END SIGNAL
        BEGIN SIGNAL B(3)
        END SIGNAL
        SIGNAL XLXN_42
        SIGNAL XLXN_43
        SIGNAL XLXN_48
        BEGIN SIGNAL B(0)
        END SIGNAL
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
        BEGIN SIGNAL Z(7)
        END SIGNAL
        SIGNAL Z(0:7)
        SIGNAL XLXN_50
        SIGNAL Fn(0:1)
        SIGNAL A(0:3)
        SIGNAL B(0:3)
        SIGNAL Z(5)
        SIGNAL Z(6)
        PORT Input En
        PORT Output Z(0:7)
        PORT Input Fn(0:1)
        PORT Input A(0:3)
        PORT Input B(0:3)
        BEGIN BLOCKDEF and_array
            TIMESTAMP 2004 10 19 0 14 54
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
        END BLOCKDEF
        BEGIN BLOCKDEF nand_array
            TIMESTAMP 2004 10 19 0 14 33
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
        END BLOCKDEF
        BEGIN BLOCKDEF not_array
            TIMESTAMP 2004 10 19 0 20 39
            RECTANGLE N 64 -320 320 0 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
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
        BEGIN BLOCKDEF evenp
            TIMESTAMP 2004 10 19 2 42 28
            RECTANGLE N 64 -320 320 0 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_4 d2_4e
            PIN A0 Fn(0)
            PIN A1 Fn(1)
            PIN E En
            PIN D0 XLXN_9
            PIN D1 XLXN_13
            PIN D2 XLXN_14
            PIN D3 XLXN_15
        END BLOCK
        BEGIN BLOCK XLXI_1 and_array
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN B0 B(0)
            PIN B1 B(1)
            PIN B2 B(2)
            PIN B3 B(3)
            PIN En XLXN_9
            PIN Z0 XLXN_33
            PIN Z1 XLXN_34
            PIN Z2 XLXN_35
            PIN Z3 XLXN_36
        END BLOCK
        BEGIN BLOCK XLXI_2 nand_array
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN B0 B(0)
            PIN B1 B(1)
            PIN B2 B(2)
            PIN B3 B(3)
            PIN En XLXN_13
            PIN Z0 XLXN_33
            PIN Z1 XLXN_34
            PIN Z2 XLXN_35
            PIN Z3 XLXN_36
        END BLOCK
        BEGIN BLOCK XLXI_3 not_array
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN En XLXN_14
            PIN Z0 XLXN_33
            PIN Z1 XLXN_34
            PIN Z2 XLXN_35
            PIN Z3 XLXN_36
        END BLOCK
        BEGIN BLOCK XLXI_5 evenp
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN En XLXN_15
            PIN Z0 XLXN_33
            PIN Z1 XLXN_34
            PIN Z2 XLXN_35
            PIN Z3 XLXN_36
            PIN Zp XLXN_43
        END BLOCK
        BEGIN BLOCK XLXI_13 bufe4
            PIN E En
            PIN I0 XLXN_33
            PIN I1 XLXN_34
            PIN I2 XLXN_35
            PIN I3 XLXN_36
            PIN O0 Z(0)
            PIN O1 Z(1)
            PIN O2 Z(2)
            PIN O3 Z(3)
        END BLOCK
        BEGIN BLOCK XLXI_14 bufe4
            PIN E En
            PIN I0 XLXN_42
            PIN I1 XLXN_48
            PIN I2 XLXN_48
            PIN I3 XLXN_48
            PIN O0 Z(4)
            PIN O1 Z(5)
            PIN O2 Z(6)
            PIN O3 Z(7)
        END BLOCK
        BEGIN BLOCK XLXI_15 and2
            PIN I0 XLXN_15
            PIN I1 XLXN_43
            PIN O XLXN_42
        END BLOCK
        BEGIN BLOCK XLXI_16 gnd
            PIN G XLXN_48
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 960 736 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 960 1520 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 960 2048 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_5 960 2576 R0
        END INSTANCE
        BEGIN BRANCH A(1)
            WIRE 176 256 256 256
            WIRE 256 256 448 256
            WIRE 448 256 832 256
            WIRE 832 256 832 1040
            WIRE 832 1040 832 1824
            WIRE 832 1824 832 2352
            WIRE 832 2352 960 2352
            WIRE 832 1824 960 1824
            WIRE 832 1040 960 1040
            WIRE 832 256 960 256
            BEGIN DISPLAY 448 256 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 176 320 256 320
            WIRE 256 320 448 320
            WIRE 448 320 816 320
            WIRE 816 320 816 1104
            WIRE 816 1104 816 1888
            WIRE 816 1888 816 2416
            WIRE 816 2416 960 2416
            WIRE 816 1888 960 1888
            WIRE 816 1104 960 1104
            WIRE 816 320 960 320
            BEGIN DISPLAY 448 320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 176 384 256 384
            WIRE 256 384 448 384
            WIRE 448 384 800 384
            WIRE 800 384 800 1168
            WIRE 800 1168 800 1952
            WIRE 800 1952 800 2480
            WIRE 800 2480 960 2480
            WIRE 800 1952 960 1952
            WIRE 800 1168 960 1168
            WIRE 800 384 960 384
            BEGIN DISPLAY 448 384 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(0)
            WIRE 160 2352 192 2352
            WIRE 192 2352 256 2352
            BEGIN DISPLAY 192 2352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(1)
            WIRE 160 2416 192 2416
            WIRE 192 2416 256 2416
            BEGIN DISPLAY 192 2416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH En
            WIRE 128 2544 208 2544
            WIRE 208 2544 256 2544
            WIRE 208 2544 208 2640
            WIRE 208 2640 2752 2640
            WIRE 2752 128 2816 128
            WIRE 2752 128 2752 800
            WIRE 2752 800 2752 2640
            WIRE 2752 800 2832 800
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 640 2480 672 2480
            WIRE 672 2016 672 2480
            WIRE 672 2016 960 2016
        END BRANCH
        BEGIN BRANCH XLXN_15
            WIRE 640 2544 912 2544
            WIRE 912 2544 960 2544
            WIRE 912 2544 912 2592
            WIRE 912 2592 2288 2592
            WIRE 2288 896 2336 896
            WIRE 2288 896 2288 2592
        END BRANCH
        INSTANCE XLXI_4 256 2672 R0
        BEGIN BRANCH XLXN_9
            WIRE 640 704 960 704
            WIRE 640 704 640 2352
        END BRANCH
        BEGIN BRANCH XLXN_13
            WIRE 640 2416 656 2416
            WIRE 656 1488 656 2416
            WIRE 656 1488 960 1488
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 224 512 272 512
            WIRE 272 512 448 512
            WIRE 448 512 736 512
            WIRE 736 512 736 1296
            WIRE 736 1296 960 1296
            WIRE 736 512 960 512
            BEGIN DISPLAY 448 512 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 224 576 256 576
            WIRE 256 576 464 576
            WIRE 464 576 752 576
            WIRE 752 576 752 1360
            WIRE 752 1360 960 1360
            WIRE 752 576 960 576
            BEGIN DISPLAY 464 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_13 2816 416 R0
        BEGIN BRANCH XLXN_33
            WIRE 1344 192 1440 192
            WIRE 1440 192 2816 192
            WIRE 1440 192 1440 976
            WIRE 1440 976 1440 1760
            WIRE 1440 1760 1440 2288
            WIRE 1344 976 1440 976
            WIRE 1344 1760 1440 1760
            WIRE 1344 2288 1440 2288
        END BRANCH
        BEGIN BRANCH XLXN_34
            WIRE 1344 256 1520 256
            WIRE 1520 256 2816 256
            WIRE 1520 256 1520 1040
            WIRE 1520 1040 1520 1824
            WIRE 1520 1824 1520 2352
            WIRE 1344 1040 1520 1040
            WIRE 1344 1824 1520 1824
            WIRE 1344 2352 1520 2352
        END BRANCH
        BEGIN BRANCH XLXN_35
            WIRE 1344 320 1600 320
            WIRE 1600 320 2816 320
            WIRE 1600 320 1600 1104
            WIRE 1600 1104 1600 1888
            WIRE 1600 1888 1600 2416
            WIRE 1344 1104 1600 1104
            WIRE 1344 1888 1600 1888
            WIRE 1344 2416 1600 2416
        END BRANCH
        BEGIN BRANCH XLXN_36
            WIRE 1344 384 1680 384
            WIRE 1680 384 2816 384
            WIRE 1680 384 1680 1168
            WIRE 1680 1168 1680 1952
            WIRE 1680 1952 1680 2480
            WIRE 1344 1168 1680 1168
            WIRE 1344 1952 1680 1952
            WIRE 1344 2480 1680 2480
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 176 192 272 192
            WIRE 272 192 448 192
            WIRE 448 192 848 192
            WIRE 848 192 848 976
            WIRE 848 976 960 976
            WIRE 848 976 848 1760
            WIRE 848 1760 960 1760
            WIRE 848 1760 848 2288
            WIRE 848 2288 960 2288
            WIRE 848 192 960 192
            BEGIN DISPLAY 448 192 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 224 640 272 640
            WIRE 272 640 432 640
            WIRE 432 640 768 640
            WIRE 768 640 768 1424
            WIRE 768 1424 960 1424
            WIRE 768 640 960 640
            BEGIN DISPLAY 432 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_42
            WIRE 2592 864 2832 864
        END BRANCH
        INSTANCE XLXI_15 2336 960 R0
        BEGIN BRANCH XLXN_43
            WIRE 1344 2544 2272 2544
            WIRE 2272 832 2336 832
            WIRE 2272 832 2272 2544
        END BRANCH
        INSTANCE XLXI_16 2496 1248 R0
        BEGIN BRANCH B(0)
            WIRE 224 448 240 448
            WIRE 240 448 448 448
            WIRE 448 448 944 448
            WIRE 944 448 960 448
            WIRE 944 448 944 1232
            WIRE 944 1232 960 1232
            BEGIN DISPLAY 448 448 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 128 2544 En R180 28
        BEGIN BRANCH Z(0)
            WIRE 3040 192 3056 192
            WIRE 3056 192 3072 192
            WIRE 3072 192 3104 192
            BEGIN DISPLAY 3056 192 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 3040 256 3072 256
            WIRE 3072 256 3104 256
            BEGIN DISPLAY 3072 256 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 3040 320 3072 320
            WIRE 3072 320 3088 320
            WIRE 3088 320 3104 320
            BEGIN DISPLAY 3088 320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 3040 384 3072 384
            WIRE 3072 384 3088 384
            WIRE 3088 384 3104 384
            BEGIN DISPLAY 3088 384 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 3056 864 3088 864
            WIRE 3088 864 3104 864
            BEGIN DISPLAY 3088 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(7)
            WIRE 3056 1056 3088 1056
            WIRE 3088 1056 3104 1056
            BEGIN DISPLAY 3088 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0:7)
            WIRE 3200 160 3344 160
            WIRE 3200 160 3200 192
            WIRE 3200 192 3200 256
            WIRE 3200 256 3200 320
            WIRE 3200 320 3200 384
            WIRE 3200 384 3200 864
            WIRE 3200 864 3200 928
            WIRE 3200 928 3200 992
            WIRE 3200 992 3200 1056
            WIRE 3200 1056 3200 1120
        END BRANCH
        BEGIN BRANCH A(0:3)
            WIRE 80 80 320 80
            WIRE 80 80 80 192
            WIRE 80 192 80 256
            WIRE 80 256 80 320
            WIRE 80 320 80 384
            WIRE 80 384 80 400
        END BRANCH
        BEGIN BRANCH B(0:3)
            WIRE 128 416 128 448
            WIRE 128 448 128 512
            WIRE 128 512 128 576
            WIRE 128 576 128 640
            WIRE 128 640 128 736
            WIRE 128 736 320 736
        END BRANCH
        IOMARKER 320 80 A(0:3) R0 28
        IOMARKER 320 736 B(0:3) R0 28
        BEGIN BRANCH Fn(0:1)
            WIRE 64 2064 240 2064
            WIRE 64 2064 64 2352
            WIRE 64 2352 64 2416
            WIRE 64 2416 64 2432
        END BRANCH
        IOMARKER 240 2064 Fn(0:1) R0 28
        IOMARKER 3344 160 Z(0:7) R0 28
        BUSTAP 3200 192 3104 192
        BUSTAP 3200 256 3104 256
        BUSTAP 3200 320 3104 320
        BUSTAP 3200 384 3104 384
        BUSTAP 3200 864 3104 864
        INSTANCE XLXI_14 2832 1088 R0
        BEGIN BRANCH XLXN_48
            WIRE 2560 928 2832 928
            WIRE 2560 928 2560 992
            WIRE 2560 992 2560 1056
            WIRE 2560 1056 2560 1120
            WIRE 2560 1056 2832 1056
            WIRE 2560 992 2832 992
        END BRANCH
        BUSTAP 3200 1056 3104 1056
        BEGIN BRANCH Z(5)
            WIRE 3056 928 3072 928
            WIRE 3072 928 3104 928
            BEGIN DISPLAY 3072 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(6)
            WIRE 3056 992 3088 992
            WIRE 3088 992 3104 992
            BEGIN DISPLAY 3088 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 3200 928 3104 928
        BUSTAP 3200 992 3104 992
        BUSTAP 80 192 176 192
        BUSTAP 80 256 176 256
        BUSTAP 80 320 176 320
        BUSTAP 80 384 176 384
        BUSTAP 128 448 224 448
        BUSTAP 128 512 224 512
        BUSTAP 128 576 224 576
        BUSTAP 128 640 224 640
        BUSTAP 64 2352 160 2352
        BUSTAP 64 2416 160 2416
    END SHEET
END SCHEMATIC
