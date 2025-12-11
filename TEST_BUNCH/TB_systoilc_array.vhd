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
    -- Clock Generation (10ns period)
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
        -- Reset Sequence
        ----------------------------------------------------------------
        RST <= '1';
        EN  <= '0';
        wait for 20 ns;

        RST <= '0';
        EN  <= '1';
        wait for 10 ns; 
        
        ----------------------------------------------------------------
        -- Matrix Multiplication: A (2x2) * B (2x2)
        -- A = [[1, 2], [3, 4]]
        -- B = [[5, 6], [7, 8]]
        --
        -- Expected Result:
        -- C = [[19, 22], [43, 50]]
        ----------------------------------------------------------------

        -- Cycle 0: Feed first elements of Row 0 and Col 0 (A00, B00)
        -- Row 1 and Col 1 must wait for the next cycle (Skewing)
        A0_in <= x"0001"; -- A[0][0]
        B0_in <= x"0005"; -- B[0][0]
        
        A1_in <= (others => '0');
        B1_in <= (others => '0');
        
        wait until rising_edge(CLK);

        -- Cycle 1: Feed second element of Row 0 / Col 0 (A01, B10)
        --          AND start feeding first element of Row 1 / Col 1 (A10, B01)
        A0_in <= x"0002"; -- A[0][1]
        B0_in <= x"0007"; -- B[1][0]
        
        A1_in <= x"0003"; -- A[1][0]
        B1_in <= x"0006"; -- B[0][1]
        
        wait until rising_edge(CLK);

        -- Cycle 2: Finished with Row 0 / Col 0.
        --          Continue with second element of Row 1 / Col 1 (A11, B11)
        A0_in <= (others => '0');
        B0_in <= (others => '0');
        
        A1_in <= x"0004"; -- A[1][1]
        B1_in <= x"0008"; -- B[1][1]
        
        wait until rising_edge(CLK);

        -- Cycle 3: End of input feeding
        A1_in <= (others => '0');
        B1_in <= (others => '0');

        ----------------------------------------------------------------
        -- Wait for computation
        -- The pipeline stages add latency to the result availability
        ----------------------------------------------------------------
        wait for 60 ns;
        
        -- Expected Results check:
        -- C00 = 19
        -- C01 = 22
        -- C10 = 43
        -- C11 = 50

        wait;
    end process;

end Behavioral;