library IEEE;
use IEEE.std_logic_1164.all;

entity L08_TopModule is
    port (
        BTN : in  std_logic_vector(1 downto 0);
        SW  : in  std_logic_vector(1 downto 0);
        CAT : out std_logic_vector(6 downto 0);
        DOT : out std_logic;
        ANO : out std_logic_vector(3 downto 0)
    );
end L08_TopModule;

architecture rtl of L08_TopModule is

    -- Input
    signal s_sel_src, s_sel_op : std_logic_vector(1 downto 0);
    
    -- Intermediary
    signal s_yDEC0, s_yDEC1       : std_logic_vector(3 downto 0);
    signal s_CE                   : std_logic_vector(3 downto 0);
    signal s_T0, s_T1, s_T2, s_T3 : std_logic_vector(3 downto 0);
    signal s_cnt_en, s_clr_en     : std_logic;
    signal s_DOBR                 : std_logic_vector(3 downto 0);
    signal s_CEOBR                : std_logic;
    signal s_QOBR                 : std_logic_vector(3 downto 0);

    -- Clock
    signal s_clk : std_logic;

    component decoder is
        port (
            sw : in  std_logic_vector(1 downto 0);
            y  : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component counter is
        port (
            D       : in  std_logic_vector(3 downto 0);
            CE      : in  std_logic;
            cnt_en  : in  std_logic;
            clr_en  : in  std_logic;
            clk     : in  std_logic;
            T       : out std_logic_vector(3 downto 0);
        );
    end component;
    
    component mux is
        port (
            D0, D1, D2, D3 : in  std_logic_vector(3 downto 0);
            sel            : in  std_logic_vector(1 downto 0);
            Q              : out std_logic
        );
    end component;

    component register is
        port (
            D   : in  std_logic_vector(3 downto 0);
            CE  : in  std_logic;
            clk : in  std_logic;
            Q   : out std_logic_vector(3 downto 0)
        );
    end component;

    component seven_segment_decoder is
        port (
            s : in  std_logic_vector(3 downto 0);
            c : out std_logic_vector(6 downto 0)
        );
    end component;
begin
    s_sel_src <= SW;
    s_sel_op  <= BTN;

    DEC0 : decoder
        port map (
            sw => s_sel_src,
            y  => s_yDEC0
        );

    DEC1 : decoder
        port map (
            sw => s_sel_op,
            y  => s_yDEC1
        );

    CNT0 : counter
        port map (
            D      => s_T0,
            CE     => s_CE(0),
            cnt_en => s_cnt_en,
            clr_en => s_clr_en,
            clk    => s_clk,
            T      => s_T0,
        );
    
    CNT1 : counter
        port map (
            D      => s_T1,
            CE     => s_CE(1),
            cnt_en => s_cnt_en,
            clr_en => s_clr_en,
            clk    => s_clk,
            T      => s_T1,
        );
    
    CNT2 : counter
        port map (
            D      => s_T2,
            CE     => s_CE(2),
            cnt_en => s_cnt_en,
            clr_en => s_clr_en,
            clk    => s_clk,
            T      => s_T2,
        );
    
    CNT3 : counter
        port map (
            D      => s_T3,
            CE     => s_CE(3),
            cnt_en => s_cnt_en,
            clr_en => s_clr_en,
            clk    => s_clk,
            T      => s_T3,
        );

    MUX0 : mux
        port map (
            D0  => s_T0,
            D1  => s_T1,
            D2  => s_T2,
            D3  => s_T3,
            sel => s_sel_src,
            Q   => s_DOBR
        );

    OBR0 : register
        port map (
            D   => s_DOBR,
            CE  => s_CEOBR,
            clk => s_clk,
            Q   => s_QOBR
        );

    DOT <= '1' when (s_DOBR = "1001") else '0';
    
    CLK_PROC : process( )
    begin
        clk <= '0';
        wait for 5 ms;
        clk <= '1';
        wait for 5 ms;sjjj
    end process ; -- CLK_PROC
end rtl ; -- rtl