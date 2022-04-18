library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity module_p is
  Port (clock_inp: in std_logic;
  reset: in std_logic;
  set:in std_logic;
  inp_1:in std_logic_vector(7 downto 0);
  inp_2: in std_logic_vector(7 downto 0);
  output_gcd: out std_logic_vector(7 downto 0));
end module_p;

architecture Behavioral of module_p is
component project_datapath
  Port (  clock_inp:in std_logic;
 reset: in std_logic;
  inp1msel: in std_logic;
  inp2msel: in std_logic;
  inp1load: in std_logic;
  inp2load: in std_logic;
  outpload: in std_logic;
  inp_1: in std_logic_vector(7 downto 0);
 inp_2: in std_logic_vector(7 downto 0);
   gcd: out std_logic_vector(7 downto 0);
  eqflg: out std_logic;
  ltflg: out std_logic);
end component;

component control_p
  Port (clock_inp: in std_logic;
  reset: in std_logic;
  set:in std_logic;
  eqflg: in std_logic;
  ltflg: in std_logic;
  inp1msel: out std_logic;
  inp2msel: out std_logic;
  inp1load: out std_logic;
  inp2load: out std_logic;
  outpload: out std_logic);
end component;

signal eqflg, ltflg, inp1msel,inp2msel: std_logic;
signal inp1load,inp2load,outpload: std_logic;

begin

u1:project_datapath port map(clock_inp=>clock_inp,reset=>reset,inp1msel=>inp1msel,inp2msel=>inp2msel,inp1load=>inp1load,inp2load=>inp2load,
outpload=>outpload,inp_1=>inp_1,inp_2=>inp_2,gcd=>output_gcd,eqflg=>eqflg,ltflg=>ltflg);

u2:control_p port map(clock_inp=>clock_inp,reset=>reset,set=>set,eqflg=>eqflg,ltflg=>ltflg,
inp1msel=>inp1msel,inp2msel=>inp2msel,inp1load=>inp1load,inp2load=>inp2load,outpload=>outpload);
 
end Behavioral;
