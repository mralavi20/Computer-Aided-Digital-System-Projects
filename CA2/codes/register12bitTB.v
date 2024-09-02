module Register12bit_TB;

  // Inputs
  reg [11:0] A;
  reg clk, rst;

  // Outputs
  wire [11:0] out;

  // Instantiate the Register10bit module
  Register12bit uut (
    .data_in(A),
    .clk(clk),
    .rst(rst),
    .data_out(out)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize variables
    A = 10'b0;
    rst = 1;
    clk = 0;

    // Apply random inputs and monitor outputs
    repeat (20) begin
      #10 A = $random;
      #10 rst = $random % 2;
      #10;

      // Display inputs
      $display("Cycle %0d -----------------------------", $stime);
      $display("A = %b", A);
      $display("rst = %b", rst);

      // Display outputs
      #10 $display("out = %b", out);
    end

    // Finish simulation
    $stop;
  end

endmodule



