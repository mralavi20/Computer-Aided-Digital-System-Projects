module TB();

    parameter N = 4;

    reg clk = 0, start = 0;
    wire done;

    reg[6:0] y = 7'd0, z = 7'd5, x = 7'd16; //addrese dorost bayad bezarim

    Top_level #(N) TL(.clk(clk), .start(start), .X(x), .Y(y), .Z(z), .done(done));

    always #5 clk = ~clk;

    initial begin
        #10 start = 1;
        #10 start = 0;
        #51000 $stop;
    end

endmodule