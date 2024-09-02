module Register (input clk, rst, write_en, count_en,input [7:0] data_in, output [7:0] data_out);
    reg [7:0] data;

    always @(posedge clk, posedge rst) begin
        if (rst)
            data <= 8'b0;
        else if (write_en)
            data <= data_in;
        else if (count_en)
            data <= data + 1;
    end

    assign data_out = data;

endmodule

