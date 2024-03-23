-- Test I. multiplexeur 4 voies -- Cadeau !
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_test is
end entity;

architecture arch_mux_test of mux_test is
  component MUX is
    port (
      e0: in STD_LOGIC_VECTOR(7 downto 0);
      e1: in STD_LOGIC_VECTOR(7 downto 0);
      e2: in STD_LOGIC_VECTOR(7 downto 0);
      e3: in STD_LOGIC_VECTOR(7 downto 0);
      c0: in STD_LOGIC;
      c1: in STD_LOGIC;
      s0: out STD_LOGIC_VECTOR(7 downto 0)
      );
  end component;
  
  signal e0t, e1t, e2t, e3t, s0t: STD_LOGIC_VECTOR(7 downto 0);
  signal c0t, c1t : STD_LOGIC;
begin

  mu: MUX
    port map (
      e0 => e0t,
      e1 => e1t,
      e2 => e2t,
      e3 => e3t,
      c0 => c0t,
      c1 => c1t,
      s0 => s0t
      );

  process
  begin
    e0t <= "00000001";
    e1t <= "00000010";
    e2t <= "00000100";
    e3t <= "00001000";
    c0t <= '0';
    c1t <= '0';
    wait for 5 ns;
    assert s0t = "00000001";

    c0t <= '1';
    wait for 5 ns;
    assert s0t = "00000010";

    c1t <= '1';
    wait for 5 ns;
    assert s0t = "00001000";

    c0t <= '0';
    wait for 5 ns;
    assert s0t = "00000100";

    wait;
  end process;
end architecture;

---------------------------------------------------------------------------
-- Test II. Additionneur 8 bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add8b_test is
end entity;
-- Architecture du banc de test a developper
architecture arch_add8b_test of add8b_test is
  component add8b is
    port (
      e0: in STD_LOGIC_VECTOR(7 downto 0);
      e1: in STD_LOGIC_VECTOR(7 downto 0);
      s: out STD_LOGIC_VECTOR(7 downto 0)
      );
  end component;
  

  signal e0t, e1t, st: STD_LOGIC_VECTOR(7 downto 0);
begin

  ad: add8b
    port map (
      e0 => e0t,
      e1 => e1t,
      s => st
      );

  process
  begin
    e0t(0) <= '0';
    e1t(0) <= '0';
    wait for 5 ns;
    assert st = "0";

    e0t(0) <= '1';
    e1t(0) <= '0';
    wait for 5 ns;
    assert st = "1";

    e0t(0) <= '0';
    e1t(0) <= '1';
    wait for 5 ns;
    assert st = "1";

    e0t(0) <= '1';
    e1t(0) <= '1';
    wait for 5 ns;
    assert st = "0";

    wait;
  end process;
end architecture;
---------------------------------------------------------------------------
-- Test IV. And 8 bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
      
entity and8b_test is
end entity;
-- Architecture du banc de test a developper
architecture arch_and8b_test of and8b_test is
  component and8b is
    port (
      e0: in STD_LOGIC_VECTOR(7 downto 0);
      e1: in STD_LOGIC_VECTOR(7 downto 0);
      s: out STD_LOGIC_VECTOR(7 downto 0)
      );
  end component;
  
  signal e0t, e1t, st: STD_LOGIC_VECTOR(7 downto 0);
begin

  an: and8b
    port map (
      e0 => e0t,
      e1 => e1t,
      s => st
      );

  process
  begin
    e0t(0) <= '0';
    e1t(0) <= '0';
    wait for 5 ns;
    assert st = "0";

    e0t(0) <= '1';
    e1t(0) <= '0';
    wait for 5 ns;
    assert st = "0";

    e0t(0) <= '0';
    e1t(0) <= '1';
    wait for 5 ns;
    assert st = "0";

    e0t(0) <= '1';
    e1t(0) <= '1';
    wait for 5 ns;
    assert st = "1";

    wait;
  end process;
end architecture;
---------------------------------------------------------------------------
