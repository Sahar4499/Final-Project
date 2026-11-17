library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_booth_multiplier_8x8 is
end entity;

architecture tb of tb_booth_multiplier_8x8 is

    component booth_multiplier_8x8 is
        port (
            a : in  std_logic_vector(7 downto 0);
            b : in  std_logic_vector(7 downto 0);
            p : out std_logic_vector(15 downto 0)
        );
    end component;

    signal a_tb : std_logic_vector(7 downto 0);
    signal b_tb : std_logic_vector(7 downto 0);
    signal p_tb : std_logic_vector(15 downto 0);

begin

    DUT: booth_multiplier_8x8
        port map (
            a => a_tb,
            b => b_tb,
            p => p_tb
        );

    stimulus: process
        variable expected_v : signed(15 downto 0);
    begin

        ----------------------------------------------------------------
        -- Test 1 : 3 * 2 = 6
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(3, 8));
        b_tb <= std_logic_vector(to_signed(2, 8));
        wait for 20 ns;

        expected_v := to_signed(3 * 2, 16);

        assert signed(p_tb) = expected_v
            report "Test 1 failed: 3 * 2 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 2 : 5 * 3 = 15
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(5, 8));
        b_tb <= std_logic_vector(to_signed(3, 8));
        wait for 20 ns;

        expected_v := to_signed(5 * 3, 16);

        assert signed(p_tb) = expected_v
            report "Test 2 failed: 5 * 3 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 3 : -3 * 2 = -6
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(-3, 8));
        b_tb <= std_logic_vector(to_signed(2, 8));
        wait for 20 ns;

        expected_v := to_signed(-3 * 2, 16);

        assert signed(p_tb) = expected_v
            report "Test 3 failed: -3 * 2 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 4 : -4 * -2 = 8
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(-4, 8));
        b_tb <= std_logic_vector(to_signed(-2, 8));
        wait for 20 ns;

        expected_v := to_signed((-4) * (-2), 16);

        assert signed(p_tb) = expected_v
            report "Test 4 failed: -4 * -2 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 5 : 7 * -1 = -7
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(7, 8));
        b_tb <= std_logic_vector(to_signed(-1, 8));
        wait for 20 ns;

        expected_v := to_signed(7 * (-1), 16);

        assert signed(p_tb) = expected_v
            report "Test 5 failed: 7 * -1 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 6 : 0 * 12 = 0
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(0, 8));
        b_tb <= std_logic_vector(to_signed(12, 8));
        wait for 20 ns;

        expected_v := to_signed(0 * 12, 16);

        assert signed(p_tb) = expected_v
            report "Test 6 failed: 0 * 12 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 7 : 12 * 0 = 0
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(12, 8));
        b_tb <= std_logic_vector(to_signed(0, 8));
        wait for 20 ns;

        expected_v := to_signed(12 * 0, 16);

        assert signed(p_tb) = expected_v
            report "Test 7 failed: 12 * 0 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 8 : 15 * 15 = 225
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(15, 8));
        b_tb <= std_logic_vector(to_signed(15, 8));
        wait for 20 ns;

        expected_v := to_signed(15 * 15, 16);

        assert signed(p_tb) = expected_v
            report "Test 8 failed: 15 * 15 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 9 : -8 * 7 = -56
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(-8, 8));
        b_tb <= std_logic_vector(to_signed(7, 8));
        wait for 20 ns;

        expected_v := to_signed((-8) * 7, 16);

        assert signed(p_tb) = expected_v
            report "Test 9 failed: -8 * 7 /= output"
            severity error;

        ----------------------------------------------------------------
        -- Test 10 : -16 * -4 = 64
        ----------------------------------------------------------------
        a_tb <= std_logic_vector(to_signed(-16, 8));
        b_tb <= std_logic_vector(to_signed(-4, 8));
        wait for 20 ns;

        expected_v := to_signed((-16) * (-4), 16);

        assert signed(p_tb) = expected_v
            report "Test 10 failed: -16 * -4 /= output"
            severity error;

        report "All tests completed" severity note;
        wait;

    end process;

end architecture;