VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL BusA(0)
        SIGNAL BusA(1)
        SIGNAL BusA(2)
        SIGNAL BusA(3)
        SIGNAL BusA(0:3)
        SIGNAL B0
        SIGNAL B2
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL B3
        SIGNAL B1
        SIGNAL XLXN_1
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL XLXN_11
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_15
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        SIGNAL XLXN_18
        SIGNAL XLXN_19
        SIGNAL XLXN_20
        SIGNAL XLXN_21
        SIGNAL XLXN_22
        SIGNAL XLXN_23
        SIGNAL XLXN_24
        SIGNAL XLXN_25
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL XLXN_28
        SIGNAL XLXN_29
        SIGNAL XLXN_30
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL XLXN_35
        SIGNAL XLXN_36
        SIGNAL XLXN_37
        SIGNAL XLXN_38
        SIGNAL XLXN_39
        SIGNAL XLXN_40
        SIGNAL XLXN_41
        SIGNAL XLXN_42
        SIGNAL XLXN_43
        SIGNAL XLXN_44
        SIGNAL XLXN_45
        SIGNAL XLXN_46
        SIGNAL XLXN_47
        SIGNAL XLXN_48
        SIGNAL XLXN_49
        SIGNAL XLXN_58
        SIGNAL XLXN_59
        SIGNAL XLXN_60
        SIGNAL XLXN_61
        SIGNAL XLXN_62
        SIGNAL XLXN_71
        SIGNAL XLXN_72
        SIGNAL XLXN_73
        SIGNAL XLXN_74
        SIGNAL XLXN_75
        SIGNAL XLXN_79
        SIGNAL XLXN_80
        SIGNAL XLXN_81
        SIGNAL XLXN_82
        SIGNAL En
        SIGNAL Z7
        SIGNAL Z6
        SIGNAL Z5
        SIGNAL Z4
        SIGNAL Z3
        SIGNAL Z2
        SIGNAL Z1
        SIGNAL Z0
        PORT Input B0
        PORT Input B2
        PORT Input A0
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Input B3
        PORT Input B1
        PORT Input En
        PORT Output Z7
        PORT Output Z6
        PORT Output Z5
        PORT Output Z4
        PORT Output Z3
        PORT Output Z2
        PORT Output Z1
        PORT Output Z0
        BEGIN BLOCKDEF and_row
            TIMESTAMP 2004 10 19 0 26 57
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
        BEGIN BLOCKDEF e_adder
            TIMESTAMP 2004 10 19 2 6 7
            RECTANGLE N 64 -1088 320 0 
            LINE N 64 -1056 0 -1056 
            LINE N 64 -992 0 -992 
            LINE N 64 -928 0 -928 
            LINE N 64 -864 0 -864 
            LINE N 64 -800 0 -800 
            LINE N 64 -736 0 -736 
            LINE N 64 -672 0 -672 
            LINE N 64 -608 0 -608 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -1056 384 -1056 
            LINE N 320 -992 384 -992 
            LINE N 320 -928 384 -928 
            LINE N 320 -864 384 -864 
            LINE N 320 -800 384 -800 
            LINE N 320 -736 384 -736 
            LINE N 320 -672 384 -672 
            LINE N 320 -608 384 -608 
            LINE N 320 -544 384 -544 
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
        BEGIN BLOCK XLXI_7 and_row
            PIN A0 BusA(0)
            PIN A1 BusA(1)
            PIN A2 BusA(2)
            PIN A3 BusA(3)
            PIN B B0
            PIN Z0 XLXN_14
            PIN Z1 XLXN_15
            PIN Z2 XLXN_16
            PIN Z3 XLXN_17
        END BLOCK
        BEGIN BLOCK XLXI_11 buf4
            PIN I0 A0
            PIN I1 A1
            PIN I2 A2
            PIN I3 A3
            PIN O0 BusA(0)
            PIN O1 BusA(1)
            PIN O2 BusA(2)
            PIN O3 BusA(3)
        END BLOCK
        BEGIN BLOCK XLXI_16 and_row
            PIN A0 BusA(0)
            PIN A1 BusA(1)
            PIN A2 BusA(2)
            PIN A3 BusA(3)
            PIN B B2
            PIN Z0 XLXN_33
            PIN Z1 XLXN_34
            PIN Z2 XLXN_35
            PIN Z3 XLXN_36
        END BLOCK
        BEGIN BLOCK XLXI_17 and_row
            PIN A0 BusA(0)
            PIN A1 BusA(1)
            PIN A2 BusA(2)
            PIN A3 BusA(3)
            PIN B B3
            PIN Z0 XLXN_46
            PIN Z1 XLXN_47
            PIN Z2 XLXN_48
            PIN Z3 XLXN_49
        END BLOCK
        BEGIN BLOCK XLXI_18 and_row
            PIN A0 BusA(0)
            PIN A1 BusA(1)
            PIN A2 BusA(2)
            PIN A3 BusA(3)
            PIN B B1
            PIN Z0 XLXN_18
            PIN Z1 XLXN_19
            PIN Z2 XLXN_20
            PIN Z3 XLXN_21
        END BLOCK
        BEGIN BLOCK XLXI_19 e_adder
            PIN Cin XLXN_30
            PIN A0 XLXN_14
            PIN A1 XLXN_15
            PIN A2 XLXN_16
            PIN A3 XLXN_17
            PIN A4 XLXN_30
            PIN A5 XLXN_30
            PIN A6 XLXN_30
            PIN A7 XLXN_30
            PIN B0 XLXN_30
            PIN B1 XLXN_18
            PIN B2 XLXN_19
            PIN B3 XLXN_20
            PIN B4 XLXN_21
            PIN B5 XLXN_30
            PIN B6 XLXN_30
            PIN B7 XLXN_30
            PIN Z0 XLXN_6
            PIN Z1 XLXN_7
            PIN Z2 XLXN_8
            PIN Z3 XLXN_9
            PIN Z4 XLXN_10
            PIN Z5 XLXN_11
            PIN Z6 XLXN_12
            PIN Z7 XLXN_13
            PIN Cout XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_20 e_adder
            PIN Cin XLXN_5
            PIN A0 XLXN_6
            PIN A1 XLXN_7
            PIN A2 XLXN_8
            PIN A3 XLXN_9
            PIN A4 XLXN_10
            PIN A5 XLXN_11
            PIN A6 XLXN_12
            PIN A7 XLXN_13
            PIN B0 XLXN_30
            PIN B1 XLXN_30
            PIN B2 XLXN_33
            PIN B3 XLXN_34
            PIN B4 XLXN_35
            PIN B5 XLXN_36
            PIN B6 XLXN_30
            PIN B7 XLXN_30
            PIN Z0 XLXN_38
            PIN Z1 XLXN_39
            PIN Z2 XLXN_40
            PIN Z3 XLXN_41
            PIN Z4 XLXN_42
            PIN Z5 XLXN_43
            PIN Z6 XLXN_44
            PIN Z7 XLXN_45
            PIN Cout XLXN_37
        END BLOCK
        BEGIN BLOCK XLXI_21 e_adder
            PIN Cin XLXN_37
            PIN A0 XLXN_38
            PIN A1 XLXN_39
            PIN A2 XLXN_40
            PIN A3 XLXN_41
            PIN A4 XLXN_42
            PIN A5 XLXN_43
            PIN A6 XLXN_44
            PIN A7 XLXN_45
            PIN B0 XLXN_30
            PIN B1 XLXN_30
            PIN B2 XLXN_30
            PIN B3 XLXN_46
            PIN B4 XLXN_47
            PIN B5 XLXN_48
            PIN B6 XLXN_49
            PIN B7 XLXN_30
            PIN Z0 XLXN_71
            PIN Z1 XLXN_72
            PIN Z2 XLXN_73
            PIN Z3 XLXN_74
            PIN Z4 XLXN_75
            PIN Z5 XLXN_79
            PIN Z6 XLXN_80
            PIN Z7 XLXN_81
            PIN Cout
        END BLOCK
        BEGIN BLOCK XLXI_22 gnd
            PIN G XLXN_30
        END BLOCK
        BEGIN BLOCK XLXI_23 bufe4
            PIN E En
            PIN I0 XLXN_71
            PIN I1 XLXN_72
            PIN I2 XLXN_73
            PIN I3 XLXN_74
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
        BEGIN BLOCK XLXI_24 bufe4
            PIN E En
            PIN I0 XLXN_75
            PIN I1 XLXN_79
            PIN I2 XLXN_80
            PIN I3 XLXN_81
            PIN O0 Z4
            PIN O1 Z5
            PIN O2 Z6
            PIN O3 Z7
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_7 752 560 R0
        END INSTANCE
        BEGIN BRANCH BusA(0)
            WIRE 656 272 704 272
            WIRE 704 272 752 272
            BEGIN DISPLAY 704 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(1)
            WIRE 656 336 688 336
            WIRE 688 336 752 336
            BEGIN DISPLAY 688 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(2)
            WIRE 656 400 704 400
            WIRE 704 400 752 400
            BEGIN DISPLAY 704 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(3)
            WIRE 640 464 656 464
            WIRE 656 464 688 464
            WIRE 688 464 752 464
            BEGIN DISPLAY 688 464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 560 464 656 464
        BUSTAP 560 400 656 400
        BUSTAP 560 336 656 336
        BUSTAP 560 272 656 272
        BEGIN BRANCH BusA(0)
            WIRE 336 576 400 576
            WIRE 400 576 464 576
            BEGIN DISPLAY 400 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(1)
            WIRE 336 640 400 640
            WIRE 400 640 464 640
            BEGIN DISPLAY 400 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(2)
            WIRE 336 704 384 704
            WIRE 384 704 464 704
            BEGIN DISPLAY 384 704 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(3)
            WIRE 336 768 384 768
            WIRE 384 768 464 768
            BEGIN DISPLAY 384 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 560 576 464 576
        BUSTAP 560 640 464 640
        BUSTAP 560 704 464 704
        BUSTAP 560 768 464 768
        BEGIN BRANCH BusA(0)
            WIRE 1520 272 1536 272
            WIRE 1536 272 1568 272
            WIRE 1568 272 1616 272
            BEGIN DISPLAY 1568 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(1)
            WIRE 1520 336 1536 336
            WIRE 1536 336 1552 336
            WIRE 1552 336 1616 336
            BEGIN DISPLAY 1552 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(2)
            WIRE 1520 400 1536 400
            WIRE 1536 400 1568 400
            WIRE 1568 400 1616 400
            BEGIN DISPLAY 1568 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(3)
            WIRE 1520 464 1536 464
            WIRE 1536 464 1552 464
            WIRE 1552 464 1616 464
            BEGIN DISPLAY 1552 464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_16 1616 560 R0
        END INSTANCE
        BUSTAP 1440 272 1536 272
        BUSTAP 1440 336 1536 336
        BUSTAP 1440 400 1536 400
        BUSTAP 1440 464 1536 464
        BEGIN BRANCH BusA(0:3)
            WIRE 560 160 1440 160
            WIRE 1440 160 1440 272
            WIRE 1440 272 1440 336
            WIRE 1440 336 1440 400
            WIRE 1440 400 1440 464
            WIRE 1440 464 1440 496
            WIRE 1440 160 2240 160
            WIRE 2240 160 2240 272
            WIRE 2240 272 2240 336
            WIRE 2240 336 2240 400
            WIRE 2240 400 2240 464
            WIRE 2240 464 2240 496
            WIRE 560 160 560 272
            WIRE 560 272 560 336
            WIRE 560 336 560 400
            WIRE 560 400 560 464
            WIRE 560 464 560 576
            WIRE 560 576 560 640
            WIRE 560 640 560 704
            WIRE 560 704 560 768
            WIRE 560 768 560 832
            WIRE 560 832 560 896
            WIRE 560 896 560 960
            WIRE 560 960 560 1024
            WIRE 560 1024 560 1056
        END BRANCH
        BEGIN BRANCH B0
            WIRE 128 1264 368 1264
            WIRE 368 528 368 1264
            WIRE 368 528 752 528
        END BRANCH
        BEGIN BRANCH A0
            WIRE 80 576 112 576
        END BRANCH
        IOMARKER 80 576 A0 R180 28
        BEGIN BRANCH A1
            WIRE 80 640 112 640
        END BRANCH
        IOMARKER 80 640 A1 R180 28
        BEGIN BRANCH A2
            WIRE 80 704 112 704
        END BRANCH
        IOMARKER 80 704 A2 R180 28
        BEGIN BRANCH A3
            WIRE 80 768 112 768
        END BRANCH
        IOMARKER 80 768 A3 R180 28
        INSTANCE XLXI_11 112 800 R0
        BEGIN BRANCH BusA(0)
            WIRE 2336 272 2400 272
            WIRE 2400 272 2448 272
            BEGIN DISPLAY 2400 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(1)
            WIRE 2336 336 2400 336
            WIRE 2400 336 2448 336
            BEGIN DISPLAY 2400 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(2)
            WIRE 2336 400 2400 400
            WIRE 2400 400 2448 400
            BEGIN DISPLAY 2400 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(3)
            WIRE 2336 464 2400 464
            WIRE 2400 464 2448 464
            BEGIN DISPLAY 2400 464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2240 272 2336 272
        BUSTAP 2240 336 2336 336
        BUSTAP 2240 400 2336 400
        BUSTAP 2240 464 2336 464
        BEGIN INSTANCE XLXI_18 736 1120 R0
        END INSTANCE
        BEGIN BRANCH B3
            WIRE 128 1408 320 1408
            WIRE 320 64 2320 64
            WIRE 2320 64 2320 528
            WIRE 2320 528 2448 528
            WIRE 320 64 320 1408
        END BRANCH
        BEGIN BRANCH BusA(0)
            WIRE 656 832 688 832
            WIRE 688 832 736 832
            BEGIN DISPLAY 688 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(1)
            WIRE 656 896 688 896
            WIRE 688 896 736 896
            BEGIN DISPLAY 688 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(2)
            WIRE 656 960 688 960
            WIRE 688 960 736 960
            BEGIN DISPLAY 688 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(3)
            WIRE 656 1024 688 1024
            WIRE 688 1024 736 1024
            BEGIN DISPLAY 688 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 560 832 656 832
        BUSTAP 560 960 656 960
        BUSTAP 560 1024 656 1024
        BUSTAP 560 896 656 896
        BEGIN BRANCH B1
            WIRE 128 1312 352 1312
            WIRE 352 1088 352 1312
            WIRE 352 1088 736 1088
        END BRANCH
        BEGIN INSTANCE XLXI_19 1312 2352 R0
        END INSTANCE
        IOMARKER 128 1264 B0 R180 28
        IOMARKER 128 1312 B1 R180 28
        BEGIN BRANCH B2
            WIRE 128 1360 336 1360
            WIRE 336 112 336 1360
            WIRE 336 112 1600 112
            WIRE 1600 112 1600 528
            WIRE 1600 528 1616 528
        END BRANCH
        IOMARKER 128 1360 B2 R180 28
        IOMARKER 128 1408 B3 R180 28
        BEGIN BRANCH XLXN_5
            WIRE 1696 1808 1728 1808
            WIRE 1728 1168 1728 1808
            WIRE 1728 1168 2176 1168
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1696 1360 1760 1360
            WIRE 1760 1296 1760 1360
            WIRE 1760 1296 2176 1296
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1696 1424 1776 1424
            WIRE 1776 1360 1776 1424
            WIRE 1776 1360 2176 1360
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 1696 1488 1792 1488
            WIRE 1792 1424 1792 1488
            WIRE 1792 1424 2176 1424
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 1696 1552 1808 1552
            WIRE 1808 1488 1808 1552
            WIRE 1808 1488 2176 1488
        END BRANCH
        BEGIN BRANCH XLXN_11
            WIRE 1696 1616 1824 1616
            WIRE 1824 1552 1824 1616
            WIRE 1824 1552 2176 1552
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 1696 1680 1840 1680
            WIRE 1840 1616 1840 1680
            WIRE 1840 1616 2176 1616
        END BRANCH
        BEGIN BRANCH XLXN_13
            WIRE 1696 1744 1856 1744
            WIRE 1856 1680 1856 1744
            WIRE 1856 1680 2176 1680
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 1136 272 1280 272
            WIRE 1280 272 1280 1360
            WIRE 1280 1360 1312 1360
        END BRANCH
        BEGIN BRANCH XLXN_15
            WIRE 1136 336 1264 336
            WIRE 1264 336 1264 1424
            WIRE 1264 1424 1312 1424
        END BRANCH
        BEGIN BRANCH XLXN_16
            WIRE 1136 400 1248 400
            WIRE 1248 400 1248 1488
            WIRE 1248 1488 1312 1488
        END BRANCH
        BEGIN BRANCH XLXN_17
            WIRE 1136 464 1232 464
            WIRE 1232 464 1232 1552
            WIRE 1232 1552 1312 1552
        END BRANCH
        BEGIN BRANCH XLXN_18
            WIRE 1120 832 1216 832
            WIRE 1216 832 1216 1936
            WIRE 1216 1936 1312 1936
        END BRANCH
        BEGIN BRANCH XLXN_19
            WIRE 1120 896 1200 896
            WIRE 1200 896 1200 2000
            WIRE 1200 2000 1312 2000
        END BRANCH
        BEGIN BRANCH XLXN_20
            WIRE 1120 960 1184 960
            WIRE 1184 960 1184 2064
            WIRE 1184 2064 1312 2064
        END BRANCH
        BEGIN BRANCH XLXN_21
            WIRE 1120 1024 1168 1024
            WIRE 1168 1024 1168 2128
            WIRE 1168 2128 1312 2128
        END BRANCH
        BEGIN INSTANCE XLXI_20 2176 2224 R0
        END INSTANCE
        BEGIN BRANCH XLXN_6
            WIRE 1696 1296 1744 1296
            WIRE 1744 1232 1744 1296
            WIRE 1744 1232 2176 1232
        END BRANCH
        INSTANCE XLXI_22 976 2672 R0
        BEGIN BRANCH XLXN_33
            WIRE 2000 272 2080 272
            WIRE 2080 272 2080 1872
            WIRE 2080 1872 2176 1872
        END BRANCH
        BEGIN BRANCH XLXN_34
            WIRE 2000 336 2064 336
            WIRE 2064 336 2064 1936
            WIRE 2064 1936 2176 1936
        END BRANCH
        BEGIN BRANCH XLXN_35
            WIRE 2000 400 2048 400
            WIRE 2048 400 2048 2000
            WIRE 2048 2000 2176 2000
        END BRANCH
        BEGIN BRANCH XLXN_36
            WIRE 2000 464 2032 464
            WIRE 2032 464 2032 2064
            WIRE 2032 2064 2176 2064
        END BRANCH
        BEGIN BRANCH XLXN_37
            WIRE 2560 1680 2576 1680
            WIRE 2576 1104 2576 1680
            WIRE 2576 1104 2944 1104
        END BRANCH
        BEGIN BRANCH XLXN_39
            WIRE 2560 1232 2944 1232
        END BRANCH
        BEGIN BRANCH XLXN_40
            WIRE 2560 1296 2944 1296
        END BRANCH
        BEGIN BRANCH XLXN_41
            WIRE 2560 1360 2944 1360
        END BRANCH
        BEGIN BRANCH XLXN_42
            WIRE 2560 1424 2944 1424
        END BRANCH
        BEGIN BRANCH XLXN_43
            WIRE 2560 1488 2944 1488
        END BRANCH
        BEGIN BRANCH XLXN_44
            WIRE 2560 1552 2944 1552
        END BRANCH
        BEGIN BRANCH XLXN_45
            WIRE 2560 1616 2944 1616
        END BRANCH
        BEGIN BRANCH XLXN_46
            WIRE 2832 272 2896 272
            WIRE 2896 272 2896 1872
            WIRE 2896 1872 2944 1872
        END BRANCH
        BEGIN INSTANCE XLXI_17 2448 560 R0
        END INSTANCE
        BEGIN BRANCH XLXN_47
            WIRE 2832 336 2880 336
            WIRE 2880 336 2880 1936
            WIRE 2880 1936 2944 1936
        END BRANCH
        BEGIN BRANCH XLXN_48
            WIRE 2832 400 2864 400
            WIRE 2864 400 2864 2000
            WIRE 2864 2000 2944 2000
        END BRANCH
        BEGIN BRANCH XLXN_38
            WIRE 2560 1168 2944 1168
        END BRANCH
        BEGIN BRANCH XLXN_30
            WIRE 1040 1296 1312 1296
            WIRE 1040 1296 1040 1616
            WIRE 1040 1616 1312 1616
            WIRE 1040 1616 1040 1680
            WIRE 1040 1680 1312 1680
            WIRE 1040 1680 1040 1744
            WIRE 1040 1744 1312 1744
            WIRE 1040 1744 1040 1808
            WIRE 1040 1808 1312 1808
            WIRE 1040 1808 1040 1872
            WIRE 1040 1872 1312 1872
            WIRE 1040 1872 1040 2192
            WIRE 1040 2192 1312 2192
            WIRE 1040 2192 1040 2256
            WIRE 1040 2256 1312 2256
            WIRE 1040 2256 1040 2320
            WIRE 1040 2320 1312 2320
            WIRE 1040 2320 1040 2400
            WIRE 1040 2400 1040 2544
            WIRE 1040 2400 1920 2400
            WIRE 1920 2400 2592 2400
            WIRE 1920 1744 2176 1744
            WIRE 1920 1744 1920 1808
            WIRE 1920 1808 2176 1808
            WIRE 1920 1808 1920 2128
            WIRE 1920 2128 2176 2128
            WIRE 1920 2128 1920 2192
            WIRE 1920 2192 2176 2192
            WIRE 1920 2192 1920 2400
            WIRE 2592 1680 2944 1680
            WIRE 2592 1680 2592 1744
            WIRE 2592 1744 2592 1808
            WIRE 2592 1808 2592 2128
            WIRE 2592 2128 2592 2400
            WIRE 2592 2128 2944 2128
            WIRE 2592 1808 2944 1808
            WIRE 2592 1744 2944 1744
        END BRANCH
        BEGIN INSTANCE XLXI_21 2944 2160 R0
        END INSTANCE
        BEGIN BRANCH XLXN_49
            WIRE 2832 464 2848 464
            WIRE 2848 464 2848 2064
            WIRE 2848 2064 2944 2064
        END BRANCH
        INSTANCE XLXI_23 3136 336 R0
        INSTANCE XLXI_24 3136 688 R0
        BEGIN BRANCH XLXN_71
            WIRE 2960 112 3136 112
            WIRE 2960 112 2960 992
            WIRE 2960 992 3344 992
            WIRE 3344 992 3344 1104
            WIRE 3328 1104 3344 1104
        END BRANCH
        BEGIN BRANCH XLXN_72
            WIRE 2976 176 3136 176
            WIRE 2976 176 2976 976
            WIRE 2976 976 3360 976
            WIRE 3360 976 3360 1168
            WIRE 3328 1168 3360 1168
        END BRANCH
        BEGIN BRANCH XLXN_73
            WIRE 2992 240 3136 240
            WIRE 2992 240 2992 960
            WIRE 2992 960 3376 960
            WIRE 3376 960 3376 1232
            WIRE 3328 1232 3376 1232
        END BRANCH
        BEGIN BRANCH XLXN_74
            WIRE 3008 304 3136 304
            WIRE 3008 304 3008 944
            WIRE 3008 944 3392 944
            WIRE 3392 944 3392 1296
            WIRE 3328 1296 3392 1296
        END BRANCH
        BEGIN BRANCH XLXN_75
            WIRE 3024 464 3136 464
            WIRE 3024 464 3024 928
            WIRE 3024 928 3408 928
            WIRE 3408 928 3408 1360
            WIRE 3328 1360 3408 1360
        END BRANCH
        BEGIN BRANCH XLXN_79
            WIRE 3040 528 3136 528
            WIRE 3040 528 3040 912
            WIRE 3040 912 3424 912
            WIRE 3424 912 3424 1424
            WIRE 3328 1424 3424 1424
        END BRANCH
        BEGIN BRANCH XLXN_80
            WIRE 3056 592 3136 592
            WIRE 3056 592 3056 896
            WIRE 3056 896 3440 896
            WIRE 3440 896 3440 1488
            WIRE 3328 1488 3440 1488
        END BRANCH
        BEGIN BRANCH XLXN_81
            WIRE 3072 656 3136 656
            WIRE 3072 656 3072 880
            WIRE 3072 880 3456 880
            WIRE 3456 880 3456 1552
            WIRE 3328 1552 3456 1552
        END BRANCH
        BEGIN BRANCH En
            WIRE 160 1600 464 1600
            WIRE 464 48 3120 48
            WIRE 3120 48 3136 48
            WIRE 3120 48 3120 400
            WIRE 3120 400 3136 400
            WIRE 464 48 464 1600
        END BRANCH
        IOMARKER 160 1600 En R180 28
        BEGIN BRANCH Z7
            WIRE 3360 656 3392 656
        END BRANCH
        IOMARKER 3392 656 Z7 R0 28
        BEGIN BRANCH Z6
            WIRE 3360 592 3392 592
        END BRANCH
        IOMARKER 3392 592 Z6 R0 28
        BEGIN BRANCH Z5
            WIRE 3360 528 3392 528
        END BRANCH
        IOMARKER 3392 528 Z5 R0 28
        BEGIN BRANCH Z4
            WIRE 3360 464 3392 464
        END BRANCH
        IOMARKER 3392 464 Z4 R0 28
        BEGIN BRANCH Z3
            WIRE 3360 304 3392 304
        END BRANCH
        IOMARKER 3392 304 Z3 R0 28
        BEGIN BRANCH Z2
            WIRE 3360 240 3392 240
        END BRANCH
        IOMARKER 3392 240 Z2 R0 28
        BEGIN BRANCH Z1
            WIRE 3360 176 3392 176
        END BRANCH
        IOMARKER 3392 176 Z1 R0 28
        BEGIN BRANCH Z0
            WIRE 3360 112 3392 112
        END BRANCH
        IOMARKER 3392 112 Z0 R0 28
    END SHEET
END SCHEMATIC
