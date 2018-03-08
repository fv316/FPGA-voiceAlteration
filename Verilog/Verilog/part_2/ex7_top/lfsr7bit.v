//`timescale 100ns / 10ns


module lfsr7 (enable, data_out , clock);

  output [7:1] data_out;
  input  clock;
  input enable;
  
  reg [7:1] sreg;
  
  initial sreg = 7'b1;
//  
//  always @ (posedge clock)
//  if (enable == 1'b1) 
//      sreg <= {sreg[6:1],sreg[1] ^ sreg[7]};
//		

	always @ (negedge enable)
	sreg <=  {sreg[6:1],sreg[1] ^ sreg[7]};
  assign data_out = {1'b0,sreg};
 
endmodule
  