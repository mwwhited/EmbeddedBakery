--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : f_adder.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: ADD1_MXILINX_f_adder
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity ADD1_MXILINX_f_adder is
   port ( A0 : in    std_logic; 
          B0 : in    std_logic; 
          CI : in    std_logic; 
          CO : out   std_logic; 
          S0 : out   std_logic);
end ADD1_MXILINX_f_adder;

architecture BEHAVIORAL of ADD1_MXILINX_f_adder is
   attribute BOX_TYPE   : string ;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
begin
   I_36_60 : AND2B1
      port map (I0=>CI,      
                I1=>B0,      
                O=>XLXN_7);
   
   I_36_61 : AND2
      port map (I0=>CI,      
                I1=>A0,      
                O=>XLXN_10);
   
   I_36_62 : OR2
      port map (I0=>XLXN_6,      
                I1=>XLXN_7,      
                O=>XLXN_8);
   
   I_36_63 : OR3
      port map (I0=>XLXN_9,      
                I1=>XLXN_11,      
                I2=>XLXN_10,      
                O=>CO);
   
   I_36_64 : XOR2
      port map (I0=>XLXN_8,      
                I1=>A0,      
                O=>S0);
   
   I_36_65 : AND2B1
      port map (I0=>B0,      
                I1=>CI,      
                O=>XLXN_6);
   
   I_36_80 : AND2
      port map (I0=>B0,      
                I1=>A0,      
                O=>XLXN_11);
   
   I_36_81 : AND2
      port map (I0=>CI,      
                I1=>B0,      
                O=>XLXN_9);
   
end BEHAVIORAL;


--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : f_adder.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: ADD4_MXILINX_f_adder
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity ADD4_MXILINX_f_adder is
   port ( A0  : in    std_logic; 
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
end ADD4_MXILINX_f_adder;

architecture BEHAVIORAL of ADD4_MXILINX_f_adder is
   attribute BOX_TYPE   : string ;
   signal CI_OR0   : std_logic;
   signal XLXN_24  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_26  : std_logic;
   signal XLXN_27  : std_logic;
   signal XLXN_28  : std_logic;
   signal XLXN_29  : std_logic;
   signal XLXN_30  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_32  : std_logic;
   signal XLXN_33  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_36  : std_logic;
   signal XLXN_37  : std_logic;
   signal XLXN_38  : std_logic;
   signal XLXN_39  : std_logic;
   signal XLXN_40  : std_logic;
   signal XLXN_41  : std_logic;
   signal XLXN_42  : std_logic;
   signal XLXN_43  : std_logic;
   signal X0       : std_logic;
   signal X1       : std_logic;
   signal X2       : std_logic;
   signal X3       : std_logic;
   signal S3_DUMMY : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   S3 <= S3_DUMMY;
   I_36_168 : XOR2
      port map (I0=>B3,      
                I1=>A3,      
                O=>X3);
   
   I_36_169 : XOR2
      port map (I0=>B2,      
                I1=>A2,      
                O=>X2);
   
   I_36_170 : XOR2
      port map (I0=>B1,      
                I1=>A1,      
                O=>X1);
   
   I_36_171 : XOR2
      port map (I0=>B0,      
                I1=>A0,      
                O=>X0);
   
   I_36_185 : OR2
      port map (I0=>XLXN_36,      
                I1=>XLXN_35,      
                O=>XLXN_28);
   
   I_36_186 : OR3
      port map (I0=>XLXN_39,      
                I1=>XLXN_38,      
                I2=>XLXN_37,      
                O=>XLXN_34);
   
   I_36_187 : OR4
      port map (I0=>XLXN_43,      
                I1=>XLXN_42,      
                I2=>XLXN_41,      
                I3=>XLXN_40,      
                O=>XLXN_27);
   
   I_36_188 : AND5
      port map (I0=>CI_OR0,      
                I1=>X0,      
                I2=>X1,      
                I3=>X2,      
                I4=>X3,      
                O=>XLXN_30);
   
   I_36_189 : AND5
      port map (I0=>B0,      
                I1=>A0,      
                I2=>X1,      
                I3=>X2,      
                I4=>X3,      
                O=>XLXN_29);
   
   I_36_190 : AND4
      port map (I0=>B1,      
                I1=>A1,      
                I2=>X2,      
                I3=>X3,      
                O=>XLXN_33);
   
   I_36_191 : AND3
      port map (I0=>B2,      
                I1=>A2,      
                I2=>X3,      
                O=>XLXN_31);
   
   I_36_192 : AND2
      port map (I0=>B3,      
                I1=>A3,      
                O=>XLXN_32);
   
   I_36_193 : AND4
      port map (I0=>CI_OR0,      
                I1=>X0,      
                I2=>X1,      
                I3=>X2,      
                O=>XLXN_43);
   
   I_36_194 : AND4
      port map (I0=>B0,      
                I1=>A0,      
                I2=>X1,      
                I3=>X2,      
                O=>XLXN_42);
   
   I_36_195 : AND3
      port map (I0=>B1,      
                I1=>A1,      
                I2=>X2,      
                O=>XLXN_41);
   
   I_36_196 : AND2
      port map (I0=>B2,      
                I1=>A2,      
                O=>XLXN_40);
   
   I_36_197 : AND3
      port map (I0=>CI_OR0,      
                I1=>X0,      
                I2=>X1,      
                O=>XLXN_39);
   
   I_36_198 : AND3
      port map (I0=>B0,      
                I1=>A0,      
                I2=>X1,      
                O=>XLXN_38);
   
   I_36_199 : AND2
      port map (I0=>B1,      
                I1=>A1,      
                O=>XLXN_37);
   
   I_36_200 : AND2
      port map (I0=>CI_OR0,      
                I1=>X0,      
                O=>XLXN_36);
   
   I_36_201 : AND2
      port map (I0=>B0,      
                I1=>A0,      
                O=>XLXN_35);
   
   I_36_206 : XOR2
      port map (I0=>XLXN_34,      
                I1=>X2,      
                O=>S2);
   
   I_36_207 : OR5
      port map (I0=>XLXN_30,      
                I1=>XLXN_29,      
                I2=>XLXN_33,      
                I3=>XLXN_31,      
                I4=>XLXN_32,      
                O=>CO);
   
   I_36_208 : XOR2
      port map (I0=>X0,      
                I1=>CI_OR0,      
                O=>S0);
   
   I_36_209 : XOR2
      port map (I0=>XLXN_28,      
                I1=>X1,      
                O=>S1);
   
   I_36_210 : XOR2
      port map (I0=>XLXN_27,      
                I1=>X3,      
                O=>S3_DUMMY);
   
   I_36_211 : OR2
      port map (I0=>XLXN_26,      
                I1=>CI,      
                O=>CI_OR0);
   
   I_36_212 : GND
      port map (G=>XLXN_26);
   
   I_36_234 : AND3B1
      port map (I0=>S3_DUMMY,      
                I1=>A3,      
                I2=>B3,      
                O=>XLXN_24);
   
   I_36_235 : AND3B2
      port map (I0=>B3,      
                I1=>A3,      
                I2=>S3_DUMMY,      
                O=>XLXN_25);
   
   I_36_238 : OR2
      port map (I0=>XLXN_24,      
                I1=>XLXN_25,      
                O=>OFL);
   
end BEHAVIORAL;


--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : f_adder.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: f_adder
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity f_adder is
   port ( A : in    std_logic_vector (0 to 5); 
          B : in    std_logic_vector (0 to 5); 
          Z : out   std_logic_vector (0 to 5));
end f_adder;

architecture BEHAVIORAL of f_adder is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_3  : std_logic;
   signal XLXN_23 : std_logic;
   component ADD4_MXILINX_f_adder
      port ( A0  : in    std_logic; 
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
   end component;
   
   component ADD1_MXILINX_f_adder
      port ( A0 : in    std_logic; 
             B0 : in    std_logic; 
             CI : in    std_logic; 
             CO : out   std_logic; 
             S0 : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
begin
   XLXI_1 : ADD4_MXILINX_f_adder
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                B0=>B(0),      
                B1=>B(1),      
                B2=>B(2),      
                B3=>B(3),      
                CI=>XLXN_23,      
                CO=>XLXN_3,      
                OFL=>open,      
                S0=>Z(0),      
                S1=>Z(1),      
                S2=>Z(2),      
                S3=>Z(3));
   
   XLXI_2 : ADD1_MXILINX_f_adder
      port map (A0=>A(4),      
                B0=>B(4),      
                CI=>XLXN_3,      
                CO=>Z(5),      
                S0=>Z(4));
   
   XLXI_3 : GND
      port map (G=>XLXN_23);
   
end BEHAVIORAL;


