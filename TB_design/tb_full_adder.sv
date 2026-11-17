`timescale 1ns/1ps

module tb_full_adder;
    logic a;
    logic b;
    logic cin;
    logic sum;
    logic cout;

    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    task automatic check(input logic ta, input logic tb, input logic tcin);
        logic [1:0] expected;
        begin
            a = ta;
            b = tb;
            cin = tcin;
            #1;
            expected = {1'b0, ta} + {1'b0, tb} + {1'b0, tcin};
            if ({cout, sum} !== expected) begin
                $fatal(1, "full_adder failed: a=%0b b=%0b cin=%0b expected cout,sum=%02b got=%02b",
                       ta, tb, tcin, expected, {cout, sum});
            end
        end
    endtask

    initial begin
        for (int i = 0; i < 8; i++) begin
            check(i[2], i[1], i[0]);
        end
        $display("tb_full_adder passed");
        $finish;
    end
endmodule
