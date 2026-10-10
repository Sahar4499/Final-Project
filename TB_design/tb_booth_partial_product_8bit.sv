`timescale 1ns/1ps

module tb_booth_partial_product_8bit;
    logic [7:0] a;
    logic sel_1x;
    logic sel_2x;
    logic neg;
    logic [15:0] pp;

    booth_partial_product_8bit dut (
        .a(a),
        .sel_1x(sel_1x),
        .sel_2x(sel_2x),
        .neg(neg),
        .pp(pp)
    );

    function automatic logic [15:0] expected_pp(
        input logic [7:0] fa,
        input logic fsel_1x,
        input logic fsel_2x,
        input logic fneg
    );
        logic [8:0] raw;
        begin
            raw[0] = ((fa[0] & fsel_1x) | (1'b0 & fsel_2x)) ^ fneg;
            for (int i = 1; i <= 7; i++) begin
                raw[i] = ((fa[i] & fsel_1x) | (fa[i - 1] & fsel_2x)) ^ fneg;
            end
            raw[8] = ((fa[7] & fsel_1x) | (fa[7] & fsel_2x)) ^ fneg;
            expected_pp = {{7{raw[8]}}, raw};
        end
    endfunction

    task automatic check(
        input logic [7:0] ta,
        input logic tsel_1x,
        input logic tsel_2x,
        input logic tneg
    );
        logic [15:0] expected;
        begin
            a = ta;
            sel_1x = tsel_1x;
            sel_2x = tsel_2x;
            neg = tneg;
            #1;
            expected = expected_pp(ta, tsel_1x, tsel_2x, tneg);
            if (pp !== expected) begin
                $fatal(1, "booth_partial_product_8bit failed: a=%02h sel_1x=%0b sel_2x=%0b neg=%0b expected=%04h got=%04h",
                       ta, tsel_1x, tsel_2x, tneg, expected, pp);
            end
        end
    endtask

    initial begin
        check(8'h00, 1'b0, 1'b0, 1'b0); // zero row
        check(8'h00, 1'b0, 1'b0, 1'b1); // inverted zero row
        check(8'h01, 1'b1, 1'b0, 1'b0); // 1x, LSB only
        check(8'h80, 1'b1, 1'b0, 1'b0); // 1x, MSB sign extension
        check(8'h55, 1'b1, 1'b0, 1'b1); // negative 1x pattern
        check(8'h0f, 1'b0, 1'b1, 1'b0); // 2x lower bits
        check(8'hf0, 1'b0, 1'b1, 1'b0); // 2x upper bits
        check(8'ha5, 1'b0, 1'b1, 1'b1); // negative 2x pattern
        check(8'hff, 1'b1, 1'b1, 1'b0); // both selects asserted
        $display("tb_booth_partial_product_8bit passed");
        $finish;
    end
endmodule
