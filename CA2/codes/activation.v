module Activation (input [11:0] data_in, output [4:0] data_out);

    Mux1bit2to1 M1 (data_in[11], 1'b0, data_in[11], data_out[4]);
    Mux1bit2to1 M2 (data_in[6], 1'b0, data_in[11], data_out[3]);
    Mux1bit2to1 M3 (data_in[5], 1'b0, data_in[11], data_out[2]);
    Mux1bit2to1 M4 (data_in[4], 1'b0, data_in[11], data_out[1]);
    Mux1bit2to1 M5 (data_in[3], 1'b0, data_in[11], data_out[0]);
    
endmodule