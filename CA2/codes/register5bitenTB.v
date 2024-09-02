module Register5biten_TB;

  // Inputs
  reg [4:0] A;
  reg rst, we;
  reg Clk;

  // Outputs
  wire [4:0] out;

  // Instantiate the TenBitFullAdder module
  Register5biten Cut (
    .clk(Clk),
    .data_in(A),
    .rst(rst),
    .write_en(we),
    .data_out(out)
  );

  // Clock generation
  always #5 Clk = ~Clk;

  // Testbench stimulus
  initial begin

    // Initialize variables
    A = 5'b0;
    rst = 0;
    Clk = 0;
    we = 0;

    // Apply random inputs and monitor outputs
    repeat (20) begin
      #10 A = $random;
      #10 rst = $random % 2;
      #10 we = $random % 2;
      #10;

      // Display inputs
      $display("Cycle %0d -----------------------------", $stime);
      $display("A = %b", A);
      $display("rst = %b", rst);
      $display("we = %b", we);

      // Display outputs
      #10 $display("out = %b", out);
    end

    // Finish simulation
    $stop;
  end

endmodule
