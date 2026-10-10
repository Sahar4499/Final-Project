library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity systolic_top_4x4_fsm is
    port(
        CLK   : in  std_logic;
        RST   : in  std_logic;

        start : in  std_logic;
        done  : out std_logic;

        we_A   : in  std_logic;
        addr_A : in  unsigned(3 downto 0);
        data_A : in  std_logic_vector(15 downto 0);

        we_B   : in  std_logic;
        addr_B : in  unsigned(3 downto 0);
        data_B : in  std_logic_vector(15 downto 0);

        C00 : out std_logic_vector(31 downto 0);
        C01 : out std_logic_vector(31 downto 0);
        C02 : out std_logic_vector(31 downto 0);
        C03 : out std_logic_vector(31 downto 0);

        C10 : out std_logic_vector(31 downto 0);
        C11 : out std_logic_vector(31 downto 0);
        C12 : out std_logic_vector(31 downto 0);
        C13 : out std_logic_vector(31 downto 0);

        C20 : out std_logic_vector(31 downto 0);
        C21 : out std_logic_vector(31 downto 0);
        C22 : out std_logic_vector(31 downto 0);
        C23 : out std_logic_vector(31 downto 0);

        C30 : out std_logic_vector(31 downto 0);
        C31 : out std_logic_vector(31 downto 0);
        C32 : out std_logic_vector(31 downto 0);
        C33 : out std_logic_vector(31 downto 0)
    );
end entity;

architecture RTL of systolic_top_4x4_fsm is

    constant N         : integer := 4;
    constant FEED_LEN  : integer := 2*N - 1; -- 7 cycles: t=0..6
    constant FLUSH_LEN : integer := 20;

    type mem16 is array (0 to 15) of std_logic_vector(15 downto 0);
    signal A_mem : mem16 := (others => (others => '0'));
    signal B_mem : mem16 := (others => (others => '0'));

    signal A0_in, A1_in, A2_in, A3_in : std_logic_vector(15 downto 0) := (others => '0');
    signal B0_in, B1_in, B2_in, B3_in : std_logic_vector(15 downto 0) := (others => '0');

    type state_t is (IDLE, RUN_FEED, RUN_FLUSH, DONE_S);
    signal state : state_t := IDLE;

    signal t_cnt     : integer range 0 to FEED_LEN-1 := 0;
    signal flush_cnt : integer range 0 to FLUSH_LEN-1 := 0;

    signal done_i : std_logic := '0';

begin

    done <= done_i;

    SA : entity work.systolic_4x4
        port map(
            CLK => CLK,
            RST => RST,
            EN  => '1',

            A0_in => A0_in,  A1_in => A1_in,  A2_in => A2_in,  A3_in => A3_in,
            B0_in => B0_in,  B1_in => B1_in,  B2_in => B2_in,  B3_in => B3_in,

            C00 => C00, C01 => C01, C02 => C02, C03 => C03,
            C10 => C10, C11 => C11, C12 => C12, C13 => C13,
            C20 => C20, C21 => C21, C22 => C22, C23 => C23,
            C30 => C30, C31 => C31, C32 => C32, C33 => C33
        );

    process(CLK)
        variable t : integer;

        variable k0, k1, k2, k3 : integer;
        variable idxA, idxB     : integer;
    begin
        if rising_edge(CLK) then

            -- memory write
            if we_A = '1' then
                A_mem(to_integer(addr_A)) <= data_A;
            end if;

            if we_B = '1' then
                B_mem(to_integer(addr_B)) <= data_B;
            end if;

            if RST = '1' then
                state <= IDLE;
                t_cnt <= 0;
                flush_cnt <= 0;
                done_i <= '0';

                A0_in <= (others => '0'); A1_in <= (others => '0');
                A2_in <= (others => '0'); A3_in <= (others => '0');
                B0_in <= (others => '0'); B1_in <= (others => '0');
                B2_in <= (others => '0'); B3_in <= (others => '0');

            else
                done_i <= '0';

                case state is
                    when IDLE =>
                        A0_in <= (others => '0'); A1_in <= (others => '0');
                        A2_in <= (others => '0'); A3_in <= (others => '0');
                        B0_in <= (others => '0'); B1_in <= (others => '0');
                        B2_in <= (others => '0'); B3_in <= (others => '0');

                        t_cnt <= 0;
                        flush_cnt <= 0;

                        if start = '1' then
                            state <= RUN_FEED;
                        end if;

                    when RUN_FEED =>
                        t := t_cnt;

                        -- A(i, t-i)
                        k0 := t - 0;  k1 := t - 1;  k2 := t - 2;  k3 := t - 3;

                        if (k0 >= 0 and k0 <= 3) then idxA := 0*4 + k0; A0_in <= A_mem(idxA); else A0_in <= (others => '0'); end if;
                        if (k1 >= 0 and k1 <= 3) then idxA := 1*4 + k1; A1_in <= A_mem(idxA); else A1_in <= (others => '0'); end if;
                        if (k2 >= 0 and k2 <= 3) then idxA := 2*4 + k2; A2_in <= A_mem(idxA); else A2_in <= (others => '0'); end if;
                        if (k3 >= 0 and k3 <= 3) then idxA := 3*4 + k3; A3_in <= A_mem(idxA); else A3_in <= (others => '0'); end if;

                        -- B(t-j, j)
                        if (k0 >= 0 and k0 <= 3) then idxB := k0*4 + 0; B0_in <= B_mem(idxB); else B0_in <= (others => '0'); end if;
                        if (k1 >= 0 and k1 <= 3) then idxB := k1*4 + 1; B1_in <= B_mem(idxB); else B1_in <= (others => '0'); end if;
                        if (k2 >= 0 and k2 <= 3) then idxB := k2*4 + 2; B2_in <= B_mem(idxB); else B2_in <= (others => '0'); end if;
                        if (k3 >= 0 and k3 <= 3) then idxB := k3*4 + 3; B3_in <= B_mem(idxB); else B3_in <= (others => '0'); end if;

                        if t_cnt = FEED_LEN-1 then
                            state <= RUN_FLUSH;
                            flush_cnt <= 0;
                        else
                            t_cnt <= t_cnt + 1;
                        end if;

                    when RUN_FLUSH =>
                        A0_in <= (others => '0'); A1_in <= (others => '0');
                        A2_in <= (others => '0'); A3_in <= (others => '0');
                        B0_in <= (others => '0'); B1_in <= (others => '0');
                        B2_in <= (others => '0'); B3_in <= (others => '0');

                        if flush_cnt = FLUSH_LEN-1 then
                            state <= DONE_S;
                        else
                            flush_cnt <= flush_cnt + 1;
                        end if;

                    when DONE_S =>
                        done_i <= '1';
                        if start = '0' then
                            state <= IDLE;
                        end if;

                end case;
            end if;
        end if;
    end process;

end architecture;
