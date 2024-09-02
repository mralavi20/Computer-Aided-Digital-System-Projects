module Adder(input [31:0] data1, data2, output reg [31:0] result);
    reg [31:0] num1, num2;
    reg[23:0] mantis1, mantis2, mantis3;
    reg[7:0] exp1, exp2, exp3, r_exp;
    reg sign1, sign2, c, r_sign;

    assign num1 = (data1[30:23] >= data2[30:23]) ? data1 : data2;
    assign num2 = (data1[30:23] < data2[30:23]) ? data1  :data2;
    assign mantis1 = {1'b1,num1[22:0]};
    assign mantis2 = {1'b1,num2[22:0]};
    assign exp1 = num1[30:23];
    assign exp2 = num2[30:23];
    assign sign1 = num1[31];
    assign sign2 = num2[31];
    assign exp3 = exp1 - exp2;
    assign mantis2 = mantis2 >> exp3;
    assign r_exp = exp1;
    assign r_sign = sign1;
    assign {c,mantis3} = (sign1 ^ sign2) ? mantis1 - mantis2 : mantis1 + mantis2;


    always @* begin
        if (c == 1) begin
            mantis3 = mantis3 >> 1;
            r_exp = r_exp + 1'b1;
        end
        else begin
            while(mantis3[23] != 1'b1) begin
                mantis3 = mantis3 << 1;
                r_exp = r_exp - 1'b1;
            end
        end
    end

    always @* begin
        if ((~|data1) && (~|data2))
            result = 32'b0;
        else if (~|data1)
            result = data2;
        else if (~|data2)
            result = data1;
        else begin
         result[31] = r_sign;
         result[30:23] = r_exp;
         result[22:0] = mantis3[22:0];
        end
    end
endmodule