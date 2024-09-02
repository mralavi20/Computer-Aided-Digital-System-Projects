module Mux5bit4to1 (input [4:0] data1, data2, data3, data4, input [1:0] sel, output [4:0] data_out);

    Mux1bit4to1 M1 (data1[4], data2[4], data3[4], data4[4], sel, data_out[4]);
    Mux1bit4to1 M2 (data1[3], data2[3], data3[3], data4[3], sel, data_out[3]);
    Mux1bit4to1 M3 (data1[2], data2[2], data3[2], data4[2], sel, data_out[2]);
    Mux1bit4to1 M4 (data1[1], data2[1], data3[1], data4[1], sel, data_out[1]);
    Mux1bit4to1 M5 (data1[0], data2[0], data3[0], data4[0], sel, data_out[0]);
    
endmodule