library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


entity control_p is
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
end control_p;

architecture Behavioral of control_p is
type state_type is(start, input, test1,test2,update1,update2,done);
signal p_state, n_state: state_type;
begin

sreg: process(clock_inp, reset)
begin
if reset = '1' then
p_state<=start;
elsif clock_inp'event and clock_inp='1'then
p_state<=n_state;
end if;
end process;

c1: process(p_state,set,eqflg,ltflg)
begin
case p_state is 
when start=>
if set='1' then 
n_state<=input;
else
n_state<=start;
end if;

when input=>
n_state<=test1;

when test1=>
if eqflg = '1' then
n_state<=done;
else
n_state<=test2;
end if;

when test2=>
if ltflg='1' then
n_state<= update1;
else
n_state<=update2;
end if;

when update1=>
n_state<=test1;

when update2=>
n_state<=test1;

when done=>
n_state<=done;

when others=>
null;
end case;
end process;

c2: process(p_state)
begin
inp1load<='0';inp2load<='0';outpload<='0';inp1msel<='0';inp2msel<='0';
case p_state is
when input=>
inp1load<='1';inp2load<='1';
inp1msel<='1';inp2msel<='1';
when update1=>
inp2load<='1';
when update2=>
inp1load<='1';
when done=>
outpload<='1';
when others=>
null;
end case;
end process;
