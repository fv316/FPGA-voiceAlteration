module ex13_top(CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT,KEY);

input CLOCK_50;
input [3:0] KEY;

wire [9:0] A;
wire [9:0] D;
wire sampling_pulse;

output PWM_OUT;
output DAC_CS ;
output DAC_SDI ;
output DAC_LD ;
output DAC_SCK ;

div_5000 clockdivider (CLOCK_50, sampling_pulse);

counter_10 ct10 ( CLOCK_50, sampling_pulse, A, ~KEY[1]);

ROM rom1(A,sampling_pulse,D);

spi2dac spidac1 (CLOCK_50, D, sampling_pulse, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

pwm pwm1 (CLOCK_50, D, sampling_pulse, PWM_OUT);

endmodule
