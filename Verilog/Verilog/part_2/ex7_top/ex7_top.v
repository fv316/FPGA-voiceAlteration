module ex7_top (CLOCK_50, KEY, HEX0, HEX1);

   input CLOCK_50;
	input [3:0] KEY;
//	wire [3:0] BCD0, BCD1, BCD2 ;
	wire [6:0] count ;
	
	output [6:0] HEX0, HEX1;
	
	lfsr7 lsfr_one(KEY[3], count, CLOCK_50);
	
	
	hex_to_7seg	BIT1 (count[3:0], HEX0);
	hex_to_7seg	BIT2 (count[6:4], HEX1);
	
	// to display in decimal 
//	bin2bcd8 to_bcd(count, BCD0, BCD1, BCD2);
//	
//	hex_to_7seg	BIT1 (BCD0, HEX0);
//	hex_to_7seg	BIT2 (BCD1, HEX1);
//	hex_to_7seg	BIT3 (BCD2, HEX2);
//	
endmodule 