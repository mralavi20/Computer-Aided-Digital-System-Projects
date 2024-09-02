module Or5bit (input [4:0] data_in, output res);

    wire out1, out2, out3;

    Or G1 (data_in[4], data_in[3], out1);
    Or G2 (out1, data_in[2], out2);
    Or G3 (out2, data_in[1], out3);
    Or G4 (out3, data_in[0], res);

endmodule