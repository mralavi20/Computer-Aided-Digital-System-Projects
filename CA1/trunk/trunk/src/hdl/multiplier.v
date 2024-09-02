module Multiplier (input [31:0] data1, data2, output [31:0] result);
  reg sign1, sign2, crr, r_sign;
  reg [7:0] exp1, exp2;
  reg [22:0] mantis1, mantis2, r_mantis2;
  reg [47:0] r_mantis1;
  reg [8:0] exp3;
  reg [9:0] exp4;
  reg [7:0] r_exp;
  wire [23:0] num1, num2;
  reg [47:0] r;

  assign exp1 = data1[30:23];
  assign mantis1 = data1[22:0];
  assign sign1 = data1[31];
  assign sign2 = data2[31];
  assign exp2 = data2[30:23];
  assign mantis2 = data2[22:0];
  assign r_sign = sign1 ^ sign2;
  assign exp3 = exp1 + exp2;
  assign exp4 = {exp3} - 9'd127;

  assign num1 = {1'b1,mantis1};
  assign num2 = {1'b1,mantis2};

  always @(num1, num2) begin
    r_mantis1 = num1 * num2;
  end

  assign r_mantis2 = (r_mantis1[47]) ? r_mantis1[46:24] : r_mantis1[45:23];
  assign {crr,r_exp} = exp4[7:0] + {7'b0,r_mantis1[47]};
  assign result[31] = ((~|data1) | (~|data2)) ? 1'b0 : r_sign;
  assign result[30:23] = ((~|data1) | (~|data2)) ? 8'b0 : r_exp;
  assign result[22:0] = ((~|data1) | (~|data2)) ? 23'b0 : r_mantis2;
endmodule