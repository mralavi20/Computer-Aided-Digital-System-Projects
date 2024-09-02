module Not5_tb;

  // Define the inputs and outputs
  reg[4:0] A;
  wire[4:0] W;

  // Instantiate the FullAdder module
  not5bit CUT (.data_in(A), .res(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 5'b10101;
    #10 $display("A=%b, W=%b", A, W);

    // Test case 2
    A = 5'b01010;
    #10 $display("A=%b, W=%b", A, W);

    // Test case 3
    A = 5'b11111;
    #10 $display("A=%b, W=%b", A, W);

    // Test case 4
    A = 5'b00000;
    #10 $display("A=%b, W=%b", A, W);

    // Finish the simulation
    $stop;
  end

endmodule



