// booth_multiplier_8x8.sv
module booth_multiplier_8x8 (
    input  logic [7:0] a, b,
    output logic [15:0] p
);
    logic [2:0] triplet0, triplet1, triplet2, triplet3;
    logic sel_1x_0, sel_1x_1, sel_1x_2, sel_1x_3;
    logic sel_2x_0, sel_2x_1, sel_2x_2, sel_2x_3;
    logic neg_0, neg_1, neg_2, neg_3;
    
    logic [15:0] pp0, pp1, pp2, pp3;
    logic [31:0] pp0_aligned, pp1_aligned, pp2_aligned, pp3_aligned, corr_row;
    
    logic [31:0] sum1, carry1, sum2, carry2, sum3, carry3;
    logic [31:0] carry1_s, carry2_s, carry3_s, final_sum;
    logic final_cout;

    // Booth triplets definition
    assign triplet0 = {b[1], b[0], 1'b0};
    assign triplet1 = {b[3], b[2], b[1]};
    assign triplet2 = {b[5], b[4], b[3]};
    assign triplet3 = {b[7], b[6], b[5]};

    // Encoders
    booth_encoder ENC0 (.b_triplet(triplet0), .sel_1x(sel_1x_0), .sel_2x(sel_2x_0), .neg(neg_0));
    booth_encoder ENC1 (.b_triplet(triplet1), .sel_1x(sel_1x_1), .sel_2x(sel_2x_1), .neg(neg_1));
    booth_encoder ENC2 (.b_triplet(triplet2), .sel_1x(sel_1x_2), .sel_2x(sel_2x_2), .neg(neg_2));
    booth_encoder ENC3 (.b_triplet(triplet3), .sel_1x(sel_1x_3), .sel_2x(sel_2x_3), .neg(neg_3));

    // PP Generators
    booth_partial_product_8bit PP0_GEN (.a(a), .sel_1x(sel_1x_0), .sel_2x(sel_2x_0), .neg(neg_0), .pp(pp0));
    booth_partial_product_8bit PP1_GEN (.a(a), .sel_1x(sel_1x_1), .sel_2x(sel_2x_1), .neg(neg_1), .pp(pp1));
    booth_partial_product_8bit PP2_GEN (.a(a), .sel_1x(sel_1x_2), .sel_2x(sel_2x_2), .neg(neg_2), .pp(pp2));
    booth_partial_product_8bit PP3_GEN (.a(a), .sel_1x(sel_1x_3), .sel_2x(sel_2x_3), .neg(neg_3), .pp(pp3));

    // Alignment Process with Zero Padding
    always_comb begin
        pp0_aligned = 32'b0; pp1_aligned = 32'b0;
        pp2_aligned = 32'b0; pp3_aligned = 32'b0; 
        corr_row = 32'b0;

        pp0_aligned[15:0]  = pp0; pp0_aligned[31:16] = {16{pp0[15]}};
        pp1_aligned[17:2]  = pp1; pp1_aligned[31:18] = {14{pp1[15]}};
        pp2_aligned[19:4]  = pp2; pp2_aligned[31:20] = {12{pp2[15]}};
        pp3_aligned[21:6]  = pp3; pp3_aligned[31:22] = {10{pp3[15]}};

        corr_row[0] = neg_0; 
        corr_row[2] = neg_1;
        corr_row[4] = neg_2; 
        corr_row[6] = neg_3;
    end

    // Carry shifts for CSA Tree
    assign carry1_s = {carry1[30:0], 1'b0};
    assign carry2_s = {carry2[30:0], 1'b0};
    assign carry3_s = {carry3[30:0], 1'b0};

    // CSA Tree (5 rows -> 2 rows)
    csa_layer_32bit CSA1 (.row_a(pp0_aligned), .row_b(pp1_aligned), .row_c(pp2_aligned), .sum_out(sum1), .carry_out(carry1));
    csa_layer_32bit CSA2 (.row_a(sum1), .row_b(carry1_s), .row_c(pp3_aligned), .sum_out(sum2), .carry_out(carry2));
    csa_layer_32bit CSA3 (.row_a(sum2), .row_b(carry2_s), .row_c(corr_row), .sum_out(sum3), .carry_out(carry3));

    // Final Addition
    ripple_adder_32bit ADD_FINAL (.a(sum3), .b(carry3_s), .cin(1'b0), .sum(final_sum), .cout(final_cout));

    // Output Truncation
    assign p = final_sum[15:0];
endmodule