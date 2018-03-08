module reactions (clk, time_out, react, key);
	input clk, time_out, key;
	output [13:0] react;
	reg [1:0] state;
	initial state <= 0;
	reg [13:0] count;
	initial count = 0;
	
	always @ (posedge clk)
		case (state)
		2'b00: if (time_out == 1) begin state <= 2'b01;
		count <= 0; end
		2'b01: if (key == 1) state <= 2'b10;
		else count <= count + 1;
		2'b10: if (time_out == 0) state <= 2'b00;
	endcase
	
	assign react = count;
endmodule
		