library ieee;
use ieee.std_logic_1164.all;

entity booth_multiplier_8x8 is
    port (
        a : in  std_logic_vector(7 downto 0);
        b : in  std_logic_vector(7 downto 0);
        p : out std_logic_vector(15 downto 0)
    );
end entity;

architecture structural of booth_multiplier_8x8 is

    component booth_encoder is
        port (
            b_triplet : in  std_logic_vector(2 downto 0);
            sel_1x    : out std_logic;
            sel_2x    : out std_logic;
            neg       : out std_logic
        );
    end component;

    component booth_partial_product_8bit is
        port (
            a      : in  std_logic_vector(7 downto 0);
            sel_1x : in  std_logic;
            sel_2x : in  std_logic;
            neg    : in  std_logic;
            pp     : out std_logic_vector(15 downto 0)
        );
    end component;

    component csa_layer_32bit is
        port (
            row_a, row_b, row_c : in  std_logic_vector(31 downto 0);
            sum_out             : out std_logic_vector(31 downto 0);
            carry_out           : out std_logic_vector(31 downto 0)
        );
    end component;

    component ripple_adder_32bit is
        port (
            a    : in  std_logic_vector(31 downto 0);
            b    : in  std_logic_vector(31 downto 0);
            cin  : in  std_logic;
            sum  : out std_logic_vector(31 downto 0);
            cout : out std_logic
        );
    end component;

    signal triplet0, triplet1, triplet2, triplet3 : std_logic_vector(2 downto 0);
    signal sel_1x_0, sel_1x_1, sel_1x_2, sel_1x_3 : std_logic;
    signal sel_2x_0, sel_2x_1, sel_2x_2, sel_2x_3 : std_logic;
    signal neg_0,    neg_1,    neg_2,    neg_3    : std_logic;
    signal pp0, pp1, pp2, pp3 : std_logic_vector(15 downto 0);

    signal pp0_aligned, pp1_aligned, pp2_aligned, pp3_aligned : std_logic_vector(31 downto 0);
    signal corr_row : std_logic_vector(31 downto 0);

    signal sum1, carry1, sum2, carry2, sum3, carry3 : std_logic_vector(31 downto 0);
    signal carry1_s, carry2_s, carry3_s : std_logic_vector(31 downto 0);
    signal final_sum : std_logic_vector(31 downto 0);
    signal final_cout : std_logic;

begin

    -- Booth triplets definition
    triplet0 <= b(1) & b(0) & '0';
    triplet1 <= b(3) & b(2) & b(1);
    triplet2 <= b(5) & b(4) & b(3);
    triplet3 <= b(7) & b(6) & b(5);

    -- Encoders
    ENC0: booth_encoder port map (triplet0, sel_1x_0, sel_2x_0, neg_0);
    ENC1: booth_encoder port map (triplet1, sel_1x_1, sel_2x_1, neg_1);
    ENC2: booth_encoder port map (triplet2, sel_1x_2, sel_2x_2, neg_2);
    ENC3: booth_encoder port map (triplet3, sel_1x_3, sel_2x_3, neg_3);

    -- PP Generators
    PP0_GEN: booth_partial_product_8bit port map (a, sel_1x_0, sel_2x_0, neg_0, pp0);
    PP1_GEN: booth_partial_product_8bit port map (a, sel_1x_1, sel_2x_1, neg_1, pp1);
    PP2_GEN: booth_partial_product_8bit port map (a, sel_1x_2, sel_2x_2, neg_2, pp2);
    PP3_GEN: booth_partial_product_8bit port map (a, sel_1x_3, sel_2x_3, neg_3, pp3);

    -- Alignment Process with Zero Padding
    process(pp0, pp1, pp2, pp3, neg_0, neg_1, neg_2, neg_3)
        variable v_pp0, v_pp1, v_pp2, v_pp3, v_corr : std_logic_vector(31 downto 0);
    begin
        -- Initialize all to zero first to ensure correct padding below shift
        v_pp0 := (others => '0'); v_pp1 := (others => '0');
        v_pp2 := (others => '0'); v_pp3 := (others => '0');
        v_corr := (others => '0');

        -- Row 0: Shift 0
        v_pp0(15 downto 0) := pp0;
        v_pp0(31 downto 16) := (others => pp0(15)); -- Sign Extension

        -- Row 1: Shift 2
        v_pp1(17 downto 2) := pp1;
        v_pp1(31 downto 18) := (others => pp1(15)); -- Sign Extension

        -- Row 2: Shift 4
        v_pp2(19 downto 4) := pp2;
        v_pp2(31 downto 20) := (others => pp2(15)); -- Sign Extension

        -- Row 3: Shift 6
        v_pp3(21 downto 6) := pp3;
        v_pp3(31 downto 22) := (others => pp3(15)); -- Sign Extension

        -- Correction Row (neg bits for 2's complement)
        v_corr(0) := neg_0;
        v_corr(2) := neg_1;
        v_corr(4) := neg_2;
        v_corr(6) := neg_3;

        pp0_aligned <= v_pp0; pp1_aligned <= v_pp1;
        pp2_aligned <= v_pp2; pp3_aligned <= v_pp3;
        corr_row    <= v_corr;
    end process;

    -- Carry shifts for CSA Tree
    carry1_s <= carry1(30 downto 0) & '0';
    carry2_s <= carry2(30 downto 0) & '0';
    carry3_s <= carry3(30 downto 0) & '0';

    -- CSA Tree (5 rows -> 2 rows)
    CSA1: csa_layer_32bit port map (pp0_aligned, pp1_aligned, pp2_aligned, sum1, carry1);
    CSA2: csa_layer_32bit port map (sum1, carry1_s, pp3_aligned, sum2, carry2);
    CSA3: csa_layer_32bit port map (sum2, carry2_s, corr_row, sum3, carry3);

    -- Final Addition
    ADD_FINAL: ripple_adder_32bit port map (sum3, carry3_s, '0', final_sum, final_cout);

    -- Output Truncation
    p <= final_sum(15 downto 0);

end architecture;