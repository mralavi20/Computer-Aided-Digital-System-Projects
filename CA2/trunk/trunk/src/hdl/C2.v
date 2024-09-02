module C2 (input D00, D01, D10, D11, A0, A1, B0, B1, output out);
    wire S0, S1;

    assign S0 = A0 && B0;
    assign S1 = A1 || B1;
    assign out = (S1) ? (S0 ? D11 : D10) : (S0 ? D01 : D00);

endmodule