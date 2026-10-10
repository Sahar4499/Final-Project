`timescale 1ns/1ps

module tb_csa_layer_32bit;
    logic [31:0] row_a;
    logic [31:0] row_b;
    logic [31:0] row_c;
    logic [31:0] sum_out;
    logic [31:0] carry_out;

    csa_layer_32bit dut (
        .row_a(row_a),
        .row_b(row_b),
        .row_c(row_c),
        .sum_out(sum_out),
        .carry_out(carry_out)
    );

    task automatic check(input logic [31:0] a, input logic [31:0] b, input logic [31:0] c);
        logic [31:0] exp_sum;
        logic [31:0] exp_carry;
        begin
            row_a = a;
            row_b = b;
            row_c = c;
            #1;
            exp_sum = a ^ b ^ c;
            exp_carry = (a & b) | (a & c) | (b & c);
            if (sum_out !== exp_sum || carry_out !== exp_carry) begin
                $fatal(1, "csa_layer_32bit failed: a=%08h b=%08h c=%08h expected sum=%08h carry=%08h got sum=%08h carry=%08h",
                       a, b, c, exp_sum, exp_carry, sum_out, carry_out);
            end
        end
    endtask

    initial begin
        check(32'h0000_0000, 32'h0000_0000, 32'h0000_0000);
        check(32'hffff_ffff, 32'h0000_0000, 32'h0000_0000);
        check(32'hffff_ffff, 32'hffff_ffff, 32'hffff_ffff);
        check(32'ha5a5_5a5a, 32'h0f0f_f0f0, 32'h3333_cccc);
        check(32'h8000_0000, 32'h8000_0000, 32'h0000_0000);
        check(32'h0000_0001, 32'h0000_0001, 32'h0000_0001);
        check(32'hffff_0000, 32'h00ff_00ff, 32'h5555_aaaa);
        $display("tb_csa_layer_32bit passed");
        $finish;
    end
endmodule
