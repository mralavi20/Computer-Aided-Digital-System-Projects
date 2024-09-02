module MAC(input clk, rst, en, input[7:0] input_mac, input_s, output reg[7:0] output_mac, output done_mac);

    reg[4:0] counter = 5'b00000;
    reg last;

    reg[7:0] mul = 8'b00000000;
    reg[11:0] register = 12'b000000000000;
    reg[15:0] sum = 16'b0000000000000000;
    reg[7:0] out;

    always@(posedge clk) begin
        if(rst) begin
            counter = 5'b00000;
            register = 12'b000000000000;
        end

        if(last)begin
            out = register[11:4];
            last = 1'b0;
        end

        else if(en) begin
            if(counter == 5'b10000)
                last = 1'b1;

            if(counter == 5'b00000)
                counter = counter + 1;

            else begin
                sum = input_s * input_mac;
                mul = sum[15:8];
                register = register + mul;
                counter = counter + 1;
            end
        end
    end

    assign output_mac = out;
    assign done_mac = (counter == 5'b10000) ? 1 : 0;

endmodule