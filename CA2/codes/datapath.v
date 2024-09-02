module datapath(input [4:0] Neuron1, Neuron2, Neuron3, Neuron4, input clk, rst, ld_t, ld_x, sel_t, output [4:0] maximum_number,  output done);

    wire [11:0] w22, w23, w24, w25;

    wire [4:0] w1, w2, w3, w4, w6, w7, w8;
    wire [4:0] w9, w10, w11, w12, w13, w14;
    wire [4:0] w15, w16, w17;
    wire [4:0] data1, data2, data3, data4;

    wire [1:0] w5;

    wire w18, w19, w20, w21;

    Register5biten x1(.data_in(Neuron1), .write_en(ld_x), .clk(clk), .rst(rst), .data_out(w1));
    Register5biten x2(.data_in(Neuron2), .write_en(ld_x), .clk(clk), .rst(rst), .data_out(w2));
    Register5biten x3(.data_in(Neuron3), .write_en(ld_x), .clk(clk), .rst(rst), .data_out(w3));
    Register5biten x4(.data_in(Neuron4), .write_en(ld_x), .clk(clk), .rst(rst), .data_out(w4));

    Mux5bit4to1 M1(.data1(w1), .data2(w2), .data3(w3), .data4(w4), .sel(w5), .data_out(maximum_number));

    Mux5bit2to1 M2(.data1(w10), .data2(Neuron1), .sel(sel_t), .data_out(w6));
    Mux5bit2to1 M3(.data1(w11), .data2(Neuron2), .sel(sel_t), .data_out(w7));
    Mux5bit2to1 M4(.data1(w12), .data2(Neuron3), .sel(sel_t), .data_out(w8));
    Mux5bit2to1 M5(.data1(w13), .data2(Neuron4), .sel(sel_t), .data_out(w9));

    Register5biten t1(.data_in(w6), .write_en(ld_t), .clk(clk), .rst(rst), .data_out(w14));
    Register5biten t2(.data_in(w7), .write_en(ld_t), .clk(clk), .rst(rst), .data_out(w15));
    Register5biten t3(.data_in(w8), .write_en(ld_t), .clk(clk), .rst(rst), .data_out(w16));
    Register5biten t4(.data_in(w9), .write_en(ld_t), .clk(clk), .rst(rst), .data_out(w17));

    Or5bit O1(.data_in(w14), .res(w18));
    Or5bit O2(.data_in(w15), .res(w19));
    Or5bit O3(.data_in(w16), .res(w20));
    Or5bit O4(.data_in(w17), .res(w21));

    encoder E(.a(w18), .b(w19), .c(w20), .d(w21), .data_out(w5));

    doneChecker D(.a(w18), .b(w19), .c(w20), .d(w21), .done(done));

    Pu P1(
        .input1(w14), .input2(w15), .input3(w16), .input4(w17), 
        .weight1(5'b01000), .weight2(5'b11110), .weight3(5'b11110), .weight4(5'b11110), 
        .clk(clk), .rst(rst), .o_result(w22)
    );
    Pu P2(
        .input1(w14), .input2(w15), .input3(w16), .input4(w17), 
        .weight1(5'b11110), .weight2(5'b01000), .weight3(5'b11110), .weight4(5'b11110), 
        .clk(clk), .rst(rst), .o_result(w23)
    );
    Pu P3(
        .input1(w14), .input2(w15), .input3(w16), .input4(w17), 
        .weight1(5'b11110), .weight2(5'b11110), .weight3(5'b01000), .weight4(5'b11110), 
        .clk(clk), .rst(rst), .o_result(w24)
    );
    Pu P4(
        .input1(w14), .input2(w15), .input3(w16), .input4(w17), 
        .weight1(5'b11110), .weight2(5'b11110), .weight3(5'b11110), .weight4(5'b01000), 
        .clk(clk), .rst(rst), .o_result(w25)
    );

    Activation A1(.data_in(w22), .data_out(w10));
    Activation A2(.data_in(w23), .data_out(w11));
    Activation A3(.data_in(w24), .data_out(w12));
    Activation A4(.data_in(w25), .data_out(w13));

endmodule