module Register5biten (input clk, rst, write_en, input [4:0] data_in, output [4:0] data_out);
    Register1biten R1 (clk, rst, write_en, data_in[4], data_out[4]);
    Register1biten R2 (clk, rst, write_en, data_in[3], data_out[3]);
    Register1biten R3 (clk, rst, write_en, data_in[2], data_out[2]);
    Register1biten R4 (clk, rst, write_en, data_in[1], data_out[1]);
    Register1biten R5 (clk, rst, write_en, data_in[0], data_out[0]);
endmodule