module fsm (
clk,
tick,
trigger,
time_out,
en_fsr,
start_delay,
LEDR
);


input trigger,clk,tick,time_out;
reg [3:0] count;
output reg en_fsr,start_delay;
output  [9:0] LEDR;
initial count=4'b1010;
initial en_fsr=1'b1;
initial start_delay=1'b0;

reg temp;
//wire temp2;
//reg [3:0] exep;
//initial exep = 4'b0000;
always @ (posedge clk)
if (trigger==1) begin
temp<=1;
//begin
//exep <= 4'b0000;
//end
end 
else if (count==0) begin
temp<=0;
//if(time_out==1) begin
//		exep<=4'd10;
//		end
end
always @ (posedge tick) begin
	case (count)
		4'b1010: if (temp==1) begin 
		   count<=4'd9;end
		4'b1001: count<=4'd8; 
		4'b1000: count<=4'd7;
		4'b0111: count<=4'd6;
		4'b0110: count<=4'd5;
		4'b0101: 
	      begin
		   count<=4'd4;
			en_fsr<=0; end 	
      4'b0100: count<=4'd3;
		4'b0011: count<=4'd2;
		4'b0010: count<=4'd1;
		4'b0001: begin
				start_delay=1;
				count<=4'd0; end
		4'b0000: if(time_out==1) begin
		count<=4'd10;
		start_delay=0;
		end
		default:
			count<=4'd10;
		endcase
		
end
//or orr2 (temp2, count, exep);
led L1 (LEDR, count);
endmodule
	

