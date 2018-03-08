module check (count, time_out, result, clk);
	input [3:0] count;
	input clk;
	input time_out;
	output reg [3:0] result;
	always @ (posedge clk)
	begin
	if (count == 4'b0)
	begin
	if (time_out == 1'b1)
	begin
	result <= 4'd10;
	end
	else result <= count;
	end
	else result <= count;
	end
	endmodule
	