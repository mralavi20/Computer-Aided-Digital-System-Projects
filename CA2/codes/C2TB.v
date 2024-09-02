module C2_tb;


  reg D00, D01, D10, D11, A0, A1, B0, B1;

  wire out;

  // Instantiate the module
  C2 CUT (.D00(D00), .D01(D01), .D10(D10), .D11(D11), .A0(A0), .A1(A1), .B0(B0), .B1(B1), .out(out));

  reg clk = 0;
  always #5 clk = ~clk;

  initial begin
    // Initialize inputs
    D00 = 1; D01 = 0; D10 = 1; D11 = 0;
    A0 = 0; A1 = 0; B0 = 0; B1 = 0;

    // Apply test vectors
    #10 A0 = 1; B0 = 1; // Test case 1
    #10 A0 = 0; B0 = 1; // Test case 2
    #10 A0 = 1; B0 = 0; // Test case 3
    #10 A1 = 1; B1 = 1; // Test case 4
    #10 A1 = 0; B1 = 1; // Test case 5
    #10 A1 = 1; B1 = 0; // Test case 6

    // Add more test cases as needed

    #10 $stop;
  end

endmodule

