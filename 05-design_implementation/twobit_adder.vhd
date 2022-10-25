library IEEE;
use IEEE.std_logic_1164.all;

entity twobit_adder is
    port (
        d0, d1    : in  std_logic_vector(1 downto 0);
        carry_in  : in  std_logic;
        sum       : out std_logic_vector(1 downto 0);
        carry_out : out std_logic
    );
end twobit_adder;

architecture rtl of twobit_adder is
    -- Subcircuit component
    component full_adder is
        port (
        d0, d1         : in  std_logic;
        carry_in       : in  std_logic;
        sum, carry_out : out std_logic
        );
    end component;
    
    -- Signals
    signal c0, c1, cpr : std_logic;
    
begin
    -- Link subcircuit
    u0 : full_adder port map( d0(0), d1(0), cpr, sum(0), c0 );
    u1 : full_adder port map( d0(1), d1(1), c0,  sum(1), c1 );

    cpr <= carry_in;
    carry_out <= c1;
end rtl; -- rtl
