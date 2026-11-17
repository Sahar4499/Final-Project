module mult16x16_hierarchical (
    input  logic [15:0] a,
    input  logic [15:0] b,
    output logic [31:0] p
);

    logic [15:0] p_ll, p_lh, p_hl, p_hh;
    logic [31:0] term1, term2, term3, term4;

    // 4 Instances of the 8x8 multiplier
    mult8x8 MULT_LL (
        .a(a[7:0]),  
        .b(b[7:0]),  
        .p(p_ll)
    );

    mult8x8 MULT_LH (
        .a(a[15:8]), 
        .b(b[7:0]),  
        .p(p_lh)
    );

    mult8x8 MULT_HL (
        .a(a[7:0]),  
        .b(b[15:8]), 
        .p(p_hl)
    );

    mult8x8 MULT_HH (
        .a(a[15:8]), 
        .b(b[15:8]), 
        .p(p_hh)
    );

    // Alignment and Summation (The 16x16 logic)
    assign term1 = {16'b0, p_ll};
    assign term2 = {16'b0, p_lh} << 8;
    assign term3 = {16'b0, p_hl} << 8;
    assign term4 = {16'b0, p_hh} << 16;

    assign p = term1 + term2 + term3 + term4;

endmodule
