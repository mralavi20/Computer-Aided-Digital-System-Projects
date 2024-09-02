module Memory(input re, clk, input[6:0] adr, output reg[31:0] output_mem);

    reg[31:0] memory[0:127];

    initial $readmemh("file/input.txt", memory);

    assign output_mem = (re) ? memory[adr] : 31'dx;

endmodule