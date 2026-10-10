`timescale 1ns/1ps

module tb_pe;
    logic clk;
    logic rst_n;
    logic signed [7:0] a_in;
    logic signed [7:0] b_in;
    logic signed [7:0] a_out;
    logic signed [7:0] b_out;
    logic signed [15:0] c_out;

    pe dut (
        .clk(clk),
        .rst_n(rst_n),
        .a_in(a_in),
        .b_in(b_in),
        .a_out(a_out),
        .b_out(b_out),
        .c_out(c_out)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    task automatic tick;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    task automatic drive_and_check(
        input logic signed [7:0] ta,
        input logic signed [7:0] tb,
        inout logic signed [15:0] expected_acc
    );
        logic signed [15:0] ta_ext;
        logic signed [15:0] tb_ext;
        logic signed [15:0] expected_product;
        begin
            a_in = ta;
            b_in = tb;
            ta_ext = ta;
            tb_ext = tb;
            expected_product = ta_ext * tb_ext;
            tick();
            expected_acc = expected_acc + expected_product;
            if (a_out !== ta || b_out !== tb || c_out !== expected_acc) begin
                $fatal(1, "pe failed: a=%0d b=%0d expected a_out=%0d b_out=%0d c_out=%0d got a_out=%0d b_out=%0d c_out=%0d",
                       ta, tb, ta, tb, expected_acc, a_out, b_out, c_out);
            end
        end
    endtask

    initial begin
        logic signed [15:0] expected_acc;
        expected_acc = 16'sd0;
        a_in = '0;
        b_in = '0;
        rst_n = 1'b0;
        tick();
        if (a_out !== 8'sd0 || b_out !== 8'sd0 || c_out !== 16'sd0) begin
            $fatal(1, "pe reset failed: a_out=%0d b_out=%0d c_out=%0d", a_out, b_out, c_out);
        end

        rst_n = 1'b1;
        drive_and_check(8'sd3, 8'sd2, expected_acc);
        drive_and_check(-8'sd4, 8'sd3, expected_acc);
        drive_and_check(8'sd5, -8'sd2, expected_acc);
        drive_and_check(-8'sd6, -8'sd3, expected_acc);
        drive_and_check(8'sd0, 8'sd99, expected_acc);

        rst_n = 1'b0;
        tick();
        if (a_out !== 8'sd0 || b_out !== 8'sd0 || c_out !== 16'sd0) begin
            $fatal(1, "pe second reset failed: a_out=%0d b_out=%0d c_out=%0d", a_out, b_out, c_out);
        end
        $display("tb_pe passed");
        $finish;
    end
endmodule
