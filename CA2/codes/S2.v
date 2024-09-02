module S2 (input clk, clr, D00, D01, D10, D11, A0, A1, B0, B1, output out);

    wire S0, S1, m_out;

    assign S0 = A0 && B0;
    assign S1 = A1 || B1;
    assign m_out = (S1) ? (S0 ? D11 : D10) : (S0 ? D01 : D00);

    dflipflop D (.clk(clk), .clr(clr), .data_in(m_out), .data_out(out));

endmodule