--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : set1.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_set1
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_set1 is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_set1;

architecture BEHAVIORAL of BUFE4_MXILINX_set1 is
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
--  /   /         Filename : set1.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: D2_4E_MXILINX_set1
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity D2_4E_MXILINX_set1 is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          E  : in    std_logic; 
          D0 : out   std_logic; 
          D1 : out   std_logic; 
          D2 : out   std_logic; 
          D3 : out   std_logic);
end D2_4E_MXILINX_set1;

architecture BEHAVIORAL of D2_4E_MXILINX_set1 is
   attribute BOX_TYPE   : string ;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
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
   I_36_30 : AND3
      port map (I0=>A1,      
                I1=>A0,      
                I2=>E,      
                O=>D3);
   
   I_36_31 : AND3B1
      port map (I0=>A0,      
                I1=>A1,      
                I2=>E,      
                O=>D2);
   
   I_36_32 : AND3B1
      port map (I0=>A1,      
                I1=>A0,      
                I2=>E,      
                O=>D1);
   
   I_36_33 : AND3B2
      port map (I0=>A0,      
                I1=>A1,      
                I2=>E,      
                O=>D0);
   
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
--  /   /         Filename : set1.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: set1
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity set1 is
   port ( A  : in    std_logic_vector (0 to 3); 
          B  : in    std_logic_vector (0 to 3); 
          En : in    std_logic; 
          Fn : in    std_logic_vector (0 to 1); 
          Z  : out   std_logic_vector (0 to 7));
end set1;

architecture BEHAVIORAL of set1 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_9  : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_42 : std_logic;
   signal XLXN_43 : std_logic;
   signal XLXN_48 : std_logic;
   component and_array
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             B0 : in    std_logic; 
             B1 : in    std_logic; 
             B2 : in    std_logic; 
             B3 : in    std_logic; 
             En : in    std_logic; 
             Z0 : out   std_logic; 
             Z1 : out   std_logic; 
             Z2 : out   std_logic; 
             Z3 : out   std_logic);
   end component;
   
   component nand_array
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             B0 : in    std_logic; 
             B1 : in    std_logic; 
             B2 : in    std_logic; 
             B3 : in    std_logic; 
             En : in    std_logic; 
             Z0 : out   std_logic; 
             Z1 : out   std_logic; 
             Z2 : out   std_logic; 
             Z3 : out   std_logic);
   end component;
   
   component not_array
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             En : in    std_logic; 
             Z0 : out   std_logic; 
             Z1 : out   std_logic; 
             Z2 : out   std_logic; 
             Z3 : out   std_logic);
   end component;
   
   component D2_4E_MXILINX_set1
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component evenp
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             En : in    std_logic; 
             Z0 : out   std_logic; 
             Z1 : out   std_logic; 
             Z2 : out   std_logic; 
             Z3 : out   std_logic; 
             Zp : out   std_logic);
   end component;
   
   component BUFE4_MXILINX_set1
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
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_4 : label is "XLXI_4_0";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_1";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_2";
begin
   XLXI_1 : and_array
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                B0=>B(0),      
                B1=>B(1),      
                B2=>B(2),      
                B3=>B(3),      
                En=>XLXN_9,      
                Z0=>XLXN_33,      
                Z1=>XLXN_34,      
                Z2=>XLXN_35,      
                Z3=>XLXN_36);
   
   XLXI_2 : nand_array
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                B0=>B(0),      
                B1=>B(1),      
                B2=>B(2),      
                B3=>B(3),      
                En=>XLXN_13,      
                Z0=>XLXN_33,      
                Z1=>XLXN_34,      
                Z2=>XLXN_35,      
                Z3=>XLXN_36);
   
   XLXI_3 : not_array
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                En=>XLXN_14,      
                Z0=>XLXN_33,      
                Z1=>XLXN_34,      
                Z2=>XLXN_35,      
                Z3=>XLXN_36);
   
   XLXI_4 : D2_4E_MXILINX_set1
      port map (A0=>Fn(0),      
                A1=>Fn(1),      
                E=>En,      
                D0=>XLXN_9,      
                D1=>XLXN_13,      
                D2=>XLXN_14,      
                D3=>XLXN_15);
   
   XLXI_5 : evenp
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                En=>XLXN_15,      
                Zp=>XLXN_43,      
                Z0=>XLXN_33,      
                Z1=>XLXN_34,      
                Z2=>XLXN_35,      
                Z3=>XLXN_36);
   
   XLXI_13 : BUFE4_MXILINX_set1
      port map (E=>En,      
                I0=>XLXN_33,      
                I1=>XLXN_34,      
                I2=>XLXN_35,      
                I3=>XLXN_36,      
                O0=>Z(0),      
                O1=>Z(1),      
                O2=>Z(2),      
                O3=>Z(3));
   
   XLXI_14 : BUFE4_MXILINX_set1
      port map (E=>En,      
                I0=>XLXN_42,      
                I1=>XLXN_48,      
                I2=>XLXN_48,      
                I3=>XLXN_48,      
                O0=>Z(4),      
                O1=>Z(5),      
                O2=>Z(6),      
                O3=>Z(7));
   
   XLXI_15 : AND2
      port map (I0=>XLXN_15,      
                I1=>XLXN_43,      
                O=>XLXN_42);
   
   XLXI_16 : GND
      port map (G=>XLXN_48);
   
end BEHAVIORAL;


