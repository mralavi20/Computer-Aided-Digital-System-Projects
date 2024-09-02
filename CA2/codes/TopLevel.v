module top_module(input [4:0] Neuron1, Neuron2, Neuron3, Neuron4, input clock, reset, start_signal, output [4:0] output_maximum_number, output done);

    wire done_signal, load_t, load_x, select_t;

    datapath datapath_instance(
        .Neuron1(Neuron1),
        .Neuron2(Neuron2),
        .Neuron3(Neuron3),
        .Neuron4(Neuron4),
        .clk(clock),
        .rst(reset),
        .ld_t(load_t),
        .ld_x(load_x),
        .sel_t(select_t),
        .maximum_number(output_maximum_number),
        .done(done_signal)
    );

    Controller controller_instance (
        .done(done_signal),
        .start(start_signal),
        .clk(clock),
        .rst(reset),
        .load_x(load_x),
        .load_t(load_t),
        .select_t(select_t)
    );
    
    assign done = done_signal;

endmodule