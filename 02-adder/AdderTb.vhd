library IEEE;
use IEEE.std_logic_1164.all;

entity L02_AdderTb is
-- empty
end L02_AdderTb;

architecture tb of L02_AdderTb is

  -- DUT component
  component full_adder is
    port (
      d1, d2         : in  std_logic;
      carry_in       : in  std_logic;
      sum, carry_out : out std_logic
    ) ;
  end component;

  -- Signals
  signal d1_i, d2_i, c_i, s_o, c_o : std_logic;

begin
  -- Link DUT
  DUT : half_adder port map(d1_i, d2_i, c_i, s_o, c_o);

  stim_proc : process
  begin
    c_i  <= '0';
  
    d1_i <= '0';
    d2_i <= '0';
    wait for 1 ns;
    assert(s_o = '0') report "Fail s_o 0/0" severity error;
    assert(c_o = '0') report "Fail c_o 0/0" severity error;
    
    d1_i <= '1';
    d2_i <= '0';
    wait for 1 ns;
    assert(s_o = '1') report "Fail s_o 1/0" severity error;
    assert(c_o = '0') report "Fail c_o 1/0" severity error;
    
    d1_i <= '0';
    d2_i <= '1';
    wait for 1 ns;
    assert(s_o = '1') report "Fail s_o 0/1" severity error;
    assert(c_o = '0') report "Fail c_o 0/1" severity error;
    
    d1_i <= '1';
    d2_i <= '1';
    wait for 1 ns;
    assert(s_o = '0') report "Fail s_o 1/1" severity error;
    assert(c_o = '1') report "Fail c_o 1/1" severity error;
    
    -- Clear inputs
    d1_i <= '0';
    d2_i <= '0';
    
    wait;
    assert false report "Test done" severity note;
  end process; -- stim_proc
end tb; -- tb
