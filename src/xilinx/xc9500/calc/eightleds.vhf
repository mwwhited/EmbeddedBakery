--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : eightleds.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:42
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUF4_MXILINX_eightleds
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUF4_MXILINX_eightleds is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUF4_MXILINX_eightleds;

architecture BEHAVIORAL of BUF4_MXILINX_eightleds is
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
--  /   /         Filename : eightleds.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:42
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: OBUFE_MXILINX_eightleds
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity OBUFE_MXILINX_eightleds is
   port ( E : in    std_logic; 
          I : in    std_logic; 
          O : out   std_logic);
end OBUFE_MXILINX_eightleds;

architecture BEHAVIORAL of OBUFE_MXILINX_eightleds is
   attribute BOX_TYPE   : string ;
   signal T : std_logic;
   component OBUFT
      port ( I : in    std_logic; 
             T : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of OBUFT : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   I_36_10 : OBUFT
      port map (I=>I,      
                T=>T,      
                O=>O);
   
   I_36_12 : INV
      port map (I=>E,      
                O=>T);
   
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
--  /   /         Filename : eightleds.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:42
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: OBUFE4_MXILINX_eightleds
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity OBUFE4_MXILINX_eightleds is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end OBUFE4_MXILINX_eightleds;

architecture BEHAVIORAL of OBUFE4_MXILINX_eightleds is
   attribute HU_SET     : string ;
   component OBUFE_MXILINX_eightleds
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   
   attribute HU_SET of I_36_37 : label is "I_36_37_3";
   attribute HU_SET of I_36_38 : label is "I_36_38_0";
   attribute HU_SET of I_36_39 : label is "I_36_39_1";
   attribute HU_SET of I_36_40 : label is "I_36_40_2";
begin
   I_36_37 : OBUFE_MXILINX_eightleds
      port map (E=>E,      
                I=>I3,      
                O=>O3);
   
   I_36_38 : OBUFE_MXILINX_eightleds
      port map (E=>E,      
                I=>I2,      
                O=>O2);
   
   I_36_39 : OBUFE_MXILINX_eightleds
      port map (E=>E,      
                I=>I1,      
                O=>O1);
   
   I_36_40 : OBUFE_MXILINX_eightleds
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
--  /   /         Filename : eightleds.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:42
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: eightleds
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity eightleds is
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
   attribute loc : string ;
   attribute loc of Z1 : signal is "p44";
   attribute loc of Z2 : signal is "p43";
   attribute loc of Z3 : signal is "p41";
   attribute LOC of Z4 : signal is "p40";
   attribute LOC of Z5 : signal is "p39";
   attribute LOC of Z6 : signal is "p37";
   attribute loc of Z7 : signal is "p36";
   attribute LOC of Z8 : signal is "p35";
end eightleds;

architecture BEHAVIORAL of eightleds is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1 : std_logic;
   signal XLXN_2 : std_logic;
   signal XLXN_3 : std_logic;
   signal XLXN_4 : std_logic;
   signal XLXN_5 : std_logic;
   signal XLXN_6 : std_logic;
   signal XLXN_7 : std_logic;
   signal XLXN_8 : std_logic;
   signal XLXN_9 : std_logic;
   component OBUFE4_MXILINX_eightleds
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
   
   component BUF4_MXILINX_eightleds
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_4";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_5";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_6";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_7";
begin
   XLXI_1 : OBUFE4_MXILINX_eightleds
      port map (E=>XLXN_9,      
                I0=>XLXN_8,      
                I1=>XLXN_7,      
                I2=>XLXN_6,      
                I3=>XLXN_5,      
                O0=>Z1,      
                O1=>Z2,      
                O2=>Z3,      
                O3=>Z4);
   
   XLXI_2 : OBUFE4_MXILINX_eightleds
      port map (E=>XLXN_9,      
                I0=>XLXN_4,      
                I1=>XLXN_3,      
                I2=>XLXN_2,      
                I3=>XLXN_1,      
                O0=>Z5,      
                O1=>Z6,      
                O2=>Z7,      
                O3=>Z8);
   
   XLXI_3 : BUF4_MXILINX_eightleds
      port map (I0=>A1,      
                I1=>A2,      
                I2=>A3,      
                I3=>A4,      
                O0=>XLXN_8,      
                O1=>XLXN_7,      
                O2=>XLXN_6,      
                O3=>XLXN_5);
   
   XLXI_4 : BUF4_MXILINX_eightleds
      port map (I0=>A5,      
                I1=>A6,      
                I2=>A7,      
                I3=>A8,      
                O0=>XLXN_4,      
                O1=>XLXN_3,      
                O2=>XLXN_2,      
                O3=>XLXN_1);
   
   XLXI_5 : BUF
      port map (I=>Enable,      
                O=>XLXN_9);
   
end BEHAVIORAL;


