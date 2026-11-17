`timescale 1ns/1ps

module tb_booth_multiplier_8x8;
    logic signed [7:0] a;
    logic signed [7:0] b;
    logic signed [15:0] p;

    booth_multiplier_8x8 dut (
        .a(a),
        .b(b),
        .p(p)
    );

    task automatic check(input logic signed [7:0] ta, input logic signed [7:0] tb);
        logic signed [15:0] ta_ext;
        logic signed [15:0] tb_ext;
        logic signed [15:0] expected;
        begin
            a = ta;
            b = tb;
            #1;
            ta_ext = ta;
            tb_ext = tb;
            expected = ta_ext * tb_ext;
            if (p !== expected) begin
                $fatal(1, "booth_multiplier_8x8 failed: a=%0d b=%0d expected=%0d/%04h got=%0d/%04h",
                       ta, tb, expected, expected, p, p);
            end
        end
    endtask

    initial begin
        check(0, 0);
        check(1, 1);
        check(3, 2);
        check(-3, 2);
        check(7, -1);
        check(-4, -2);
        check(8'sd127, 8'sd127);
        check(8'sh80, 8'sd1);
        check(8'sh80, -8'sd1);
        check(8'sd64, -8'sd2);
        check(8'sd0, -8'sd55);
        check(-8'sd1, -8'sd1);
        check(8'sd85, 8'sd3);
        check(-8'sd37, 8'sd11);
        $display("tb_booth_multiplier_8x8 passed");
        $finish;
    end
endmodule
