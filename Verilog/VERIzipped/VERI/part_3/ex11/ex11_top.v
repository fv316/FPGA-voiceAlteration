module ex11_top (SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);

input [9:0] SW;
input CLOCK_50 ;

output DAC_CS ;
output DAC_SDI ;
output DAC_LD ;
output DAC_SCK ;
output PWM_OUT ;
wire load;




div_5000 cllk(CLOCK_50, load);


spi2dac spd(CLOCK_50 , SW, load, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

pwm p(CLOCK_50, SW, load, PWM_OUT);

endmodule
