`timescale 1ns / 1ps

module TextModeControllerTestBench;

    reg ScanClock = 0; 
    reg [15:0] CharacterBuffer [(80 * 45)-1:0]; // 15:12 BgC, 11:8 FgC, 7:0 Char
    reg [11:0] ColorPalette [15:0]; // RRRR GGGG BBBB
    reg [63:0] CharacterMap [255:0]; // CharacterPixelHeight x CharacterPixelWidth pixels
    
    wire [3:0] Red;
    wire [3:0] Green;
    wire [3:0] Blue;    
    wire HorizontalSync;
    wire VerticalSync;
    
    wire LineComplete;
    wire FrameComplete;
    wire LineBlanking;
    wire FrameBlanking;

    TextModeController tmc(
        .ScanClock(ScanClock),
        
        .CharacterBuffer(CharacterBuffer),
        .ColorPalette(ColorPalette),
        .CharacterMap(CharacterMap),
        
        .Red(Red),
        .Green(Green),
        .Blue(Blue),        
        .HorizontalSync(HorizontalSync),
        .VerticalSync(VerticalSync),
        
        .LineComplete(LineComplete),
        .FrameComplete(FrameComplete),
        .LineBlanking(LineBlanking),
        .FrameBlanking(FrameBlanking)
    );
    
    reg [3:0] framecount = 0;   
    
    always @(posedge FrameBlanking) begin
        framecount <= framecount + 1;
        if (framecount > 2) begin
             $finish;
        end
    end
    
    always #1 begin
        ScanClock <= ~ScanClock;
    end

    initial begin
    
        for(int c = 0; c < 3600; c++) begin
            CharacterBuffer[c] <= {  // 15:12 BgC, 11:8 FgC, 7:0 Char
                /*bg*/4'h0, // + c[15:12],  
                /*fg*/4'hF, // + c[11:8],
                /*char*/ c[7:0]  
                };
        end
        
        ColorPalette[00] <= 12'h000;
        ColorPalette[01] <= 12'h00A;
        ColorPalette[02] <= 12'hA00;
        ColorPalette[03] <= 12'hA0A;
        ColorPalette[04] <= 12'h0A0;
        ColorPalette[05] <= 12'h0AA;
        ColorPalette[06] <= 12'hAA0;
        ColorPalette[07] <= 12'hAAA;
        ColorPalette[08] <= 12'h666;
        ColorPalette[09] <= 12'h00F;
        ColorPalette[10] <= 12'hF00;
        ColorPalette[11] <= 12'hF0F;
        ColorPalette[12] <= 12'h0F0;
        ColorPalette[13] <= 12'h0FF;
        ColorPalette[14] <= 12'hFF0;
        ColorPalette[15] <= 12'hFFF;
        
        CharacterMap[000] <= 64'h1C_22_4A_56_4C_20_1E_00;
        CharacterMap[001] <= 64'h3C_24_24_7E_62_62_62_00;
        CharacterMap[002] <= 64'h78_44_44_7C_62_62_7E_00;
        CharacterMap[003] <= 64'h7E_42_40_60_60_62_7E_00;
        CharacterMap[004] <= 64'h7C_46_42_62_62_66_7C_00;
        CharacterMap[005] <= 64'h7E_40_40_7C_60_60_7E_00;
        CharacterMap[006] <= 64'h7E_40_40_7E_60_60_60_00;
        CharacterMap[007] <= 64'h7E_42_40_6E_62_62_7E_00;
        CharacterMap[008] <= 64'h42_42_42_7E_62_62_62_00;
        CharacterMap[009] <= 64'h08_08_08_0C_0C_0C_0C_00;
        CharacterMap[010] <= 64'h04_04_04_06_06_46_7E_00;
        CharacterMap[011] <= 64'h42_44_48_7C_62_62_62_00;
        CharacterMap[012] <= 64'h40_40_40_60_60_60_7E_00;
        CharacterMap[013] <= 64'h7E_4A_4A_6A_6A_6A_6A_00;
        CharacterMap[014] <= 64'h7E_42_42_62_62_62_62_00;
        CharacterMap[015] <= 64'h7E_46_42_42_42_42_7E_00;
        CharacterMap[016] <= 64'h7E_42_42_7E_60_60_60_00;
        CharacterMap[017] <= 64'h7E_42_42_42_4A_4E_7E_00;
        CharacterMap[018] <= 64'h7C_44_44_7C_62_62_62_00;
        CharacterMap[019] <= 64'h7E_42_40_7E_06_46_7E_00;
        CharacterMap[020] <= 64'h3E_10_10_18_18_18_18_00;
        CharacterMap[021] <= 64'h42_42_42_62_62_62_7E_00;
        CharacterMap[022] <= 64'h62_62_62_66_24_24_3C_00;
        CharacterMap[023] <= 64'h4A_4A_4A_6A_6A_6A_7E_00;
        CharacterMap[024] <= 64'h42_42_66_18_66_62_62_00;
        CharacterMap[025] <= 64'h22_22_22_3E_18_18_18_00;
        CharacterMap[026] <= 64'h7E_42_06_18_60_62_7E_00;
        CharacterMap[027] <= 64'h3C_20_20_20_20_20_3C_00;
        CharacterMap[028] <= 64'h00_40_20_10_08_04_02_00;
        CharacterMap[029] <= 64'h3C_04_04_04_04_04_3C_00;
        CharacterMap[030] <= 64'h00_08_1C_2A_08_08_14_14;
        CharacterMap[031] <= 64'h00_00_10_20_7F_20_10_00;
        CharacterMap[032] <= 64'h00_00_00_00_00_00_00_00;
        CharacterMap[033] <= 64'h08_08_08_0C_0C_00_0C_00;
        CharacterMap[034] <= 64'h6C_24_6C_00_00_00_00_00;
        CharacterMap[035] <= 64'h24_24_7E_24_7E_24_24_00;
        CharacterMap[036] <= 64'h08_3E_20_3E_06_3E_08_00;
        CharacterMap[037] <= 64'h00_62_64_08_10_26_46_00;
        CharacterMap[038] <= 64'h3C_20_24_7E_64_64_7C_00;
        CharacterMap[039] <= 64'h1C_18_10_00_00_00_00_00;
        CharacterMap[040] <= 64'h04_08_10_10_10_08_04_00;
        CharacterMap[041] <= 64'h20_10_08_08_08_10_20_00;
        CharacterMap[042] <= 64'h08_2A_1C_3E_1C_2A_08_00;
        CharacterMap[043] <= 64'h00_08_08_3E_08_08_00_00;
        CharacterMap[044] <= 64'h00_00_00_00_00_18_18_08;
        CharacterMap[045] <= 64'h00_00_00_7E_00_00_00_00;
        CharacterMap[046] <= 64'h00_00_00_00_00_18_18_00;
        CharacterMap[047] <= 64'h00_02_04_08_10_20_40_00;
        CharacterMap[048] <= 64'h7E_62_52_4A_46_46_7E_00;
        CharacterMap[049] <= 64'h18_08_08_18_18_1A_3E_00;
        CharacterMap[050] <= 64'h7E_42_02_7E_60_60_7E_00;
        CharacterMap[051] <= 64'h7C_44_04_1E_06_46_7E_00;
        CharacterMap[052] <= 64'h44_44_44_44_7E_0C_0C_00;
        CharacterMap[053] <= 64'h7E_40_7E_06_06_46_7E_00;
        CharacterMap[054] <= 64'h7E_42_40_7E_46_46_7E_00;
        CharacterMap[055] <= 64'h7E_02_02_06_06_06_06_00;
        CharacterMap[056] <= 64'h3C_24_24_7E_46_46_7E_00;
        CharacterMap[057] <= 64'h7E_42_42_7E_06_06_06_00;
        CharacterMap[058] <= 64'h00_00_18_00_00_18_00_00;
        CharacterMap[059] <= 64'h00_00_18_00_00_18_18_08;
        CharacterMap[060] <= 64'h0E_18_30_60_30_18_0E_00;
        CharacterMap[061] <= 64'h00_00_7E_00_7E_00_00_00;
        CharacterMap[062] <= 64'h70_18_0C_06_0C_18_70_00;
        CharacterMap[063] <= 64'h7E_02_02_7E_60_00_60_00;
        CharacterMap[064] <= 64'h00_00_00_00_FF_00_00_00;
        CharacterMap[065] <= 64'h08_1C_3E_7F_7F_1C_3E_00;
        CharacterMap[066] <= 64'h10_10_10_10_10_10_10_10;
        CharacterMap[067] <= 64'h00_00_00_FF_00_00_00_00;
        CharacterMap[068] <= 64'h00_00_FF_00_00_00_00_00;
        CharacterMap[069] <= 64'h00_FF_00_00_00_00_00_00;
        CharacterMap[070] <= 64'h00_00_00_00_00_FF_00_00;
        CharacterMap[071] <= 64'h20_20_20_20_20_20_20_20;
        CharacterMap[072] <= 64'h04_04_04_04_04_04_04_04;
        CharacterMap[073] <= 64'h00_00_00_00_E0_10_08_08;
        CharacterMap[074] <= 64'h08_08_08_04_03_00_00_00;
        CharacterMap[075] <= 64'h08_08_08_10_E0_00_00_00;
        CharacterMap[076] <= 64'h80_80_80_80_80_80_80_FF;
        CharacterMap[077] <= 64'h80_40_20_10_08_04_02_01;
        CharacterMap[078] <= 64'h01_02_04_08_10_20_40_80;
        CharacterMap[079] <= 64'hFF_80_80_80_80_80_80_80;
        CharacterMap[080] <= 64'hFF_01_01_01_01_01_01_01;
        CharacterMap[081] <= 64'h00_3C_7E_7E_7E_7E_3C_00;
        CharacterMap[082] <= 64'h00_00_00_00_00_00_FF_00;
        CharacterMap[083] <= 64'h36_7F_7F_7F_3E_1C_08_00;
        CharacterMap[084] <= 64'h40_40_40_40_40_40_40_40;
        CharacterMap[085] <= 64'h00_00_00_00_03_04_08_08;
        CharacterMap[086] <= 64'h81_42_24_18_18_24_42_81;
        CharacterMap[087] <= 64'h00_3C_42_42_42_42_3C_00;
        CharacterMap[088] <= 64'h08_1C_2A_77_2A_08_08_00;
        CharacterMap[089] <= 64'h02_02_02_02_02_02_02_02;
        CharacterMap[090] <= 64'h08_1C_3E_7F_3E_1C_08_00;
        CharacterMap[091] <= 64'h08_08_08_08_FF_08_08_08;
        CharacterMap[092] <= 64'hA0_50_A0_50_A0_50_A0_50;
        CharacterMap[093] <= 64'h08_08_08_08_08_08_08_08;
        CharacterMap[094] <= 64'h00_00_01_3E_54_14_14_00;
        CharacterMap[095] <= 64'hFF_7F_3F_1F_0F_07_03_01;
        CharacterMap[096] <= 64'h00_00_00_00_00_00_00_00;
        CharacterMap[097] <= 64'hF0_F0_F0_F0_F0_F0_F0_F0;
        CharacterMap[098] <= 64'h00_00_00_00_FF_FF_FF_FF;
        CharacterMap[099] <= 64'hFF_00_00_00_00_00_00_00;
        CharacterMap[100] <= 64'h00_00_00_00_00_00_00_FF;
        CharacterMap[101] <= 64'h80_80_80_80_80_80_80_80;
        CharacterMap[102] <= 64'hAA_55_AA_55_AA_55_AA_55;
        CharacterMap[103] <= 64'h01_01_01_01_01_01_01_01;
        CharacterMap[104] <= 64'h00_00_00_00_AA_55_AA_55;
        CharacterMap[105] <= 64'hFF_FE_FC_F8_F0_E0_C0_80;
        CharacterMap[106] <= 64'h03_03_03_03_03_03_03_03;
        CharacterMap[107] <= 64'h08_08_08_08_0F_08_08_08;
        CharacterMap[108] <= 64'h00_00_00_00_0F_0F_0F_0F;
        CharacterMap[109] <= 64'h08_08_08_08_0F_00_00_00;
        CharacterMap[110] <= 64'h00_00_00_00_F8_08_08_08;
        CharacterMap[111] <= 64'h00_00_00_00_00_00_FF_FF;
        CharacterMap[112] <= 64'h00_00_00_00_0F_08_08_08;
        CharacterMap[113] <= 64'h08_08_08_08_FF_00_00_00;
        CharacterMap[114] <= 64'h00_00_00_00_FF_08_08_08;
        CharacterMap[115] <= 64'h08_08_08_08_F8_08_08_08;
        CharacterMap[116] <= 64'hC0_C0_C0_C0_C0_C0_C0_C0;
        CharacterMap[117] <= 64'hE0_E0_E0_E0_E0_E0_E0_E0;
        CharacterMap[118] <= 64'h07_07_07_07_07_07_07_07;
        CharacterMap[119] <= 64'hFF_FF_00_00_00_00_00_00;
        CharacterMap[120] <= 64'hFF_FF_FF_00_00_00_00_00;
        CharacterMap[121] <= 64'h00_00_00_00_00_FF_FF_FF;
        CharacterMap[122] <= 64'h01_01_01_01_01_01_01_FF;
        CharacterMap[123] <= 64'h00_00_00_00_F0_F0_F0_F0;
        CharacterMap[124] <= 64'h0F_0F_0F_0F_00_00_00_00;
        CharacterMap[125] <= 64'h08_08_08_08_F8_00_00_00;
        CharacterMap[126] <= 64'hF0_F0_F0_F0_00_00_00_00;
        CharacterMap[127] <= 64'hF0_F0_F0_F0_0F_0F_0F_0F;
        CharacterMap[128] <= 64'h1C_22_4A_56_4C_20_1E_00;
        CharacterMap[129] <= 64'h00_00_3C_04_7C_64_7C_00;
        CharacterMap[130] <= 64'h40_40_7E_42_62_62_7E_00;
        CharacterMap[131] <= 64'h00_00_7E_42_60_62_7E_00;
        CharacterMap[132] <= 64'h02_02_7E_42_62_62_7E_00;
        CharacterMap[133] <= 64'h00_00_7E_42_7E_60_7E_00;
        CharacterMap[134] <= 64'h1E_12_10_7C_18_18_18_00;
        CharacterMap[135] <= 64'h00_00_7E_42_62_7E_02_7E;
        CharacterMap[136] <= 64'h40_40_7E_42_62_62_62_00;
        CharacterMap[137] <= 64'h18_00_10_10_18_18_18_00;
        CharacterMap[138] <= 64'h0C_00_08_0C_0C_0C_44_7C;
        CharacterMap[139] <= 64'h40_40_44_48_78_64_64_00;
        CharacterMap[140] <= 64'h10_10_10_10_18_18_18_00;
        CharacterMap[141] <= 64'h00_00_7F_49_6D_6D_6D_00;
        CharacterMap[142] <= 64'h00_00_7E_42_62_62_62_00;
        CharacterMap[143] <= 64'h00_00_7E_42_62_62_7E_00;
        CharacterMap[144] <= 64'h00_00_7E_42_62_7E_40_40;
        CharacterMap[145] <= 64'h00_00_7E_42_46_7E_02_02;
        CharacterMap[146] <= 64'h00_00_7E_40_60_60_60_00;
        CharacterMap[147] <= 64'h00_00_7E_40_7E_06_7E_00;
        CharacterMap[148] <= 64'h10_10_7C_10_18_18_18_00;
        CharacterMap[149] <= 64'h00_00_42_42_62_62_7E_00;
        CharacterMap[150] <= 64'h00_00_62_62_66_24_3C_00;
        CharacterMap[151] <= 64'h00_00_49_49_6D_6D_7F_00;
        CharacterMap[152] <= 64'h00_00_42_42_3C_62_62_00;
        CharacterMap[153] <= 64'h00_00_62_62_42_7E_02_7E;
        CharacterMap[154] <= 64'h00_00_7E_06_18_60_7E_00;
        CharacterMap[155] <= 64'h3C_20_20_20_20_20_3C_00;
        CharacterMap[156] <= 64'h00_40_20_10_08_04_02_00;
        CharacterMap[157] <= 64'h3C_04_04_04_04_04_3C_00;
        CharacterMap[158] <= 64'h00_08_1C_2A_08_08_14_14;
        CharacterMap[159] <= 64'h00_00_10_20_7F_20_10_00;
        CharacterMap[160] <= 64'h00_00_00_00_00_00_00_00;
        CharacterMap[161] <= 64'h08_08_08_0C_0C_00_0C_00;
        CharacterMap[162] <= 64'h6C_24_6C_00_00_00_00_00;
        CharacterMap[163] <= 64'h24_24_7E_24_7E_24_24_00;
        CharacterMap[164] <= 64'h08_3E_20_3E_06_3E_08_00;
        CharacterMap[165] <= 64'h00_62_64_08_10_26_46_00;
        CharacterMap[166] <= 64'h3C_20_24_7E_64_64_7C_00;
        CharacterMap[167] <= 64'h1C_18_10_00_00_00_00_00;
        CharacterMap[168] <= 64'h04_08_10_10_10_08_04_00;
        CharacterMap[169] <= 64'h20_10_08_08_08_10_20_00;
        CharacterMap[170] <= 64'h08_2A_1C_3E_1C_2A_08_00;
        CharacterMap[171] <= 64'h00_08_08_3E_08_08_00_00;
        CharacterMap[172] <= 64'h00_00_00_00_00_18_18_08;
        CharacterMap[173] <= 64'h00_00_00_7E_00_00_00_00;
        CharacterMap[174] <= 64'h00_00_00_00_00_18_18_00;
        CharacterMap[175] <= 64'h00_02_04_08_10_20_40_00;
        CharacterMap[176] <= 64'h7E_62_52_4A_46_46_7E_00;
        CharacterMap[177] <= 64'h38_08_08_18_18_1A_3E_00;
        CharacterMap[178] <= 64'h7E_42_02_7E_60_60_7E_00;
        CharacterMap[179] <= 64'h7C_44_04_1E_06_46_7E_00;
        CharacterMap[180] <= 64'h44_44_44_44_7E_0C_0C_00;
        CharacterMap[181] <= 64'h7E_40_7E_06_06_46_7E_00;
        CharacterMap[182] <= 64'h7E_42_40_7E_46_46_7E_00;
        CharacterMap[183] <= 64'h7E_02_02_06_06_06_06_00;
        CharacterMap[184] <= 64'h3C_24_24_7E_46_46_7E_00;
        CharacterMap[185] <= 64'h7E_42_42_7E_06_06_06_00;
        CharacterMap[186] <= 64'h00_00_18_00_00_18_00_00;
        CharacterMap[187] <= 64'h00_00_18_00_00_18_18_08;
        CharacterMap[188] <= 64'h0E_18_30_60_30_18_0E_00;
        CharacterMap[189] <= 64'h00_00_7E_00_7E_00_00_00;
        CharacterMap[190] <= 64'h70_18_0C_06_0C_18_70_00;
        CharacterMap[191] <= 64'h7E_02_02_7E_60_00_60_00;
        CharacterMap[192] <= 64'h00_00_00_00_FF_00_00_00;
        CharacterMap[193] <= 64'h3C_24_24_7E_62_62_62_00;
        CharacterMap[194] <= 64'h78_44_44_7C_62_62_7E_00;
        CharacterMap[195] <= 64'h7E_42_40_60_60_62_7E_00;
        CharacterMap[196] <= 64'h7C_46_42_62_62_66_7C_00;
        CharacterMap[197] <= 64'h7E_40_40_78_60_60_7E_00;
        CharacterMap[198] <= 64'h7E_40_40_7E_60_60_60_00;
        CharacterMap[199] <= 64'h7E_42_40_6E_62_62_7E_00;
        CharacterMap[200] <= 64'h42_42_42_7E_62_62_62_00;
        CharacterMap[201] <= 64'h08_08_08_0C_0C_0C_0C_00;
        CharacterMap[202] <= 64'h04_04_04_06_06_46_7E_00;
        CharacterMap[203] <= 64'h42_44_48_7C_62_62_62_00;
        CharacterMap[204] <= 64'h40_40_40_60_60_60_7E_00;
        CharacterMap[205] <= 64'h7E_4A_4A_6A_6A_6A_6A_00;
        CharacterMap[206] <= 64'h7E_42_42_62_62_62_62_00;
        CharacterMap[207] <= 64'h7E_46_42_42_42_42_7E_00;
        CharacterMap[208] <= 64'h7E_42_42_7E_60_60_60_00;
        CharacterMap[209] <= 64'h7E_42_42_42_4A_4E_7E_00;
        CharacterMap[210] <= 64'h7C_44_44_7C_62_62_62_00;
        CharacterMap[211] <= 64'h7E_42_40_7E_06_46_7E_00;
        CharacterMap[212] <= 64'h3E_10_10_18_18_18_18_00;
        CharacterMap[213] <= 64'h42_42_42_62_62_62_7E_00;
        CharacterMap[214] <= 64'h62_62_62_66_24_24_3C_00;
        CharacterMap[215] <= 64'h4A_4A_4A_6A_6A_6A_7E_00;
        CharacterMap[216] <= 64'h42_42_66_3C_66_62_62_00;
        CharacterMap[217] <= 64'h22_22_22_3E_18_18_18_00;
        CharacterMap[218] <= 64'h7E_42_06_18_60_62_7E_00;
        CharacterMap[219] <= 64'h08_08_08_08_FF_08_08_08;
        CharacterMap[220] <= 64'hA0_50_A0_50_A0_50_A0_50;
        CharacterMap[221] <= 64'h08_08_08_08_08_08_08_08;
        CharacterMap[222] <= 64'hCC_CC_33_33_CC_CC_33_33;
        CharacterMap[223] <= 64'hCC_66_33_99_CC_66_33_99;
        CharacterMap[224] <= 64'h00_00_00_00_00_00_00_00;
        CharacterMap[225] <= 64'hF0_F0_F0_F0_F0_F0_F0_F0;
        CharacterMap[226] <= 64'h00_00_00_00_FF_FF_FF_FF;
        CharacterMap[227] <= 64'hFF_00_00_00_00_00_00_00;
        CharacterMap[228] <= 64'h00_00_00_00_00_00_00_FF;
        CharacterMap[229] <= 64'h80_80_80_80_80_80_80_80;
        CharacterMap[230] <= 64'hAA_55_AA_55_AA_55_AA_55;
        CharacterMap[231] <= 64'h01_01_01_01_01_01_01_01;
        CharacterMap[232] <= 64'h00_00_00_00_AA_55_AA_55;
        CharacterMap[233] <= 64'h99_33_66_CC_99_33_66_CC;
        CharacterMap[234] <= 64'h03_03_03_03_03_03_03_03;
        CharacterMap[235] <= 64'h08_08_08_08_0F_08_08_08;
        CharacterMap[236] <= 64'h00_00_00_00_0F_0F_0F_0F;
        CharacterMap[237] <= 64'h08_08_08_08_0F_00_00_00;
        CharacterMap[238] <= 64'h00_00_00_00_F8_08_08_08;
        CharacterMap[239] <= 64'h00_00_00_00_00_00_FF_FF;
        CharacterMap[240] <= 64'h00_00_00_00_0F_08_08_08;
        CharacterMap[241] <= 64'h08_08_08_08_FF_00_00_00;
        CharacterMap[242] <= 64'h00_00_00_00_FF_08_08_08;
        CharacterMap[243] <= 64'h08_08_08_08_F8_08_08_08;
        CharacterMap[244] <= 64'hC0_C0_C0_C0_C0_C0_C0_C0;
        CharacterMap[245] <= 64'hE0_E0_E0_E0_E0_E0_E0_E0;
        CharacterMap[246] <= 64'h07_07_07_07_07_07_07_07;
        CharacterMap[247] <= 64'hFF_FF_00_00_00_00_00_00;
        CharacterMap[248] <= 64'hFF_FF_FF_00_00_00_00_00;
        CharacterMap[249] <= 64'h00_00_00_00_00_FF_FF_FF;
        CharacterMap[250] <= 64'h01_02_44_48_50_60_40_00;
        CharacterMap[251] <= 64'h00_00_00_00_F0_F0_F0_F0;
        CharacterMap[252] <= 64'h0F_0F_0F_0F_00_00_00_00;
        CharacterMap[253] <= 64'h08_08_08_08_F8_00_00_00;
        CharacterMap[254] <= 64'hF0_F0_F0_F0_00_00_00_00;
        CharacterMap[255] <= 64'hF0_F0_F0_F0_0F_0F_0F_0F;
 
    end
    
endmodule
