module C1 (input A0, A1, SA, B0, B1, SB, S0, S1, output F);
    
    wire F1, F2, S2;
    
    assign F1 = (SA) ? A1 : A0;
    assign F2 = (SB) ? B1 : B0;
    assign S2 = S0 || S1;
    assign F = (S2) ? F2 : F1;

endmodule