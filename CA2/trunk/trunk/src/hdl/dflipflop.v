module dflipflop (input clk, clr,input data_in, output data_out);

    reg data;

    always @(posedge clk, posedge clr) begin
        if (clr)
            data <= 1'b0;
        else
            data <= data_in;
    end

    assign data_out = data;

endmodule


