module Register1biten (input clk, rst, write_en, data_in, output data_out);
    S2 S (clk, rst, data_out, data_in, 1'b0, 1'b0, write_en, 1'b0, 1'b1, 1'b0, data_out);
endmodule