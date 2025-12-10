library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_systolic_2x2 is
end TB_systolic_2x2;

architecture Behavioral of TB_systolic_2x2 is

    -- DUT signals
    signal CLK   : std_logic := '0';
    signal RST   : std_logic := '0';
    signal EN    : std_logic := '0';

    signal A0_in : std_logic_vector(15 downto 0) := (others => '0');
    signal A1_in : std_logic_vector(15 downto 0) := (others => '0');
    signal B0_in : std_logic_vector(15 downto 0) := (others => '0');
    signal B1_in : std_logic_vector(15 downto 0) := (others => '0');

    signal C00   : std_logic_vector(31 downto 0);
    signal C01   : std_logic_vector(31 downto 0);
    signal C10   : std_logic_vector(31 downto 0);
    signal C11   : std_logic_vector(31 downto 0);

begin

    --------------------------------------------------------------------
    -- Clock 10ns
    --------------------------------------------------------------------
    CLK <= not CLK after 5 ns;

    --------------------------------------------------------------------
    -- Instantiate systolic array 2x2
    --------------------------------------------------------------------
    DUT : entity work.systolic_2x2
        port map (
            CLK   => CLK,
            RST   => RST,
            EN    => EN,
            A0_in => A0_in,
            A1_in => A1_in,
            B0_in => B0_in,
            B1_in => B1_in,
            C00   => C00,
            C01   => C01,
            C10   => C10,
            C11   => C11
        );

    --------------------------------------------------------------------
    -- Test Process
    --------------------------------------------------------------------
    stim : process
    begin
        ----------------------------------------------------------------
        -- Reset
        ----------------------------------------------------------------
        RST <= '1';
        EN  <= '0';
        wait for 20 ns;

        RST <= '0';
        EN  <= '1';
        wait for 10 ns;    -- align to rising edge

        ----------------------------------------------------------------
        -- MATRIX A and B
        -- A = | 1 2 |
        --     | 3 4 |
        --
        -- B = | 5 6 |
        --     | 7 8 |
        --
        -- Expected C = A * B =
        -- | 1*5 + 2*7     1*6 + 2*8 | = | 19   22 |
        -- | 3*5 + 4*7     3*6 + 4*8 |   | 43   50 |
        ----------------------------------------------------------------

        ----------------------------------------------------------------
        -- Cycle 0: Send first column of A and B
        ----------------------------------------------------------------
        A0_in <= x"0001";  -- A[0][0]
        A1_in <= x"0003";  -- A[1][0]
        B0_in <= x"0005";  -- B[0][0]
        B1_in <= x"0006";  -- B[0][1]
        wait until rising_edge(CLK);

        ----------------------------------------------------------------
        -- Cycle 1: Send second column of A and B
        ----------------------------------------------------------------
        A0_in <= x"0002";  -- A[0][1]
        A1_in <= x"0004";  -- A[1][1]
        B0_in <= x"0007";  -- B[1][0]
        B1_in <= x"0008";  -- B[1][1]
        wait until rising_edge(CLK);

        ----------------------------------------------------------------
        -- After inputs, stop driving new values
        ----------------------------------------------------------------
        A0_in <= (others => '0');
        A1_in <= (others => '0');
        B0_in <= (others => '0');
        B1_in <= (others => '0');

        ----------------------------------------------------------------
        -- Now we wait for pipelining + systolic propagation
        -- PE latency = 3 cycles
        -- systolic wave propagation ≈ 2 cycles
        -- WAIT ~5 cycles total
        ----------------------------------------------------------------
        wait for 50 ns;

        ----------------------------------------------------------------
        -- Check results in waveform:
        --   C00 = 19
        --   C01 = 22
        --   C10 = 43
        --   C11 = 50
        ----------------------------------------------------------------

        wait;
    end process;

end Behavioral;
