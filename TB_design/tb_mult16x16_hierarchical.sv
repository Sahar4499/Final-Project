`timescale 1ns/1ps

module tb_mult16x16_hierarchical;
    logic [15:0] a;
    logic [15:0] b;
    logic [31:0] p;

    mult16x16_hierarchical dut (
        .a(a),
        .b(b),
        .p(p)
    );

    task automatic check(input logic [15:0] ta, input logic [15:0] tb);
        logic [31:0] ta_ext;
        logic [31:0] tb_ext;
        logic [31:0] expected;
        begin
            a = ta;
            b = tb;
            #1;
            ta_ext = ta;
            tb_ext = tb;
            expected = ta_ext * tb_ext;
            if (p !== expected) begin
                $fatal(1, "mult16x16_hierarchical failed: a=%0d b=%0d expected=%0d/%08h got=%0d/%08h",
                       ta, tb, expected, expected, p, p);
            end
        end
    endtask

    initial begin
        check(16'd0, 16'd0);
        check(16'd1, 16'd1);
        check(16'd15, 16'd15);
        check(16'd255, 16'd2);
        check(16'hffff, 16'd2);
        check(16'h8000, 16'h8000);
        check(16'hffff, 16'hffff);
        check(16'h0000, 16'ha5a5);
        check(16'h00ff, 16'h0101);
        check(16'h1234, 16'h00f0);
        $display("tb_mult16x16_hierarchical passed");
        $finish;
    end
endmodule
