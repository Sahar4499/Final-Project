// tb_booth_partial_product_8bit.sv
module tb_booth_partial_product_8bit;
    logic [7:0] a;
    logic sel_1x, sel_2x, neg;
    logic [15:0] pp;

    booth_partial_product_8bit DUT (.*);

    initial begin        
        $shm_open("waves.shm");
        $shm_probe("AS"); // "AS"
        $display("Testing Booth Partial Product");
        
        a = 8'h05; // 5

        // Test 1x
        sel_1x = 1; sel_2x = 0; neg = 0; #10;
        if (pp !== 16'h0005) $error("Failed 1x");

        // Test 2x
        sel_1x = 0; sel_2x = 1; neg = 0; #10;
        if (pp !== 16'h000A) $error("Failed 2x");

        // Test -1x (One's complement, needs +1 in CSA tree)
        sel_1x = 1; sel_2x = 0; neg = 1; #10;
        if (pp !== 16'hFFFA) $error("Failed -1x");

        $display("Booth Partial Product Test Completed");
    end
endmodule