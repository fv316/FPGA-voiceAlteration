module ex10_top (CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, SW);


input CLOCK_50 ;
input [9:0] SW;
output DAC_CS ;
output DAC_SDI ;
output DAC_LD ;
output DAC_SCK ;
wire load;

div_5000 clk (CLOCK_50, load);


spi2dac spd(CLOCK_50 , SW, load, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);



endmodule