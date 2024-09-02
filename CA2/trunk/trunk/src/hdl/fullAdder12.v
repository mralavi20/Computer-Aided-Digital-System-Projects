module twelveBitFullAdder (input [11:0] A, input [11:0] B, input Cin, output [11:0] Sum, output Cout);

  wire [11:0] C;

  FullAdder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(C[0]));
  FullAdder FA1 (.A(A[1]), .B(B[1]), .Cin(C[0]), .Sum(Sum[1]), .Cout(C[1]));
  FullAdder FA2 (.A(A[2]), .B(B[2]), .Cin(C[1]), .Sum(Sum[2]), .Cout(C[2]));
  FullAdder FA3 (.A(A[3]), .B(B[3]), .Cin(C[2]), .Sum(Sum[3]), .Cout(C[3]));
  FullAdder FA4 (.A(A[4]), .B(B[4]), .Cin(C[3]), .Sum(Sum[4]), .Cout(C[4]));
  FullAdder FA5 (.A(A[5]), .B(B[5]), .Cin(C[4]), .Sum(Sum[5]), .Cout(C[5]));
  FullAdder FA6 (.A(A[6]), .B(B[6]), .Cin(C[5]), .Sum(Sum[6]), .Cout(C[6]));
  FullAdder FA7 (.A(A[7]), .B(B[7]), .Cin(C[6]), .Sum(Sum[7]), .Cout(C[7]));
  FullAdder FA8 (.A(A[8]), .B(B[8]), .Cin(C[7]), .Sum(Sum[8]), .Cout(C[8]));
  FullAdder FA9 (.A(A[9]), .B(B[9]), .Cin(C[8]), .Sum(Sum[9]), .Cout(C[9]));
  FullAdder FA10 (.A(A[10]), .B(B[10]), .Cin(C[9]), .Sum(Sum[10]), .Cout(C[10]));
  FullAdder FA11 (.A(A[11]), .B(B[11]), .Cin(C[10]), .Sum(Sum[11]), .Cout(Cout));

endmodule