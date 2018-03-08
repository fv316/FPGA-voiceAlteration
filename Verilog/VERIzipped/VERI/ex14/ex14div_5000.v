
module div_5000 (clock, out);

   parameter BIT_SZ = 16;
	input clock;
	output out;
	
	
	reg [BIT_SZ-1:0] count;
	reg out;
	
	
	initial count = 0;
	initial out = 0;
	
	always @ (posedge clock)
	begin
		if (count == 16'd4999) begin
			out <= ~out;
			count <= 1'b0; end
		else begin
		   count <= count + 1'b1;
			out <= out; end
		
end
endmodule
