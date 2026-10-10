`timescale 1ns/1ps

module tb_systolic_array_2x2;
    logic clk;
    logic rst_n;
    logic signed [7:0] a_in_0;
    logic signed [7:0] a_in_1;
    logic signed [7:0] b_in_0;
    logic signed [7:0] b_in_1;
    logic signed [15:0] c_out_00;
    logic signed [15:0] c_out_01;
    logic signed [15:0] c_out_10;
    logic signed [15:0] c_out_11;

    systolic_array_2x2 dut (
        .clk(clk),
        .rst_n(rst_n),
        .a_in_0(a_in_0),
        .a_in_1(a_in_1),
        .b_in_0(b_in_0),
        .b_in_1(b_in_1),
        .c_out_00(c_out_00),
        .c_out_01(c_out_01),
        .c_out_10(c_out_10),
        .c_out_11(c_out_11)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    task automatic tick;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    initial begin
        logic signed [15:0] exp_00;
        logic signed [15:0] exp_01;
        logic signed [15:0] exp_10;
        logic signed [15:0] exp_11;

        a_in_0 = '0;
        a_in_1 = '0;
        b_in_0 = '0;
        b_in_1 = '0;
        rst_n = 1'b0;
        tick();
        if (c_out_00 !== 16'sd0 || c_out_01 !== 16'sd0 ||
            c_out_10 !== 16'sd0 || c_out_11 !== 16'sd0) begin
            $fatal(1, "systolic_array_2x2 reset failed");
        end

        rst_n = 1'b1;
        exp_00 = 16'sd0;
        exp_01 = 16'sd0;
        exp_10 = 16'sd0;
        exp_11 = 16'sd0;

        a_in_0 = 8'sd2;
        a_in_1 = 8'sd4;
        b_in_0 = 8'sd3;
        b_in_1 = 8'sd5;
        tick();
        exp_00 += 16'sd2 * 16'sd3;
        exp_01 += 16'sd0 * 16'sd5;
        exp_10 += 16'sd4 * 16'sd0;
        exp_11 += 16'sd0 * 16'sd0;

        a_in_0 = -8'sd1;
        a_in_1 = 8'sd7;
        b_in_0 = -8'sd2;
        b_in_1 = 8'sd6;
        tick();
        exp_00 += -16'sd1 * -16'sd2;
        exp_01 += 16'sd2 * 16'sd6;
        exp_10 += 16'sd7 * 16'sd3;
        exp_11 += 16'sd4 * 16'sd5;

        a_in_0 = 8'sd0;
        a_in_1 = 8'sd0;
        b_in_0 = 8'sd0;
        b_in_1 = 8'sd0;
        tick();
        exp_00 += 16'sd0;
        exp_01 += -16'sd1 * 16'sd0;
        exp_10 += 16'sd0 * -16'sd2;
        exp_11 += 16'sd7 * 16'sd6;

        tick();
        exp_11 += 16'sd0;

        if (c_out_00 !== exp_00 || c_out_01 !== exp_01 ||
            c_out_10 !== exp_10 || c_out_11 !== exp_11) begin
            $fatal(1, "systolic_array_2x2 failed: expected C00=%0d C01=%0d C10=%0d C11=%0d got C00=%0d C01=%0d C10=%0d C11=%0d",
                   exp_00, exp_01, exp_10, exp_11, c_out_00, c_out_01, c_out_10, c_out_11);
        end

        rst_n = 1'b0;
        tick();
        if (c_out_00 !== 16'sd0 || c_out_01 !== 16'sd0 ||
            c_out_10 !== 16'sd0 || c_out_11 !== 16'sd0) begin
            $fatal(1, "systolic_array_2x2 second reset failed");
        end

        $display("tb_systolic_array_2x2 passed");
        $finish;
    end
endmodule
