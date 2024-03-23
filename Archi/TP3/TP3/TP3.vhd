-- Architecture 2. Sujet de TP 3 (seances 5 et 6).
-- Implementation d'un processeur simplifié
-- Author: T. Carle (thomas.carle@irit.fr)

-- I. Assemblage de l'ALU et du banc de registres
-- I.0. MUX 2 -> 1 8 bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_1_8 is
  port (
    e0: in STD_LOGIC_VECTOR(7 downto 0);
    e1: in STD_LOGIC_VECTOR(7 downto 0);
    c: in STD_LOGIC;
    o: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture arch_MUX2_1_8 of MUX2_1_8 is
begin
  o <= e1 when c = '1'
       else e0;
end architecture;
-------------------------------------------------------------------

-- I.1. processeur
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity proc_v0 is
  port (
    op: in STD_LOGIC_VECTOR(1 downto 0);
    reg_0_id: in STD_LOGIC_VECTOR(2 downto 0);
    reg_1_id: in STD_LOGIC_VECTOR(2 downto 0);
    rst: in STD_LOGIC;
    clk: in STD_LOGIC;
    WR_bank: in STD_LOGIC
    );
end entity;

--Architecture a completer
architecture arch_proc_v0 of proc_v0 is
	component MUX2_1_8 is
		port(
		e0: in STD_LOGIC_VECTOR(7 downto 0);
   		e1: in STD_LOGIC_VECTOR(7 downto 0);
    	c: in STD_LOGIC;
    	o: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	
	signal mux_to_alu: std_logic_vector(7 downto 0);
		
	component banc is
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
	end component;
	
	signal bank_to_mux, bank_to_alu: std_logic_vector(7 downto 0);
	
	component ALU is
	  port (
		R_e0: in STD_LOGIC_VECTOR(7 downto 0);
		R_e1: in STD_LOGIC_VECTOR(7 downto 0);
		Op: in STD_LOGIC_VECTOR(1 downto 0);
		R_s: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	
	signal alu_to_bank: std_logic_vector(7 downto 0);
	
	signal reg_1_id_to_mux: std_logic_vector(7 downto 0) := reg_1_id & "00000";
	signal op_to_mux: std_logic := op(0) and op(1);
	
	begin
		mux: MUX2_1_8
		port map(
			e0 => reg_1_id_to_mux,
			e1 => bank_to_mux,
			c => op_to_mux,
			o => mux_to_alu
		);
		
		bank: banc
		port map(
		reg_0_id => reg_0_id,
		reg_1_id => reg_1_id,
		reg_write_val => alu_to_bank,
		WR => WR_bank,
		clk => clk,
		rst => rst,
		reg_0_val => bank_to_mux,
		reg_1_val => bank_to_alu
		);
		
		map_alu: ALU
		port map(
		R_e0 => bank_to_alu,
		R_e1 => mux_to_alu,
		op => op,
		R_s => alu_to_bank
		);
end architecture;

-------------------------------------------------------------------

--II. Ajout d'un sequenceur pour obtenir le processeur simplifie
--II.1. Sequenceur
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequencer is
  port (
    init : in STD_LOGIC;
    clk: in STD_LOGIC;
    WR_instr: out STD_LOGIC;
    WR_bank: out STD_LOGIC
    );
end entity;
--Architecture a completer
-------------------------------------------------------------------
--II.2. Assemblage du processeur
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity proc_v1 is
  port (
    instr: in STD_LOGIC_VECTOR(7 downto 0);
    Init: in STD_LOGIC;
    rst: in STD_LOGIC;
    clk: in STD_LOGIC
    );
end entity;

--Architecture a completer
-------------------------------------------------------------------
