module Datapath (input clk, rst, s1, input [1:0] s2, input [31:0] x1, x2, x3, x4, output z1, z2, z3, z4, output [31:0] res);
    wire [31:0] xr1, xr2, xr3 ,xr4 ,w0, w1, a1, a2, a3, a4, y1, y2, y3, y4, y5, y6, d1, d2, d3, d4, d5, d6, r1, r2, r3, r4, b1, b2, b3, b4;

    assign w0 = 32'b00111111100000000000000000000000;
    assign w1 = 32'b10111110010011001100110011001101;

    Register XR1 (clk, rst, 1'b1, x1, xr1);
    Register XR2 (clk, rst, 1'b1, x2, xr2);
    Register XR3 (clk, rst, 1'b1, x3, xr3);
    Register XR4 (clk, rst, 1'b1, x4, xr4);

    mux2to1 M1 (s1, xr1, a1, y1);
    mux2to1 M2 (s1, xr2, a2, y2);
    mux2to1 M3 (s1, xr3, a3, y3);
    mux2to1 M4 (s1, xr4, a4, y4);

    Register R1 (clk, rst, 1'b1, y1, d1);
    Register R2 (clk, rst, 1'b1, y2, d2);
    Register R3 (clk, rst, 1'b1, y3, d3);
    Register R4 (clk, rst, 1'b1, y4, d4);
    Register R5 (clk, rst, 1'b1, w0, d5);
    Register R6 (clk, rst, 1'b1, w1, d6);


    PU P1 (clk, rst, 1'b1, d1, d2, d3, d4, d5, d6, d6, d6, r1);
    Activation A1 (r1, b1);
    Register R7 (clk, rst, 1'b1, b1, a1);
    Comparator C1 (a1, z1);

    PU P2 (clk, rst, 1'b1, d1, d2, d3, d4, d6, d5, d6, d6, r2);
    Activation A2 (r2, b2);
    Register R8 (clk, rst, 1'b1, b2, a2);
    Comparator C2 (a2, z2);

    PU P3 (clk, rst, 1'b1, d1, d2, d3, d4, d6, d6, d5, d6, r3);
    Activation A3 (r3, b3);
    Register R9 (clk, rst, 1'b1, b3, a3);
    Comparator C3 (a3, z3);

    PU P4 (clk, rst, 1'b1, d1, d2, d3, d4, d6, d6, d6, d5, r4);
    Activation A4 (r4, b4);
    Register R10 (clk, rst, 1'b1, b4, a4);
    Comparator C4 (a4, z4);

    mux4to1 M5 (s2, xr1, xr2, xr3, xr4, res);
endmodule