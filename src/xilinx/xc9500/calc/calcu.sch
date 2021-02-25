VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
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
        BEGIN BLOCK XLXI_8 buf4
            PIN I0
            PIN I1
            PIN I2
            PIN I3
            PIN O0
            PIN O1
            PIN O2
            PIN O3
        END BLOCK
        BEGIN BLOCK XLXI_9 buf4
            PIN I0
            PIN I1
            PIN I2
            PIN I3
            PIN O0
            PIN O1
            PIN O2
            PIN O3
        END BLOCK
        BEGIN BLOCK XLXI_10 buf4
            PIN I0
            PIN I1
            PIN I2
            PIN I3
            PIN O0
            PIN O1
            PIN O2
            PIN O3
        END BLOCK
        BEGIN BLOCK XLXI_11 bufe4
            PIN E
            PIN I0
            PIN I1
            PIN I2
            PIN I3
            PIN O0
            PIN O1
            PIN O2
            PIN O3
        END BLOCK
        BEGIN BLOCK XLXI_12 bufe4
            PIN E
            PIN I0
            PIN I1
            PIN I2
            PIN I3
            PIN O0
            PIN O1
            PIN O2
            PIN O3
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_8 208 448 R0
        INSTANCE XLXI_9 192 880 R0
        INSTANCE XLXI_10 192 1440 R0
        INSTANCE XLXI_11 3136 528 R0
        INSTANCE XLXI_12 3136 1088 R0
    END SHEET
END SCHEMATIC
