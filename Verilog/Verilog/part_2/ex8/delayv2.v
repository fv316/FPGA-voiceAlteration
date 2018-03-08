module delayv2 (N, clk, trigger, time_out);

input [13:0] N;
input clk, trigger;
output reg time_out;
reg [1:0] state;
initial state = 2'b0;
reg [13:0] count;
initial count = 0;
initial time_out <= 0;

always @ (posedge clk)
	case (state)
		2'b0: if (trigger == 1)
		begin
		state <= 1;
		count <= 0;
		end
		2'b1: if (count == N-1)
		begin 
		state <= 2'b10;
		time_out <= 1;
		end
		else begin
		count <= count + 1'b1;
		time_out <= 0;
		end
		2'b10: if (trigger == 0)
		begin
		state <= 2'b0;
		time_out <= 0;
		end
	endcase
endmodule
		