module Mux1bit4to1_tb;

  // Define the inputs and outputs
  reg A, B, C, D;
  reg [1:0] S;
  wire W;

  // Instantiate the FullAdder module
  Mux1bit4to1 CUT (.data1(A), .data2(B), .data3(C), .data4(D), .sel(S), .data_out(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 0; B = 0; C = 0; D = 0; S = 2'b10;
    #10 $display("A=%b, B=%b, C=%b, D=%b, S=%b, W=%b", A, B, C, D, S, W);

    // Test case 2
    A = 1; B = 0; C = 0; D = 0; S = 2'b00;
    #10 $display("A=%b, B=%b, C=%b, D=%b, S=%b, W=%b", A, B, C, D, S, W);

    // Test case 3
    A = 0; B = 1; C = 1; D = 0; S = 2'b11;
    #10 $display("A=%b, B=%b, C=%b, D=%b, S=%b, W=%b", A, B, C, D, S, W);

    // Test case 4
    A = 1; B = 1; C = 1; D = 0; S = 2'b01;
    #10 $display("A=%b, B=%b, C=%b, D=%b, S=%b, W=%b", A, B, C, D, S, W);

    // Finish the simulation
    $stop;
  end

endmodule


