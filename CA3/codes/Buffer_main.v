module Buffer_main (input clk, main_we, main_re, rst_main, input[31:0] input_main, output reg[127:0] output_main, output empty, full);

    reg[2:0] counterColumn = 3'b0, counterRow = 3'b0;
    reg[3:0] counterOut = 4'b0;

    reg[127:0] buff[0:3]; // this is 16 * 4

    always@(counterColumn) begin
        if(counterColumn == 3'b100) begin
            
            if(counterRow!= 3'b011) begin
                buff[0] = buff[1];
                buff[1] = buff[2];
                buff[2] = buff[3];
            end

            counterRow = counterRow + 1;
            counterColumn = 3'd0;
        end
    end

    always@(posedge clk) begin

        if(rst_main)begin

            buff[0] = 128'b0;
            buff[1] = 128'b0;
            buff[2] = 128'b0;
            buff[3] = 128'b0;

            counterColumn = 3'b0;
            counterRow = 3'b0;
            counterOut = 4'b0;
        end

        else if(main_re) begin

            output_main = {buff[0][127:96], buff[1][127:96], buff[2][127:96], buff[3][127:96]};

            buff[0] = {buff[0][119:0], 8'bxxxxxxxx};
            buff[1] = {buff[1][119:0], 8'bxxxxxxxx};
            buff[2] = {buff[2][119:0], 8'bxxxxxxxx};
            buff[3] = {buff[3][119:0], 8'bxxxxxxxx};

            counterOut = counterOut + 1;
        end

        else if(main_we) begin
            if(!full) begin
                buff[3] = {buff[3][95:0], input_main};
                counterColumn = counterColumn + 1;
            end
        end
    end

    assign empty = (counterOut == 4'd13) ? 1 : 0;
    assign full = (counterRow== 3'b100) ? 1 : 0;

endmodule