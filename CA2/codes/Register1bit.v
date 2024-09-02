module Register1bit (input clk, rst, data_in, output data_out);
    S2 S (clk, rst, data_in, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, data_out);
endmodule
