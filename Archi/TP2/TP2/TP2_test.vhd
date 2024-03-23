--I. Decodeur
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodeur3_8_test is
end entity;

--architecture a developper
architecture arch_decodeur3_8_test of decodeur3_8_test is 
	component decodeur3_8 is
  		port (
    			e: in STD_LOGIC_VECTOR(2 downto 0);
    			s: out STD_LOGIC_VECTOR(7 downto 0)
    			);
	end component;
	
	signal et: STD_LOGIC_VECTOR(2 downto 0);
	signal st: STD_LOGIC_VECTOR(7 downto 0);

begin 
	dec3_8 : decodeur3_8
		port map(
			e => et,
			s => st
			);
	process
	begin
		et <= "101";
		wait for 5 ns;
		assert st = "00100000";

		et <= "010";
		wait for 5 ns;
		assert st = "00000100";

		wait;
	end process;
end architecture;		
------------------------------------------------------------
--II. Registre 8 bits 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity r8bits_test is
end entity;

--architecture a developper
architecture arch_r8bits_test of r8bits_test is
	component r8bits is
  		port(
    			R_in: in STD_LOGIC_VECTOR(7 downto 0);
    			WR: in STD_LOGIC;
    			rst: in STD_LOGIC;
    			clk: in STD_LOGIC;
    			R_out: out STD_LOGIC_VECTOR(7 downto 0)
    			);
  	end component;
	
	signal R_outt, R_int : STD_LOGIC_VECTOR(7 downto 0);
	signal WRt, rstt, clkt : STD_LOGIC;
begin
	r_8b : r8bits
		port map(
			R_in => R_int,
			WR => WRt,
			rst => rstt,
			clk => clkt,
			R_out => R_outt
			);
	
	process
	begin
		R_int <= "00001111";
		WRt <= '1';
		rstt <= '1';
		clkt <= '0';

		wait for 1 ns;

		clkt <= '1';
		wait for 5 ns;
		assert R_outt = "00001111";

		wait for 1 ns;

		R_int <= "10101010";
		clkt <= '0';
		wait for 5 ns;
		assert R_outt = "00001111";

		wait for 1 ns;

		clkt <= '1';
		wait for 5 ns;
		assert R_outt = "10101010";

		wait;
	end process;
end architecture;
------------------------------------------------------------
--III. Porte 3 etats
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p3e_test is
end entity;

--architecture a developper
architecture arch_p3e_test of p3e_test is
	component p3e is
		port ( 
			a: in STD_LOGIC_VECTOR(7 downto 0);
    			b: in STD_lOGIC;
    			c: out STD_LOGIC_VECTOR(7 downto 0)
    			);
	end component;
	
	signal at, ct: STD_LOGIC_VECTOR(7 downto 0);
	signal bt: STD_LOGIC;
	

begin
	p_3e : p3e
		port map (
			a => at,
			b => bt,
			c => ct
			);
	process
	begin
		at <= "00010000";
		bt <= '0';
		wait for 5 ns;
		assert ct = "ZZZZZZZZ";

		at <= "00000100";
		bt <= '1';
		wait for 5 ns;
		assert ct = "00000100";
		

		wait;
	end process;
end architecture;
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and1b_test is
end entity;

architecture arch_and1b_test of and1b_test is
	component and1b is
		port ( 
			ent0: in STD_LOGIC;
    			ent1: in STD_lOGIC;
    			sort: out STD_LOGIC
    			);
	end component;

	signal ent0t, ent1t, sortt: STD_LOGIC;
begin
	p_and1b : and1b
		port map (
			ent0 => ent0t,
			ent1 => ent1t,
			sort => sortt
			);
	process
	begin
		ent0t <= '0';
		ent1t <= '0';
		wait for 5 ns;
		assert sortt = '0';

		ent0t <= '0';
		ent1t <= '1';
		wait for 5 ns;
		assert sortt = '0';

		ent0t <= '1';
		ent1t <= '1';
		wait for 5 ns;
		assert sortt = '1';

		wait;
	end process;
end architecture;
------------------------------------------------------------
--IV. Banc de registres
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity banc_test is
end banc_test;

--architecture a developper
