module ripple_adder_32bit (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic        cin,
    output logic [31:0] sum,
    output logic        cout
);

    logic [32:0] c;

    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : GEN_FA
            full_adder FA_INST (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(c[i+1])
            );
        end
    endgenerate

    assign cout = c[32];

endmodule
