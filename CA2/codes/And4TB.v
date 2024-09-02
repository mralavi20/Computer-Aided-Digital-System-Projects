module And4_tb;

  // Define the inputs and outputs
  reg A, B, C, D;
  wire W;

  // Instantiate the FullAdder module
  And4 CUT (.a(A), .b(B), .c(C), .d(D), .res(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 0; B = 0; C = 0; D = 0;
    #10 $display("A=%b, B=%b, W=%b", A, B, W);

    // Test case 2
    A = 1; B = 0; C = 0; D = 1;
    #10 $display("A=%b, B=%b, W=%b", A, B, W);

    // Test case 3
    A = 0; B = 1; C = 1; D = 0;
    #10 $display("A=%b, B=%b, W=%b", A, B, W);

    // Test case 4
    A = 1; B = 1; C = 1; D = 1;
    #10 $display("A=%b, B=%b, W=%b", A, B, W);

    // Finish the simulation
    $stop;
  end

endmodule

