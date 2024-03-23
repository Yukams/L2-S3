-- Architecture 2. Sujet de TP 2 (seances 3 et 4).
-- Implementation d'un banc de registres
-- Author: T. Carle (thomas.carle@irit.fr)

-- I. Decodeur 3 -> 8
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodeur3_8 is
  port (
    e: in STD_LOGIC_VECTOR(2 downto 0);
    s: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

--Architecture a completer
architecture arch_dec3_8 of decodeur3_8 is
begin
    s(0) <= not e(2) and not e(1) and not e(0);
    s(1) <= not e(2) and not e(1) and e(0);
    s(2) <= not e(2) and e(1) and not e(0);
    s(3) <= not e(2) and e(1) and e(0);
    s(4) <= e(2) and not e(1) and not e(0);
    s(5) <= e(2) and not e(1) and e(0);
    s(6) <= e(2) and e(1) and not e(0);
    s(7) <= e(2) and e(1) and e(0);
end;
-------------------------------------------------------------------

-- II. Registre 8 bits lecture/ecriture paralleles
--II.1. Bascule D
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bascule_D is
  port (
    e: in STD_LOGIC;
    clock: in STD_LOGIC;
    reset: in STD_LOGIC;
    set: in STD_LOGIC;
    s1: out STD_LOGIC
    );
end entity;

architecture arch_bascule_D of bascule_D is
begin
  process(clock, reset, set)
  begin
    if reset = '0' then
      s1 <= '0';
    elsif set = '0' then
      s1 <= '1';
    elsif rising_edge(clock) then
      s1 <= e;
    end if;
  end process;
end architecture;

--II.2. Multiplexeur 2->1
--entite et architecture a developper
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux2_1 is
    port (
    e0: in STD_LOGIC;
    e1: in STD_LOGIC;
    c: in STD_LOGIC;
    s0: out STD_LOGIC
    );
end entity;

architecture arch_mux2_1 of mux2_1 is
begin
    s0 <= e0 when c='0' else
    e1 when c='1';
end;

-- II.3. Registre 8 bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity r8bits is
  port(
    R_in: in STD_LOGIC_VECTOR(7 downto 0);
    WR: in STD_LOGIC;
    rst: in STD_LOGIC;
    clk: in STD_LOGIC;
    R_out: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

--architecture a developper
architecture arch_r8bits of r8bits is
component mux2_1 is
    port (
    e0: in STD_LOGIC;
    e1: in STD_LOGIC;
    c: in STD_LOGIC;
    s0: out STD_LOGIC
    );
end component;

signal e0, e1, c, s0 : STD_LOGIC_VECTOR(7 downto 0);

component bascule_D is
  port (
    e: in STD_LOGIC;
    clock: in STD_LOGIC;
    reset: in STD_LOGIC;
    set: in STD_LOGIC;
    s1: out STD_LOGIC
    );
end component;

signal sigmux, sigbas : STD_LOGIC_VECTOR(7 downto 0);

begin
GEN: FOR i IN 0 TO 7 GENERATE 
	
        mux: mux2_1
	  port map(
	e0 => sigbas(i), e1 => R_in(i), c => WR, s0 => sigmux(i));
	
	bascule: bascule_D
	  port map(
	e => sigmux(i), clock => clk, reset => rst, set => rst, s1 => sigbas(i)
	);
END GENERATE GEN;
	R_out <= sigbas;
end architecture;
-------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--III. Porte 3 etats
entity p3e is
  port(
    a: in STD_LOGIC_VECTOR(7 downto 0);
    b: in STD_lOGIC;
    c: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

--architecture a developper
architecture arch_p3e of p3e is
begin
    c <= "ZZZZZZZZ" when b='0' else
    a when b='1';
end architecture;
-------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--III. Porte AND
entity and1b is
  port(
    ent0: in STD_LOGIC;
    ent1: in STD_lOGIC;
    sort: out STD_LOGIC
    );
end entity;

--architecture a developper
architecture arch_and1b of and1b is
begin
	sort <= ent0 and ent1;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--IV. Banc de 8 registres 8 bits
entity banc is
  port(
    reg_0_id: in STD_LOGIC_VECTOR(2 downto 0);
    reg_1_id: in STD_LOGIC_VECTOR(2 downto 0);
    reg_write_val: in STD_LOGIC_VECTOR(7 downto 0);
    WR: in STD_LOGIC;
    clk: in STD_LOGIC;
    rst: in STD_LOGIC;
    reg_0_val: out STD_LOGIC_VECTOR(7 downto 0);
    reg_1_val: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

--architecture a developper
architecture arch_banc of banc is
  component p3e is
  port(
    a: in STD_LOGIC_VECTOR(7 downto 0);
    b: in STD_lOGIC;
    c: out STD_LOGIC_VECTOR(7 downto 0)
    );
  end component;

  component and1b is
  port(
    ent0: in STD_LOGIC;
    ent1: in STD_lOGIC;
    sort: out STD_LOGIC
    );
end component;

  component decodeur3_8 is
  port (
    e: in STD_LOGIC_VECTOR(2 downto 0);
    s: out STD_LOGIC_VECTOR(7 downto 0)
    );
  end component;

  component r8bits is
  port(
    R_in: in STD_LOGIC_VECTOR(7 downto 0);
    WR: in STD_LOGIC;
    rst: in STD_LOGIC;
    clk: in STD_LOGIC;
    R_out: out STD_LOGIC_VECTOR(7 downto 0)
    );
  end component;

signal sig0, sig1, s_and, sr8bits, sp3e0, sp3e1: STD_LOGIC_VECTOR(7 downto 0); 

begin
	dec0 : decodeur3_8
		port map(e(0) => reg_0_id(0), e(1) => reg_0_id(2), e(2) => reg_0_id(2), s(0) => sig0(0), 
s(1) => sig0(1), s(2) => sig0(2), s(3) => sig0(3), s(4) => sig0(4), s(5) => sig0(5), s(6) => sig0(6), s(7) => sig0(7));
	
	dec1 : decodeur3_8
		port map(e(0) => reg_1_id(0), e(1) => reg_1_id(2), e(2) => reg_1_id(2), s(0) => sig1(0), 
s(1) => sig1(1), s(2) => sig1(2), s(3) => sig1(3), s(4) => sig1(4), s(5) => sig1(5), s(6) => sig1(6), s(7) => sig1(7));

	

GEN: FOR i IN 0 TO 7 GENERATE 

	
	p_and : and1b
		port map(ent0 => sig0(i), ent1 => WR, sort => s_and(i));

	r_8b : r8bits
		port map(R_in => reg_write_val, WR => s_and(i), rst => rst, clk => clk, R_out => sr8bits);
        
	p3e0 : p3e
		port map(a => sr8bits, b => sig0(i), c => reg_0_val);

	p3e1 : p3e
		port map(a => sr8bits, b => sig1(i), c => reg_1_val);


END GENERATE GEN;
end architecture;
