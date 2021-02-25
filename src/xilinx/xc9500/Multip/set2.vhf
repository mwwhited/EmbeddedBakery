--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : set2.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:15
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_set2
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_set2 is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_set2;

architecture BEHAVIORAL of BUFE4_MXILINX_set2 is
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
--  /   /         Filename : set2.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:15
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUF4_MXILINX_set2
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUF4_MXILINX_set2 is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUF4_MXILINX_set2;

architecture BEHAVIORAL of BUF4_MXILINX_set2 is
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
--  /   /         Filename : set2.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:15
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: D2_4E_MXILINX_set2
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity D2_4E_MXILINX_set2 is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          E  : in    std_logic; 
          D0 : out   std_logic; 
          D1 : out   std_logic; 
          D2 : out   std_logic; 
          D3 : out   std_logic);
end D2_4E_MXILINX_set2;

architecture BEHAVIORAL of D2_4E_MXILINX_set2 is
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
--  /   /         Filename : set2.vhf
-- /___/   /\     Timestamp : 10/21/2004 00:01:15
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: set2
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity set2 is
   port ( A  : in    std_logic_vector (0 to 3); 
          B  : in    std_logic_vector (0 to 3); 
          En : in    std_logic; 
          Fn : in    std_logic_vector (0 to 1); 
          Z  : out   std_logic_vector (0 to 7));
end set2;

architecture BEHAVIORAL of set2 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal InBus   : std_logic_vector (0 to 12);
   signal OutBus  : std_logic_vector (0 to 4);
   signal XLXN_61 : std_logic;
   component or_array
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
   
   component nor_array
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
   
   component xnor_array
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
   
   component xor_array
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
   
   component D2_4E_MXILINX_set2
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component BUF4_MXILINX_set2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   component BUFE4_MXILINX_set2
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_5 : label is "XLXI_5_0";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_1";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_2";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_3";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_4";
begin
   XLXI_1 : or_array
      port map (A0=>InBus(0),      
                A1=>InBus(1),      
                A2=>InBus(2),      
                A3=>InBus(3),      
                B0=>InBus(4),      
                B1=>InBus(5),      
                B2=>InBus(6),      
                B3=>InBus(7),      
                En=>InBus(8),      
                Z0=>OutBus(0),      
                Z1=>OutBus(1),      
                Z2=>OutBus(2),      
                Z3=>OutBus(3));
   
   XLXI_2 : nor_array
      port map (A0=>InBus(0),      
                A1=>InBus(1),      
                A2=>InBus(2),      
                A3=>InBus(3),      
                B0=>InBus(4),      
                B1=>InBus(5),      
                B2=>InBus(6),      
                B3=>InBus(7),      
                En=>InBus(9),      
                Z0=>OutBus(0),      
                Z1=>OutBus(1),      
                Z2=>OutBus(2),      
                Z3=>OutBus(3));
   
   XLXI_3 : xnor_array
      port map (A0=>InBus(0),      
                A1=>InBus(1),      
                A2=>InBus(2),      
                A3=>InBus(3),      
                B0=>InBus(4),      
                B1=>InBus(5),      
                B2=>InBus(6),      
                B3=>InBus(7),      
                En=>InBus(10),      
                Z0=>OutBus(0),      
                Z1=>OutBus(1),      
                Z2=>OutBus(2),      
                Z3=>OutBus(3));
   
   XLXI_4 : xor_array
      port map (A0=>InBus(0),      
                A1=>InBus(1),      
                A2=>InBus(2),      
                A3=>InBus(3),      
                B0=>InBus(4),      
                B1=>InBus(5),      
                B2=>InBus(6),      
                B3=>InBus(7),      
                En=>InBus(11),      
                Z0=>OutBus(0),      
                Z1=>OutBus(1),      
                Z2=>OutBus(2),      
                Z3=>OutBus(3));
   
   XLXI_5 : D2_4E_MXILINX_set2
      port map (A0=>Fn(0),      
                A1=>Fn(1),      
                E=>En,      
                D0=>InBus(8),      
                D1=>InBus(9),      
                D2=>InBus(10),      
                D3=>InBus(11));
   
   XLXI_10 : BUF4_MXILINX_set2
      port map (I0=>A(0),      
                I1=>A(1),      
                I2=>A(2),      
                I3=>A(3),      
                O0=>InBus(0),      
                O1=>InBus(1),      
                O2=>InBus(2),      
                O3=>InBus(3));
   
   XLXI_11 : BUF4_MXILINX_set2
      port map (I0=>B(0),      
                I1=>B(1),      
                I2=>B(2),      
                I3=>B(3),      
                O0=>InBus(4),      
                O1=>InBus(5),      
                O2=>InBus(6),      
                O3=>InBus(7));
   
   XLXI_12 : BUFE4_MXILINX_set2
      port map (E=>OutBus(4),      
                I0=>OutBus(0),      
                I1=>OutBus(1),      
                I2=>OutBus(2),      
                I3=>OutBus(3),      
                O0=>Z(0),      
                O1=>Z(1),      
                O2=>Z(2),      
                O3=>Z(3));
   
   XLXI_13 : BUF
      port map (I=>En,      
                O=>InBus(12));
   
   XLXI_14 : BUF
      port map (I=>InBus(12),      
                O=>OutBus(4));
   
   XLXI_15 : BUFE4_MXILINX_set2
      port map (E=>OutBus(4),      
                I0=>XLXN_61,      
                I1=>XLXN_61,      
                I2=>XLXN_61,      
                I3=>XLXN_61,      
                O0=>Z(4),      
                O1=>Z(5),      
                O2=>Z(6),      
                O3=>Z(7));
   
   XLXI_16 : GND
      port map (G=>XLXN_61);
   
end BEHAVIORAL;


