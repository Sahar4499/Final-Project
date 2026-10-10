`timescale 1ns/1ps

module tb_booth_encoder;
    logic [2:0] b_triplet;
    logic sel_1x;
    logic sel_2x;
    logic neg;

    booth_encoder dut (
        .b_triplet(b_triplet),
        .sel_1x(sel_1x),
        .sel_2x(sel_2x),
        .neg(neg)
    );

    task automatic check(input logic [2:0] triplet);
        logic exp_sel_1x;
        logic exp_sel_2x;
        logic exp_neg;
        begin
            b_triplet = triplet;
            #1;
            exp_sel_1x = triplet[1] ^ triplet[0];
            exp_sel_2x = (~triplet[2] & triplet[1] & triplet[0]) |
                         ( triplet[2] & ~triplet[1] & ~triplet[0]);
            exp_neg = triplet[2];
            if ({sel_1x, sel_2x, neg} !== {exp_sel_1x, exp_sel_2x, exp_neg}) begin
                $fatal(1, "booth_encoder failed: triplet=%03b expected=%03b got=%03b",
                       triplet, {exp_sel_1x, exp_sel_2x, exp_neg}, {sel_1x, sel_2x, neg});
            end
        end
    endtask

    initial begin
        check(3'b000); // zero
        check(3'b001); // +1
        check(3'b010); // +1
        check(3'b011); // +2
        check(3'b100); // -2
        check(3'b101); // -1
        check(3'b110); // -1
        check(3'b111); // zero negative region
        $display("tb_booth_encoder passed");
        $finish;
    end
endmodule
