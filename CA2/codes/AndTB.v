module And_tb;

  // Define the inputs and outputs
  reg A, B;
  wire W;

  // Instantiate the FullAdder module
  And CUT (.a(A), .b(B), .res(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 0; B = 0;
    #10 $display("A=%b, B=%b, W=%b", A, B, W);

    // Test case 2
    A = 1; B = 0;
    #10 $display("A=%b, B=%b, W=%b", A, B, W);

    // Test case 3
    A = 0; B = 1;
    #10 $display("A=%b, B=%b, W=%b", A, B, W);

    // Test case 4
    A = 1; B = 1;
    #10 $display("A=%b, B=%b, W=%b", A, B, W);

    // Finish the simulation
    $stop;
  end

endmodule
