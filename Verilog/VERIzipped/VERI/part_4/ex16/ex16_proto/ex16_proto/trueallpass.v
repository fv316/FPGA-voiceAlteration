module processor (sysclk, data_in, data_out, data_valid);
 
       input                        sysclk, data_valid;       // system clock
       input [9:0]       data_in;            // 10-bit input data
       output [9:0]     data_out;  // 10-bit output data
 
       wire                          sysclk;
       wire [9:0]         data_in;
       reg [9:0]           data_out;
       wire [9:0]         x,y;
       wire full, pulse;
       wire [9:0] q;
       parameter              ADC_OFFSET = 10'h181;
       parameter              DAC_OFFSET = 10'h200;
       assign x = data_in[9:0] - ADC_OFFSET;   
       
		 assign y = x;
       
		 always @(posedge sysclk)
       begin
              data_out <=  y + DAC_OFFSET;
				  end
             
endmodule