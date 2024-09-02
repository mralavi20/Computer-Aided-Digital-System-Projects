module twelveBitFullAdder_TB;

  // Inputs
  reg [11:0] A;
  reg [11:0] B;
  reg Cin;

  // Outputs
  wire [11:0] Sum;
  wire Cout;

  // Instantiate the twelveBitFullAdder module
  twelveBitFullAdder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Clock generation
  reg clk;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize variables
    A = 11'b0;
    B = 11'b0;
    Cin = 0;
    clk = 0;

    // Apply random inputs and monitor outputs
    repeat (20) begin
      #10 A = $random;
      #10 B = $random;
      #10 Cin = $random % 2;
      #10;

      // Display inputs
      $display("Cycle %0d -----------------------------", $stime);
      $display("A = %b", A);
      $display("B = %b", B);
      $display("Cin = %b", Cin);

      // Display outputs
      #10 $display("Sum = %b", Sum);
      $display("Cout = %b", Cout);
    end

    // Finish simulation
    $stop;
  end

endmodule



