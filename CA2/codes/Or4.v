module or4 (input a, b, c, d, output res);
    
    wire W1, W2;

    Or O1(a, b, W1);
    Or O2(W1, c, W2);
    Or O3(W2, d, res);

endmodule