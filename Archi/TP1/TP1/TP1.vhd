-- Architecture 2. Sujet de TP 1 (seances 1 et 2).
-- Implementation d'une ALU simple
-- Author: T. Carle (thomas.carle@irit.fr)


-- I. Multiplexeur 4 voies 8 bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
  port (
    e0: in STD_LOGIC_VECTOR(7 downto 0);
    e1: in STD_LOGIC_VECTOR(7 downto 0);
    e2: in STD_LOGIC_VECTOR(7 downto 0);
    e3: in STD_LOGIC_VECTOR(7 downto 0);
    c0: in STD_LOGIC;
    c1: in STD_LOGIC;
    s0: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;
-- Architecture a developper

architecture arch_MUX of MUX is
begin
	s0 <= e0 when  c1 = '0' and c0 = '0' else
	e1 when c1 = '0' and c0 = '1' else
	e2 when c1 = '1' and not c0 = '0' else
	e3;
	end architecture arch_MUX;

--------------------------------------------------------------------

-- II. Additionneur 8 bits
-- II.1. Additionneur 1 bit
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add1b is
  port (
    a: in STD_LOGIC;
    b: in STD_LOGIC;
    c_in: in STD_LOGIC;
    s0: out STD_LOGIC;
    c_out: out STD_LOGIC
    );
end entity;

-- Architecture a developper

architecture arch_add1b of add1b is
begin
	s0<=a xor b xor c_in;
	c_out <=(a AND b) OR (a AND c_in) OR (b AND c_in);
end architecture arch_add1b;
	

--II.2. Additionneur 8 bits a retenue propagee
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add8b is
  port (
    e0: in STD_LOGIC_VECTOR(7 downto 0);
    e1: in STD_LOGIC_VECTOR(7 downto 0);
    s: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

-- Architecture a developper

architecture arch_add8b of add8b is
    component add1b is
        port (
            a: in STD_LOGIC;
            b: in STD_LOGIC;
            c_in: in STD_LOGIC;
            s0: out STD_LOGIC;
            c_out: out STD_LOGIC
            );
    end component;
    signal c_out : STD_LOGIC_VECTOR(8 downto 0);
    signal a : STD_LOGIC_VECTOR(8 downto 0);
    signal b : STD_LOGIC_VECTOR(8 downto 0);
    signal c_in : STD_LOGIC_VECTOR(8 downto 0);
    signal s0 : STD_LOGIC_VECTOR(8 downto 0);
    begin
        a0 : add1b
            port map(a => a(0), b => b(0), c_in => c_out(0), s0 => s0(0), c_out => c_out(1));
        a1 : add1b
            port map(a => a(1), b => b(1), c_in => c_out(1), s0 => s0(1), c_out => c_out(2));
        a2 : add1b
            port map(a => a(2), b => b(2), c_in => c_out(2), s0 => s0(2), c_out => c_out(3));
        a3 : add1b
            port map(a => a(3), b => b(3), c_in => c_out(3), s0 => s0(3), c_out => c_out(4));
        a4 : add1b
            port map(a => a(4), b => b(4), c_in => c_out(4), s0 => s0(4), c_out => c_out(5));
        a5 : add1b
            port map(a => a(5), b => b(5), c_in => c_out(5), s0 => s0(5), c_out => c_out(6));
        a6 : add1b
            port map(a => a(6), b => b(6), c_in => c_out(6), s0 => s0(6), c_out => c_out(7));
        a7 : add1b
            port map(a => a(7), b => b(7), c_in => c_out(7), s0 => s0(7), c_out => c_out(8));
end architecture arch_add8b;

-- III. Soustracteur 8 bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub1b is
  port (
    a: in STD_LOGIC;
    b: in STD_LOGIC;
    c_in: in STD_LOGIC;
    s0: out STD_LOGIC;
    c_out: out STD_LOGIC
    );
end entity;


-- Architecture a developper
ARCHITECTURE sub1b_fd OF sub1b IS
BEGIN
    s0 <= a XOR b XOR c_in;
    c_out <= ((NOT a) AND (b OR c_in)) OR (b AND c_in);
            
END ARCHITECTURE sub1b_fd; 


-- Architecture et sous-composants a developper

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub8b is
  port (
    e0: in STD_LOGIC_VECTOR(7 downto 0);
    e1: in STD_LOGIC_VECTOR(7 downto 0);
    s: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;


-- Architecture a developper
ARCHITECTURE sub8b_fd OF sub8b IS
    COMPONENT sub1b IS
        PORT (
            a: IN STD_LOGIC;
            b: IN STD_LOGIC;
            c_in: IN STD_LOGIC;
            s0: OUT STD_LOGIC;
            c_out: OUT STD_LOGIC
            );
    END COMPONENT;
    
    SIGNAL a, b, c_in, s0, c_out : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
        GEN: FOR i IN 0 TO 7 GENERATE
            temp_a: sub1b
                PORT MAP(
                    a => a(i), 
                    b => b(i), 
                    c_in => c_out(i), 
                    s0 => s0(i), 
                    c_out => c_out(i+1)
                    );
        END GENERATE GEN;
END ARCHITECTURE sub8b_fd;

-------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--IV. ET bit a bit
entity and8b is
  port (
    e0: in STD_LOGIC_VECTOR(7 downto 0);
    e1: in STD_LOGIC_VECTOR(7 downto 0);
    s: out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;
-- Architecture a developper

ARCHITECTURE and8b_fd OF and8b IS
BEGIN
    GEN: FOR i IN 0 TO 7 GENERATE 
        s(i)<= e0(i) AND e1(i);
    END GENERATE GEN;
END ARCHITECTURE and8b_fd;

---------------------------------------------------------
