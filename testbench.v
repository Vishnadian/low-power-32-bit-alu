`timescale 1ns/1ps

module tb_alu;

reg [31:0] A, B;
reg [2:0] sel;
reg enable;
wire [31:0] result;

// Instantiate ALU
low_power_alu uut (
    .A(A),
    .B(B),
    .sel(sel),
    .enable(enable),
    .result(result)
);

// Generate VCD waveform
initial begin
    $dumpfile("alu_waveform.vcd");   // Output VCD file
    $dumpvars(0, tb_alu);            // Dump all signals in tb_alu
end

initial begin
    $display("Time\tEnable\tSel\tA\tB\tResult");

    enable = 1;
    A = 10;
    B = 5;

    sel = 3'b000; #10; // ADD
    $display("%0t\t%b\t%03b\t%d\t%d\t%d", $time, enable, sel, A, B, result);

    sel = 3'b001; #10; // SUB
    $display("%0t\t%b\t%03b\t%d\t%d\t%d", $time, enable, sel, A, B, result);

    sel = 3'b010; #10; // AND
    $display("%0t\t%b\t%03b\t%d\t%d\t%d", $time, enable, sel, A, B, result);

    sel = 3'b011; #10; // OR
    $display("%0t\t%b\t%03b\t%d\t%d\t%d", $time, enable, sel, A, B, result);

    sel = 3'b100; #10; // XOR
    $display("%0t\t%b\t%03b\t%d\t%d\t%d", $time, enable, sel, A, B, result);

    sel = 3'b101; #10; // SHIFT LEFT
    $display("%0t\t%b\t%03b\t%d\t%d\t%d", $time, enable, sel, A, B, result);

    sel = 3'b110; #10; // SHIFT RIGHT
    $display("%0t\t%b\t%03b\t%d\t%d\t%d", $time, enable, sel, A, B, result);

    // Disable ALU (Low Power Mode)
    enable = 0;
    sel = 3'b000; #10;
    $display("%0t\t%b\t%03b\t%d\t%d\t%d (Disabled)", $time, enable, sel, A, B, result);

    $finish;
end

endmodule
