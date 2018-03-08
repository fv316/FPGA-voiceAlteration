
module ex15_top2(CLOCK_50,DAC_CS,DAC_SDI,DAC_LD,DAC_SCK,PWM_OUT,HEX0,HEX1,HEX2,HEX3,HEX4,ADC_SDI,ADC_CS,ADC_SCK,ADC_SDO);

input CLOCK_50,ADC_SDO;
output DAC_CS,DAC_SDI,DAC_LD,DAC_SCK,PWM_OUT,ADC_SDI,ADC_CS,ADC_SCK;
output[6:0] HEX0,HEX1,HEX2,HEX3,HEX4;

wire DAC_CS,DAC_SDI,DAC_LD,DAC_SCK,CLOCK_50,ADC_SDI,ADC_CS,ADC_SCK,ADC_SDO;
wire ldclk,data_valid;
wire[6:0] HEX0,HEX1,HEX2,HEX3,HEX4;
wire[3:0] BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;

wire[9:0] sineWave,adcOut;
wire[23:0] B;
reg[9:0] ADR,freqData;

initial freqData = 0;

always @(posedge ldclk)
begin
	freqData <= adcOut;
	ADR <= ADR + freqData;
end


div_5000 cl(CLOCK_50, ldclk);

ROM sw(ADR,ldclk,sineWave);

spi2adc_v3 ck(.sysclk(CLOCK_50), .channel(1'b0), .data_from_adc(adcOut),
			.start(ldclk), .data_valid(data_valid), 
			.sdata_to_adc(ADC_SDI), .adc_cs(ADC_CS), 
			.adc_sck(ADC_SCK), .sdata_from_adc(ADC_SDO));

spi2dac_v3 s2d(CLOCK_50, sineWave, ldclk, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
pwm p1(CLOCK_50,sineWave,ldclk,PWM_OUT);

bin2bcd_16 b2b(B[23:10],BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);

mult m1(freqData,B);

hex_to_7seg h27s0(HEX0,BCD_0);
hex_to_7seg h27s1(HEX1,BCD_1);
hex_to_7seg h27s2(HEX2,BCD_2);
hex_to_7seg h27s3(HEX3,BCD_3);
hex_to_7seg h27s4(HEX4,BCD_4);


endmodule
