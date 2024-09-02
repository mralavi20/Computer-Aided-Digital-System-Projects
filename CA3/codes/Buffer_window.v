module Buffer_window(input clk, window_we, window_re, input[127:0] input_w, output reg[7:0] output_w);

    reg[127:0] buff;

    always@(posedge clk) begin

        if(window_we)
            buff = input_w;

        else if(window_re) begin
            output_w = buff[127:120];
            buff = {buff[119:0], 8'bxxxxxxxx};
        end
    end

endmodule