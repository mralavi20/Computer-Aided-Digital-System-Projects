module PU (input clk, rst, en, input [31:0] x1, x2, x3, x4, w1, w2, w3, w4, output [31:0] data_out);
    wire[31:0] r1, r2, r3, r4, r5, r6, y1, y2, y3, y4;

    Multiplier M1 (x1, w1, r1);
    Multiplier M2 (x2, w2, r2);
    Multiplier M3 (x3, w3, r3);
    Multiplier M4 (x4, w4, r4);

    Register R1 (clk, rst, en, r1, y1);
    Register R2 (clk, rst, en, r2, y2);
    Register R3 (clk, rst, en, r3, y3);
    Register R4 (clk, rst, en, r4, y4);

    Adder A1 (y1, y2, r5);
    Adder A2 (y3, y4, r6);
    Adder A5 (r5, r6, data_out);
endmodule