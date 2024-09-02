module Pu(input [4:0] input1, input2, input3, input4, weight1, weight2, weight3, weight4, input clk, rst, output [11:0] o_result);

    wire [9:0] w1, w2, w3, w4, w5, w6, w7, w8;
    wire [10:0] w9, w10;
    wire [11:0] w11;
    wire C1, C2, C3;

    array_multiplier M1(.x(input1), .y(weight1), .out(w1));
    array_multiplier M2(.x(input2), .y(weight2), .out(w2));
    array_multiplier M3(.x(input3), .y(weight3), .out(w3));
    array_multiplier M4(.x(input4), .y(weight4), .out(w4));

    Register10bit R1(.data_in(w1), .clk(clk), .rst(rst), .data_out(w5));
    Register10bit R2(.data_in(w2), .clk(clk), .rst(rst), .data_out(w6));
    Register10bit R3(.data_in(w3), .clk(clk), .rst(rst), .data_out(w7));
    Register10bit R4(.data_in(w4), .clk(clk), .rst(rst), .data_out(w8));

    ElevenBitFullAdder A1(.A({w5[9], w5}), .B({w6[9], w6}), .Cin(1'b0), .Sum(w9), .Cout(C1));
    ElevenBitFullAdder A2(.A({w7[9], w7}), .B({w8[9], w8}), .Cin(1'b0), .Sum(w10), .Cout(C2));

    twelveBitFullAdder A3(.A({w9[10], w9}), .B({w10[10], w10}), .Cin(1'b0), .Sum(w11), .Cout(C3));

    Register12bit R5(.data_in(w11), .clk(clk), .rst(rst), .data_out(o_result));

endmodule