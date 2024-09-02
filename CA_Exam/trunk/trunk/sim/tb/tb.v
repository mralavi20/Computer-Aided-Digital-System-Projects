module tb ();
    reg clk = 1'b0;
    reg rst = 1'b0;
    reg [7:0] x = 0, y = 0, z = 0;
    wire done;

    Datapath D (clk, rst, x, y, z, done);

    initial begin
        repeat (100) #5 clk = ~clk;
    end

    initial begin
        #10 rst = 1'b1;
        #10 rst = 1'b0;
        #500 $stop;
    end
endmodule
