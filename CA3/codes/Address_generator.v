module Address_generator(input en, count_en_y, rst_x, clk, input[1:0] sel, input[6:0] x, y, z, output done_ag, output reg[6:0] output_ag);

    reg[6:0] x_reg, y_reg, z_reg;

    reg[1:0] counter_y = 2'b00;
    reg[3:0] counter_col = 4'b0000;
    reg[4:0] counter_x = 5'b00000; 
    reg[5:0] counter_z = 4'b0000;

    always@(posedge clk) begin
        if(rst_x)
            counter_x = 5'b00000;

        if(en) begin
            x_reg = x;
            y_reg = y;
            z_reg = z;
        end

        else begin
            case (sel)
                2'b00 : begin // this is for x
                    if(counter_x == 5'b10000) begin // we must go to the next line
                        x_reg = x_reg + 4;
                        counter_col = counter_col + 1;
                    end

                    output_ag = x_reg + counter_x;
                    counter_x = counter_x + 1;
                end 

                2'b01 : begin // this is for y
                    if(count_en_y) begin
                        output_ag = y_reg + counter_y;
                        counter_y = counter_y + 1;
                    end
                end 

                2'b10 : begin // this is for z
                        output_ag = z_reg + counter_z;
                        counter_z = counter_z + 1;
                end 

                default: output_ag = 7'bzzzzzzz;
            endcase
        end
    end

    assign done_ag = (counter_col == 4'b1110) ? 1 : 0;

endmodule