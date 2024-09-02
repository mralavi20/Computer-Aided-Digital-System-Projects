module not5bit (input [4:0] data_in, output[4:0] res);

    wire W1, W2, W3, W4, W5;

    Not N1(data_in[4], W1);
    Not N2(data_in[3], W2);
    Not N3(data_in[2], W3);
    Not N4(data_in[1], W4);
    Not N5(data_in[0], W5);

    assign res = {W1, W2, W3, W4, W5};

endmodule