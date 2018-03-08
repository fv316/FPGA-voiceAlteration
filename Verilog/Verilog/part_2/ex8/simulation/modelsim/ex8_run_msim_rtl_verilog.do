transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI/part_2/ex7_top {H:/VERI/part_2/ex7_top/lfsr7bit.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/ex8 {H:/VERI/part_2/ex8/ex8_top.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/ex6_top {H:/VERI/part_2/ex6_top/divider_50000.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/ex8 {H:/VERI/part_2/ex8/fsm.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/ex8 {H:/VERI/part_2/ex8/delay.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/mylib {H:/VERI/part_2/mylib/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/mylib {H:/VERI/part_2/mylib/bin2bcd_16.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/ex8 {H:/VERI/part_2/ex8/div_2500.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/mylib {H:/VERI/part_2/mylib/add3_ge5.v}

