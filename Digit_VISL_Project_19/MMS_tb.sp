.title MMS testbench
 
.option CONVERGE=5
.options list node post=2 probe


** add library section
* .protect
* .lib '/data2/class/lxy/lxy1/2020project/lib/l0040ll_v1p4_1r.lib' TT
* .inc '/data2/class/lxy/lxy1/2020project/lib/l0040ll_v1p4_1r.mdl'
* .unprotect

.protect
.lib './lib/l0040ll_v1p4_1r.lib' TT
.inc './lib/l0040ll_v1p4_1r.mdl'
.unprotect

** add design netlist

.include './MMS19.sp'     

.global vdd! gnd! vdd_! gnd_!


** add device under test

X_MMS  
*input
+ clk reset start valid 							
+ data7 data6 data5 data4 data3 data2 data1 data0 
*output
+ max7 max6 max5 max4 max3 max2 max1 max0  
+ min7 min6 min5 min4 min3 min2 min1 min0
+ sum13 sum12 sum11 sum10 sum9 sum8 sum7 sum6 sum5 sum4 sum3 sum2 sum1 sum0	
+ MMS_4F

** input driver
.subckt INV in out Wmin=120n Lmin=40n f=1
X_Mp out in vdd_! vdd_! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn out in gnd_! gnd_! n11ll_ckt W='Wmin*f' L=Lmin
.ends INV

.subckt buffer in out
X_inv1 in nin INV
X_inv2 nin out INV f=4
.ends buffer

X_buffer1	clk_	clk 	buffer
X_buffer2	reset_ 	reset 	buffer
X_buffer3	start_ 	start 	buffer
X_buffer4	valid_ 	valid 	buffer
X_buffer5	data_7 	data7 	buffer
X_buffer6	data_6 	data6 	buffer
X_buffer7	data_5 	data5 	buffer
X_buffer8	data_4 	data4 	buffer
X_buffer9	data_3 	data3 	buffer
X_buffer10	data_2 	data2 	buffer
X_buffer11	data_1 	data1 	buffer
X_buffer12	data_0 	data0 	buffer

** add output load

.param	cl=4f

Cmax7	max7 	0	c=cl
Cmax6	max6 	0	c=cl
Cmax5	max5	0	c=cl
Cmax4	max4 	0	c=cl
Cmax3	max3 	0	c=cl
Cmax2	max2 	0	c=cl
Cmax1	max1 	0	c=cl
Cmax0	max0 	0	c=cl

Cmin7	min7 	0 	c=cl
Cmin6	min6 	0 	c=cl
Cmin5	min5 	0 	c=cl
Cmin4	min4 	0 	c=cl
Cmin3	min3 	0 	c=cl
Cmin2	min2 	0 	c=cl
Cmin1	min1 	0 	c=cl
Cmin0	min0 	0 	c=cl

Csum13	sum13	0	c=cl
Csum12	sum12	0	c=cl
Csum11	sum11	0	c=cl
Csum10	sum10	0	c=cl
Csum9	sum9	0	c=cl
Csum8	sum8	0	c=cl
Csum7	sum7	0	c=cl
Csum6	sum6	0	c=cl
Csum5	sum5	0	c=cl
Csum4	sum4	0	c=cl
Csum3	sum3	0	c=cl
Csum2	sum2	0	c=cl
Csum1	sum1	0	c=cl
Csum0	sum0	0	c=cl

** add power supply

.param	pwsp=0.245
Vddgl	vdd!	0	dc=pwsp
Vddgnd	gnd!   	0   dc=0
Vddgl_	vdd_! 	0	dc=pwsp
Vddgnd_	gnd_!   0   dc=0

** add stimulition 

.param	fclk = 200k tper='1/fclk'

.param	ts=10p
.VEC './simu.vec'

Vclk	clk_ 	0	pulse(0 pwsp 'tper-ts/2' ts ts 'tper/2-ts' tper)
Vrst	reset_	0	pulse(0 pwsp 50p ts ts 'tper' 10)

** add simulation command

.tran 1n  'tper*45'
.op
  
.probe tran v(vdd!) v(gnd!) v(clk*) v(reset*) v(start*) v(valid*) v(data*) v(max*) v(min*) v(sum*) v(s*)

.measure tran avg_power avg p(vddgl) from=0 to='tper*45'

.alter
.param fclk=2Meg
.param pwsp=0.37

.alter
.param fclk=1G
.param pwsp=0.98
.end
