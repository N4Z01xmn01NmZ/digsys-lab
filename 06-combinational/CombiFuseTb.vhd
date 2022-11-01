library IEEE;
use IEEE.std_logic_1164.all;

entity L06_CombiFuseTb is
end L06_CombiFuseTb;

architecture tb of L06_CombiFuseTb is
    component combi_fuse is
        port (
            d   : in  std_logic_vector(2 downto 0);
            led : out std_logic_vector(3 downto 0)
        );
    end component;

    signal s_d   : std_logic_vector(2 downto 0);
    signal s_led : std_logic_vector(2 downto 0);
begin
    uut : combi_fuse port map (
        d   => s_d,
        led => s_led
    );

    stim_proc : process
    begin
        for i in 0 to 7 loop
            s_d <= s_d + '1';
            wait for 10 ns;
        end loop;

        wait;
    end
end tb ; -- tb