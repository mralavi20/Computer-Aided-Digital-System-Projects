module Memory (input clk, write_en, [7:0] address, [7:0] write_data, output [31:0] read_data);
    reg [31:0] data_mem [0:127];

    initial begin
        $readmemh ("data.txt", data_mem);
    end

    assign read_data = data_mem [address];

    always @(posedge clk) begin
        if (write_en)
            data_mem[address] <= {24'b0, write_data};
    end
endmodule
