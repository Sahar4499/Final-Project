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
        wait for 10 ns; 
        
        ----------------------------------------------------------------
        -- MATRIX A (2x2) * MATRIX B (2x2)
        -- A = [[1, 2], [3, 4]]
        -- B = [[5, 6], [7, 8]]
        ----------------------------------------------------------------

        -- Cycle 0: מזינים A[0][0] ו-B[0][0]
        A0_in <= x"0001"; 
        B0_in <= x"0005"; 
        
        A1_in <= (others => '0');
        B1_in <= (others => '0');
        
        wait until rising_edge(CLK);

        -- Cycle 1: מזינים A[0][1], B[1][0] וגם A[1][0], B[0][1]
        A0_in <= x"0002"; 
        B0_in <= x"0007"; 
        
        A1_in <= x"0003"; 
        B1_in <= x"0006"; 
        
        wait until rising_edge(CLK);

        -- Cycle 2: מזינים A[1][1], B[1][1] (השאר אפסים)
        A0_in <= (others => '0');
        B0_in <= (others => '0');
        
        A1_in <= x"0004"; 
        B1_in <= x"0008"; 
        
        wait until rising_edge(CLK);

        -- Cycle 3: סיום הזנה
        A1_in <= (others => '0');
        B1_in <= (others => '0');

        ----------------------------------------------------------------
        -- Wait for Pipeline computation
        -- ה-Pipeline מוסיף עוד 2 מחזורי שעון של השהיה בתוך ה-PE
        ----------------------------------------------------------------
        wait for 60 ns;
        
        -- Expected Result:
        -- C00 = 19
        -- C01 = 22
        -- C10 = 43
        -- C11 = 50

        wait;
    end process;

end Behavioral;