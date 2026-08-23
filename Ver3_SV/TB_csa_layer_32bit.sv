// tb_csa_layer_32bit.sv
module tb_csa_layer_32bit;
    logic [31:0] row_a, row_b, row_c;
    logic [31:0] sum_out, carry_out;

    csa_layer_32bit DUT (.*);

    initial begin
        $shm_open("waves.shm");
        $shm_probe("AS"); // "AS"
        $display("Testing CSA Layer");
        
        row_a = 32'h0000_0005;
        row_b = 32'h0000_000A;
        row_c = 32'h0000_0003;
        #10;
        
        // 5 + 10 + 3 = 18. In CSA: sum + (carry<<1) = 18
        if ((sum_out + (carry_out << 1)) !== 32'h0000_0012) 
            $error("CSA logic failed");
            
        $display("CSA Layer Test Completed");
    end
endmodule