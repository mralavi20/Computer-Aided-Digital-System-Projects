module Mux1bit2to1_tb;

  // Define the inputs and outputs
  reg A, B, S;
  wire W;

  // Instantiate the FullAdder module
  Mux1bit2to1 CUT (.a(A), .b(B), .s(S), .res(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 0; B = 0; S = 0;
    #10 $display("A=%b, B=%b, S=%b, W=%b", A, B, S, W);

    // Test case 2
    A = 1; B = 0; S = 0;
    #10 $display("A=%b, B=%b, S=%b, W=%b", A, B, S, W);

    // Test case 3
    A = 0; B = 1; S = 1;
    #10 $display("A=%b, B=%b, S=%b, W=%b", A, B, S, W);

    // Test case 4
    A = 1; B = 1; S = 1;
    #10 $display("A=%b, B=%b, S=%b, W=%b", A, B, S, W);

    // Finish the simulation
    $stop;
  end

endmodule

