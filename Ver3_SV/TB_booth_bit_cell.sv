// tb_booth_bit_cell.sv
module tb_booth_bit_cell;
    logic a_j, a_prev, sel_1x, sel_2x, neg;
    logic pp_bit;

    booth_bit_cell DUT (.*);

    initial begin
        $shm_open("waves.shm");
        $shm_probe("AS"); // "AS"
        $display("Testing Booth Bit Cell");
        
        // Test +1x selection
        a_j = 1; a_prev = 0; sel_1x = 1; sel_2x = 0; neg = 0; #10;
        if (pp_bit !== 1) $error("Failed +1x");

        // Test +2x selection
        a_j = 0; a_prev = 1; sel_1x = 0; sel_2x = 1; neg = 0; #10;
        if (pp_bit !== 1) $error("Failed +2x");

        // Test -1x selection
        a_j = 1; a_prev = 0; sel_1x = 1; sel_2x = 0; neg = 1; #10;
        if (pp_bit !== 0) $error("Failed -1x (Should be inverted)");

        $display("Booth Bit Cell Test Completed");
    end
endmodule