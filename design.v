module low_power_alu (
    input  [31:0] A, B,
    input  [2:0] sel,
    input  enable,
    output reg [31:0] result
);

always @(*) begin
    if (!enable)
        result = 32'b0;  // Operand isolation (low power)
    else begin
        case(sel)
            3'b000: result = A + B;      // ADD
            3'b001: result = A - B;      // SUB
            3'b010: result = A & B;      // AND
            3'b011: result = A | B;      // OR
            3'b100: result = A ^ B;      // XOR
            3'b101: result = A << 1;     // SHIFT LEFT
            3'b110: result = A >> 1;     // SHIFT RIGHT
            default: result = 32'b0;
        endcase
    end
end

endmodule
