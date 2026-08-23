// tb_booth_encoder.sv
module tb_booth_encoder;
    logic [2:0] b_triplet;
    logic       sel_1x, sel_2x, neg;

    booth_encoder DUT (
        .b_triplet(b_triplet),
        .sel_1x(sel_1x),
        .sel_2x(sel_2x),
        .neg(neg)
    );

    initial begin
        $shm_open("waves.shm");
        $shm_probe("AS"); // "AS"
        $display("Testing Booth Encoder");
        // Test all 8 possible combinations for Radix-4 Booth Encoding
        for (int i = 0; i < 8; i++) begin
            b_triplet = i;
            #10;
            $display("Triplet: %3b | 1x: %b | 2x: %b | neg: %b", b_triplet, sel_1x, sel_2x, neg);
        end
        $display("Booth Encoder Test Completed");
    end
endmodule