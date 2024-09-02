module doneChecker_tb;

  // Define the inputs and outputs
  reg A, B, C, D;
  wire W;

  // Instantiate the FullAdder module
  doneChecker CUT (.a(A), .b(B), .c(C), .d(D), .done(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 1; B = 0; C = 0; D = 0;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Test case 2
    A = 0; B = 1; C = 0; D = 0;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Test case 3
    A = 0; B = 0; C = 1; D = 0;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Test case 4
    A = 0; B = 0; C = 0; D = 1;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Test case 5
    A = 1; B = 0; C = 0; D = 1;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Test case 6
    A = 0; B = 1; C = 1; D = 0;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Test case 7
    A = 1; B = 1; C = 1; D = 0;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Test case 8
    A = 1; B = 1; C = 1; D = 1;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Finish the simulation
    $stop;
  end

endmodule


