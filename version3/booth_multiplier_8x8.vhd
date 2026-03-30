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
            row_a     : in  std_logic_vector(31 downto 0);
            row_b     : in  std_logic_vector(31 downto 0);
            row_c     : in  std_logic_vector(31 downto 0);
            sum_out   : out std_logic_vector(31 downto 0);
            carry_out : out std_logic_vector(31 downto 0)
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

    signal pp0_aligned : std_logic_vector(31 downto 0);
    signal pp1_aligned : std_logic_vector(31 downto 0);
    signal pp2_aligned : std_logic_vector(31 downto 0);
    signal pp3_aligned : std_logic_vector(31 downto 0);

    signal corr_row : std_logic_vector(31 downto 0);

    signal sum1, carry1 : std_logic_vector(31 downto 0);
    signal sum2, carry2 : std_logic_vector(31 downto 0);

    signal carry1_shifted : std_logic_vector(31 downto 0);
    signal carry2_shifted : std_logic_vector(31 downto 0);

    signal final_sum : std_logic_vector(31 downto 0);
    signal final_cout : std_logic;

begin

    ----------------------------------------------------------------
    -- Booth triplets
    ----------------------------------------------------------------
    triplet0 <= b(1) & b(0) & '0';
    triplet1 <= b(3) & b(2) & b(1);
    triplet2 <= b(5) & b(4) & b(3);
    triplet3 <= b(7) & b(6) & b(5);

    ----------------------------------------------------------------
    -- Encoders
    ----------------------------------------------------------------
    ENC0: booth_encoder
        port map (
            b_triplet => triplet0,
            sel_1x    => sel_1x_0,
            sel_2x    => sel_2x_0,
            neg       => neg_0
        );

    ENC1: booth_encoder
        port map (
            b_triplet => triplet1,
            sel_1x    => sel_1x_1,
            sel_2x    => sel_2x_1,
            neg       => neg_1
        );

    ENC2: booth_encoder
        port map (
            b_triplet => triplet2,
            sel_1x    => sel_1x_2,
            sel_2x    => sel_2x_2,
            neg       => neg_2
        );

    ENC3: booth_encoder
        port map (
            b_triplet => triplet3,
            sel_1x    => sel_1x_3,
            sel_2x    => sel_2x_3,
            neg       => neg_3
        );

    ----------------------------------------------------------------
    -- Partial Product Generators
    ----------------------------------------------------------------
    PP0_GEN: booth_partial_product_8bit
        port map (
            a      => a,
            sel_1x => sel_1x_0,
            sel_2x => sel_2x_0,
            neg    => neg_0,
            pp     => pp0
        );

    PP1_GEN: booth_partial_product_8bit
        port map (
            a      => a,
            sel_1x => sel_1x_1,
            sel_2x => sel_2x_1,
            neg    => neg_1,
            pp     => pp1
        );

    PP2_GEN: booth_partial_product_8bit
        port map (
            a      => a,
            sel_1x => sel_1x_2,
            sel_2x => sel_2x_2,
            neg    => neg_2,
            pp     => pp2
        );

    PP3_GEN: booth_partial_product_8bit
        port map (
            a      => a,
            sel_1x => sel_1x_3,
            sel_2x => sel_2x_3,
            neg    => neg_3,
            pp     => pp3
        );

    ----------------------------------------------------------------
    -- Align partial products + correction row
    ----------------------------------------------------------------
    process(pp0, pp1, pp2, pp3, neg_0, neg_1, neg_2, neg_3)
        variable v_pp0 : std_logic_vector(31 downto 0);
        variable v_pp1 : std_logic_vector(31 downto 0);
        variable v_pp2 : std_logic_vector(31 downto 0);
        variable v_pp3 : std_logic_vector(31 downto 0);
        variable v_corr : std_logic_vector(31 downto 0);
    begin
        v_pp0  := (others => pp0(15));
        v_pp1  := (others => pp1(15));
        v_pp2  := (others => pp2(15));
        v_pp3  := (others => pp3(15));
        v_corr := (others => '0');

        v_pp0(15 downto 0) := pp0;
        v_pp1(17 downto 2) := pp1;
        v_pp2(19 downto 4) := pp2;
        v_pp3(21 downto 6) := pp3;

        v_corr(0) := neg_0;
        v_corr(2) := neg_1;
        v_corr(4) := neg_2;
        v_corr(6) := neg_3;

        pp0_aligned <= v_pp0;
        pp1_aligned <= v_pp1;
        pp2_aligned <= v_pp2;
        pp3_aligned <= v_pp3;
        corr_row    <= v_corr;
    end process;

    ----------------------------------------------------------------
    -- Carry shifts
    ----------------------------------------------------------------
    carry1_shifted <= carry1(30 downto 0) & '0';
    carry2_shifted <= carry2(30 downto 0) & '0';

    ----------------------------------------------------------------
    -- CSA stages
    ----------------------------------------------------------------
    CSA1: csa_layer_32bit
        port map (
            row_a     => pp0_aligned,
            row_b     => pp1_aligned,
            row_c     => pp2_aligned,
            sum_out   => sum1,
            carry_out => carry1
        );

    CSA2: csa_layer_32bit
        port map (
            row_a     => sum1,
            row_b     => carry1_shifted,
            row_c     => pp3_aligned,
            sum_out   => sum2,
            carry_out => carry2
        );

    ----------------------------------------------------------------
    -- Final adder
    -- כאן מחברים גם את corr_row
    ----------------------------------------------------------------
    ADD_FINAL: ripple_adder_32bit
        port map (
            a    => (sum2 xor corr_row),
            b    => carry2_shifted,
            cin  => '0',
            sum  => final_sum,
            cout => final_cout
        );

    ----------------------------------------------------------------
    -- Output
    ----------------------------------------------------------------
    p <= final_sum(15 downto 0);

end architecture;