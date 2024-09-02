`timescale 1ns/1ps
module TopLevelTB ();
  reg [4:0] Neuron1, Neuron2, Neuron3, Neuron4;
  reg clk = 1'b0;
  reg rst = 1'b0;
  reg start = 1'b0;
  wire [4:0] maximum_number;
  wire done;

  top_module CUT(
    .Neuron1(Neuron1),
    .Neuron2(Neuron2),
    .Neuron3(Neuron3),
    .Neuron4(Neuron4),
    .clock(clk), 
    .reset(rst), 
    .start_signal(start), 
    .output_maximum_number(maximum_number),
    .done(done)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    Neuron1 = 5'b00010;
    Neuron2 = 5'b00010;
    Neuron3 = 5'b01000;
    Neuron4 = 5'b00010;
    #10 rst = 1'b1;
    #10 rst = 1'b0;
    #10 start = 1'b1;
    #10 start = 1'b0;
    wait(done == 1'b1)
    #1 $stop;
  end
endmodule