--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : adder.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_adder
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_adder is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_adder;

architecture BEHAVIORAL of BUFE4_MXILINX_adder is
   attribute BOX_TYPE   : string ;
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
begin
   I_36_37 : BUFE
      port map (E=>E,      
                I=>I3,      
                O=>O3);
   
   I_36_38 : BUFE
      port map (E=>E,      
                I=>I2,      
                O=>O2);
   
   I_36_39 : BUFE
      port map (E=>E,      
                I=>I1,      
                O=>O1);
   
   I_36_40 : BUFE
      port map (E=>E,      
                I=>I0,      
                O=>O0);
   
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
--  /   /         Filename : adder.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: ADD4_MXILINX_adder
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity ADD4_MXILINX_adder is
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
end ADD4_MXILINX_adder;

architecture BEHAVIORAL of ADD4_MXILINX_adder is
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
--  /   /         Filename : adder.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: adder
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity adder is
   port ( A  : in    std_logic_vector (0 to 3); 
          B  : in    std_logic_vector (0 to 3); 
          En : in    std_logic; 
          Z  : out   std_logic_vector (0 to 4));
end adder;

architecture BEHAVIORAL of adder is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal Cin  : std_logic;
   signal Cout : std_logic;
   signal Q0   : std_logic;
   signal Q1   : std_logic;
   signal Q2   : std_logic;
   signal Q3   : std_logic;
   component ADD4_MXILINX_adder
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
   
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUFE4_MXILINX_adder
      port ( E  : in    std_logic; 
             I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   attribute HU_SET of add_main : label is "add_main_0";
   attribute HU_SET of low4 : label is "low4_1";
begin
   add_main : ADD4_MXILINX_adder
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                B0=>B(0),      
                B1=>B(1),      
                B2=>B(2),      
                B3=>B(3),      
                CI=>Cin,      
                CO=>Cout,      
                OFL=>open,      
                S0=>Q0,      
                S1=>Q1,      
                S2=>Q2,      
                S3=>Q3);
   
   high1 : BUFE
      port map (E=>En,      
                I=>Cout,      
                O=>Z(4));
   
   holdlow : GND
      port map (G=>Cin);
   
   low4 : BUFE4_MXILINX_adder
      port map (E=>En,      
                I0=>Q0,      
                I1=>Q1,      
                I2=>Q2,      
                I3=>Q3,      
                O0=>Z(0),      
                O1=>Z(1),      
                O2=>Z(2),      
                O3=>Z(3));
   
end BEHAVIORAL;


