library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_systolic_2x2_checked is
end TB_systolic_2x2_checked;

architecture Behavioral of TB_systolic_2x2_checked is
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

    constant TCLK : time := 10 ns;

    function to_u32(x : integer) return std_logic_vector is
    begin
        return std_logic_vector(to_unsigned(x, 32));
    end function;

begin
    CLK <= not CLK after TCLK/2;

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

    stim : process
    begin
        -- reset
        RST <= '1';
        EN  <= '0';
        wait for 2*TCLK;

        RST <= '0';
        EN  <= '1';
        wait until rising_edge(CLK);

        -- A = [[1,2],[3,4]]
        -- B = [[5,6],[7,8]]
        --
        -- Systolic feeding:
        -- cycle k=0: A(:,0) and B(0,:)
        A0_in <= x"0001";  -- A(0,0)
        A1_in <= x"0003";  -- A(1,0)
        B0_in <= x"0005";  -- B(0,0)
        B1_in <= x"0006";  -- B(0,1)
        wait until rising_edge(CLK);

        -- cycle k=1: A(:,1) and B(1,:)
        A0_in <= x"0002";  -- A(0,1)
        A1_in <= x"0004";  -- A(1,1)
        B0_in <= x"0007";  -- B(1,0)
        B1_in <= x"0008";  -- B(1,1)
        wait until rising_edge(CLK);

        -- stop driving
        A0_in <= (others => '0');
        A1_in <= (others => '0');
        B0_in <= (others => '0');
        B1_in <= (others => '0');

        -- wait for PE pipeline + systolic propagation (conservative)
        for i in 0 to 9 loop
            wait until rising_edge(CLK);
        end loop;

        assert C00 = to_u32(19) report "C00 mismatch" severity failure;
        assert C01 = to_u32(22) report "C01 mismatch" severity failure;
        assert C10 = to_u32(43) report "C10 mismatch" severity failure;
        assert C11 = to_u32(50) report "C11 mismatch" severity failure;

        report "PASS: systolic_2x2 results are correct" severity note;
        wait;
    end process;

end Behavioral;