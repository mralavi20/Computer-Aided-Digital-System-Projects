module encoder_tb;

  // Define the inputs and outputs
  reg A, B, C, D;
  wire[1:0] W;

  // Instantiate the FullAdder module
  encoder CUT (.a(A), .b(B), .c(C), .d(D), .data_out(W));

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
    A = 0; B = 1; C = 0; D = 1;
    #10 $display("A=%b, B=%b, C=%b, D=%b, W=%b", A, B, C, D, W);

    // Finish the simulation
    $stop;
  end

endmodule