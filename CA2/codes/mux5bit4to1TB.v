module Mux5bit4to1_tb;

  // Define the inputs and outputs
  reg[4:0] A, B, C, D;
  reg [1:0] S;
  wire[4:0] W;

  // Instantiate the FullAdder module
  Mux5bit4to1 CUT (.data1(A), .data2(B), .data3(C), .data4(D), .sel(S), .data_out(W));

  // Stimulus generation
  initial begin
    // Test case 1
    A = 5'b11000; B = 5'b00001; C = 5'b01100; D = 5'b10000; S = 2'b10;
    #10 $display("A=%b, B=%b, C=%b, D=%b, S=%b, W=%b", A, B, C, D, S, W);

    // Test case 2
    A = 5'b11111; B = 5'b00010; C = 5'b00001; D = 5'b00100; S = 2'b00;
    #10 $display("A=%b, B=%b, C=%b, D=%b, S=%b, W=%b", A, B, C, D, S, W);

    // Test case 3
    A = 5'b00110; B = 5'b10000; C = 5'b01111; D = 5'b00000; S = 2'b11;
    #10 $display("A=%b, B=%b, C=%b, D=%b, S=%b, W=%b", A, B, C, D, S, W);

    // Test case 4
    A = 5'b11110; B = 5'b11111; C = 5'b11110; D = 5'b11110; S = 2'b01;
    #10 $display("A=%b, B=%b, C=%b, D=%b, S=%b, W=%b", A, B, C, D, S, W);

    // Finish the simulation
    $stop;
  end

endmodule



