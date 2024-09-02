module bit_multiplier(input xi, yi, pi, ci, output xo, yo, po, co);

    wire xy, W1, W2, W3, W4, W5;

    And A1(xi, yi, xy);
    And A2(pi, xy, W1);
    And A3(pi, ci, W2);
    And A4(xy, ci, W3);

    Or O1(W1, W2, W4);
    Or O4(W3, W4, co);

    Xor X1(pi, xy, W5);
    Xor X2(W5, ci, po);
    
    assign xo = xi;
    assign yo = yi;

endmodule

module array_multiplier (input [4:0] x, y, output [9:0] out);

    wire[4:0] not_x, not_y, twos_x, twos_y, x_operand, y_operand;
    wire[9:0] z, twos_out, not_out;
    wire cout_x, cout_y, cout_out, decider;
    wire [9:0] intermediate_out;

    wire xv [5:0][5:0];
    wire yv [5:0][5:0];
    wire cv [5:0][5:0];
    wire pv [5:0][5:0];

    not5bit N1(x, not_x);
    not5bit N2(y, not_y);

    fiveBitFullAdder F1(not_x, 5'b00000, 1'b1, twos_x, cout_x);
    fiveBitFullAdder F2(not_y, 5'b00000, 1'b1, twos_y, cout_y);

    Mux5bit2to1 M1(x, twos_x, x[4], x_operand);
    Mux5bit2to1 M2(y, twos_y, y[4], y_operand);

    genvar i, j;

    generate //Instancing bit_multipliers//
    for (i = 0; i < 5; i = i + 1)
    begin: gen_rows
        for (j = 0; j < 5; j = j + 1) 
        begin: gen_cols

        bit_multiplier inst(.xi(xv[i][j]), .yi(yv[i][j]), .pi(pv[i][j+1]), .ci(cv[i][j]), .xo(xv[i][j+1]), .yo(yv[i+1][j]), .po(pv[i+1][j]), .co(cv[i][j+1]));

        end
    end
    endgenerate
    
    generate // Side Ports Connections// 
    for (i = 0; i < 5; i = i + 1)
        begin: sides
            assign xv[i][0] = x_operand[i];
            assign cv[i][0] = 1'b0; 
            assign pv[0][i+1] = 1'b0;
            assign pv[i+1][5] = cv[i][5];
            assign yv[0][i] = y_operand[i];
            assign z[i] = pv[i+1][0];
            assign z[i+5] = pv[5][i+1];
        end
    endgenerate
    
    assign intermediate_out = z;

    Xor X1(x[4], y[4], decider);

    not10bit N3(intermediate_out, not_out);

    TenBitFullAdder F3(not_out, 10'b0, 1'b1, twos_out, cout_out);

    assign out = (decider) ? twos_out : intermediate_out;

endmodule