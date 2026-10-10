module systolic_array_2x2 (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [7:0]  a_in_0,
    input  logic [7:0]  a_in_1,
    input  logic [7:0]  b_in_0,
    input  logic [7:0]  b_in_1,
    output logic [15:0] c_out_00,
    output logic [15:0] c_out_01,
    output logic [15:0] c_out_10,
    output logic [15:0] c_out_11
);

    logic [7:0] a_00_to_01, a_10_to_11;
    logic [7:0] b_00_to_10, b_01_to_11;

    pe pe_00 (
        .clk(clk), .rst_n(rst_n),
        .a_in(a_in_0), .b_in(b_in_0),
        .a_out(a_00_to_01), .b_out(b_00_to_10),
        .c_out(c_out_00)
    );

    pe pe_01 (
        .clk(clk), .rst_n(rst_n),
        .a_in(a_00_to_01), .b_in(b_in_1),
        .a_out(), .b_out(b_01_to_11),
        .c_out(c_out_01)
    );

    pe pe_10 (
        .clk(clk), .rst_n(rst_n),
        .a_in(a_in_1), .b_in(b_00_to_10),
        .a_out(a_10_to_11), .b_out(),
        .c_out(c_out_10)
    );

    pe pe_11 (
        .clk(clk), .rst_n(rst_n),
        .a_in(a_10_to_11), .b_in(b_01_to_11),
        .a_out(), .b_out(),
        .c_out(c_out_11)
    );

endmodule
