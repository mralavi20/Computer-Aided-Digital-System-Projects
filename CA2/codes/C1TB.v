module C1TB;

  reg A0, A1, SA, B0, B1, SB, S0, S1;
  
  wire F;

  C1 CUT (.A0(A0), .A1(A1), .SA(SA), .B0(B0), .B1(B1), .SB(SB), .S0(S0), .S1(S1), .F(F));

  initial begin
    // Test case 1
    A0 = 1; A1 = 0; SA = 1;
    B0 = 0; B1 = 1; SB = 0;
    S0 = 1; S1 = 0;

    // Apply inputs
    #10 A0 = 0; A1 = 1; SA = 0;
    #10 B0 = 1; B1 = 0; SB = 1;
    #10 S0 = 0; S1 = 1;

    // Wait for some time
    #10;

    // Check the output
    if (F !== 1'b0) $display("Test case 1 failed");

    // Test case 2
    A0 = 1; A1 = 0; SA = 0;
    B0 = 0; B1 = 1; SB = 1;
    S0 = 1; S1 = 0;

    // Apply inputs
    #10 A0 = 0; A1 = 1; SA = 1;
    #10 B0 = 1; B1 = 0; SB = 0;
    #10 S0 = 0; S1 = 1;

    // Wait for some time
    #10;

    // Check the output
    if (F !== 1'b1) $display("Test case 2 failed");

    // Add more test cases as needed

    // End the simulation
    $stop;
  end

endmodule

