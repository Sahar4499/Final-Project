// booth_bit_cell.sv
module booth_bit_cell (
    input  logic a_j,      // Current bit A[j]
    input  logic a_prev,   // Previous bit A[j-1]
    input  logic sel_1x,   // From Encoder
    input  logic sel_2x,   // From Encoder
    input  logic neg,      // From Encoder
    output logic pp_bit    // Partial Product output bit
);
    logic mux_out;
    
    // Select value (Abstract 3-to-1 MUX)
    assign mux_out = (a_j & sel_1x) | (a_prev & sel_2x);
    
    // Sign inversion (XOR)
    assign pp_bit = mux_out ^ neg;
endmodule