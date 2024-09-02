module FullAdder_tb;

  // Define the inputs and outputs
  reg A, B, Cin;
  wire Sum, Cout;

  // Instantiate the FullAdder module
  FullAdder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Stimulus generation
  initial begin
    // Test case 1
    A = 0; B = 0; Cin = 0;
    #10 $display("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

    // Test case 2
    A = 1; B = 0; Cin = 0;
    #10 $display("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

    // Test case 3
    A = 0; B = 1; Cin = 0;
    #10 $display("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

    // Test case 4
    A = 1; B = 1; Cin = 0;
    #10 $display("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

    // Test case 5
    A = 0; B = 0; Cin = 1;
    #10 $display("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

    // Test case 6
    A = 1; B = 0; Cin = 1;
    #10 $display("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

    // Test case 7
    A = 0; B = 1; Cin = 1;
    #10 $display("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

    // Test case 8
    A = 1; B = 1; Cin = 1;
    #10 $display("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

    // Finish the simulation
    $stop;
  end

endmodule
