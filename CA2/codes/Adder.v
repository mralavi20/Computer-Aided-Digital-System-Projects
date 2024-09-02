module FullAdder (input A, B, Cin, output Sum, Cout);

  wire X1, Y1, Y2;

  // XOR gates for sum
  Xor X(A, B, X1);
  Xor X2(X1, Cin, Sum);

  // AND gates for carry generation
  And A1(A, B, Y1);
  And A2(X1, Cin, Y2);

  // OR gate for carry-out
  Or O(Y1, Y2, Cout);

endmodule