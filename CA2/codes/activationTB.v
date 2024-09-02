module Activation_tb;

  // Define the inputs and outputs
  reg[11:0] A;
  wire[4:0] W;

  // Instantiate the FullAdder module
  Activation CUT (.data_in(A), .data_out(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 12'b111100000101;
    #10 $display("A=%b, W=%b", A, W);

    // Test case 2
    A = 12'b010101001001;
    #10 $display("A=%b, W=%b", A, W);

    // Finish the simulation
    $stop;
  end

endmodule