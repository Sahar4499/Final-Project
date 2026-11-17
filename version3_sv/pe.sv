module pe (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [7:0]  a_in,
    input  logic [7:0]  b_in,
    output logic [7:0]  a_out,
    output logic [7:0]  b_out,
    output logic [15:0] c_out
);

    logic [15:0] mult_result;

    booth_multiplier_8x8 u_mult (
        .a (a_in),
        .b (b_in),
        .p (mult_result)
    );

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_out <= 8'b0;
            b_out <= 8'b0;
            c_out <= 16'b0;
        end else begin
            a_out <= a_in;
            b_out <= b_in;
            c_out <= c_out + mult_result;
        end
    end

endmodule
