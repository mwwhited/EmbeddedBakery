--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : eightbits.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_eightbits
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_eightbits is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_eightbits;

architecture BEHAVIORAL of BUFE4_MXILINX_eightbits is
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
--  /   /         Filename : eightbits.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: IBUF4_MXILINX_eightbits
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity IBUF4_MXILINX_eightbits is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end IBUF4_MXILINX_eightbits;

architecture BEHAVIORAL of IBUF4_MXILINX_eightbits is
   attribute BOX_TYPE   : string ;
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
begin
   I_36_37 : IBUF
      port map (I=>I3,      
                O=>O3);
   
   I_36_38 : IBUF
      port map (I=>I2,      
                O=>O2);
   
   I_36_39 : IBUF
      port map (I=>I1,      
                O=>O1);
   
   I_36_40 : IBUF
      port map (I=>I0,      
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
--  /   /         Filename : eightbits.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: eightbits
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity eightbits is
   port ( A  : in    std_logic_vector (0 to 7); 
          En : in    std_logic; 
          Z  : out   std_logic_vector (0 to 7));
end eightbits;

architecture BEHAVIORAL of eightbits is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal qen : std_logic;
   signal q0  : std_logic;
   signal q1  : std_logic;
   signal q2  : std_logic;
   signal q3  : std_logic;
   signal q4  : std_logic;
   signal q5  : std_logic;
   signal q6  : std_logic;
   signal q7  : std_logic;
   component IBUF4_MXILINX_eightbits
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
   
   component BUFE4_MXILINX_eightbits
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
   
   attribute HU_SET of in_buf0 : label is "in_buf0_0";
   attribute HU_SET of in_buf1 : label is "in_buf1_1";
   attribute HU_SET of out_buf0 : label is "out_buf0_3";
   attribute HU_SET of out_buf1 : label is "out_buf1_2";
begin
   in_buf0 : IBUF4_MXILINX_eightbits
      port map (I0=>A(0),      
                I1=>A(1),      
                I2=>A(2),      
                I3=>A(3),      
                O0=>q0,      
                O1=>q1,      
                O2=>q2,      
                O3=>q3);
   
   in_buf1 : IBUF4_MXILINX_eightbits
      port map (I0=>A(4),      
                I1=>A(5),      
                I2=>A(6),      
                I3=>A(7),      
                O0=>q4,      
                O1=>q5,      
                O2=>q6,      
                O3=>q7);
   
   in_buf2 : BUF
      port map (I=>En,      
                O=>qen);
   
   out_buf0 : BUFE4_MXILINX_eightbits
      port map (E=>qen,      
                I0=>q0,      
                I1=>q1,      
                I2=>q2,      
                I3=>q3,      
                O0=>Z(0),      
                O1=>Z(1),      
                O2=>Z(2),      
                O3=>Z(3));
   
   out_buf1 : BUFE4_MXILINX_eightbits
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


