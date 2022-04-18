library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity project_datapath is
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
end project_datapath;


architecture Behavioral of project_datapath is
component gcd_mux
port(a: in std_logic_vector(7 downto 0);
b:in std_logic_vector(7 downto 0);
s: in std_logic;
y:out std_logic_vector(7 downto 0));
end component;

component gcd_reg
port(load: in std_logic;
d: in std_logic_vector(7 downto 0);
clock_inp:in std_logic;
reset: in std_logic;
q:out std_logic_vector(7 downto 0));
end component;

signal x,y,x1,y1,xmy,ymx: std_logic_vector(7 downto 0);
begin
xmy<=x-y;
ymx<=y-x;

eq: process(x,y)
begin
if x=y then
eqflg<= '1';
else
eqflg<='0';
end if;
end process;

lt: process(x,y)
begin
if x<y then
ltflg<='1';
else
ltflg<='0';
end if;
end process;

m1: gcd_mux
port map(a=>xmy, b=>inp_1,s=>inp1msel, y=>x1);

m2: gcd_mux
port map(a=>ymx, b=>inp_2, s=>inp2msel, y=>y1);

r1: gcd_reg
port map(load=>inp1load, d=>x1, clock_inp=>clock_inp, reset=>reset, q=>x);

r2: gcd_reg
port map(load=>inp2load, d=>y1, clock_inp=>clock_inp, reset=>reset, q=>y);

r3: gcd_reg
port map(load=>outpload, d=>x, clock_inp=>clock_inp, reset=>reset, q=>gcd);

end Behavioral;
