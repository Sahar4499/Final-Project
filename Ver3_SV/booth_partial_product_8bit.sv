// booth_partial_product_8bit.sv
module booth_partial_product_8bit (
    input  logic [7:0] a,
    input  logic       sel_1x,
    input  logic       sel_2x,
    input  logic       neg,
    output logic [15:0] pp
);
    logic [8:0] pp_raw;

    booth_bit_cell BIT0 (
        .a_j(a[0]), .a_prev(1'b0), 
        .sel_1x(sel_1x), .sel_2x(sel_2x), .neg(neg), .pp_bit(pp_raw[0])
    );

    genvar i;
    generate
        for (i = 1; i <= 7; i++) begin : GEN_BITS
            booth_bit_cell BC (
                .a_j(a[i]), .a_prev(a[i-1]), 
                .sel_1x(sel_1x), .sel_2x(sel_2x), .neg(neg), .pp_bit(pp_raw[i])
            );
        end
    endgenerate

    booth_bit_cell BIT8 (
        .a_j(a[7]), .a_prev(a[7]), 
        .sel_1x(sel_1x), .sel_2x(sel_2x), .neg(neg), .pp_bit(pp_raw[8])
    );

    assign pp[8:0]  = pp_raw;
    assign pp[15:9] = {7{pp_raw[8]}}; // Sign extension
endmodule