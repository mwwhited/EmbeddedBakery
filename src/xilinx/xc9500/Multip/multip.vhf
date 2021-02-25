--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : multip.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:02:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE8_MXILINX_multip
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE8_MXILINX_multip is
   port ( E : in    std_logic; 
          I : in    std_logic_vector (7 downto 0); 
          O : out   std_logic_vector (7 downto 0));
end BUFE8_MXILINX_multip;

architecture BEHAVIORAL of BUFE8_MXILINX_multip is
   attribute BOX_TYPE   : string ;
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
begin
   I_36_30 : BUFE
      port map (E=>E,      
                I=>I(0),      
                O=>O(0));
   
   I_36_31 : BUFE
      port map (E=>E,      
                I=>I(1),      
                O=>O(1));
   
   I_36_32 : BUFE
      port map (E=>E,      
                I=>I(2),      
                O=>O(2));
   
   I_36_33 : BUFE
      port map (E=>E,      
                I=>I(3),      
                O=>O(3));
   
   I_36_34 : BUFE
      port map (E=>E,      
                I=>I(7),      
                O=>O(7));
   
   I_36_35 : BUFE
      port map (E=>E,      
                I=>I(6),      
                O=>O(6));
   
   I_36_36 : BUFE
      port map (E=>E,      
                I=>I(5),      
                O=>O(5));
   
   I_36_37 : BUFE
      port map (E=>E,      
                I=>I(4),      
                O=>O(4));
   
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
--  /   /         Filename : multip.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:02:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: multip
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity multip is
   port ( A  : in    std_logic_vector (0 to 3); 
          B  : in    std_logic_vector (0 to 3); 
          En : in    std_logic; 
          Z  : out   std_logic_vector (0 to 7));
end multip;

architecture BEHAVIORAL of multip is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal aout1 : std_logic_vector (0 to 4);
   signal aout2 : std_logic_vector (0 to 4);
   signal Q     : std_logic_vector (0 to 7);
   signal R0    : std_logic_vector (0 to 4);
   signal R1    : std_logic_vector (0 to 3);
   signal R2    : std_logic_vector (0 to 3);
   signal R3    : std_logic_vector (0 to 3);
   component and_row
      port ( A : in    std_logic_vector (0 to 3); 
             B : in    std_logic; 
             Z : out   std_logic_vector (0 to 3));
   end component;
   
   component e_adder
      port ( A : in    std_logic_vector (0 to 4); 
             B : in    std_logic_vector (0 to 3); 
             Y : out   std_logic; 
             Z : out   std_logic_vector (0 to 4));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUFE8_MXILINX_multip
      port ( E : in    std_logic; 
             I : in    std_logic_vector (7 downto 0); 
             O : out   std_logic_vector (7 downto 0));
   end component;
   
   attribute HU_SET of obufz : label is "obufz_0";
begin
   ar1 : and_row
      port map (A(0 to 3)=>A(0 to 3),      
                B=>B(0),      
                Z(0 to 3)=>R0(0 to 3));
   
   ar2 : and_row
      port map (A(0 to 3)=>A(0 to 3),      
                B=>B(1),      
                Z(0 to 3)=>R1(0 to 3));
   
   ar3 : and_row
      port map (A(0 to 3)=>A(0 to 3),      
                B=>B(2),      
                Z(0 to 3)=>R2(0 to 3));
   
   ar4 : and_row
      port map (A(0 to 3)=>A(0 to 3),      
                B=>B(3),      
                Z(0 to 3)=>R3(0 to 3));
   
   ea1 : e_adder
      port map (A(0 to 4)=>R0(0 to 4),      
                B(0 to 3)=>R1(0 to 3),      
                Y=>Q(0),      
                Z(0 to 4)=>aout1(0 to 4));
   
   ea2 : e_adder
      port map (A(0 to 4)=>aout1(0 to 4),      
                B(0 to 3)=>R2(0 to 3),      
                Y=>Q(1),      
                Z(0 to 4)=>aout2(0 to 4));
   
   ea3 : e_adder
      port map (A(0 to 4)=>aout2(0 to 4),      
                B(0 to 3)=>R3(0 to 3),      
                Y=>Q(2),      
                Z(0 to 4)=>Q(3 to 7));
   
   holdlow : GND
      port map (G=>R0(4));
   
   obufz : BUFE8_MXILINX_multip
      port map (E=>En,      
                I(7 downto 0)=>Q(0 to 7),      
                O(7 downto 0)=>Z(0 to 7));
   
end BEHAVIORAL;


