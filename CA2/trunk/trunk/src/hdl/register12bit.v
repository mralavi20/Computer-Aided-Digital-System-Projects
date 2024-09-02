module Register12bit (input clk, rst, input [11:0] data_in, output [11:0] data_out);

    Register1bit R1 (clk, rst, data_in[11], data_out[11]);
    Register1bit R2 (clk, rst, data_in[10], data_out[10]);
    Register1bit R3 (clk, rst, data_in[9], data_out[9]);
    Register1bit R4 (clk, rst, data_in[8], data_out[8]);
    Register1bit R5 (clk, rst, data_in[7], data_out[7]);
    Register1bit R6 (clk, rst, data_in[6], data_out[6]);
    Register1bit R7 (clk, rst, data_in[5], data_out[5]);
    Register1bit R8 (clk, rst, data_in[4], data_out[4]);
    Register1bit R9 (clk, rst, data_in[3], data_out[3]);
    Register1bit R10 (clk, rst, data_in[2], data_out[2]);
    Register1bit R11 (clk, rst, data_in[1], data_out[1]);
    Register1bit R12 (clk, rst, data_in[0], data_out[0]);

endmodule