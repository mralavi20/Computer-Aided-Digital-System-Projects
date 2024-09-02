module doneChecker (input a, b, c, d, output done);
    
    wire W1, W2, W3, W4;
    wire out1, out2, out3, out4;

    Not N1(b, W1);
    Not N2(c, W2);
    Not N3(d, W3);
    Not N4(a, W4);

    And4 A1(a, W1, W2, W3, out1);
    And4 A2(W4, b, W2, W3, out2);
    And4 A3(W4, W1, c, W3, out3);
    And4 A4(W4, W1, W2, d, out4);

    or4 O1(out1, out2, out3, out4, done);

endmodule