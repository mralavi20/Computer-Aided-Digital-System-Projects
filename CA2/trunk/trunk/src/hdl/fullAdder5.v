module fiveBitFullAdder (input [4:0] A, input [4:0] B, input Cin, output [4:0] Sum, output Cout);

  wire [4:0] C;

  FullAdder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(C[0]));
  FullAdder FA1 (.A(A[1]), .B(B[1]), .Cin(C[0]), .Sum(Sum[1]), .Cout(C[1]));
  FullAdder FA2 (.A(A[2]), .B(B[2]), .Cin(C[1]), .Sum(Sum[2]), .Cout(C[2]));
  FullAdder FA3 (.A(A[3]), .B(B[3]), .Cin(C[2]), .Sum(Sum[3]), .Cout(C[3]));
  FullAdder FA4 (.A(A[4]), .B(B[4]), .Cin(C[3]), .Sum(Sum[4]), .Cout(Cout));

endmodule