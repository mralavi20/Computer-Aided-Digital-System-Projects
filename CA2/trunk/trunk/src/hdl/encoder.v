module encoder (input a, b, c, d, output[1:0] data_out);
   
    wire W1, W2, W3;
    wire out0, out1;

    Not N1(a, W1);
    Not N2(b, W2);
    Not N3(c, W3);

    And A1(W1, W2, out1);
    And A2(W1, W3, out0);

    assign data_out = {out1, out0};

endmodule