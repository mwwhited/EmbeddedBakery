--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : momentsw.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:43
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: momentsw
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity momentsw is
   port ( A1     : in    std_logic; 
          Enable : in    std_logic; 
          Z1     : out   std_logic);
   attribute LOC : string ;
   attribute LOC of A1 : signal is "p10";
end momentsw;

architecture BEHAVIORAL of momentsw is
   attribute BOX_TYPE   : string ;
   signal XLXN_2 : std_logic;
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
begin
   XLXI_2 : IBUF
      port map (I=>A1,      
                O=>XLXN_2);
   
   XLXI_3 : BUFE
      port map (E=>Enable,      
                I=>XLXN_2,      
                O=>Z1);
   
end BEHAVIORAL;


