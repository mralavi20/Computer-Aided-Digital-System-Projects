module ArrayMultiplier_TB;

  // Inputs
  reg [4:0] A, B;

  // Outputs
  wire [9:0] Mul;

  // Instantiate the TenBitFullAdder module
  array_multiplier Cut (
    .x(A),
    .y(B),
    .out(Mul)
  );

  // Testbench stimulus
  initial begin
    // Initialize variables
    A = 5'b0;
    B = 5'b0;

    // Apply random inputs and monitor outputs
    repeat (20) begin
      #10 A = $random;
      #10 B = $random;
      #10;

      // Display inputs
      $display("A = %b", A);
      $display("B = %b", B);

      // Display outputs
      #10 $display("Mul = %b", Mul);
    end

    // Finish simulation
    $stop;
  end

endmodule


