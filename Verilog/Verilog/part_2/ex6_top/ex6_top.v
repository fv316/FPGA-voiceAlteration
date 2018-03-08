module ex6_top (CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4);
	input CLOCK_50;
	input [1:0] KEY;
	
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	wire [15:0] counter_16_wire;
	wire tick;
	wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;
	div_50000 divider (CLOCK_50, tick);
	
	counter_16 c0 (CLOCK_50, ((!KEY[0])&tick), counter_16_wire, !KEY[1]);
	bin2bcd_16 BIN (counter_16_wire, BCD0, BCD1, BCD2, BCD3, BCD4);
	
	hex_to_7seg H1 (BCD0, HEX0);
	hex_to_7seg H2 (BCD1, HEX1);
	hex_to_7seg H3 (BCD2, HEX2);
	hex_to_7seg H4 (BCD3, HEX3);
	hex_to_7seg H5 (BCD4, HEX4);
endmodule
