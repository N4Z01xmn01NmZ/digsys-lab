library IEEE;
use IEEE.std_logic_1164.all;

entity L01_LogicGatesTb is
-- empty
end L01_LogicGatesTb ;

architecture tb of L01_LogicGatesTb is

    -- DUT components
    component or_gate is
    port (
        d1, d2 : in  std_logic;
        o      : out std_logic
    );
    end component;
    component and_gate is
      port (
        d1, d2 : in  std_logic;
        o      : out std_logic
    );
    end component;

    -- Signals
    signal d1_i, d2_i  : std_logic;
    signal or_o, and_o : std_logic;

begin
    -- Connect DUT
    DUT1 : or_gate port map( d1_i, d2_i, or_o );
    DUT2 : and_gate port map( d1_i, d2_i, and_o );

    stim_proc : process
    begin
        d1_i <= '0';
        d2_i <= '0';
        wait for 1 ns;
        assert (or_o = '0') report "Fail or_o 0/0" severity error;
        assert (and_o = '0') report "Fail and_o 0/0" severity error;

        d1_i <= '1';
        d2_i <= '0';
        wait for 1 ns;
        assert (or_o = '1') report "Fail or_o 1/0" severity error;
        assert (and_o = '0') report "Fail and_o 1/0" severity error;

        d1_i <= '1';
        d2_i <= 'X';
        wait for 1 ns;
        assert (or_o = '1') report "Fail or_o 1/X" severity error;
        assert (and_o = 'X') report "Fail and_o 1/X" severity error;

        d1_i <= '1';
        d2_i <= '1';
        wait for 1 ns;
        assert (or_o = '1') report "Fail or_o 1/1" severity error;
        assert (and_o = '1') report "Fail and_o 1/1" severity error;

        assert false report "Test done" severity note;
        wait;
    end process; -- stim_proc
end architecture; -- tb
