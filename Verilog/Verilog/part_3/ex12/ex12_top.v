module ex12_top (SW, CLOCK_50, HEX0, HEX1, HEX2);

input [9:0] SW;
input CLOCK_50 ;

output [6:0] HEX0, HEX1, HEX2;

wire [9:0] q;


ROM romi(SW,CLOCK_50,q);

hex_to_7seg	BIT1 (HEX0, q[3:0],);
hex_to_7seg	BIT2 (HEX1, q[7:4],);
hex_to_7seg	BIT3 (HEX2, {2'b00,q[9:8]});



endmodule
