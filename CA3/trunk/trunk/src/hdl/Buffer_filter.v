module Buffer_filter(input clk, filter_we, filter_re, rst_filter, input[31:0] input_filter, output reg[7:0] output_filter, output full_f);

    reg[2:0] counter_write = 3'b000;
    reg[3:0] counter_shift = 4'b0000;
    reg[127:0] buff, temp_buff;

    always@(posedge clk) begin

        if(rst_filter)
            counter_shift = 4'b0000;

        if(filter_re) begin
            if(counter_shift == 4'b0000)
                temp_buff = buff;

            output_filter = temp_buff[127:120];
            temp_buff = {temp_buff[119:0], 8'bxxxxxxxx}; // shift for the next number
            counter_shift = counter_shift + 1;
        end

        else if(filter_we) begin
            buff = {buff[95:0], input_filter}; // shift for 4 numbers
            counter_write = counter_write + 1;
        end
    end

    assign full_f = (counter_write == 3'b100) ? 1 : 0;

endmodule