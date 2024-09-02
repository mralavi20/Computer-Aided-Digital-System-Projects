`timescale 1ns/1ps

module tb_S2;

  // Inputs
  reg clk, clr, D00, D01, D10, D11, A0, A1, B0, B1;

  // Output
  wire out;

  // Instantiate the S2 module
  S2 uut (.clk(clk), .clr(clr), .D00(D00), .D01(D01), .D10(D10), .D11(D11), .A0(A0), .A1(A1), .B0(B0), .B1(B1), .out(out));

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus
  initial begin
    #10 clr = 1;
    #10 clr = 0;
    
    A0 = 0; A1 = 1;
    B0 = 1; B1 = 0;
    D00 = 0; D01 = 1;
    D10 = 1; D11 = 0;

    // Apply some test cases
    #10 A0 = 1; B0 = 1; // Set inputs
    #10 A0 = 0; B0 = 1; // Change inputs
    #10 A1 = 0; B1 = 0; // Change inputs

    #100 $stop; // Finish simulation after some time
  end

endmodule

