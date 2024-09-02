module Controller (input clk, rst, output reg x_reg_en, y_reg_en, z_reg_en, x_reg_count, y_reg_count, z_reg_count, result_reg_en, filter_buff_en, buff8_en, buff4_en, 
                   write_en, buff8_shift_en, done, output reg [1:0] sel, output reg [7:0] filter_index, buff8_index, buff4_index, buff8_to_buff4_count);
    
    reg [7:0] memory_to_buff8_count, sum_count;
    reg rst_filter_index, rst_buff8_index, rst_buff4_index, rst_memory_to_buff8_counter, rst_buff8_to_buff4_counter, rst_sum_counter, 
        filter_index_en, buff8_index_en, buff4_index_en, memory_to_buff8_counter_en, buff8_to_buff4_counter_en, sum_counter_en, count_type1, count_type2, count_type3;


    reg [3:0] ps, ns;

    always @(ps, filter_index, buff8_index, buff4_index, sum_count, buff8_to_buff4_count, buff8_index) begin
        case (ps)
            0: ns = 1;
            1: ns = 2;
            2: ns = filter_index < 16 ? 2 : 3;
            3: ns = buff8_index < 64 ? 3 : 4;
            4: ns = 5;
            5: ns = buff4_index < 16 ? 5 : 6;
            6: ns = 7;
            7: ns = sum_count < 16 ? 7 : 8;
            8: ns = buff8_to_buff4_count < 25 ? 5 : memory_to_buff8_count < 169 ? 9 : 11;
            9: ns = 10;
            10: ns = buff8_index < 16 ? 10 : 4;
            11: ns = 11;
        endcase
    end

    always @(ps) begin
        {rst_filter_index, rst_buff8_index, rst_buff4_index, rst_memory_to_buff8_counter, rst_buff8_to_buff4_counter, rst_sum_counter, 
        filter_index_en, buff8_index_en, buff4_index_en, memory_to_buff8_counter_en, buff8_to_buff4_counter_en, sum_counter_en, buff8_en, buff4_en, count_type1, count_type2, count_type3, 
        result_reg_en, write_en, buff8_shift_en, done} = 21'b0;

        case (ps)
            0: begin
                rst_filter_index = 1'b0;
                rst_buff8_index = 1'b0;
                rst_buff4_index = 1'b0;
                rst_memory_to_buff8_counter = 1'b0;
                rst_buff8_to_buff4_counter = 1'b0;
                rst_sum_counter = 1'b0;
            end
            1: begin
                x_reg_en = 1'b1;
                y_reg_en = 1'b1;
                z_reg_en = 1'b1;
            end
            2: begin
                filter_index_en = 1'b1;
                filter_buff_en = 1'b1;
                y_reg_count = 1'b1;
                sel = 2'b01;
                count_type1 = 1'b0;
            end
            3: begin
                buff8_index_en = 1'b1;
                buff8_en = 1'b1;
                x_reg_count = 1'b1;
                count_type2 = 1'b0;
                sel = 2'b00;
            end
            4: begin
                memory_to_buff8_counter_en = 1'b1;
                rst_buff8_index = 1'b1;
            end
            5: begin
                buff4_index_en = 1'b1;
                buff8_index_en = 1'b1;
                buff4_en = 1'b1;
                count_type2 = 1'b1;
                count_type3 = 1'b0;
            end
            6: begin
                buff8_to_buff4_counter_en = 1'b1;
                rst_buff4_index = 1'b1;
                rst_filter_index = 1'b1;
                rst_sum_counter = 1'b1;
            end
            7: begin
                filter_index_en = 1'b1;
                buff4_index_en = 1'b1;
                sum_counter_en = 1'b1;
                result_reg_en = 1'b1;
                count_type1 = 1'b1;
                count_type3 = 1'b1;
            end
            8: begin
                write_en = 1'b1;
                z_reg_count = 1'b1;
                sel = 2'b10;
            end
            9: begin
                buff8_shift_en = 1'b1;
                rst_buff8_to_buff4_counter = 1'b1;
            end
            10: begin
                buff8_index_en = 1'b1;
                buff8_en = 1'b1;
                x_reg_count = 1'b1;
                count_type2 = 1'b0;
            end
            11: begin
                done = 1'b1;
            end
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            ps <= 0;
        else
            ps <= ns;
    end

    always @(posedge clk, posedge rst_filter_index) begin
        if (rst_filter_index)
            filter_index = 8'b0;
        else if (filter_index_en && !count_type1)
            filter_index = filter_index + 4;
        else if (filter_index_en && count_type1)
            filter_index = filter_index + 1;
    end

    always @(posedge clk, posedge rst_buff8_index) begin
        if (rst_buff8_index)
            buff8_index = 8'b0;
        else if (buff8_index_en && !count_type2)
            buff8_index = buff8_index + 4;
        else if (buff8_index_en && count_type2) begin
            buff8_index = buff8_index + 16;
        end
    end

    always @(posedge clk, posedge rst_buff4_index) begin
        if (rst_buff4_index)
            buff4_index = 8'b0;
        else if (buff4_index_en && !count_type3)
            buff4_index = buff4_index + 4;
        else if (buff4_index_en && count_type3)
            buff4_index = buff4_index + 1;
    end

    always @(posedge clk, posedge rst_memory_to_buff8_counter) begin
        if (rst_memory_to_buff8_counter)
            memory_to_buff8_count = 8'b0;
        else if (memory_to_buff8_counter_en)
            memory_to_buff8_count = memory_to_buff8_count + 1;
    end

    always @(posedge clk, posedge rst_buff8_to_buff4_counter) begin
        if (rst_buff8_to_buff4_counter)
            buff8_to_buff4_count = 8'b0;
        else if (buff8_to_buff4_counter_en)
            buff8_to_buff4_count = buff8_to_buff4_count + 1;
    end

    always @(posedge clk, posedge rst_sum_counter) begin
        if (rst_sum_counter)
            buff4_index = 8'b0;
        else if (sum_counter_en)
            sum_count = sum_count + 1;
    end

endmodule