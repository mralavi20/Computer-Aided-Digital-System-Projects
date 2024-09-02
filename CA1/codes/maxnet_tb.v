module maxnet_tb ();
    reg clk = 1'b0;
    reg rst = 1'b0;
    reg start = 1'b0;
    reg [31:0] x1, x2, x3, x4;
    wire done;
    wire [31:0] res;

    Maxnet M (clk, rst, start, x1, x2, x3, x4, done, res);

    initial begin
        repeat (100) #5 clk = ~clk;
    end

    initial begin
        #10 rst = 1'b1;
        #10 rst = 1'b0;
        #10 x1 = 32'b00111110010011001100110011001101;
        x2 = 32'b00111110110011001100110011001101;
        x3 = 32'b00111111000110011001100110011010;
        x4 = 32'b00111111010011001100110011001101;
        start = 1'b1;
        #10 start = 1'b0;
        #500 $stop;
    end
endmodule