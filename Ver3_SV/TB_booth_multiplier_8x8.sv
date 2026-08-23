// tb_booth_multiplier_8x8.sv
module tb_booth_multiplier_8x8;
    logic [7:0] a_tb, b_tb;
    logic [15:0] p_tb;
    logic signed [15:0] expected_v;

    booth_multiplier_8x8 DUT (
        .a(a_tb), .b(b_tb), .p(p_tb)
    );

    initial begin
        $shm_open("waves.shm");
        $shm_probe("AS"); // "AS"
        $display("Starting Top Level Tests...");

        // Test 1: 3 * 2 = 6
        a_tb = 8'sd3; b_tb = 8'sd2; #20;
        expected_v = 16'sd6;
        if ($signed(p_tb) !== expected_v) $error("Test 1 failed");

        // Test 2: 5 * 3 = 15
        a_tb = 8'sd5; b_tb = 8'sd3; #20;
        expected_v = 16'sd15;
        if ($signed(p_tb) !== expected_v) $error("Test 2 failed");

        // Test 3: -3 * 2 = -6
        a_tb = -8'sd3; b_tb = 8'sd2; #20;
        expected_v = -16'sd6;
        if ($signed(p_tb) !== expected_v) $error("Test 3 failed");

        // Test 4: -4 * -2 = 8
        a_tb = -8'sd4; b_tb = -8'sd2; #20;
        expected_v = 16'sd8;
        if ($signed(p_tb) !== expected_v) $error("Test 4 failed");

        // Test 5: 0 * 12 = 0
        a_tb = 8'sd0; b_tb = 8'sd12; #20;
        expected_v = 16'sd0;
        if ($signed(p_tb) !== expected_v) $error("Test 5 failed");

        $display("Top Level Multiplier Tests Completed");
        $finish;
    end
endmodule