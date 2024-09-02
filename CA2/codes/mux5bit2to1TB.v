module Mux5bit2to1_tb;

  // Define the inputs and outputs
  reg[4:0] A, B;
  reg S;
  wire[4:0] W;

  // Instantiate the FullAdder module
  Mux5bit2to1 CUT (.data1(A), .data2(B), .sel(S), .data_out(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 5'b00000; B = 5'b11000; S = 0;
    #10 $display("A=%b, B=%b, S=%b, W=%b", A, B, S, W);

    // Test case 2
    A = 5'b11111; B = 5'b00000; S = 0;
    #10 $display("A=%b, B=%b, S=%b, W=%b", A, B, S, W);

    // Test case 3
    A = 5'b01110; B = 5'b00000; S = 1;
    #10 $display("A=%b, B=%b, S=%b, W=%b", A, B, S, W);

    // Test case 4
    A = 5'b01010; B = 5'b11110; S = 1;
    #10 $display("A=%b, B=%b, S=%b, W=%b", A, B, S, W);

    // Finish the simulation
    $stop;
  end

endmodule


