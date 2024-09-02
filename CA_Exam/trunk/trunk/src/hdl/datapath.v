module Datapath (input clk, rst, input [7:0] x, y, z, output done);
    
    wire x_reg_en, y_reg_en, z_reg_en, x_reg_count, y_reg_count, z_reg_count, result_reg_en, filter_buff_en, buff8_en, buff4_en, write_en, buff8_shift_en;
    wire [1:0] sel;
    wire [7:0] filter_index, buff8_index, buff4_index, buff8_to_buff4_count, buff4_out, multi_out, register_out, adder_out, x_reg_out, y_reg_out, z_reg_out, mux_out;
    wire [31:0] memory_out, buff8_out;

    Controller C (clk, rst, x_reg_en, y_reg_en, z_reg_en, x_reg_count, y_reg_count, z_reg_count, result_reg_en, filter_buff_en, buff8_en, buff4_en, write_en, 
                  buff8_shift_en, done, sel, filter_index, buff8_index, buff4_index, buff8_to_buff4_count);

    Register R_x (clk, rst, x_reg_en, x_reg_count, x_reg_out);
    Register R_y (clk, rst, y_reg_en, y_reg_count, y_reg_out);
    Register R_z (clk, rst, z_reg_en, z_reg_count, z_reg_out);
    Mux4to1 mux(sel, x_reg_out, y_reg_out, z_reg_out, 8'b0, mux_out);
    Memory memory (clk, write_en, mux_out, register_out, memory_out);
    Buffer4 filter (clk, rst, filter_buff_en, filter_index, memory_out, filter_buff_out);
    Buffer8 first_buffer (clk, rst, buff8_en, buff8_shift_en, buff8_to_buff4_count, buff8_index, memory_out, buff8_out);
    Buffer4 seccond_buffer (clk, rst, buff4_en, buff4_count, buff8_out, buff4_out);
    Multiplier M (buff4_out, filter_buff_out, multi_out);
    Adder A (multi_out, register_out, adder_out);
    Register R (clk, rst, result_reg_en, 1'b0, adder_out, register_out);

endmodule