library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_systolic_4x4_correct is
end TB_systolic_4x4_correct;

architecture Behavioral of TB_systolic_4x4_correct is

    signal CLK : std_logic := '0';
    signal RST : std_logic := '0';
    signal EN  : std_logic := '0';

    signal A0_in, A1_in, A2_in, A3_in : std_logic_vector(15 downto 0) := (others => '0');
    signal B0_in, B1_in, B2_in, B3_in : std_logic_vector(15 downto 0) := (others => '0');

    signal C_out : std_logic_vector(511 downto 0);

    constant TCLK : time := 10 ns;

    type int4x4 is array (0 to 3, 0 to 3) of integer;

    -- Example A (any values you like)
    constant A : int4x4 :=
      (( 1,  2,  3,  4),
       ( 5,  6,  7,  8),
       ( 9, 10, 11, 12),
       (13, 14, 15, 16));

    -- B = Identity, so C should equal A
    constant B : int4x4 :=
      ((1,0,0,0),
       (0,1,0,0),
       (0,0,1,0),
       (0,0,0,1));

    function to_slv16(x : integer) return std_logic_vector is
    begin
        return std_logic_vector(to_unsigned(x, 16));
    end function;

    function to_slv32(x : integer) return std_logic_vector is
    begin
        return std_logic_vector(to_unsigned(x, 32));
    end function;

    function C_at(i : integer; j : integer; Cflat : std_logic_vector(511 downto 0))
        return std_logic_vector is
        variable idx  : integer;
        variable hi   : integer;
        variable lo   : integer;
    begin
        idx := i*4 + j;
        hi  := (idx+1)*32 - 1;
        lo  := idx*32;
        return Cflat(hi downto lo);
    end function;

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
        variable k : integer;
    begin
        -- reset
        RST <= '1';
        EN  <= '0';
        wait for 2*TCLK;

        RST <= '0';
        EN  <= '1';
        wait until rising_edge(CLK);

        -- Proper systolic feeding: for k=0..3
        -- A_in(i) = A(i,k)
        -- B_in(j) = B(k,j)
        for k in 0 to 3 loop
            A0_in <= to_slv16(A(0,k));
            A1_in <= to_slv16(A(1,k));
            A2_in <= to_slv16(A(2,k));
            A3_in <= to_slv16(A(3,k));

            B0_in <= to_slv16(B(k,0));
            B1_in <= to_slv16(B(k,1));
            B2_in <= to_slv16(B(k,2));
            B3_in <= to_slv16(B(k,3));

            wait until rising_edge(CLK);
        end loop;

        -- stop driving
        A0_in <= (others => '0');
        A1_in <= (others => '0');
        A2_in <= (others => '0');
        A3_in <= (others => '0');

        B0_in <= (others => '0');
        B1_in <= (others => '0');
        B2_in <= (others => '0');
        B3_in <= (others => '0');

        -- wait for pipeline + systolic propagation (conservative)
        -- PE pipeline ~3 cycles, plus array travel; 20 cycles is safe for bring-up
        for k in 0 to 19 loop
            wait until rising_edge(CLK);
        end loop;

        -- correctness check: since B=I, C should equal A
        for k in 0 to 3 loop
            assert C_at(k,0,C_out) = to_slv32(A(k,0)) report "Mismatch C(k,0)" severity failure;
            assert C_at(k,1,C_out) = to_slv32(A(k,1)) report "Mismatch C(k,1)" severity failure;
            assert C_at(k,2,C_out) = to_slv32(A(k,2)) report "Mismatch C(k,2)" severity failure;
            assert C_at(k,3,C_out) = to_slv32(A(k,3)) report "Mismatch C(k,3)" severity failure;
        end loop;

        report "PASS: systolic_4x4 with B=I produced C=A" severity note;
        wait;
    end process;

end Behavioral;