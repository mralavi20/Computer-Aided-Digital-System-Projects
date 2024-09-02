module Register5bit (input clk, rst, input [4:0] data_in, output [4:0] data_out);
    Register1bit R1 (clk, rst, data_in[4], data_out[4]);
    Register1bit R2 (clk, rst, data_in[3], data_out[3]);
    Register1bit R3 (clk, rst, data_in[2], data_out[2]);
    Register1bit R4 (clk, rst, data_in[1], data_out[1]);
    Register1bit R5 (clk, rst, data_in[0], data_out[0]);
endmodule