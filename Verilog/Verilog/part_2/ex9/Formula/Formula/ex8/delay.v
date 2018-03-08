module delay (
N,
clk,
trigger,
time_out
);

input [15:0] N;
input clk, trigger;
output reg time_out;
initial time_out=0;
initial count=0;
reg [15:0] count;

always @ (posedge clk)
 if (trigger==1'b1)begin
		if (count==N-1) begin
			time_out<=1'b1;
		end
		else begin
			time_out<=1'b0;
			count<=count+1'b1;
		end
end
endmodule 