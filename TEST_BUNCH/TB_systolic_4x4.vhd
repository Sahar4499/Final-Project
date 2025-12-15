library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_systolic_4x4 is
end TB_systolic_4x4;

architecture Behavioral of TB_systolic_4x4 is

    signal CLK : std_logic := '0';
    signal RST : std_logic := '0';
    signal EN  : std_logic := '0';

    signal A0_in, A1_in, A2_in, A3_in : std_logic_vector(15 downto 0);
    signal B0_in, B1_in, B2_in, B3_in : std_logic_vector(15 downto 0);

    signal C_out : std_logic_vector(511 downto 0);

    constant TCLK : time := 10 ns;

begin

    CLK <= not CLK after TCLK/2;

    DUT : entity work.systolic_4x4
        port map(
            CLK   => CLK,
            RST   => RST,
            EN    => EN,
            A0_in => A0_in,
            A1_in => A1_in,
            A2_in => A2_in,
            A3_in => A3_in,
            B0_in => B0_in,
            B1_in => B1_in,
            B2_in => B2_in,
            B3_in => B3_in,
            C_out => C_out
        );

    stim : process
    begin
        -- reset
        RST <= '1';
        EN  <= '0';
        A0_in <= (others => '0');
        A1_in <= (others => '0');
        A2_in <= (others => '0');
        A3_in <= (others => '0');
        B0_in <= (others => '0');
        B1_in <= (others => '0');
        B2_in <= (others => '0');
        B3_in <= (others => '0');

        wait for 2*TCLK;
        RST <= '0';
        EN  <= '1';
        wait until rising_edge(CLK);

        -- cycle 0
        A0_in <= x"0001";
        A1_in <= x"0002";
        A2_in <= x"0003";
        A3_in <= x"0004";

        B0_in <= x"0001";
        B1_in <= x"0002";
        B2_in <= x"0003";
        B3_in <= x"0004";

        wait until rising_edge(CLK);

        -- cycle 1
        A0_in <= x"0002";
        A1_in <= x"0003";
        A2_in <= x"0004";
        A3_in <= x"0005";

        B0_in <= x"0002";
        B1_in <= x"0003";
        B2_in <= x"0004";
        B3_in <= x"0005";

        wait until rising_edge(CLK);

        -- cycle 2
        A0_in <= x"0003";
        A1_in <= x"0004";
        A2_in <= x"0005";
        A3_in <= x"0006";

        B0_in <= x"0003";
        B1_in <= x"0004";
        B2_in <= x"0005";
        B3_in <= x"0006";

        wait until rising_edge(CLK);

        -- cycle 3
        A0_in <= x"0004";
        A1_in <= x"0005";
        A2_in <= x"0006";
        A3_in <= x"0007";

        B0_in <= x"0004";
        B1_in <= x"0005";
        B2_in <= x"0006";
        B3_in <= x"0007";

        wait until rising_edge(CLK);

        -- stop driving
        A0_in <= (others => '0');
        A1_in <= (others => '0');
        A2_in <= (others => '0');
        A3_in <= (others => '0');
        B0_in <= (others => '0');
        B1_in <= (others => '0');
        B2_in <= (others => '0');
        B3_in <= (others => '0');

        -- wait for pipeline + systolic propagation
        for i in 0 to 15 loop
            wait until rising_edge(CLK);
        end loop;

        report "TB_systolic_4x4 completed - check waveform" severity note;
        wait;
    end process;

end Behavioral;