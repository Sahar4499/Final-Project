`timescale 1ns/1ps

module tb_ripple_adder_32bit;
    logic [31:0] a;
    logic [31:0] b;
    logic cin;
    logic [31:0] sum;
    logic cout;

    ripple_adder_32bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    task automatic check(input logic [31:0] ta, input logic [31:0] tb, input logic tcin);
        logic [32:0] expected;
        begin
            a = ta;
            b = tb;
            cin = tcin;
            #1;
            expected = {1'b0, ta} + {1'b0, tb} + tcin;
            if ({cout, sum} !== expected) begin
                $fatal(1, "ripple_adder_32bit failed: a=%08h b=%08h cin=%0b expected=%09h got=%09h",
                       ta, tb, tcin, expected, {cout, sum});
            end
        end
    endtask

    initial begin
        check(32'h0000_0000, 32'h0000_0000, 1'b0);
        check(32'h0000_0000, 32'h0000_0000, 1'b1);
        check(32'hffff_ffff, 32'h0000_0001, 1'b0);
        check(32'hffff_ffff, 32'hffff_ffff, 1'b1);
        check(32'h1234_5678, 32'h8765_4321, 1'b0);
        check(32'h7fff_ffff, 32'h0000_0001, 1'b0);
        check(32'h8000_0000, 32'h8000_0000, 1'b0);
        check(32'ha5a5_5a5a, 32'h5a5a_a5a5, 1'b1);
        $display("tb_ripple_adder_32bit passed");
        $finish;
    end
endmodule
