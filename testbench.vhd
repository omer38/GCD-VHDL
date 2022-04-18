library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity gcd_sim is
end gcd_sim;

architecture Behavioral of gcd_sim is

component module_p port(
                        clock_inp: in std_logic;
                        reset: in std_logic;
                        set:in std_logic;
                        inp_1:in std_logic_vector(7 downto 0);
                        inp_2: in std_logic_vector(7 downto 0);
                        output_gcd: out std_logic_vector(7 downto 0)
                        );
end component;

signal clk_s : std_logic;
signal reset_s : std_logic ;
signal set_s: std_logic;
signal inp_1_s: std_logic_vector(7 downto 0);
signal inp_2_s: std_logic_vector(7 downto 0);
signal output_gcd_s: std_logic_vector(7 downto 0);
                       
begin

uut: module_p port map( clock_inp => clk_s,
                          reset => reset_s,
                          set => set_s,
                          inp_1 => inp_1_s,
                          inp_2 => inp_2_s,
                          output_gcd => output_gcd_s
                          );

clk_proc : process
 begin 
 clk_s <= '0';
 wait for 10 ns;
 clk_s <= '1';
 wait for 10 ns;
 end process;

                         
stim_proc: process

begin
set_s <= '1';
    inp_1_s <= "10001100";
     inp_2_s <= "00001100";
    reset_s <= '0'; 
    wait for 100 ns;
    set_s <= '0';
    wait;
end process;

end Behavioral;
