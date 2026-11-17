module top (
    input  wire a,
    input  wire b,
    input  wire clk,
    output reg  y
);

always @(posedge clk)
begin
    y <= a & b;
end

endmodule
