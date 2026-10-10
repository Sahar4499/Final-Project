library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_systolic_top_4x4_fsm is
end TB_systolic_top_4x4_fsm;

architecture Behavioral of TB_systolic_top_4x4_fsm is

    constant TCLK : time := 10 ns;

    signal CLK   : std_logic := '0';
    signal RST   : std_logic := '0';
    signal start : std_logic := '0';
    signal done  : std_logic;

    signal we_A   : std_logic := '0';
    signal addr_A : unsigned(3 downto 0) := (others => '0');
    signal data_A : std_logic_vector(15 downto 0) := (others => '0');

    signal we_B   : std_logic := '0';
    signal addr_B : unsigned(3 downto 0) := (others => '0');
    signal data_B : std_logic_vector(15 downto 0) := (others => '0');

    signal C00 : std_logic_vector(31 downto 0);
    signal C01 : std_logic_vector(31 downto 0);
    signal C02 : std_logic_vector(31 downto 0);
    signal C03 : std_logic_vector(31 downto 0);

    signal C10 : std_logic_vector(31 downto 0);
    signal C11 : std_logic_vector(31 downto 0);
    signal C12 : std_logic_vector(31 downto 0);
    signal C13 : std_logic_vector(31 downto 0);

    signal C20 : std_logic_vector(31 downto 0);
    signal C21 : std_logic_vector(31 downto 0);
    signal C22 : std_logic_vector(31 downto 0);
    signal C23 : std_logic_vector(31 downto 0);

    signal C30 : std_logic_vector(31 downto 0);
    signal C31 : std_logic_vector(31 downto 0);
    signal C32 : std_logic_vector(31 downto 0);
    signal C33 : std_logic_vector(31 downto 0);

    type int4x4 is array (0 to 3, 0 to 3) of integer;

    constant A : int4x4 :=
      (( 1,  2,  3,  4),
       ( 5,  6,  7,  8),
       ( 9, 10, 11, 12),
       (13, 14, 15, 16));

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

begin

    CLK <= not CLK after TCLK/2;

    DUT : entity work.systolic_top_4x4_fsm
        port map(
            CLK   => CLK,
            RST   => RST,
            start => start,
            done  => done,

            we_A   => we_A,
            addr_A => addr_A,
            data_A => data_A,

            we_B   => we_B,
            addr_B => addr_B,
            data_B => data_B,

            C00 => C00, C01 => C01, C02 => C02, C03 => C03,
            C10 => C10, C11 => C11, C12 => C12, C13 => C13,
            C20 => C20, C21 => C21, C22 => C22, C23 => C23,
            C30 => C30, C31 => C31, C32 => C32, C33 => C33
        );

    stim : process
        variable r : integer;
        variable c : integer;
        variable addr : integer;
    begin
        RST <= '1';
        start <= '0';
        we_A <= '0';
        we_B <= '0';
        wait for 3*TCLK;
        RST <= '0';
        wait until rising_edge(CLK);

        -- Load A (row-major)
        for r in 0 to 3 loop
            for c in 0 to 3 loop
                addr := r*4 + c;
                addr_A <= to_unsigned(addr, 4);
                data_A <= to_slv16(A(r,c));
                we_A <= '1';
                wait until rising_edge(CLK);
            end loop;
        end loop;
        we_A <= '0';
        wait until rising_edge(CLK);

        -- Load B (row-major)
        for r in 0 to 3 loop
            for c in 0 to 3 loop
                addr := r*4 + c;
                addr_B <= to_unsigned(addr, 4);
                data_B <= to_slv16(B(r,c));
                we_B <= '1';
                wait until rising_edge(CLK);
            end loop;
        end loop;
        we_B <= '0';
        wait until rising_edge(CLK);

        -- Start run (one pulse)
        start <= '1';
        wait until rising_edge(CLK);
        start <= '0';

        -- Wait for done
        while done /= '1' loop
            wait until rising_edge(CLK);
        end loop;

        -- Since B = I, expect C = A
        assert C00 = to_slv32(A(0,0)) report "Mismatch C00" severity failure;
        assert C01 = to_slv32(A(0,1)) report "Mismatch C01" severity failure;
        assert C02 = to_slv32(A(0,2)) report "Mismatch C02" severity failure;
        assert C03 = to_slv32(A(0,3)) report "Mismatch C03" severity failure;

        assert C10 = to_slv32(A(1,0)) report "Mismatch C10" severity failure;
        assert C11 = to_slv32(A(1,1)) report "Mismatch C11" severity failure;
        assert C12 = to_slv32(A(1,2)) report "Mismatch C12" severity failure;
        assert C13 = to_slv32(A(1,3)) report "Mismatch C13" severity failure;

        assert C20 = to_slv32(A(2,0)) report "Mismatch C20" severity failure;
        assert C21 = to_slv32(A(2,1)) report "Mismatch C21" severity failure;
        assert C22 = to_slv32(A(2,2)) report "Mismatch C22" severity failure;
        assert C23 = to_slv32(A(2,3)) report "Mismatch C23" severity failure;

        assert C30 = to_slv32(A(3,0)) report "Mismatch C30" severity failure;
        assert C31 = to_slv32(A(3,1)) report "Mismatch C31" severity failure;
        assert C32 = to_slv32(A(3,2)) report "Mismatch C32" severity failure;
        assert C33 = to_slv32(A(3,3)) report "Mismatch C33" severity failure;

        report "PASS: FSM top 4x4 produced correct result for B=I (C=A)" severity note;
        wait;
    end process;

end Behavioral;
