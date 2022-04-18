library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gcd_reg is
generic(N : integer := 8);
port(load: in std_logic;
d: in std_logic_vector(N-1 downto 0);
clock_inp:in std_logic;
reset: in std_logic;
q:out std_logic_vector(N-1 downto 0));
end gcd_reg;

architecture Behavioral of gcd_reg is

begin
process(clock_inp)
begin
if rising_edge(clock_inp) then
if reset = '1' then
q<=(others=>'0');
else
if load='1' then
q<=d;
end if;
end if;
end if;
end process;
end Behavioral;
