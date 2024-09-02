module Not_tb;

  // Define the inputs and outputs
  reg A;
  wire W;

  // Instantiate the FullAdder module
  Not CUT (.a(A), .res(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 0;
    #10 $display("A=%b, W=%b", A, W);

    // Test case 2
    A = 1;
    #10 $display("A=%b, W=%b", A, W);

    // Finish the simulation
    $stop;
  end

endmodule


