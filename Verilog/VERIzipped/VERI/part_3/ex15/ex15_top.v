module ex15_top(CLOCK_50,DAC_CS,DAC_SDI,DAC_LD,DAC_SCK,PWM_OUT,HEX0,HEX1,HEX2,HEX3,HEX4,ADC_SDI,ADC_CS,ADC_SCK,ADC_SDO);

input CLOCK_50, ADC_SDO;
output DAC_CS,DAC_SDI,DAC_LD,DAC_SCK,PWM_OUT,ADC_SDI,ADC_CS,ADC_SCK;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4;

reg [9:0] A, freq;
initial A = 10'b0 ;
initial freq = 127;

wire [9:0] D;
wire tenk;

wire [9:0] intoreg, adcOut;

wire [3:0] BCD_0, BCD_1, BCD_2, BCD_3,BCD_4;
wire [23:0] multiply_by_k;

div_5000 div1(CLOCK_50, tenk);

ROM rom1(A,tenk,D);

spi2dac_v3 spidac1(CLOCK_50, D, tenk, DAC_SDI, DAC_CS, DAC_scK, DAC_LD);

pwm pwm1(CLOCK_50, D, tenk, PWM_OUT);

spi2adc_v3 spiadc1(.sysclk(CLOCK_50), .channel(1'b0), .data_from_adc(adcOut),
			.start(tenk), .data_valid(data_valid), 
			.sdata_to_adc(ADC_SDI), .adc_cs(ADC_CS), 
			.adc_sck(ADC_SCK), .sdata_from_adc(ADC_SDO));

			
mult m (SW,multiply_by_k);

bin2bcd_16  bin(multiply_by_k[23:10], BCD_0, BCD_1, BCD_2, BCD_3,BCD_4);

hex_to_7seg	h0(HEX0, BCD_0);
hex_to_7seg	h1(HEX1, BCD_1);
hex_to_7seg	h2(HEX2, BCD_2);
hex_to_7seg	h3(HEX3, BCD_3);
hex_to_7seg	h4(HEX4, BCD_4);

assign intoreg = freq + A ;

always @ (posedge tenk)
begin
	freq <= adcOut;
    A <= intoreg ;
end
endmodule
