module OFM(input we, clk, input[6:0] adr, input[31:0] input_mem);

    reg[31:0] memory[0:127];

    always@(posedge clk) begin
        if(we)
            memory[adr] = input_mem;
    end

endmodule