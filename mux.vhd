library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity gcd_mux is
port(a: in std_logic_vector(7 downto 0);
b:in std_logic_vector(7 downto 0);
s: in std_logic;
y:out std_logic_vector(7 downto 0));
end gcd_mux;

architecture Behavioral of gcd_mux is

begin
with s select y<=
a when '0',
b when '1';

end Behavioral;
