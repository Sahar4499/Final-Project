`timescale 1ns/1ps

module tb_mult8x8;
    logic [7:0] a;
    logic [7:0] b;
    logic [15:0] p;

    mult8x8 dut (
        .a(a),
        .b(b),
        .p(p)
    );

    task automatic check(input logic [7:0] ta, input logic [7:0] tb);
        logic [15:0] ta_ext;
        logic [15:0] tb_ext;
        logic [15:0] expected;
        begin
            a = ta;
            b = tb;
            #1;
            ta_ext = ta;
            tb_ext = tb;
            expected = ta_ext * tb_ext;
            if (p !== expected) begin
                $fatal(1, "mult8x8 failed: a=%0d b=%0d expected=%0d/%04h got=%0d/%04h",
                       ta, tb, expected, expected, p, p);
            end
        end
    endtask

    initial begin
        check(0, 0);
        check(1, 1);
        check(3, 5);
        check(8'hff, 8'h02);
        check(8'h80, 8'h80);
        check(8'hff, 8'hff);
        check(8'h00, 8'ha5);
        check(8'h55, 8'h03);
        check(8'h0f, 8'h10);
        $display("tb_mult8x8 passed");
        $finish;
    end
endmodule
