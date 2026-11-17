library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult8x8 is
    port(
        a : in  std_logic_vector(7 downto 0);
        b : in  std_logic_vector(7 downto 0);
        p : out std_logic_vector(15 downto 0)
    );
end entity;

architecture structural of mult8x8 is
    -- 4 partial products for 8x8 (8/2 = 4)
    type pp_array is array (0 to 3) of signed(15 downto 0);
    signal pp : pp_array;
    signal sum1, car1, sum2, car2 : signed(15 downto 0);
begin
    -- Stage 1: Booth Logic (Simplified for brevity)
    -- In Virtuoso, this would be 4 instances of your "Partial Product Row"
    process(a, b)
        variable b_ext : std_logic_vector(8 downto 0);
    begin
        b_ext := b & '0'; -- b(0) to b(7) and y(-1)=0
        for i in 0 to 3 loop
            -- Booth encoding happens here per row i
            -- pp(i) <= selected_value_shifted;
        end loop;
    end process;

    -- Stage 2: CSA Tree (Reducing 4 rows to 2)
    -- Layer 1: pp0, pp1, pp2 -> sum1, car1
    sum1 <= pp(0) xor pp(1) xor pp(2);
    car1 <= (pp(0) and pp(1)) or (pp(0) and pp(2)) or (pp(1) and pp(2));
    
    -- Layer 2: sum1, car1_shifted, pp3 -> sum2, car2
    sum2 <= sum1 xor (car1 sll 1) xor pp(3);
    car2 <= (sum1 and (car1 sll 1)) or (sum1 and pp(3)) or ((car1 sll 1) and pp(3));

    -- Final Addition
    p <= std_logic_vector(sum2 + (car2 sll 1));
end architecture;