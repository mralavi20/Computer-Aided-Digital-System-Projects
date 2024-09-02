module PE(input ldAdr, rstX, clk, rstWR, ldWR, rstCalc, enCalc, WEview, REview, 
		        WEFilter, REFilter, WETemp, RETemp, rstTemp, rstFilter, lastWR,
                input[31:0] DataIn,
		        input[6:0] x, y, z, 
		        input[1:0] sel, 
		        output doneAdr, fullWR, macDone, fullFilter, fullTemp, emptyTemp,
                output[6:0] AdrOut,
                output[31:0] DataOut);

    wire [7:0] macOut , FilterOut, ViewOut;
    wire [127:0] OutTemp;

    Buffer_main BM(.input_main(DataIn), .clk(clk), .main_we(WETemp), .main_re(RETemp), .full(fullTemp), .rst_main(rstTemp), .output_main(OutTemp), 
                   .empty(emptyTemp));
    
    Buffer_filter BF(.clk(clk), .rst_filter(rstFilter), .input_filter(DataIn), .filter_we(WEFilter), .filter_re(REFilter), 
                     .output_filter(FilterOut), .full_f(fullFilter));
    //DataIn vorodi har kodom az PE hast, 4 adad ke ye mogheii male tasvire ye mogheii baraye filter
    
    Buffer_window BW(.clk(clk), .window_we(WEview), .window_re(REview) , .input_w(OutTemp), .output_w(ViewOut));

    MAC mac(.clk(clk), .rst(rstCalc), .input_mac(ViewOut), .input_s(FilterOut), .en(enCalc), .done_mac(macDone), .output_mac(macOut));
    
    shift_register SR(.clk(clk), .last_sr(lastWR), .rst_sr(rstWR), .input_shift_register(macOut), .en(ldWR), .output_sr(DataOut) , .full(fullWR));
    //DataOut khoroji har kodom az PE hast, 4 adad mohasebe shode bere to OFM khodesh benevise

    Address_generator AG(.x(x), .y(y), .z(z), .sel(sel), .en(ldAdr), .count_en_y(WEFilter), .rst_x(rstX), .clk(clk), .output_ag(AdrOut), .done_ag(doneAdr));
    
endmodule