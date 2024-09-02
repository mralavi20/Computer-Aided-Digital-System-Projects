module not10bit (input [9:0] data_in, output[9:0] res);

    wire W1, W2, W3, W4, W5, W6, W7, W8, W9, W10;

    Not N1(data_in[9], W1);
    Not N2(data_in[8], W2);
    Not N3(data_in[7], W3);
    Not N4(data_in[6], W4);
    Not N5(data_in[5], W5);
    Not N6(data_in[4], W6);
    Not N7(data_in[3], W7);
    Not N8(data_in[2], W8);
    Not N9(data_in[1], W9);
    Not N10(data_in[0], W10);

    assign res = {W1, W2, W3, W4, W5, W6, W7, W8, W9, W10};

endmodule