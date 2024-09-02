module Comparator (input [31:0] data_in, output z);
    assign z = (data_in == 32'b0) ? 1'b1 : 1'b0;
endmodule