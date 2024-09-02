module Top_level #(parameter N) (input clk, start, input[6:0] X, Y, Z, output done);

    wire ldAdr, rstX, rstWR, ldWR, weMem, reMem, rstCalc, enCalc, WEview, REview, REFilter, WETemp, RETemp, 
         rstTemp, rstFilter, lastWR;
     
    wire [N - 1:0] WEFilter, fullFilter, doneAdr, fullWR, macDone, fullTemp, emptyTemp;
         
    wire[1:0] sel;
    wire[6:0] adrOut [0:N - 1];
    wire [6:0] adrOut_res;
    wire[31:0] DataIn;
    wire[31:0] DataOut[0:N - 1];
    wire [6:0] y[0:N];
    wire [7:0] counter;
    genvar i;

    Memory M(.re(reMem), .clk(clk), .adr(adrOut_res), .output_mem(DataIn));

    assign y[0] = Y;

    generate

     for (i = 0; i < N; i = i + 1) begin
          assign y[i + 1] = y[i] + 4;
          assign adrOut_res = (counter == i) ? adrOut[i] : 
                              (counter == N) ? adrOut[0] : 
                              7'bz;
          PE PE_inst_i (.x(X), .y(y[i]), .z(Z), .sel(sel), .ldAdr(ldAdr), .rstX(rstX), .clk(clk), .rstWR(rstWR), .ldWR(ldWR),
                                                     .rstFilter(rstFilter), .lastWR(lastWR), .doneAdr(doneAdr[i]), .fullWR(fullWR[i]), .macDone(macDone[i]), 
                                                     .fullFilter(fullFilter[i]), .REview(REview), .WEFilter(WEFilter[i]), .REFilter(REFilter), .WETemp(WETemp),
                                                     .RETemp(RETemp), .rstTemp(rstTemp), .rstCalc(rstCalc), .enCalc(enCalc), .WEview(WEview),
                                                     .fullTemp(fullTemp[i]), .emptyTemp(emptyTemp[i]), .AdrOut(adrOut[i]), .DataIn(DataIn), .DataOut(DataOut[i]));
    end

    for (i = 0; i < N; i = i + 1) begin
         OFM OFM_inst_i (.we(weMem), .clk(clk), .adr(adrOut[i]), .input_mem(DataOut[i]));
    end

    endgenerate

    Controller #(N) C(.sel(sel), .start(start), .ldAdr(ldAdr), .rstX(rstX), .clk(clk), 
                 .rstWR(rstWR), .ldWR(ldWR), .weMem(weMem), .reMem(reMem), .rstCalc(rstCalc), .enCalc(enCalc), 
                 .WETemp(WETemp), .RETemp(RETemp), .rstTemp(rstTemp), .rstFilter(rstFilter), .lastWR(lastWR), 
                 .WEview(WEview), .REview(REview), .WEFilter(WEFilter), .REFilter(REFilter),
                 .doneAdr(doneAdr[0]), .fullWR(fullWR[0]), .macDone(macDone[0]), .fullFilter(fullFilter), .fullTemp(fullTemp[0]), .emptyTemp(emptyTemp[0]),
                 .done(done), .counter(counter));

endmodule