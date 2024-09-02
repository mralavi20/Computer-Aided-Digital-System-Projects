module Controller (input clk, rst, start, done, output load_x, load_t, select_t);

    wire s0, s1, s2, d0, d1, d2, s0_bar, s1_bar, s2_bar, done_bar, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19;

    Not N1 (s0, s0_bar);
    Not N2 (s1, s1_bar);
    Not N3 (s2, s2_bar);
    Not N4 (done, done_bar);

    And A1 (s1, s0, out1);
    And A2 (s2, done, out2);
    And A3 (s2, s0, out3);
    Or A4 (out1, out2, out18);
    Or A5 (out18, out3, d2);

    And A6 (s1, s0_bar, out4);
    And A7 (s2_bar, s1_bar, out5);
    And A8 (out5, s0, out6);
    And A9 (s2, s0_bar, out8);
    And A10 (out8, done_bar, out19);
    Or A11 (out4, out6, out7);
    Or A12 (out7, out19, d1);

    And A13 (s1, s0_bar, out9);
    And A14 (s2, done, out10);
    Or A15 (out9, out10, out11);
    And A16 (s2, s0, out12);
    And A17 (s2_bar, s0_bar, out13);
    And A18 (out13, start, out14);
    Or A19 (out12, out14, out15);
    Or A20 (out11, out15, d0);

    And A21 (s2_bar, s1_bar, out16);
    And A22 (out16, s0, load_x);
    
    And A23 (s2, s0_bar, out17);
    Or A24 (load_x, out17, load_t);

    assign select_t = load_x;

    Register1bit R0 (clk, rst, d0, s0);
    Register1bit R1 (clk, rst, d1, s1);
    Register1bit R2 (clk, rst, d2, s2);
    
endmodule