-- Architecture 2. Sujet de TP 3 (seances 5 et 6).
-- Implementation d'un processeur simplifié -- banc de test
-- Author: T. Carle (thomas.carle@irit.fr)

-- I. Processeur v0
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity proc_v0_test is
end entity;

architecture arch_proc_v0_test of proc_v0_test is
  component proc_v0 is
  port (
    op: in STD_LOGIC_VECTOR(1 downto 0);
    reg_0_id: in STD_LOGIC_VECTOR(2 downto 0);
    reg_1_id: in STD_LOGIC_VECTOR(2 downto 0);
    rst: in STD_LOGIC;
    clk: in STD_LOGIC;
    WR_bank: in STD_LOGIC
    );
  end component;

  signal op : STD_LOGIC_VECTOR(1 downto 0);
  signal reg_0_id, reg_1_id: STD_LOGIC_VECTOR(2 downto 0);
  signal rst, clk, WR_bank: STD_LOGIC;

begin
  proc: proc_v0
    port map(op, reg_0_id, reg_1_id, rst, clk, WR_bank);

  process
  begin
    -- Initialize all registers to 0
    rst <= '0';
    clk <= '0';
      reg_0_id <= "000";
    reg_1_id <= "000";
    WR_bank <= '0';
    wait for 5 ns;
    rst <= '1';
    wait for 5 ns;

    --MOV R0, #4
    op <= "11";
    reg_0_id <= "000";
    reg_1_id <= "100";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '1';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '0';

    -- MOV R2, #3
    reg_0_id <= "010";
    reg_1_id <= "011";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '1';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '0';

    -- ADD R0, R0, R2
    op <= "00";
    reg_0_id <= "000";
    reg_1_id <= "010";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '1';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '0';

    -- MOV R7, #7
    op <= "11";
    reg_0_id <= "111";
    reg_1_id <= "111";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '1';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '0';
    
    --SUB R0, R0, R7
    op <= "01";
    reg_0_id <= "000";
    reg_1_id <= "111";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '1';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    WR_bank <= '0';
    wait for 5 ns;
    wait;
  end process;
end architecture;
--------------------------------------------------------------------------------------

--II. Processeur v1
-- Exemple de programmation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity proc_v1_test is
end entity;

architecture arch_proc_v1_test of proc_v1_test is
  component proc_v1 is
  port (
    instr: in STD_LOGIC_VECTOR(7 downto 0);
    Init: in STD_LOGIC;
    rst: in STD_LOGIC;
    clk: in STD_LOGIC
    );
  end component;

  signal instr : STD_LOGIC_VECTOR(7 downto 0);
  signal rst, clk, Init: STD_LOGIC;

begin
  proc: proc_v1
    port map(instr, Init, rst, clk);

  process
  begin
    -- Initialize all registers to 0
    rst <= '0';
    clk <= '0';
    Init <= '0';
    wait for 5 ns;
    rst <= '1';
    Init <= '1';

    --MOV R0, #4
    instr <= "11000100";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';

    --MOV R2, #3
    instr <= "11010011";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';

    --ADD R0, R0, R2
    instr <= "00000010";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';

    --MOV R7, #7
    instr <= "11111111";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';

    --SUB R0, R0, R7
    instr <= "01000111";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';


    --AND R7, R7, R2
    instr <= "10111010";
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';

    wait;
  end process;
end architecture;


--3+2
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calcul_1 is
end entity;

-- Architecture a developper

