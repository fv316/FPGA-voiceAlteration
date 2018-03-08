 
//------------------------------
// Module name: allpass processor
// Function: Simply to pass input to output
// Creator:  Peter Cheung
// Version:  1.1
// Date:     24 Jan 2014
//------------------------------
 
module processor (sysclk, data_in, data_out, data_valid);
 
       input                        sysclk, data_valid;       // system clock
       input [9:0]       data_in;            // 10-bit input data
       output [9:0]     data_out;  // 10-bit output data
 
       wire                          sysclk;
       wire [9:0]         data_in;
       reg [9:0]           data_out;
       wire [9:0]         x,y;
       wire full, pulse;
       reg fullreg;
       wire [9:0] q;
       parameter              ADC_OFFSET = 10'h181;
       parameter              DAC_OFFSET = 10'h200;
       assign x = data_in[9:0] - ADC_OFFSET;   

		 pulse_gen(pulse, data_valid, sysclk);
       FIFO (sysclk, x, (fullreg & pulse), pulse, full, q);
      
       assign y = x + {q[9], q[9:1]} ;
       
		 always @(posedge sysclk)
       begin
              data_out <=  y + DAC_OFFSET;
              fullreg <= full;
				  end
             
endmodule
