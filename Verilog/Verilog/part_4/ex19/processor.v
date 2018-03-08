module processor (sysclk, data_in, data_out, data_valid,SW,HEX0,HEX1,HEX2,HEX3);
 
       input                        sysclk, data_valid;       // system clock
		 input [8:0] SW;
       input [9:0]       data_in;            // 10-bit input data
       output [9:0]     data_out;  // 10-bit output data
		 output [6:0] HEX0,HEX1,HEX2,HEX3;
       wire                          sysclk;
       wire [9:0]         data_in;
       reg [9:0]           data_out;
       wire [9:0]         x,y;
       wire full, pulse;
       reg fullreg;
       wire [9:0] q;
		 wire [19:0] delay;
		 wire [3:0] BCD_0, BCD_1, BCD_2,BCD_3;
		 wire [12:0] rdaddress;
       parameter              ADC_OFFSET = 10'h181;
       parameter              DAC_OFFSET = 10'h200;
       assign x = data_in[9:0] - ADC_OFFSET;   
     
		 counter_13 (data_valid,1'b1,rdaddress, 1'b0);
/////////////////// 7-seg-display/////////////////////
mult m1(SW, delay);
		 bin2bcd_16 (delay[19:10], BCD_0, BCD_1, BCD_2,BCD_3);
		 hex_to_7seg	(HEX0,BCD_0);
		 hex_to_7seg	(HEX1,BCD_1);
		 hex_to_7seg	(HEX2,BCD_2);		 
		 hex_to_7seg	(HEX3,BCD_3);	
/////////////////////////////////////////////////////////
		 pulse_gen(pulse, data_valid, sysclk);
       RAM (sysclk,y[9:1],rdaddress,pulse,{SW[8:0],4'b0}+rdaddress,pulse,q[9:1]);
      
       assign y = x - {q[9], q[9:1]} ;
       always @(posedge sysclk)
       begin
              data_out <=  y + DAC_OFFSET;
              fullreg <= full;
				  end
             
endmodule
