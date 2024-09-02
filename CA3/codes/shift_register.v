module shift_register(input clk, rst_sr, last_sr, en, input[7:0] input_shift_register, output reg[31:0] output_sr, output full);

    reg[2:0] counter = 3'b0;
    reg[31:0] register;

    always@(posedge clk) begin

        if(rst_sr)
            counter = 2'b0;

        else if(en) begin

            if(last_sr)
                register ={register[23:0], 8'b0};
            else
                register ={register[23:0], input_shift_register};

            counter = counter + 1;
        end
    end

    assign full = (counter == 3'd4) ? 1 : 0;
    assign output_sr = (counter == 3'd4) ? register : 32'bx;

endmodule