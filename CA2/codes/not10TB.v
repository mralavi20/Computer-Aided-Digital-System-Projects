module Not10_tb;

  // Define the inputs and outputs
  reg[9:0] A;
  wire[9:0] W;

  // Instantiate the FullAdder module
  not10bit CUT (.data_in(A), .res(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 10'b0000000000;
    #10 $display("A=%b, W=%b", A, W);

    // Test case 2
    A = 10'b1111111111;
    #10 $display("A=%b, W=%b", A, W);

    // Test case 3
    A = 10'b0101010101;
    #10 $display("A=%b, W=%b", A, W);

    // Test case 4
    A = 10'b1010101010;
    #10 $display("A=%b, W=%b", A, W);

    // Finish the simulation
    $stop;
  end

endmodule




