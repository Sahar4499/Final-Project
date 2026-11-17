`timescale 1ns / 1ps

module tb_booth_multiplier_8x8;

    // Testbench signals
    logic signed [7:0]  a_tb;
    logic signed [7:0]  b_tb;
    logic signed [15:0] p_tb;
    
    // DUT Instantiation
    booth_multiplier_8x8 DUT (
        .a(a_tb),
        .b(b_tb),
        .p(p_tb)
    );

    initial begin
	logic signed [15:0] expected_v;
	$dumpfile("dump.vcd");
    	$dumpvars(0, tb_booth_multiplier_8x8);

        //----------------------------------------------------------------
        // Test 1 : 3 * 2 = 6
        //----------------------------------------------------------------
        a_tb = 3;
        b_tb = 2;
        #20;
        
        expected_v = 3 * 2;
        assert (p_tb === expected_v) else $error("Test 1 failed: 3 * 2 /= output");

        //----------------------------------------------------------------
        // Test 2 : 5 * 3 = 15
        //----------------------------------------------------------------
        a_tb = 5;
        b_tb = 3;
        #20;
        
        expected_v = 5 * 3;
        assert (p_tb === expected_v) else $error("Test 2 failed: 5 * 3 /= output");

        //----------------------------------------------------------------
        // Test 3 : -3 * 2 = -6
        //----------------------------------------------------------------
        a_tb = -3;
        b_tb = 2;
        #20;
        
        expected_v = -3 * 2;
        assert (p_tb === expected_v) else $error("Test 3 failed: -3 * 2 /= output");

        //----------------------------------------------------------------
        // Test 4 : -4 * -2 = 8
        //----------------------------------------------------------------
        a_tb = -4;
        b_tb = -2;
        #20;
        
        expected_v = (-4) * (-2);
        assert (p_tb === expected_v) else $error("Test 4 failed: -4 * -2 /= output");

        //----------------------------------------------------------------
        // Test 5 : 7 * -1 = -7
        //----------------------------------------------------------------
        a_tb = 7;
        b_tb = -1;
        #20;
        
        expected_v = 7 * (-1);
        assert (p_tb === expected_v) else $error("Test 5 failed: 7 * -1 /= output");

        //----------------------------------------------------------------
        // Test 6 : 0 * 12 = 0
        //----------------------------------------------------------------
        a_tb = 0;
        b_tb = 12;
        #20;
        
        expected_v = 0 * 12;
        assert (p_tb === expected_v) else $error("Test 6 failed: 0 * 12 /= output");

        //----------------------------------------------------------------
        // Test 7 : 12 * 0 = 0
        //----------------------------------------------------------------
        a_tb = 12;
        b_tb = 0;
        #20;
        
        expected_v = 12 * 0;
        assert (p_tb === expected_v) else $error("Test 7 failed: 12 * 0 /= output");

        //----------------------------------------------------------------
        // Test 8 : 15 * 15 = 225
        //----------------------------------------------------------------
        a_tb = 15;
        b_tb = 15;
        #20;
        
        expected_v = 15 * 15;
        assert (p_tb === expected_v) else $error("Test 8 failed: 15 * 15 /= output");

        //----------------------------------------------------------------
        // Test 9 : -8 * 7 = -56
        //----------------------------------------------------------------
        a_tb = -8;
        b_tb = 7;
        #20;
        
        expected_v = (-8) * 7;
        assert (p_tb === expected_v) else $error("Test 9 failed: -8 * 7 /= output");

        //----------------------------------------------------------------
        // Test 10 : -16 * -4 = 64
        //----------------------------------------------------------------
        a_tb = -16;
        b_tb = -4;
        #20;
        
        expected_v = (-16) * (-4);
        assert (p_tb === expected_v) else $error("Test 10 failed: -16 * -4 /= output");

        $display("All tests completed");
        $finish;

    end

endmodule
