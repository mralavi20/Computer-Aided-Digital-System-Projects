module Controller (input clk, rst, start, z1, z2, z3, z4, output reg done, s1, output reg [1:0] s2);
    reg [2:0] ps, ns;

    always @(ps, start, z1, z2, z3, z4) begin
        ns = 3'b000;
        s1 = 1'b0;
        done = 1'b0;

        case (ps)
            3'b000: ns = start ? 3'b001 : 3'b000;
            3'b001: begin 
                ns = 3'b010;
                s1 = 1'b0;
            end
            3'b010: ns = 3'b011;
            3'b011: ns = 3'b100;
            3'b100: begin 
                ns = ((z1 && z2 && z3) || (z1 && z2 && z4) || (z1 && z3 && z4) || (z2 && z2 && z4)) ? 3'b101 : 3'b010;
                s1 = 1'b1;
                s2 = (z1 == 1'b0) ? 2'b00 :
                         (z2 == 1'b0) ? 2'b01 :
                         (z3 == 1'b0) ? 2'b10 :
                         (z4 == 1'b0) ? 2'b11 :
                         2'b00;
            end
            3'b101: begin 
                ns = 3'b101;
                done = 1'b1;
            end
        endcase
    end

    always @(posedge clk, posedge rst) begin
		if (rst == 1'b1)
			ps <= 3'b000;
		else
			ps <= ns;
	end
endmodule