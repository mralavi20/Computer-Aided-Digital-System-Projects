module Multiplier (input [7:0] data_in1, data_in2, output [7:0] data_out);
    wire [15:0] data;
    assign data = data_in1 * data_in2;
    assign data_out = data[15:8];
endmodule