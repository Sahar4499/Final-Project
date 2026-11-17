library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity systolic_4x4 is
    port(
        CLK : in  std_logic;
        RST : in  std_logic;
        EN  : in  std_logic;

        A0_in : in  std_logic_vector(15 downto 0);
        A1_in : in  std_logic_vector(15 downto 0);
        A2_in : in  std_logic_vector(15 downto 0);
        A3_in : in  std_logic_vector(15 downto 0);

        B0_in : in  std_logic_vector(15 downto 0);
        B1_in : in  std_logic_vector(15 downto 0);
        B2_in : in  std_logic_vector(15 downto 0);
        B3_in : in  std_logic_vector(15 downto 0);

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
        C33 : out std_logic_vector(31 downto 0);

        C_out : out std_logic_vector(511 downto 0)
    );
end entity systolic_4x4;

architecture Structural of systolic_4x4 is

    type slv16_a_bus is array (0 to 3, 0 to 4) of std_logic_vector(15 downto 0);
    type slv16_b_bus is array (0 to 4, 0 to 3) of std_logic_vector(15 downto 0);
    type slv32_array is array (0 to 3, 0 to 3) of std_logic_vector(31 downto 0);

    signal A_bus : slv16_a_bus;
    signal B_bus : slv16_b_bus;
    signal C_mat : slv32_array;

begin

    A_bus(0,0) <= A0_in;
    A_bus(1,0) <= A1_in;
    A_bus(2,0) <= A2_in;
    A_bus(3,0) <= A3_in;

    B_bus(0,0) <= B0_in;
    B_bus(0,1) <= B1_in;
    B_bus(0,2) <= B2_in;
    B_bus(0,3) <= B3_in;

    gen_i : for i in 0 to 3 generate
        gen_j : for j in 0 to 3 generate
            PE : entity work.hPE
                port map(
                    RST   => RST,
                    CLK   => CLK,
                    EN    => EN,
                    A     => A_bus(i,j),
                    B     => B_bus(i,j),
                    C     => C_mat(i,j),
                    A_out => A_bus(i,j+1),
                    B_out => B_bus(i+1,j)
                );
        end generate;
    end generate;

    C00 <= C_mat(0,0);  C01 <= C_mat(0,1);  C02 <= C_mat(0,2);  C03 <= C_mat(0,3);
    C10 <= C_mat(1,0);  C11 <= C_mat(1,1);  C12 <= C_mat(1,2);  C13 <= C_mat(1,3);
    C20 <= C_mat(2,0);  C21 <= C_mat(2,1);  C22 <= C_mat(2,2);  C23 <= C_mat(2,3);
    C30 <= C_mat(3,0);  C31 <= C_mat(3,1);  C32 <= C_mat(3,2);  C33 <= C_mat(3,3);

    C_out( 31 downto   0) <= C_mat(0,0);
    C_out( 63 downto  32) <= C_mat(0,1);
    C_out( 95 downto  64) <= C_mat(0,2);
    C_out(127 downto  96) <= C_mat(0,3);

    C_out(159 downto 128) <= C_mat(1,0);
    C_out(191 downto 160) <= C_mat(1,1);
    C_out(223 downto 192) <= C_mat(1,2);
    C_out(255 downto 224) <= C_mat(1,3);

    C_out(287 downto 256) <= C_mat(2,0);
    C_out(319 downto 288) <= C_mat(2,1);
    C_out(351 downto 320) <= C_mat(2,2);
    C_out(383 downto 352) <= C_mat(2,3);

    C_out(415 downto 384) <= C_mat(3,0);
    C_out(447 downto 416) <= C_mat(3,1);
    C_out(479 downto 448) <= C_mat(3,2);
    C_out(511 downto 480) <= C_mat(3,3);

end architecture Structural;
