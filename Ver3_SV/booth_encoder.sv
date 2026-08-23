// booth_encoder.sv
module booth_encoder (
    input  logic [2:0] b_triplet, // {b(i+1), b(i), b(i-1)}
    output logic       sel_1x,    // Select A
    output logic       sel_2x,    // Select 2A
    output logic       neg        // Sign bit (Invert for negative)
);
    assign sel_1x = b_triplet[1] ^ b_triplet[0];
    assign sel_2x = (~b_triplet[2] & b_triplet[1] & b_triplet[0]) | 
                    (b_triplet[2] & ~b_triplet[1] & ~b_triplet[0]);
    assign neg    = b_triplet[2];
endmodule