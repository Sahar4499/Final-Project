`timescale 1ns/1ps

module tb_booth_bit_cell;
    logic a_j;
    logic a_prev;
    logic sel_1x;
    logic sel_2x;
    logic neg;
    logic pp_bit;

    booth_bit_cell dut (
        .a_j(a_j),
        .a_prev(a_prev),
        .sel_1x(sel_1x),
        .sel_2x(sel_2x),
        .neg(neg),
        .pp_bit(pp_bit)
    );

    task automatic check(input logic [4:0] v);
        logic expected;
        begin
            {a_j, a_prev, sel_1x, sel_2x, neg} = v;
            #1;
            expected = ((a_j & sel_1x) | (a_prev & sel_2x)) ^ neg;
            if (pp_bit !== expected) begin
                $fatal(1, "booth_bit_cell failed: a_j=%0b a_prev=%0b sel_1x=%0b sel_2x=%0b neg=%0b expected=%0b got=%0b",
                       a_j, a_prev, sel_1x, sel_2x, neg, expected, pp_bit);
            end
        end
    endtask

    initial begin
        check(5'b00000); // no select, positive
        check(5'b00001); // no select, inverted
        check(5'b10100); // select 1x
        check(5'b01100); // select 1x with zero a_j
        check(5'b01010); // select 2x
        check(5'b10010); // select 2x with zero a_prev
        check(5'b11110); // both selects
        check(5'b11111); // both selects with neg
        $display("tb_booth_bit_cell passed");
        $finish;
    end
endmodule
