module Mux1bit2to1 (input a, b, s, output res);
    C1 C (a, b, s, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, res);
endmodule