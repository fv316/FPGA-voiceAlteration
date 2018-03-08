module lfsr14 (enable,data_out, clk);

	output [14:1]	data_out;
	input				enable,clk;
	
	reg	[14:1]	sreg;
	
	initial sreg = 14'd1;
	
	always @ (posedge clk)
	begin
	if (enable==1)
		sreg <= {sreg[13:1], sreg[1] ^ sreg[6] ^ sreg[10] ^ sreg[14]};
		end
	assign data_out = sreg ;
endmodule 