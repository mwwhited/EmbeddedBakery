--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : hex27seg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUF4_MXILINX_hex27seg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUF4_MXILINX_hex27seg is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUF4_MXILINX_hex27seg;

architecture BEHAVIORAL of BUF4_MXILINX_hex27seg is
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
--  /   /         Filename : hex27seg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_hex27seg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_hex27seg is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_hex27seg;

architecture BEHAVIORAL of BUFE4_MXILINX_hex27seg is
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
--  /   /         Filename : hex27seg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: OR6_MXILINX_hex27seg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity OR6_MXILINX_hex27seg is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          I4 : in    std_logic; 
          I5 : in    std_logic; 
          O  : out   std_logic);
end OR6_MXILINX_hex27seg;

architecture BEHAVIORAL of OR6_MXILINX_hex27seg is
   attribute BOX_TYPE   : string ;
   signal I35 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
begin
   I_36_87 : OR4
      port map (I0=>I0,      
                I1=>I1,      
                I2=>I2,      
                I3=>I35,      
                O=>O);
   
   I_36_88 : OR3
      port map (I0=>I3,      
                I1=>I4,      
                I2=>I5,      
                O=>I35);
   
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
--  /   /         Filename : hex27seg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: D4_16E_MXILINX_hex27seg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity D4_16E_MXILINX_hex27seg is
   port ( A0  : in    std_logic; 
          A1  : in    std_logic; 
          A2  : in    std_logic; 
          A3  : in    std_logic; 
          E   : in    std_logic; 
          D0  : out   std_logic; 
          D1  : out   std_logic; 
          D2  : out   std_logic; 
          D3  : out   std_logic; 
          D4  : out   std_logic; 
          D5  : out   std_logic; 
          D6  : out   std_logic; 
          D7  : out   std_logic; 
          D8  : out   std_logic; 
          D9  : out   std_logic; 
          D10 : out   std_logic; 
          D11 : out   std_logic; 
          D12 : out   std_logic; 
          D13 : out   std_logic; 
          D14 : out   std_logic; 
          D15 : out   std_logic);
end D4_16E_MXILINX_hex27seg;

architecture BEHAVIORAL of D4_16E_MXILINX_hex27seg is
   attribute BOX_TYPE   : string ;
   component AND5B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B3 : component is "BLACK_BOX";
   
   component AND5B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B2 : component is "BLACK_BOX";
   
   component AND5B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B1 : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component AND5B4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B4 : component is "BLACK_BOX";
   
begin
   I_36_53 : AND5B3
      port map (I0=>A0,      
                I1=>A1,      
                I2=>A2,      
                I3=>A3,      
                I4=>E,      
                O=>D8);
   
   I_36_54 : AND5B2
      port map (I0=>A1,      
                I1=>A2,      
                I2=>E,      
                I3=>A3,      
                I4=>A0,      
                O=>D9);
   
   I_36_55 : AND5B2
      port map (I0=>A0,      
                I1=>A2,      
                I2=>E,      
                I3=>A3,      
                I4=>A1,      
                O=>D10);
   
   I_36_56 : AND5B1
      port map (I0=>A2,      
                I1=>A0,      
                I2=>A1,      
                I3=>A3,      
                I4=>E,      
                O=>D11);
   
   I_36_57 : AND5B2
      port map (I0=>A0,      
                I1=>A1,      
                I2=>E,      
                I3=>A3,      
                I4=>A2,      
                O=>D12);
   
   I_36_58 : AND5B1
      port map (I0=>A1,      
                I1=>A0,      
                I2=>A2,      
                I3=>A3,      
                I4=>E,      
                O=>D13);
   
   I_36_59 : AND5B1
      port map (I0=>A0,      
                I1=>A1,      
                I2=>A2,      
                I3=>A3,      
                I4=>E,      
                O=>D14);
   
   I_36_60 : AND5
      port map (I0=>A3,      
                I1=>A2,      
                I2=>A1,      
                I3=>A0,      
                I4=>E,      
                O=>D15);
   
   I_36_61 : AND5B2
      port map (I0=>A3,      
                I1=>A0,      
                I2=>E,      
                I3=>A2,      
                I4=>A1,      
                O=>D6);
   
   I_36_62 : AND5B1
      port map (I0=>A3,      
                I1=>A2,      
                I2=>A1,      
                I3=>A0,      
                I4=>E,      
                O=>D7);
   
   I_36_63 : AND5B2
      port map (I0=>A3,      
                I1=>A1,      
                I2=>E,      
                I3=>A2,      
                I4=>A0,      
                O=>D5);
   
   I_36_64 : AND5B3
      port map (I0=>A0,      
                I1=>A1,      
                I2=>A3,      
                I3=>A2,      
                I4=>E,      
                O=>D4);
   
   I_36_65 : AND5B2
      port map (I0=>A2,      
                I1=>A3,      
                I2=>E,      
                I3=>A0,      
                I4=>A1,      
                O=>D3);
   
   I_36_66 : AND5B3
      port map (I0=>A0,      
                I1=>A3,      
                I2=>A2,      
                I3=>A1,      
                I4=>E,      
                O=>D2);
   
   I_36_67 : AND5B3
      port map (I0=>A1,      
                I1=>A2,      
                I2=>A3,      
                I3=>A0,      
                I4=>E,      
                O=>D1);
   
   I_36_68 : AND5B4
      port map (I0=>A3,      
                I1=>A2,      
                I2=>A1,      
                I3=>A0,      
                I4=>E,      
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
--  /   /         Filename : hex27seg.vhf
-- /___/   /\     Timestamp : 10/21/2004 23:01:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: hex27seg
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity hex27seg is
   port ( A   : in    std_logic_vector (0 to 3); 
          Adp : in    std_logic; 
          En  : in    std_logic; 
          Z   : out   std_logic_vector (0 to 7));
end hex27seg;

architecture BEHAVIORAL of hex27seg is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_24  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_26  : std_logic;
   signal XLXN_27  : std_logic;
   signal XLXN_40  : std_logic;
   signal XLXN_41  : std_logic;
   signal XLXN_42  : std_logic;
   signal XLXN_43  : std_logic;
   signal XLXN_44  : std_logic;
   signal XLXN_45  : std_logic;
   signal XLXN_47  : std_logic;
   signal XLXN_48  : std_logic;
   signal XLXN_49  : std_logic;
   signal XLXN_52  : std_logic;
   signal XLXN_53  : std_logic;
   signal XLXN_55  : std_logic;
   signal XLXN_56  : std_logic;
   signal XLXN_59  : std_logic;
   signal XLXN_68  : std_logic;
   signal XLXN_74  : std_logic;
   signal XLXN_104 : std_logic;
   signal XLXN_105 : std_logic;
   signal XLXN_106 : std_logic;
   signal XLXN_107 : std_logic;
   signal XLXN_108 : std_logic;
   signal XLXN_109 : std_logic;
   signal XLXN_110 : std_logic;
   signal XLXN_111 : std_logic;
   signal XLXN_112 : std_logic;
   signal XLXN_113 : std_logic;
   signal XLXN_114 : std_logic;
   signal XLXN_115 : std_logic;
   signal XLXN_116 : std_logic;
   signal XLXN_117 : std_logic;
   signal XLXN_134 : std_logic;
   component D4_16E_MXILINX_hex27seg
      port ( A0  : in    std_logic; 
             A1  : in    std_logic; 
             A2  : in    std_logic; 
             A3  : in    std_logic; 
             E   : in    std_logic; 
             D0  : out   std_logic; 
             D1  : out   std_logic; 
             D10 : out   std_logic; 
             D11 : out   std_logic; 
             D12 : out   std_logic; 
             D13 : out   std_logic; 
             D14 : out   std_logic; 
             D15 : out   std_logic; 
             D2  : out   std_logic; 
             D3  : out   std_logic; 
             D4  : out   std_logic; 
             D5  : out   std_logic; 
             D6  : out   std_logic; 
             D7  : out   std_logic; 
             D8  : out   std_logic; 
             D9  : out   std_logic);
   end component;
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component OR6_MXILINX_hex27seg
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component BUFE4_MXILINX_hex27seg
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
   
   component BUF4_MXILINX_hex27seg
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
   
   attribute HU_SET of XLXI_14 : label is "XLXI_14_0";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_1";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_2";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_3";
   attribute HU_SET of XLXI_41 : label is "XLXI_41_4";
   attribute HU_SET of XLXI_42 : label is "XLXI_42_5";
   attribute HU_SET of XLXI_43 : label is "XLXI_43_6";
begin
   XLXI_14 : D4_16E_MXILINX_hex27seg
      port map (A0=>XLXN_24,      
                A1=>XLXN_25,      
                A2=>XLXN_26,      
                A3=>XLXN_27,      
                E=>XLXN_134,      
                D0=>XLXN_68,      
                D1=>XLXN_40,      
                D2=>XLXN_49,      
                D3=>XLXN_59,      
                D4=>XLXN_41,      
                D5=>XLXN_44,      
                D6=>XLXN_45,      
                D7=>XLXN_52,      
                D8=>open,      
                D9=>XLXN_53,      
                D10=>XLXN_56,      
                D11=>XLXN_42,      
                D12=>XLXN_55,      
                D13=>XLXN_43,      
                D14=>XLXN_47,      
                D15=>XLXN_48);
   
   XLXI_16 : OR4
      port map (I0=>XLXN_43,      
                I1=>XLXN_42,      
                I2=>XLXN_41,      
                I3=>XLXN_40,      
                O=>XLXN_104);
   
   XLXI_17 : OR6_MXILINX_hex27seg
      port map (I0=>XLXN_48,      
                I1=>XLXN_47,      
                I2=>XLXN_55,      
                I3=>XLXN_42,      
                I4=>XLXN_45,      
                I5=>XLXN_44,      
                O=>XLXN_105);
   
   XLXI_18 : OR4
      port map (I0=>XLXN_48,      
                I1=>XLXN_47,      
                I2=>XLXN_55,      
                I3=>XLXN_49,      
                O=>XLXN_106);
   
   XLXI_19 : OR6_MXILINX_hex27seg
      port map (I0=>XLXN_48,      
                I1=>XLXN_56,      
                I2=>XLXN_53,      
                I3=>XLXN_52,      
                I4=>XLXN_41,      
                I5=>XLXN_40,      
                O=>XLXN_107);
   
   XLXI_20 : OR6_MXILINX_hex27seg
      port map (I0=>XLXN_53,      
                I1=>XLXN_52,      
                I2=>XLXN_44,      
                I3=>XLXN_41,      
                I4=>XLXN_59,      
                I5=>XLXN_40,      
                O=>XLXN_108);
   
   XLXI_21 : OR4
      port map (I0=>XLXN_43,      
                I1=>XLXN_59,      
                I2=>XLXN_49,      
                I3=>XLXN_40,      
                O=>XLXN_109);
   
   XLXI_22 : OR4
      port map (I0=>XLXN_55,      
                I1=>XLXN_52,      
                I2=>XLXN_40,      
                I3=>XLXN_68,      
                O=>XLXN_110);
   
   XLXI_32 : INV
      port map (I=>XLXN_104,      
                O=>XLXN_117);
   
   XLXI_33 : INV
      port map (I=>XLXN_105,      
                O=>XLXN_116);
   
   XLXI_34 : INV
      port map (I=>XLXN_106,      
                O=>XLXN_115);
   
   XLXI_35 : INV
      port map (I=>XLXN_107,      
                O=>XLXN_114);
   
   XLXI_36 : INV
      port map (I=>XLXN_108,      
                O=>XLXN_113);
   
   XLXI_37 : INV
      port map (I=>XLXN_109,      
                O=>XLXN_112);
   
   XLXI_38 : INV
      port map (I=>XLXN_110,      
                O=>XLXN_111);
   
   XLXI_41 : BUFE4_MXILINX_hex27seg
      port map (E=>XLXN_134,      
                I0=>XLXN_113,      
                I1=>XLXN_112,      
                I2=>XLXN_111,      
                I3=>XLXN_74,      
                O0=>Z(4),      
                O1=>Z(5),      
                O2=>Z(6),      
                O3=>Z(7));
   
   XLXI_42 : BUFE4_MXILINX_hex27seg
      port map (E=>XLXN_134,      
                I0=>XLXN_117,      
                I1=>XLXN_116,      
                I2=>XLXN_115,      
                I3=>XLXN_114,      
                O0=>Z(0),      
                O1=>Z(1),      
                O2=>Z(2),      
                O3=>Z(3));
   
   XLXI_43 : BUF4_MXILINX_hex27seg
      port map (I0=>A(0),      
                I1=>A(1),      
                I2=>A(2),      
                I3=>A(3),      
                O0=>XLXN_24,      
                O1=>XLXN_25,      
                O2=>XLXN_26,      
                O3=>XLXN_27);
   
   XLXI_44 : BUF
      port map (I=>En,      
                O=>XLXN_134);
   
   XLXI_45 : BUF
      port map (I=>Adp,      
                O=>XLXN_74);
   
end BEHAVIORAL;


