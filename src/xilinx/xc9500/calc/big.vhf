--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : big.vhf
-- /___/   /\     Timestamp : 10/16/2004 18:23:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: ADSU1_MXILINX_big
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity ADSU1_MXILINX_big is
   port ( ADD : in    std_logic; 
          A0  : in    std_logic; 
          B0  : in    std_logic; 
          CI  : in    std_logic; 
          CO  : out   std_logic; 
          S0  : out   std_logic);
end ADSU1_MXILINX_big;

architecture BEHAVIORAL of ADSU1_MXILINX_big is
   attribute BOX_TYPE   : string ;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B3 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
begin
   I_36_38 : AND3
      port map (I0=>ADD,      
                I1=>B0,      
                I2=>A0,      
                O=>XLXN_16);
   
   I_36_39 : AND3
      port map (I0=>ADD,      
                I1=>B0,      
                I2=>CI,      
                O=>XLXN_15);
   
   I_36_40 : AND3B2
      port map (I0=>ADD,      
                I1=>B0,      
                I2=>A0,      
                O=>XLXN_14);
   
   I_36_41 : AND2
      port map (I0=>CI,      
                I1=>A0,      
                O=>XLXN_12);
   
   I_36_42 : OR5
      port map (I0=>XLXN_12,      
                I1=>XLXN_13,      
                I2=>XLXN_14,      
                I3=>XLXN_15,      
                I4=>XLXN_16,      
                O=>CO);
   
   I_36_107 : AND3B2
      port map (I0=>ADD,      
                I1=>B0,      
                I2=>CI,      
                O=>XLXN_13);
   
   I_36_125 : AND3B1
      port map (I0=>CI,      
                I1=>ADD,      
                I2=>B0,      
                O=>XLXN_7);
   
   I_36_127 : AND3B3
      port map (I0=>CI,      
                I1=>ADD,      
                I2=>B0,      
                O=>XLXN_9);
   
   I_36_128 : OR4
      port map (I0=>XLXN_10,      
                I1=>XLXN_8,      
                I2=>XLXN_7,      
                I3=>XLXN_9,      
                O=>XLXN_11);
   
   I_36_129 : XOR2
      port map (I0=>XLXN_11,      
                I1=>A0,      
                O=>S0);
   
   I_36_130 : AND3B1
      port map (I0=>B0,      
                I1=>ADD,      
                I2=>CI,      
                O=>XLXN_8);
   
   I_36_131 : AND3B1
      port map (I0=>ADD,      
                I1=>CI,      
                I2=>B0,      
                O=>XLXN_10);
   
end BEHAVIORAL;


--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : big.vhf
-- /___/   /\     Timestamp : 10/16/2004 18:23:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: ADSU4_MXILINX_big
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity ADSU4_MXILINX_big is
   port ( ADD : in    std_logic; 
          A0  : in    std_logic; 
          A1  : in    std_logic; 
          A2  : in    std_logic; 
          A3  : in    std_logic; 
          B0  : in    std_logic; 
          B1  : in    std_logic; 
          B2  : in    std_logic; 
          B3  : in    std_logic; 
          CI  : in    std_logic; 
          CO  : out   std_logic; 
          OFL : out   std_logic; 
          S0  : out   std_logic; 
          S1  : out   std_logic; 
          S2  : out   std_logic; 
          S3  : out   std_logic);
end ADSU4_MXILINX_big;

architecture BEHAVIORAL of ADSU4_MXILINX_big is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_17  : std_logic;
   signal XLXN_18  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_20  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_22  : std_logic;
   signal XLXN_23  : std_logic;
   signal S3_DUMMY : std_logic;
   component AND4B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   
   component AND4B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   component ADSU1_MXILINX_big
      port ( A0  : in    std_logic; 
             ADD : in    std_logic; 
             B0  : in    std_logic; 
             CI  : in    std_logic; 
             CO  : out   std_logic; 
             S0  : out   std_logic);
   end component;
   
   attribute HU_SET of U0 : label is "U0_3";
   attribute HU_SET of U1 : label is "U1_2";
   attribute HU_SET of U2 : label is "U2_0";
   attribute HU_SET of U3 : label is "U3_1";
begin
   S3 <= S3_DUMMY;
   OFL_NEG_ADD : AND4B1
      port map (I0=>S3_DUMMY,      
                I1=>ADD,      
                I2=>B3,      
                I3=>A3,      
                O=>XLXN_20);
   
   OFL_NEG_SUB : AND4B3
      port map (I0=>ADD,      
                I1=>B3,      
                I2=>S3_DUMMY,      
                I3=>A3,      
                O=>XLXN_23);
   
   OFL_OUT : OR4
      port map (I0=>XLXN_23,      
                I1=>XLXN_21,      
                I2=>XLXN_20,      
                I3=>XLXN_22,      
                O=>OFL);
   
   OFL_POS_ADD : AND4B2
      port map (I0=>B3,      
                I1=>A3,      
                I2=>ADD,      
                I3=>S3_DUMMY,      
                O=>XLXN_22);
   
   OFL_POS_SUB : AND4B2
      port map (I0=>A3,      
                I1=>ADD,      
                I2=>S3_DUMMY,      
                I3=>B3,      
                O=>XLXN_21);
   
   U0 : ADSU1_MXILINX_big
      port map (ADD=>ADD,      
                A0=>A0,      
                B0=>B0,      
                CI=>CI,      
                CO=>XLXN_19,      
                S0=>S0);
   
   U1 : ADSU1_MXILINX_big
      port map (ADD=>ADD,      
                A0=>A1,      
                B0=>B1,      
                CI=>XLXN_19,      
                CO=>XLXN_17,      
                S0=>S1);
   
   U2 : ADSU1_MXILINX_big
      port map (ADD=>ADD,      
                A0=>A2,      
                B0=>B2,      
                CI=>XLXN_17,      
                CO=>XLXN_18,      
                S0=>S2);
   
   U3 : ADSU1_MXILINX_big
      port map (ADD=>ADD,      
                A0=>A3,      
                B0=>B3,      
                CI=>XLXN_18,      
                CO=>CO,      
                S0=>S3_DUMMY);
   
end BEHAVIORAL;


--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : big.vhf
-- /___/   /\     Timestamp : 10/16/2004 18:23:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: big
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity big is
   port ( addsub : in    std_logic; 
          i1     : in    std_logic; 
          i2     : in    std_logic; 
          i3     : in    std_logic; 
          i4     : in    std_logic; 
          j1     : in    std_logic; 
          j2     : in    std_logic; 
          j3     : in    std_logic; 
          j4     : in    std_logic; 
          o1     : out   std_logic; 
          o2     : out   std_logic; 
          o3     : out   std_logic; 
          o4     : out   std_logic; 
          o5     : out   std_logic; 
          o6     : out   std_logic; 
          o7     : out   std_logic; 
          o8     : out   std_logic; 
          za     : out   std_logic; 
          zb     : out   std_logic; 
          zc     : out   std_logic; 
          zd     : out   std_logic; 
          zdp    : out   std_logic; 
          ze     : out   std_logic; 
          zf     : out   std_logic; 
          zg     : out   std_logic);
end big;

architecture BEHAVIORAL of big is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_58  : std_logic;
   signal XLXN_59  : std_logic;
   signal XLXN_79  : std_logic;
   signal XLXN_80  : std_logic;
   signal XLXN_81  : std_logic;
   signal XLXN_82  : std_logic;
   signal XLXN_83  : std_logic;
   signal XLXN_84  : std_logic;
   signal XLXN_95  : std_logic;
   signal XLXN_100 : std_logic;
   signal XLXN_101 : std_logic;
   signal XLXN_102 : std_logic;
   signal XLXN_103 : std_logic;
   signal XLXN_104 : std_logic;
   signal XLXN_120 : std_logic;
   signal XLXN_215 : std_logic;
   signal XLXN_219 : std_logic;
   signal XLXN_220 : std_logic;
   signal XLXN_221 : std_logic;
   signal XLXN_222 : std_logic;
   signal XLXN_223 : std_logic;
   signal XLXN_224 : std_logic;
   signal XLXN_225 : std_logic;
   signal XLXN_226 : std_logic;
   signal XLXN_248 : std_logic;
   signal XLXN_249 : std_logic;
   signal XLXN_250 : std_logic;
   signal XLXN_251 : std_logic;
   signal XLXN_254 : std_logic;
   signal XLXN_256 : std_logic;
   component hex27seg
      port ( A1     : in    std_logic; 
             A2     : in    std_logic; 
             A3     : in    std_logic; 
             A4     : in    std_logic; 
             Adp    : in    std_logic; 
             Enable : in    std_logic; 
             Za     : out   std_logic; 
             Zb     : out   std_logic; 
             Zc     : out   std_logic; 
             Zd     : out   std_logic; 
             Ze     : out   std_logic; 
             Zf     : out   std_logic; 
             Zg     : out   std_logic; 
             Zdp    : out   std_logic);
   end component;
   
   component eightbits
      port ( A1     : in    std_logic; 
             A2     : in    std_logic; 
             A3     : in    std_logic; 
             A4     : in    std_logic; 
             A5     : in    std_logic; 
             A6     : in    std_logic; 
             A7     : in    std_logic; 
             A8     : in    std_logic; 
             Enable : in    std_logic; 
             Z0     : out   std_logic; 
             Z1     : out   std_logic; 
             Z2     : out   std_logic; 
             Z3     : out   std_logic; 
             Z4     : out   std_logic; 
             Z5     : out   std_logic; 
             Z6     : out   std_logic; 
             Z7     : out   std_logic);
   end component;
   
   component sevenseg
      port ( Aa     : in    std_logic; 
             Ab     : in    std_logic; 
             Ac     : in    std_logic; 
             Ad     : in    std_logic; 
             Ae     : in    std_logic; 
             Af     : in    std_logic; 
             Ag     : in    std_logic; 
             Adp    : in    std_logic; 
             Enable : in    std_logic; 
             Za     : out   std_logic; 
             Zb     : out   std_logic; 
             Zc     : out   std_logic; 
             Zd     : out   std_logic; 
             Ze     : out   std_logic; 
             Zf     : out   std_logic; 
             Zg     : out   std_logic; 
             Zdp    : out   std_logic);
   end component;
   
   component eightleds
      port ( A1     : in    std_logic; 
             A2     : in    std_logic; 
             A3     : in    std_logic; 
             A4     : in    std_logic; 
             A5     : in    std_logic; 
             A6     : in    std_logic; 
             A7     : in    std_logic; 
             A8     : in    std_logic; 
             Enable : in    std_logic; 
             Z1     : out   std_logic; 
             Z2     : out   std_logic; 
             Z3     : out   std_logic; 
             Z4     : out   std_logic; 
             Z5     : out   std_logic; 
             Z6     : out   std_logic; 
             Z7     : out   std_logic; 
             Z8     : out   std_logic);
   end component;
   
   component momentsw
      port ( A1     : in    std_logic; 
             Enable : in    std_logic; 
             Z1     : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component ADSU4_MXILINX_big
      port ( A0  : in    std_logic; 
             A1  : in    std_logic; 
             A2  : in    std_logic; 
             A3  : in    std_logic; 
             ADD : in    std_logic; 
             B0  : in    std_logic; 
             B1  : in    std_logic; 
             B2  : in    std_logic; 
             B3  : in    std_logic; 
             CI  : in    std_logic; 
             CO  : out   std_logic; 
             OFL : out   std_logic; 
             S0  : out   std_logic; 
             S1  : out   std_logic; 
             S2  : out   std_logic; 
             S3  : out   std_logic);
   end component;
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_36 : label is "XLXI_36_4";
begin
   XLXI_2 : hex27seg
      port map (Adp=>XLXN_104,      
                A1=>XLXN_100,      
                A2=>XLXN_101,      
                A3=>XLXN_102,      
                A4=>XLXN_103,      
                Enable=>XLXN_95,      
                Za=>XLXN_79,      
                Zb=>XLXN_80,      
                Zc=>XLXN_81,      
                Zd=>XLXN_82,      
                Zdp=>XLXN_58,      
                Ze=>XLXN_83,      
                Zf=>XLXN_84,      
                Zg=>XLXN_59);
   
   XLXI_3 : eightbits
      port map (A1=>i1,      
                A2=>i2,      
                A3=>i3,      
                A4=>i4,      
                A5=>j1,      
                A6=>j2,      
                A7=>j3,      
                A8=>j4,      
                Enable=>XLXN_95,      
                Z0=>XLXN_219,      
                Z1=>XLXN_220,      
                Z2=>XLXN_221,      
                Z3=>XLXN_222,      
                Z4=>XLXN_226,      
                Z5=>XLXN_225,      
                Z6=>XLXN_224,      
                Z7=>XLXN_223);
   
   XLXI_4 : sevenseg
      port map (Aa=>XLXN_79,      
                Ab=>XLXN_80,      
                Ac=>XLXN_81,      
                Ad=>XLXN_82,      
                Adp=>XLXN_58,      
                Ae=>XLXN_83,      
                Af=>XLXN_84,      
                Ag=>XLXN_59,      
                Enable=>XLXN_95,      
                Za=>za,      
                Zb=>zb,      
                Zc=>zc,      
                Zd=>zd,      
                Zdp=>zdp,      
                Ze=>ze,      
                Zf=>zf,      
                Zg=>zg);
   
   XLXI_6 : eightleds
      port map (A1=>XLXN_120,      
                A2=>XLXN_254,      
                A3=>XLXN_256,      
                A4=>XLXN_104,      
                A5=>XLXN_103,      
                A6=>XLXN_102,      
                A7=>XLXN_101,      
                A8=>XLXN_100,      
                Enable=>XLXN_95,      
                Z1=>o1,      
                Z2=>o2,      
                Z3=>o3,      
                Z4=>o4,      
                Z5=>o5,      
                Z6=>o6,      
                Z7=>o7,      
                Z8=>o8);
   
   XLXI_8 : momentsw
      port map (A1=>addsub,      
                Enable=>XLXN_95,      
                Z1=>XLXN_120);
   
   XLXI_24 : GND
      port map (G=>XLXN_215);
   
   XLXI_30 : VCC
      port map (P=>XLXN_95);
   
   XLXI_36 : ADSU4_MXILINX_big
      port map (ADD=>XLXN_120,      
                A0=>XLXN_222,      
                A1=>XLXN_221,      
                A2=>XLXN_220,      
                A3=>XLXN_219,      
                B0=>XLXN_223,      
                B1=>XLXN_224,      
                B2=>XLXN_225,      
                B3=>XLXN_226,      
                CI=>XLXN_215,      
                CO=>XLXN_104,      
                OFL=>XLXN_256,      
                S0=>XLXN_248,      
                S1=>XLXN_249,      
                S2=>XLXN_250,      
                S3=>XLXN_251);
   
   XLXI_37 : XOR2
      port map (I0=>XLXN_248,      
                I1=>XLXN_254,      
                O=>XLXN_100);
   
   XLXI_38 : XOR2
      port map (I0=>XLXN_249,      
                I1=>XLXN_254,      
                O=>XLXN_101);
   
   XLXI_39 : XOR2
      port map (I0=>XLXN_250,      
                I1=>XLXN_254,      
                O=>XLXN_102);
   
   XLXI_40 : XOR2
      port map (I0=>XLXN_251,      
                I1=>XLXN_254,      
                O=>XLXN_103);
   
   XLXI_45 : INV
      port map (I=>XLXN_120,      
                O=>XLXN_254);
   
end BEHAVIORAL;


