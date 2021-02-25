--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : sevenseg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:57
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUF4_MXILINX_sevenseg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUF4_MXILINX_sevenseg is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUF4_MXILINX_sevenseg;

architecture BEHAVIORAL of BUF4_MXILINX_sevenseg is
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
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : sevenseg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:57
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: OBUFE_MXILINX_sevenseg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity OBUFE_MXILINX_sevenseg is
   port ( E : in    std_logic; 
          I : in    std_logic; 
          O : out   std_logic);
end OBUFE_MXILINX_sevenseg;

architecture BEHAVIORAL of OBUFE_MXILINX_sevenseg is
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
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : sevenseg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:57
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: OBUFE4_MXILINX_sevenseg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity OBUFE4_MXILINX_sevenseg is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end OBUFE4_MXILINX_sevenseg;

architecture BEHAVIORAL of OBUFE4_MXILINX_sevenseg is
   attribute HU_SET     : string ;
   component OBUFE_MXILINX_sevenseg
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   
   attribute HU_SET of I_36_37 : label is "I_36_37_3";
   attribute HU_SET of I_36_38 : label is "I_36_38_0";
   attribute HU_SET of I_36_39 : label is "I_36_39_1";
   attribute HU_SET of I_36_40 : label is "I_36_40_2";
begin
   I_36_37 : OBUFE_MXILINX_sevenseg
      port map (E=>E,      
                I=>I3,      
                O=>O3);
   
   I_36_38 : OBUFE_MXILINX_sevenseg
      port map (E=>E,      
                I=>I2,      
                O=>O2);
   
   I_36_39 : OBUFE_MXILINX_sevenseg
      port map (E=>E,      
                I=>I1,      
                O=>O1);
   
   I_36_40 : OBUFE_MXILINX_sevenseg
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
--  /   /         Filename : sevenseg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:57
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: sevenseg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity sevenseg is
   port ( A  : in    std_logic_vector (0 to 7); 
          En : in    std_logic; 
          Z  : out   std_logic_vector (0 to 7));
end sevenseg;

architecture BEHAVIORAL of sevenseg is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   component OBUFE4_MXILINX_sevenseg
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component BUF4_MXILINX_sevenseg
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_4 : label is "XLXI_4_4";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_5";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_6";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_7";
begin
   XLXI_4 : OBUFE4_MXILINX_sevenseg
      port map (E=>XLXN_11,      
                I0=>XLXN_3,      
                I1=>XLXN_4,      
                I2=>XLXN_5,      
                I3=>XLXN_6,      
                O0=>Z(0),      
                O1=>Z(1),      
                O2=>Z(2),      
                O3=>Z(3));
   
   XLXI_5 : OBUFE4_MXILINX_sevenseg
      port map (E=>XLXN_11,      
                I0=>XLXN_7,      
                I1=>XLXN_8,      
                I2=>XLXN_9,      
                I3=>XLXN_10,      
                O0=>Z(4),      
                O1=>Z(5),      
                O2=>Z(6),      
                O3=>Z(7));
   
   XLXI_14 : BUF
      port map (I=>En,      
                O=>XLXN_11);
   
   XLXI_15 : BUF4_MXILINX_sevenseg
      port map (I0=>A(4),      
                I1=>A(5),      
                I2=>A(6),      
                I3=>A(7),      
                O0=>XLXN_7,      
                O1=>XLXN_8,      
                O2=>XLXN_9,      
                O3=>XLXN_10);
   
   XLXI_16 : BUF4_MXILINX_sevenseg
      port map (I0=>A(0),      
                I1=>A(1),      
                I2=>A(2),      
                I3=>A(3),      
                O0=>XLXN_3,      
                O1=>XLXN_4,      
                O2=>XLXN_5,      
                O3=>XLXN_6);
   
end BEHAVIORAL;


