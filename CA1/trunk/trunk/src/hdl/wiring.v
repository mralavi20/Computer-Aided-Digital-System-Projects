module Maxnet (input clk, rst, start, input [31:0] x1, x2, x3, x4, output done, output [31:0] result);
    wire s1, z1, z2, z3, z4;
    wire [1:0] s2;

    Datapath D (clk, rst, s1, s2, x1, x2, x3, x4, z1, z2, z3, z4, result);
    Controller C (clk, rst, start, z1, z2, z3, z4, done, s1, s2);
endmodule