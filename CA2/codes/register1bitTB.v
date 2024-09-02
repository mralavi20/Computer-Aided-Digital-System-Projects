module Register_tb;

  // Define the inputs and outputs
  reg data_in, rst = 0, clk = 0;
  wire data_out;

  always #5 clk = ~clk;

  // Instantiate the FullAdder module
  Register1bit CUT (.clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out));

  // Stimulus generation
  initial begin
    // Test case 1
    data_in = 1; rst = 1;
    #10 $display("data_in=%b, rst=%b, data_out=%b", data_in, rst, data_out);

    // Test case 2
    data_in = 1; rst = 0;
    #10 $display("data_in=%b, rst=%b, data_out=%b", data_in, rst, data_out);

    // Test case 3
    data_in = 0; rst = 0;
    #10 $display("data_in=%b, rst=%b, data_out=%b", data_in, rst, data_out);

    // Finish the simulation
    $stop;
  end

endmodule

