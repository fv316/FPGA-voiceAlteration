module clktick (clock, k, tick, enable);
	input clock;
	input [15:0] k;
	input enable;
	output tick;
	reg tick;
	reg [15:0] count;
	initial count = k;
	initial tick = 1'b0;
	always @ (posedge clock)
	if (enable == 1'b1)
		if (count == 0) begin
			tick <= 1'b1;
			count <= k;
			end
		else begin
			tick <= 1'b0;
			count <= count - 1'b1;
			end
endmodule
