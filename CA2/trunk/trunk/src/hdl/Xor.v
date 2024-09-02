module Xor (input a, b, output res);
    wire out1, out2, out3;

    Nand N1 (a, b, out1);
    Nand N2 (a, out1, out2);
    Nand N3 (out1, b, out3);
    Nand N4 (out2, out3, res);

endmodule
