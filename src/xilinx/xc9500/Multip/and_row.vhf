--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : and_row.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:01:00
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: and_row
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity and_row is
   port ( A : in    std_logic_vector (0 to 3); 
          B : in    std_logic; 
          Z : out   std_logic_vector (0 to 3));
end and_row;

architecture BEHAVIORAL of and_row is
   attribute BOX_TYPE   : string ;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   and_1 : AND2
      port map (I0=>B,      
                I1=>A(0),      
                O=>Z(0));
   
   and_2 : AND2
      port map (I0=>B,      
                I1=>A(1),      
                O=>Z(1));
   
   and_3 : AND2
      port map (I0=>B,      
                I1=>A(2),      
                O=>Z(2));
   
   and_4 : AND2
      port map (I0=>B,      
                I1=>A(3),      
                O=>Z(3));
   
end BEHAVIORAL;


