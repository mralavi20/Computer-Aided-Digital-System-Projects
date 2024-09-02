module Buffer4 (input clk, rst, write_en,input [7:0] index, input [31:0] data_in, output [7:0] data_out);
    integer  i;
    integer j;
    reg [7:0] data[0:15];

    always @(posedge clk, posedge rst) begin
        if (rst)
            data[index] = 8'b0;

        else if (write_en)
            {data[index], data[index + 1], data[index + 2], data[index + 3]} = data_in;
    end

    assign data_out = data[index];

endmodule