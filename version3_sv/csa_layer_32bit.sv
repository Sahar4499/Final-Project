module csa_layer_32bit (
    input  logic [31:0] row_a,
    input  logic [31:0] row_b,
    input  logic [31:0] row_c,
    output logic [31:0] sum_out,
    output logic [31:0] carry_out
);

    genvar i;
    generate
        // In Virtuoso: Instance of FA<0:31>
        for (i = 0; i < 32; i++) begin : GEN_FA
            full_adder FA_INST (
                .a(row_a[i]),
                .b(row_b[i]),
                .cin(row_c[i]),
                .sum(sum_out[i]),
                .cout(carry_out[i]) // Carry will be shifted left in the next layer
            );
        end
    endgenerate

endmodule
