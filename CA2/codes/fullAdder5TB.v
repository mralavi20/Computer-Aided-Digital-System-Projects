module fiveBitFullAdder_TB;

  // Inputs
  reg [4:0] A;
  reg [4:0] B;
  reg Cin;

  // Outputs
  wire [4:0] Sum;
  wire Cout;

  // Instantiate the TenBitFullAdder module
  fiveBitFullAdder Cut (
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
    A = 5'b0;
    B = 5'b0;
    Cin = 0;
    clk = 0;

    // Apply random inputs and monitor outputs
    repeat (20) begin
      #10 A = $random;
      #10 B = $random;
      #10 Cin = $random % 2;
      #10;

      // #10 A = 10'b0000000101;
      // #10 B = 10'b0000001100;
      // #10 Cin = 1'b0;
      // #10;

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


