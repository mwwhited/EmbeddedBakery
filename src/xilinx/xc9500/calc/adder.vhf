--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : adder.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUF4_MXILINX_adder
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUF4_MXILINX_adder is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUF4_MXILINX_adder;

architecture BEHAVIORAL of BUF4_MXILINX_adder is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>I0,      
                O=>O0);
   
   XLXI_2 : BUF
      port map (I=>I1,      
                O=>O1);
   
   XLXI_3 : BUF
      port map (I=>I2,      
                O=>O2);
   
   XLXI_4 : BUF
      port map (I=>I3,      
                O=>O3);
   
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
--  /   /         Filename : adder.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:40
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
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : adder.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:40
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
   port ( Add_Sub : in    std_logic; 
          A1      : in    std_logic; 
          A2      : in    std_logic; 
          A3      : in    std_logic; 
          A4      : in    std_logic; 
          B1      : in    std_logic; 
          B2      : in    std_logic; 
          B3      : in    std_logic; 
          B4      : in    std_logic; 
          Enable  : in    std_logic; 
          Zco     : out   std_logic; 
          Z1      : out   std_logic; 
          Z2      : out   std_logic; 
          Z3      : out   std_logic; 
          Z4      : out   std_logic);
end adder;

architecture BEHAVIORAL of adder is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_2   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_7   : std_logic;
   signal XLXN_10  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_23  : std_logic;
   signal XLXN_24  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_26  : std_logic;
   signal XLXN_28  : std_logic;
   signal XLXN_33  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_37  : std_logic;
   signal XLXN_38  : std_logic;
   signal XLXN_39  : std_logic;
   signal XLXN_182 : std_logic;
   signal XLXN_345 : std_logic;
   signal XLXN_346 : std_logic;
   signal XLXN_348 : std_logic;
   signal XLXN_349 : std_logic;
   signal XLXN_350 : std_logic;
   signal XLXN_352 : std_logic;
   signal XLXN_353 : std_logic;
   signal XLXN_355 : std_logic;
   signal XLXN_356 : std_logic;
   signal XLXN_370 : std_logic;
   signal XLXN_371 : std_logic;
   signal XLXN_373 : std_logic;
   signal XLXN_374 : std_logic;
   signal XLXN_375 : std_logic;
   signal XLXN_378 : std_logic;
   signal XLXN_379 : std_logic;
   signal XLXN_383 : std_logic;
   signal XLXN_384 : std_logic;
   signal XLXN_385 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
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
   
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component BUF4_MXILINX_adder
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_121 : label is "XLXI_121_0";
   attribute HU_SET of XLXI_124 : label is "XLXI_124_1";
   attribute HU_SET of XLXI_125 : label is "XLXI_125_2";
begin
   XLXI_11 : AND2
      port map (I0=>XLXN_355,      
                I1=>XLXN_2,      
                O=>XLXN_21);
   
   XLXI_12 : AND2
      port map (I0=>XLXN_23,      
                I1=>XLXN_21,      
                O=>XLXN_24);
   
   XLXI_13 : AND2
      port map (I0=>XLXN_28,      
                I1=>XLXN_26,      
                O=>XLXN_33);
   
   XLXI_14 : AND2
      port map (I0=>XLXN_352,      
                I1=>XLXN_4,      
                O=>XLXN_25);
   
   XLXI_15 : AND2
      port map (I0=>XLXN_37,      
                I1=>XLXN_35,      
                O=>XLXN_38);
   
   XLXI_16 : AND2
      port map (I0=>XLXN_348,      
                I1=>XLXN_7,      
                O=>XLXN_34);
   
   XLXI_17 : AND2
      port map (I0=>XLXN_345,      
                I1=>XLXN_10,      
                O=>XLXN_39);
   
   XLXI_18 : XOR2
      port map (I0=>XLXN_25,      
                I1=>XLXN_24,      
                O=>XLXN_26);
   
   XLXI_19 : XOR2
      port map (I0=>XLXN_28,      
                I1=>XLXN_26,      
                O=>XLXN_385);
   
   XLXI_20 : XOR2
      port map (I0=>XLXN_352,      
                I1=>XLXN_4,      
                O=>XLXN_23);
   
   XLXI_21 : XOR2
      port map (I0=>XLXN_34,      
                I1=>XLXN_33,      
                O=>XLXN_35);
   
   XLXI_22 : XOR2
      port map (I0=>XLXN_37,      
                I1=>XLXN_35,      
                O=>XLXN_371);
   
   XLXI_23 : XOR2
      port map (I0=>XLXN_348,      
                I1=>XLXN_7,      
                O=>XLXN_28);
   
   XLXI_24 : XOR2
      port map (I0=>XLXN_345,      
                I1=>XLXN_10,      
                O=>XLXN_37);
   
   XLXI_25 : XOR2
      port map (I0=>XLXN_39,      
                I1=>XLXN_38,      
                O=>XLXN_370);
   
   XLXI_26 : XOR2
      port map (I0=>XLXN_23,      
                I1=>XLXN_21,      
                O=>XLXN_373);
   
   XLXI_27 : XOR2
      port map (I0=>XLXN_355,      
                I1=>XLXN_2,      
                O=>XLXN_374);
   
   XLXI_121 : BUFE4_MXILINX_adder
      port map (E=>XLXN_182,      
                I0=>XLXN_384,      
                I1=>XLXN_383,      
                I2=>XLXN_375,      
                I3=>XLXN_378,      
                O0=>Z1,      
                O1=>Z2,      
                O2=>Z3,      
                O3=>Z4);
   
   XLXI_122 : BUFE
      port map (E=>XLXN_182,      
                I=>XLXN_379,      
                O=>Zco);
   
   XLXI_123 : BUF
      port map (I=>Enable,      
                O=>XLXN_182);
   
   XLXI_124 : BUF4_MXILINX_adder
      port map (I0=>B1,      
                I1=>B2,      
                I2=>B3,      
                I3=>B4,      
                O0=>XLXN_346,      
                O1=>XLXN_349,      
                O2=>XLXN_350,      
                O3=>XLXN_353);
   
   XLXI_125 : BUF4_MXILINX_adder
      port map (I0=>A1,      
                I1=>A2,      
                I2=>A3,      
                I3=>A4,      
                O0=>XLXN_10,      
                O1=>XLXN_7,      
                O2=>XLXN_4,      
                O3=>XLXN_2);
   
   XLXI_149 : XOR2
      port map (I0=>XLXN_346,      
                I1=>XLXN_356,      
                O=>XLXN_345);
   
   XLXI_150 : BUF
      port map (I=>Add_Sub,      
                O=>XLXN_356);
   
   XLXI_198 : XOR2
      port map (I0=>XLXN_349,      
                I1=>XLXN_356,      
                O=>XLXN_348);
   
   XLXI_199 : XOR2
      port map (I0=>XLXN_356,      
                I1=>XLXN_350,      
                O=>XLXN_352);
   
   XLXI_200 : XOR2
      port map (I0=>XLXN_356,      
                I1=>XLXN_353,      
                O=>XLXN_355);
   
   XLXI_204 : XOR2
      port map (I0=>XLXN_356,      
                I1=>XLXN_374,      
                O=>XLXN_384);
   
   XLXI_205 : XOR2
      port map (I0=>XLXN_356,      
                I1=>XLXN_373,      
                O=>XLXN_383);
   
   XLXI_206 : XOR2
      port map (I0=>XLXN_356,      
                I1=>XLXN_385,      
                O=>XLXN_375);
   
   XLXI_207 : XOR2
      port map (I0=>XLXN_356,      
                I1=>XLXN_371,      
                O=>XLXN_378);
   
   XLXI_208 : XOR2
      port map (I0=>XLXN_356,      
                I1=>XLXN_370,      
                O=>XLXN_379);
   
end BEHAVIORAL;


