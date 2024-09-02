module And4 (input a, b, c, d, output res);
    
    wire W1, W2;

    And A1(a, b, W1);
    And A2(W1, c, W2);
    And A3(W2, d, res);

endmodule