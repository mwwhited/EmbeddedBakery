--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : set3.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_set3
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_set3 is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_set3;

architecture BEHAVIORAL of BUFE4_MXILINX_set3 is
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
--  /   /         Filename : set3.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: D2_4E_MXILINX_set3
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity D2_4E_MXILINX_set3 is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          E  : in    std_logic; 
          D0 : out   std_logic; 
          D1 : out   std_logic; 
          D2 : out   std_logic; 
          D3 : out   std_logic);
end D2_4E_MXILINX_set3;

architecture BEHAVIORAL of D2_4E_MXILINX_set3 is
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
--  /   /         Filename : set3.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: set3
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity set3 is
   port ( A  : in    std_logic_vector (0 to 3); 
          En : in    std_logic; 
          Fn : in    std_logic_vector (0 to 1); 
          Z  : out   std_logic_vector (0 to 7));
end set3;

architecture BEHAVIORAL of set3 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_39 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_53 : std_logic;
   component twocompl
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             A4 : in    std_logic; 
             En : in    std_logic; 
             Z0 : out   std_logic; 
             Z1 : out   std_logic; 
             Z2 : out   std_logic; 
             Z3 : out   std_logic; 
             Z4 : out   std_logic);
   end component;
   
   component D2_4E_MXILINX_set3
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component all_low
      port ( En : in    std_logic; 
             Z0 : out   std_logic; 
             Z1 : out   std_logic; 
             Z2 : out   std_logic; 
             Z3 : out   std_logic);
   end component;
   
   component shift_l
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
   
   component shift_r
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUFE4_MXILINX_set3
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
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_0";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_1";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_2";
begin
   XLXI_1 : twocompl
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                A4=>XLXN_11,      
                En=>XLXN_1,      
                Z0=>XLXN_25,      
                Z1=>XLXN_24,      
                Z2=>XLXN_23,      
                Z3=>XLXN_22,      
                Z4=>XLXN_40);
   
   XLXI_2 : D2_4E_MXILINX_set3
      port map (A0=>Fn(0),      
                A1=>Fn(1),      
                E=>En,      
                D0=>XLXN_1,      
                D1=>XLXN_2,      
                D2=>XLXN_3,      
                D3=>XLXN_4);
   
   XLXI_3 : all_low
      port map (En=>XLXN_4,      
                Z0=>XLXN_25,      
                Z1=>XLXN_24,      
                Z2=>XLXN_23,      
                Z3=>XLXN_22);
   
   XLXI_4 : shift_l
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                En=>XLXN_2,      
                Z0=>XLXN_25,      
                Z1=>XLXN_24,      
                Z2=>XLXN_23,      
                Z3=>XLXN_22);
   
   XLXI_5 : shift_r
      port map (A0=>A(0),      
                A1=>A(1),      
                A2=>A(2),      
                A3=>A(3),      
                En=>XLXN_3,      
                Z0=>XLXN_25,      
                Z1=>XLXN_24,      
                Z2=>XLXN_23,      
                Z3=>XLXN_22);
   
   XLXI_6 : GND
      port map (G=>XLXN_11);
   
   XLXI_7 : BUFE4_MXILINX_set3
      port map (E=>En,      
                I0=>XLXN_25,      
                I1=>XLXN_24,      
                I2=>XLXN_23,      
                I3=>XLXN_22,      
                O0=>Z(0),      
                O1=>Z(1),      
                O2=>Z(2),      
                O3=>Z(3));
   
   XLXI_8 : BUFE4_MXILINX_set3
      port map (E=>En,      
                I0=>XLXN_39,      
                I1=>XLXN_53,      
                I2=>XLXN_53,      
                I3=>XLXN_53,      
                O0=>Z(4),      
                O1=>Z(5),      
                O2=>Z(6),      
                O3=>Z(7));
   
   XLXI_9 : AND2
      port map (I0=>XLXN_1,      
                I1=>XLXN_40,      
                O=>XLXN_39);
   
   XLXI_10 : GND
      port map (G=>XLXN_53);
   
end BEHAVIORAL;


