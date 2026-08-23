// csa_layer_32bit.sv
module csa_layer_32bit (
    input  logic [31:0] row_a, row_b, row_c,
    output logic [31:0] sum_out, carry_out
);
    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : GEN_FA
            full_adder FA_INST (
                .a(row_a[i]), 
                .b(row_b[i]), 
                .cin(row_c[i]), 
                .sum(sum_out[i]), 
                .cout(carry_out[i]) // Shift left happens at the next layer
            );
        end
    endgenerate
endmodule