module Activation (input [31:0] data_in, input [31:0] data_out);
    assign data_out = data_in[31] ? 32'b0 : data_in;
endmodule