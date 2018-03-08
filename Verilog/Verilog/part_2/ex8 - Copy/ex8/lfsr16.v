module lfsr16 (enable,data_out, clk);

	output [16:1]	data_out;
	input				enable,clk;
	
	reg	[16:1]	sreg;
	
	initial sreg = 16'd1;
	
	always @ (posedge clk)
	if (enable==1)
		sreg <= {sreg[15:1], sreg[1] ^ sreg[12] ^ sreg[3] ^ sreg[16]};
		
	assign data_out = sreg ;
endmodule 