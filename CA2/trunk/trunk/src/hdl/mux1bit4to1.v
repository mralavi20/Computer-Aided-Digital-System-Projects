module Mux1bit4to1 (input data1, data2, data3, data4, input [1:0] sel, output data_out);
    C2 C (data1, data2, data3, data4, sel[0], sel[1], 1'b1, 1'b0, data_out);
endmodule