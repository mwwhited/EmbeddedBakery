VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL En
        SIGNAL Z0
        SIGNAL Z1
        SIGNAL Z2
        SIGNAL Z3
        SIGNAL Zp
        SIGNAL XLXN_14
        PORT Input A0
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Input En
        PORT Output Z0
        PORT Output Z1
        PORT Output Z2
        PORT Output Z3
        PORT Output Zp
        BEGIN BLOCKDEF xor4
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -64 48 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 60 -192 
            LINE N 0 -256 48 -256 
            LINE N 256 -160 208 -160 
            ARC N -24 -216 88 -104 64 -112 64 -208 
            LINE N 128 -208 64 -208 
            LINE N 128 -112 64 -112 
            LINE N 48 -64 48 -112 
            LINE N 48 -256 48 -208 
            ARC N 44 -208 220 -32 208 -160 128 -208 
            ARC N -40 -216 72 -104 48 -112 48 -208 
            ARC N 44 -288 220 -112 128 -112 208 -160 
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
        BEGIN BLOCK XLXI_1 xor4
            PIN I0 A3
            PIN I1 A2
            PIN I2 A1
            PIN I3 A0
            PIN O XLXN_14
        END BLOCK
        BEGIN BLOCK XLXI_2 bufe
            PIN E En
            PIN I XLXN_14
            PIN O Zp
        END BLOCK
        BEGIN BLOCK XLXI_3 bufe4
            PIN E En
            PIN I0 A0
            PIN I1 A1
            PIN I2 A2
            PIN I3 A3
            PIN O0 Z0
            PIN O1 Z1
            PIN O2 Z2
            PIN O3 Z3
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1024 928 R0
        INSTANCE XLXI_3 1680 816 R0
        BEGIN BRANCH A0
            WIRE 752 496 896 496
            WIRE 896 496 896 672
            WIRE 896 672 1024 672
            WIRE 896 496 1424 496
            WIRE 1424 496 1424 592
            WIRE 1424 592 1680 592
        END BRANCH
        BEGIN BRANCH En
            WIRE 752 976 1440 976
            WIRE 1440 976 1680 976
            WIRE 1440 528 1680 528
            WIRE 1440 528 1440 976
        END BRANCH
        BEGIN BRANCH Z0
            WIRE 1904 592 1936 592
        END BRANCH
        IOMARKER 1936 592 Z0 R0 28
        BEGIN BRANCH Z1
            WIRE 1904 656 1936 656
        END BRANCH
        IOMARKER 1936 656 Z1 R0 28
        BEGIN BRANCH Z2
            WIRE 1904 720 1936 720
        END BRANCH
        IOMARKER 1936 720 Z2 R0 28
        BEGIN BRANCH Z3
            WIRE 1904 784 1936 784
        END BRANCH
        IOMARKER 1936 784 Z3 R0 28
        BEGIN BRANCH Zp
            WIRE 1904 1040 1920 1040
            WIRE 1920 1040 1936 1040
        END BRANCH
        IOMARKER 752 496 A0 R180 28
        IOMARKER 752 544 A1 R180 28
        BEGIN BRANCH A1
            WIRE 752 544 880 544
            WIRE 880 544 880 736
            WIRE 880 736 1024 736
            WIRE 880 544 1408 544
            WIRE 1408 544 1408 656
            WIRE 1408 656 1680 656
        END BRANCH
        IOMARKER 752 592 A2 R180 28
        BEGIN BRANCH A2
            WIRE 752 592 864 592
            WIRE 864 592 864 800
            WIRE 864 800 1024 800
            WIRE 864 592 1392 592
            WIRE 1392 592 1392 720
            WIRE 1392 720 1680 720
        END BRANCH
        IOMARKER 752 640 A3 R180 28
        BEGIN BRANCH A3
            WIRE 752 640 848 640
            WIRE 848 640 848 864
            WIRE 848 864 1024 864
            WIRE 848 640 1376 640
            WIRE 1376 640 1376 784
            WIRE 1376 784 1680 784
        END BRANCH
        IOMARKER 752 976 En R180 28
        INSTANCE XLXI_2 1680 1072 R0
        BEGIN BRANCH XLXN_14
            WIRE 1280 768 1360 768
            WIRE 1360 768 1360 1040
            WIRE 1360 1040 1680 1040
        END BRANCH
        IOMARKER 1936 1040 Zp R0 28
    END SHEET
END SCHEMATIC
