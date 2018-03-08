module led  (out,in, time_out);

	output[9:0] out;
	input [3:0] in;
	input time_out;
	
	reg    [9:0] out;
	always @ (in)
		case (in)   
		4'd9: out <= 10'b1000000000;
		4'd8: out <= 10'b1100000000;
		4'd7: out <= 10'b1110000000;
		4'd6: out <= 10'b1111000000;
		4'd5: out <= 10'b1111100000;
		4'd4: out <= 10'b1111110000;
		4'd3: out <= 10'b1111111000;
		4'd2: out <= 10'b1111111100;
		4'd1: out <= 10'b1111111110;
		4'd0: if (time_out == 1) out <=  10'b0;
		else  out <=  10'b1111111111;
		default:
		 out <= 10'b0000000000;
		endcase
		
	endmodule 