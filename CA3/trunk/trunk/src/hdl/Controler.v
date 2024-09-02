`define Idle 5'd0
`define Init 5'd1
`define Filter 5'd2
`define Main 5'd3
`define begincal 5'd4
`define cal 5'd5
`define S6 5'd6
`define S7 5'd7
`define OfmWrite 5'd8
`define S9 5'd9
`define S10 5'd10
`define LastWrite 5'd11
`define ChangeWindow 5'd12
`define Done 5'd13
`define S14 5'd14
`define S15 5'd15
`define load 5'd16
`define Write 5'd17
`define S18 5'd18
`define S19 5'd19
`define S20 5'd20
`define Count_Filter 5'd21
`define Next_Filter 5'd22

module Controller #(parameter N) (input start, clk, doneAdr, fullWR, macDone, fullTemp, emptyTemp, input [N - 1:0] fullFilter,
                  output reg rstWR, done, ldWR, weMem, reMem, rstCalc, enCalc, WEview, ldAdr, rstX, 
                  REview, REFilter, WETemp, RETemp, rstTemp, rstFilter, lastWR, output reg[1:0] sel, output reg [N - 1:0] WEFilter, output reg [7:0] counter);

    reg count_rst, count_en;
    reg[4:0] ps = 5'b0, ns;

    always@(ps, start, emptyTemp, doneAdr, fullWR, fullFilter, fullTemp, macDone, counter) begin

        case(ps)

            `Idle: ns = (start) ? `Init : `Idle;

            `Init: ns = `Filter;
            
            `Filter: ns = (fullFilter[counter]) ? `Count_Filter : `Filter; // n ta filter darim

            `Count_Filter: ns = `Next_Filter;

            `Next_Filter: ns = (counter == N) ? `S19 : `Filter;
            
            `Main: ns = (fullTemp) ? `begincal : `Main;
            
            `begincal: ns = `load;
            
            `cal: ns = (macDone) ?  `S6: `cal;
            
            `S6: ns = (doneAdr) ?  `S10 : `S7;
            
            `S7: ns =`S14;
            
            `OfmWrite: ns = `S9;
            
            `S9: ns = `S20;
            
            `S10: ns = `S15;
            
            `LastWrite :ns = `Done ;
            
            `ChangeWindow :ns = `S19;
            
            `Done :ns = `Idle;

            `S14: ns = (fullWR) ? `Write : `S20;
            
            `S15: ns = (fullWR) ? `S18:`S10;

            `load: ns = `cal;
            
            `Write: ns = `OfmWrite;
            
            `S18: ns =`LastWrite;
            
            `S19: ns =`Main;
            
            `S20: ns = (emptyTemp) ? `ChangeWindow : `begincal;
        endcase
    end

    always@(ps) begin

        {WEview, REview, enCalc, rstWR, ldAdr, WETemp, RETemp, ldWR, reMem, weMem, rstX, rstCalc, rstTemp, REFilter, rstFilter, lastWR, count_en, count_rst} = 18'b0;
        WEFilter = 0;
        sel = 2'b11;

        case(ps)

            `Init:{rstCalc, rstTemp, rstWR, ldAdr, count_rst} = 5'b11111;

            `Filter:begin {WEFilter[counter], reMem} = 2'b11 ;  sel = 2'b01; end //sel 01 to A.G. baraye y hast

            `Count_Filter:begin {count_en} = 1'b1; end
            
            `Main:begin {WETemp, reMem} = 2'b11; sel = 2'b00; end //sel 00 to A.G. baraye x hast
            
            `begincal:begin {RETemp, rstCalc} = 2'b11; end
            
            `cal:begin {enCalc, REview, REFilter} = 3'b111;end
            
            `S7:begin {ldWR} = 1'b1; end
            
            `OfmWrite:begin {weMem} = 1'b1 ;end //minevisim to OFM
            
            `S9:begin {rstWR} = 1'b1;end
        
            `S10:begin {lastWR, ldWR} = 2'b11; end
            
            `LastWrite:begin  {weMem} = 1'b1 ; end //minevisim to OFM
            
            `ChangeWindow:begin {rstTemp} = 1'b1;end
            
            `Done:begin {done} = 1'b1; end
            
            `S15:begin {rstCalc} = 1'b1;end
            
            `load:begin {rstFilter, WEview} = 2'b11; end
            
            `Write:begin {sel} = 2'b10; end //sel 10 to A.G. baraye z hast
            
            `S18:begin {sel} = 2'b10; end //sel 10 to A.G. baraye z hast
            
            `S19:begin {rstX} = 1'b1; sel = 2'b00; end //sel 00 to A.G. baraye x hast
        endcase
    end

    always@(posedge clk)
        ps = ns;
    
    always @(posedge clk, posedge count_rst) begin

        if (count_rst) 
            counter <= 8'b00000000;

        else if (count_en) 
            counter <= counter + 1;
    end

endmodule