--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : eightleds.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:17
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
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : eightleds.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:17
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
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : eightleds.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:17
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
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : eightleds.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:17
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
   port ( A      : in    std_logic_vector (0 to 7); 
          Enable : in    std_logic; 
          Z      : out   std_logic_vector (0 to 7));
end eightleds;

architecture BEHAVIORAL of eightleds is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal qen    : std_logic;
   signal q0     : std_logic;
   signal q1     : std_logic;
   signal q2     : std_logic;
   signal q3     : std_logic;
   signal q4     : std_logic;
   signal q5     : std_logic;
   signal q6     : std_logic;
   signal q7     : std_logic;
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
   
   attribute HU_SET of in_buf0 : label is "in_buf0_6";
   attribute HU_SET of in_buf1 : label is "in_buf1_7";
   attribute HU_SET of out_buf0 : label is "out_buf0_4";
   attribute HU_SET of out_buf1 : label is "out_buf1_5";
begin
   in_buf0 : BUF4_MXILINX_eightleds
      port map (I0=>A(0),      
                I1=>A(1),      
                I2=>A(2),      
                I3=>A(3),      
                O0=>q0,      
                O1=>q1,      
                O2=>q2,      
                O3=>q3);
   
   in_buf1 : BUF4_MXILINX_eightleds
      port map (I0=>A(4),      
                I1=>A(5),      
                I2=>A(6),      
                I3=>A(7),      
                O0=>q4,      
                O1=>q5,      
                O2=>q6,      
                O3=>q7);
   
   in_buf2 : BUF
      port map (I=>Enable,      
                O=>qen);
   
   out_buf0 : OBUFE4_MXILINX_eightleds
      port map (E=>qen,      
                I0=>q0,      
                I1=>q1,      
                I2=>q2,      
                I3=>q3,      
                O0=>Z(0),      
                O1=>Z(1),      
                O2=>Z(2),      
                O3=>Z(3));
   
   out_buf1 : OBUFE4_MXILINX_eightleds
      port map (E=>qen,      
                I0=>q4,      
                I1=>q5,      
                I2=>q6,      
                I3=>q7,      
                O0=>Z(4),      
                O1=>Z(5),      
                O2=>Z(6),      
                O3=>Z(7));
   
end BEHAVIORAL;


