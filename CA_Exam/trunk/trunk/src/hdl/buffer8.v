module Buffer8 (input clk, rst, write_en, shift_en,input [7:0] buff_count, index, input [31:0] data_in, output [31:0] data_out);
    integer  i;
    integer j;
    reg [7:0] data[0:63];

    always @(posedge clk, posedge rst) begin
        if (rst)
            data[index] = 8'b0;

        else if (write_en)
            {data[index], data[index + 1], data[index + 2], data[index + 3]} = data_in;
        
        else if (shift_en) begin
            for (i = 1; i < 4; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    data[16 * i + j] = data[16 * (i - 1) + j];
                end
            end
        end
    end

    assign data_out = {data[buff_count + index], data[buff_count + index + 1], data[buff_count + index + 2], data[buff_count + index + 3]};

endmodule