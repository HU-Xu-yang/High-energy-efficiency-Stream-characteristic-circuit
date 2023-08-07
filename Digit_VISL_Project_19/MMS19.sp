.title subfile for MMS_tb.sp
* Author: Shuangwen Xie, xiesw20@mails.tsinghua.edu.cn
* Date:   January 9, 2021

* set the work temperature.
.temp 40

** interface for MMS_tb **
.subckt MMS_4F 
+ clk reset start valid 							
+ data7 data6 data5 data4 data3 data2 data1 data0 
+ max7 max6 max5 max4 max3 max2 max1 max0  
+ min7 min6 min5 min4 min3 min2 min1 min0
+ sum13 sum12 sum11 sum10 sum9 sum8 sum7 sum6 sum5 sum4 sum3 sum2 sum1 sum0

* routing and initializing 

* input of data[13:8] connect to ground, which will never be used.
* s[13:0] are the output of adder14, exactly 14 bit.
* cout is the carry output of adder14, never used.
X_test1 _data13 _data12 _data11 _data10 _data9 _data8 data7 data6 data5 data4 data3 data2 data1 data0 
+       sum13   sum12   sum11   sum10   sum9   sum8   sum7  sum6  sum5  sum4  sum3  sum2  sum1  sum0
+       s13     s12     s11     s10     s9     s8     s7    s6    s5    s4    s3    s2    s1    s0     Adder14
V_a13 _data13 gnd! 0
V_a12 _data12 gnd! 0
V_a11 _data11 gnd! 0
V_a10 _data10 gnd! 0
V_a9  _data9  gnd! 0
V_a8  _data8  gnd! 0

* if valid = 1, y[13:0] = s[13:0];
* if valid = 0, y[13:0] = sum[13:0].
X_test2 valid s13   s12   s11   s10   s9   s8   s7   s6   s5   s4   s3   s2   s1   s0
+             sum13 sum12 sum11 sum10 sum9 sum8 sum7 sum6 sum5 sum4 sum3 sum2 sum1 sum0
+             y13   y12   y11   y10   y9   y8   y7   y6   y5   y4   y3   y2   y1   y0               MUX28to14

* if start = 1, z[13:0] = h[13:0] = 0...0(14 bit);
* if start = 0, z[13:0] = y[13:0].
X_test3 start h13 h12 h11 h10 h9 h8 h7 h6 h5 h4 h3 h2 h1 h0
+             y13 y12 y11 y10 y9 y8 y7 y6 y5 y4 y3 y2 y1 y0
+             z13 z12 z11 z10 z9 z8 z7 z6 z5 z4 z3 z2 z1 z0         MUX28to14
V_h13 h13 gnd! 0
V_h12 h12 gnd! 0
V_h11 h11 gnd! 0
V_h10 h10 gnd! 0
V_h9  h9  gnd! 0
V_h8  h8  gnd! 0
V_h7  h7  gnd! 0
V_h6  h6  gnd! 0
V_h5  h5  gnd! 0
V_h4  h4  gnd! 0
V_h3  h3  gnd! 0
V_h2  h2  gnd! 0
V_h1  h1  gnd! 0
V_h0  h0  gnd! 0

* asynchronous reset. reset = 1, sum[13:0] = 0...0(14 bit);
* reset = 0, sum[13:0] = z[13:0] in every positive pulse.
X_test4 clk reset z13   z12   z11   z10   z9   z8   z7   z6   z5   z4   z3   z2   z1   z0
+                 sum13 sum12 sum11 sum10 sum9 sum8 sum7 sum6 sum5 sum4 sum3 sum2 sum1 sum0  Reg14

* y_22 = 1, for max[7:0] > data[7:0].
* and vice versa.
X_test5 
+       max7  max6  max5  max4  max3  max2  max1  max0
+       data7 data6 data5 data4 data3 data2 data1 data0
+       y_22                                                 Comparator8

* y_22 = 1, mx[7:0] = max[7:0];
* y_22 = 0, mx[7:0] = data[7:0].
X_test6 y_22 max7  max6  max5  max4  max3  max2  max1  max0
+            data7 data6 data5 data4 data3 data2 data1 data0 
+            mx7   mx6   mx5   mx4   mx3   mx2   mx1   mx0   MUX16to8

* valid = 1, mvx[7:0] = mx[7:0];
* and vice versa.
X_test7 valid mx7  mx6  mx5  mx4  mx3  mx2  mx1  mx0
+             max7 max6 max5 max4 max3 max2 max1 max0
+             mvx7 mvx6 mvx5 mvx4 mvx3 mvx2 mvx1 mvx0     MUX16to8

* start = 1, msx[7:0] = h[7:0] = 0000 0000.(remember h[7:0] is to gnd.)
* and vice versa.
X_test8 start h7 h6 h5 h4 h3 h2 h1 h0
+             mvx7 mvx6 mvx5 mvx4 mvx3 mvx2 mvx1 mvx0
+             msx7 msx6 msx5 msx4 msx3 msx2 msx1 msx0     MUX16to8

* asynchronous reset. reset = 1, max[7:0] = 0...0(8 bit);
* reset = 0, max[7:0] = msx[7:0] in every positive pulse.
X_test9 clk reset msx7 msx6 msx5 msx4 msx3 msx2 msx1 msx0
+                 max7 max6 max5 max4 max3 max2 max1 max0 Reg8

* y222 = 1, for mqn[7:0] > data[7:0]. 
* and vice versa.
X_test10 
+        data7 data6 data5 data4 data3 data2 data1 data0
+        mqn7  mqn6  mqn5  mqn4  mqn3  mqn2  mqn1  mqn0
+        y222                                                  Comparator8

* if y000 = 1, mn[7:0] = mqn[7:0];
* and vice versa.
X_test11 y222 mqn7  mqn6  mqn5  mqn4  mqn3  mqn2  mqn1  mqn0
+             data7 data6 data5 data4 data3 data2 data1 data0
+             mn7   mn6   mn5   mn4   mn3   mn2   mn1   mn0    MUX16to8

* if valid = 1, mvn[7:0] = mn[7:0];
* and vice versa.
X_test12 valid mn7  mn6  mn5  mn4  mn3  mn2  mn1  mn0 
+              mqn7 mqn6 mqn5 mqn4 mqn3 mqn2 mqn1 mqn0
+              mvn7 mvn6 mvn5 mvn4 mvn3 mvn2 mvn1 mvn0        MUX16to8

* to calculate the power, short f[7:0] with vdd!.
* if start = 1, msn[7:0] = f[7:0] = 1111 1111.
* and vice versa.
* to get the first number to compare with the input must be FFh.
X_test13 start f7   f6   f5   f4   f3   f2   f1   f0
+              mvn7 mvn6 mvn5 mvn4 mvn3 mvn2 mvn1 mvn0
+              msn7 msn6 msn5 msn4 msn3 msn2 msn1 msn0        MUX16to8
V_f7 f7 vdd! 0
V_f6 f6 vdd! 0
V_f5 f5 vdd! 0
V_f4 f4 vdd! 0
V_f3 f3 vdd! 0
V_f2 f2 vdd! 0
V_f1 f1 vdd! 0
V_f0 f0 vdd! 0

* asynchronous reset. reset = 1, mqn[7:0] = 0...0(8 bit);
* reset = 0, mqn[7:0] = msn[7:0] in every positive pulse.
X_test14 clk reset msn7 msn6 msn5 msn4 msn3 msn2 msn1 msn0
+                  mqn7 mqn6 mqn5 mqn4 mqn3 mqn2 mqn1 mqn0    Reg8

* if start = 1, min[7:0] = h[7:0] = 00h.
* and vice versa.
* to guarantee the min[7:0] = 00h when start = 1.
X_test15 start h7   h6   h5   h4   h3   h2   h1   h0
+              mqn7 mqn6 mqn5 mqn4 mqn3 mqn2 mqn1 mqn0
+              min7 min6 min5 min4 min3 min2 min1 min0      MUX16to8
.ends MMS_4F


** group of numerous varity of basic circuitries or sealed modules **

.subckt Inverter in out Wmin=120n Lmin=40n f=1
X_Mp out in vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn out in gnd! gnd! n11ll_ckt W='Wmin*f'   L=Lmin
.ends Inverter

.subckt MyBuffer in out
X_inv1 in  nin Inverter
X_inv2 nin out Inverter
.ends MyBuffer

.subckt NAND2 ina inb out Wmin=120n Lmin=40n f=1
X_Mp1 out ina vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mp2 out inb vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn1 out ina cmm  gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn2 cmm inb gnd! gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
.ends NAND2

.subckt AND2 ina inb out 
X_nand2    ina  inb cmm  NAND2
X_inverter cmm  out      Inverter
.ends AND2

.subckt NAND3 ina inb inc out Wmin=120n Lmin=40n f=1
X_Mp1 out  ina vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mp2 out  inb vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mp3 out  inc vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn1 out  ina cmm1 gnd! n11ll_ckt W='Wmin*3*f' L=Lmin
X_Mn2 cmm1 inb cmm2 gnd! n11ll_ckt W='Wmin*3*f' L=Lmin
X_Mn3 cmm2 inc gnd! gnd! n11ll_ckt W='Wmin*3*f' L=Lmin
.ends NAND3

******** better power comsuption***********
.subckt AND3 ina inb inc out               $
X_nand3_1  ina  inb inc out1  NAND3        $
X_inverter out1 out           Inverter     $
.ends AND3                                 $
* .subckt AND3 ina inb inc out             $
* X_and2_1 ina inb out1 NAND2              $
* X_inverter1 inc out2 Inverter            $
* X_nor2_1 out1 out2 out NOR2              $
* .ends AND3                               $
******************************************

.subckt AND4 ina inb inc ind out
X_nand2_1 ina  inb  out1 NAND2
X_nand2_2 inc  ind  out2 NAND2
X_nor2_1  out1 out2 out  NOR2
.ends AND4

.subckt AND5 ina inb inc ind ine out
X_nand3_1  ina  inb inc out1 NAND3
X_nand2_1  ind  ine     out2 NAND2
X_nor2_1   out1 out2    out  NOR2
.ends AND5

.subckt NOR2 ina inb out Wmin=120n Lmin=40n f=1
X_Mp1 cmmP ina vdd! vdd! p11ll_ckt W='Wmin*4*f' L=Lmin
X_Mp2 out  inb cmmP vdd! p11ll_ckt W='Wmin*4*f' L=Lmin
X_Mn1 out  ina gnd! gnd! n11ll_ckt W='Wmin*f'   L=Lmin
X_Mn2 out  inb gnd! gnd! n11ll_ckt W='Wmin*f'   L=Lmin
.ends NOR2

.subckt OR2 ina inb out
X_nor2_1 ina inb out1 NOR2
X_inverter out1 out   Inverter
.ends OR2

.subckt NOR3 ina inb inc out Wmin=120n Lmin=40n f=1
X_Mp1 cmm1 ina vdd! vdd! p11ll_ckt W='Wmin*6*f' L=Lmin
X_Mp2 cmm2 inb cmm1 vdd! p11ll_ckt W='Wmin*6*f' L=Lmin
X_Mp3 out  inc cmm2 vdd! p11ll_ckt W='Wmin*6*f' L=Lmin
X_Mn1 out  ina gnd! gnd! n11ll_ckt W='Wmin*f'   L=Lmin
X_Mn2 out  inb gnd! gnd! n11ll_ckt W='Wmin*f'   L=Lmin
X_Mn3 out  inc gnd! gnd! n11ll_ckt W='Wmin*f'   L=Lmin
.ends NOR3

.subckt OR3 ina inb inc out
X_nor3_1 ina inb inc out1 NOR3
X_inverter out1 out       Inverter
.ends OR3

.subckt NOR4 ina inb inc ind out
X_nor2_1 ina  inb  out1 NOR2
X_nor2_2 inc  ind  out2 NOR2
X_and2_1 out1 out2 out  AND2
.ends NOR4

.subckt NOR5 ina inb inc ind ine out
X_nor2_1 ina  inb  out1     NOR2
X_nor3_1 inc  ind  ine out2 NOR3
X_and2_1 out1 out2 out      AND2
.ends NOR5

.subckt XOR2 ina inb out 
X_nand2_1 ina  inb  out1 NAND2
X_nand2_2 ina  out1 out2 NAND2
X_nand2_3 out1 inb  out3 NAND2
X_nand2_4 out2 out3 out  NAND2
.ends XOR2

* .subckt XOR2 ina inb out 
* X_inverter1 inb _inb  Inverter
* X_inverter2 ina _ina  Inverter
* X_transgate1 ina  _ina inb  out1 TransGate
* X_transgate2 _ina ina  _inb out1 TransGate
* X_inverter3  out1 out            Inverter
* .ends XOR2

.subckt TransGate en _en vin vout Wmin=120n Lmin=40n f=1
X_Mp1 vin _en vout vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn1 vin en  vout gnd! n11ll_ckt W='Wmin*f'   L=Lmin
.ends TransGate

** D flip flop **
.subckt D_Latch clk _clk din qout _qout
X_transgate1 _clk  clk   din  din1 TransGate
X_transgate2 clk   _clk  din1 qout TransGate
X_inverter1  din1  _qout           Inverter
X_inverter2 _qout qout             Inverter
.ends D_Latch

.subckt D_PulseTrigger clk rst din qout _qout
X_inverter1  clk  clk1                     Inverter
X_inverter2  clk1 clk2                     Inverter
X_D_Latch1   clk  clk1  din   qout1 _qout1 D_Latch
X_transgate1 clk2 clk1  _qout1 din1        TransGate
X_transgate2 clk1 clk2  din1  _qout        TransGate
X_nor2_1     din1 rst   qout               NOR2
X_inverter3  qout       _qout              Inverter
.ends D_PulseTrigger

.subckt Reg4 clk rst a3 a2 a1 a0 b3 b2 b1 b0
X_d_pulsetrigger1 clk rst a3 b3 _b3 D_PulseTrigger
X_d_pulsetrigger2 clk rst a2 b2 _b2 D_PulseTrigger
X_d_pulsetrigger3 clk rst a1 b1 _b1 D_PulseTrigger
X_d_pulsetrigger4 clk rst a0 b0 _b0 D_PulseTrigger
.ends Reg4

.subckt Reg8 clk rst a7 a6 a5 a4 a3 a2 a1 a0
+                    b7 b6 b5 b4 b3 b2 b1 b0
X_reg4_1 clk rst a7 a6 a5 a4 b7 b6 b5 b4 Reg4
X_reg4_2 clk rst a3 a2 a1 a0 b3 b2 b1 b0 Reg4
.ends Reg8

.subckt Reg14 clk rst a13 a12 a11 a10 a9 a8 a7 a6 a5 a4 a3 a2 a1 a0 
+                     b13 b12 b11 b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
X_d_pulsetrigger1 clk rst a13 b13 _b13                D_PulseTrigger
X_d_pulsetrigger2 clk rst a12 b12 _b12                D_PulseTrigger
X_reg4_1          clk rst a11 a10 a9 a8 b11 b10 b9 b8 Reg4
X_reg8_1          clk rst a7 a6 a5 a4 a3 a2 a1 a0
+                         b7 b6 b5 b4 b3 b2 b1 b0     Reg8
.ends Reg14

** 1 bit half adder **
.subckt HA1 a0 b0 sum co
X_xor2_1 a0 b0 sum XOR2
X_and2_1 a0 b0 co  AND2
.ends HA1

** 1 bit full adder **
* .subckt FA1 ci a0 b0 sum co
* X_inverter1 ci     _ci           Inverter
* X_inverter2 a0     _a0           Inverter
* X_inverter3 b0     _b0           Inverter
* X_and2_1 _ci  _b0  co_1          AND2
* X_and2_2 _b0  _a0  co_2          AND2
* X_and2_3 _ci  _a0  co_3          AND2
* X_nor3_1 co_1 co_2 co_3 co       NOR3
* X_and3_1 ci   _b0  a0   sum1     AND3
* X_and3_2 _ci  b0   a0   sum2     AND3
* X_and3_3 _ci  _b0  _a0  sum3     AND3
* X_and3_4 ci   b0   _a0  sum4     AND3
* X_nor4_1 sum1 sum2 sum3 sum4 sum NOR4
* .ends FA1
.subckt FA1 ci a0 b0 sum co Wmin=120n Lmin=40n f=1
X_inverter1 ci     _ci           Inverter
X_inverter2 a0     _a0           Inverter
X_inverter3 b0     _b0           Inverter

X_Mp1 co1  ci vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mp2 cm1  b0 vdd! vdd! p11ll_ckt W='Wmin*4*f' L=Lmin
X_Mp3 co1  a0 cm1  vdd! p11ll_ckt W='Wmin*4*f' L=Lmin
X_Mn1 co1  b0 cm2  gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn2 co1  a0 cm2  gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn3 cm2  ci gnd! gnd! n11ll_ckt W='Wmin*2*f' L=Lmin

X_Mp4 co2  a0 vdd! vdd! p11ll_ckt W='Wmin*2*f' L=Lmin
X_Mp5 cm3  ci vdd! vdd! p11ll_ckt W='Wmin*4*f' L=Lmin
X_Mp6 co2  b0 cm3  vdd! p11ll_ckt W='Wmin*4*f' L=Lmin
X_Mn4 co2  ci cm4  gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn5 co2  b0 cm4  gnd! n11ll_ckt W='Wmin*2*f' L=Lmin
X_Mn6 cm4  a0 gnd! gnd! n11ll_ckt W='Wmin*2*f' L=Lmin

X_nand2_1 co1 co2 co NAND2
X_nand3_1 ci   _b0  a0   sum1     NAND3
X_nand3_2 _ci  b0   a0   sum2     NAND3
X_nand3_3 _ci  _b0  _a0  sum3     NAND3
X_nand3_4 ci   b0   _a0  sum4     NAND3
X_and4_1 sum1 sum2 sum3 sum4 sum  AND4
.ends FA1

.subckt Adder4_1 a3 a2 a1 a0 b3 b2 b1 b0 sum3 sum2 sum1 sum0 co
X_ha1_1 a0 b0 sum0 co1 HA1
X_fa1_1 co1 a1 b1 sum1 co2 FA1
X_fa1_2 co2 a2 b2 sum2 co3 FA1
X_fa1_3 co3 a3 b3 sum3 co  FA1
.ends Adder4_1

** 4 bit adder **
.subckt AdderCkt1 ina inb outa outb
X_nand2_1 ina inb outa NAND2
X_nor2_1  ina inb outb NOR2
.ends AdderCkt1

.subckt AdderCkt2 ina inb out
X_inverter1 inb _inb     Inverter
X_and2_1    ina _inb out AND2
.ends AdderCkt2

.subckt Adder4 cin a1 a2 a3 a4 b1 b2 b3 b4 sum1 sum2 sum3 sum4 cout
X_inverter1 cin  _cin Inverter
X_inverter2 _cin cin1 Inverter

* output for sum1
X_adderckt1_1 b1   a1     b1_1 a1_1 AdderCkt1
X_adderckt2_1 b1_1 a1_1   out1      AdderCkt2
X_xor2_1      out1 cin1   sum1      XOR2

* output for sum2
X_adderckt1_2 b2     a2       b2_1  a2_1   AdderCkt1
X_adderckt2_2 b2_1   a2_1     out2_1       AdderCkt2
X_mybuffer1   a1_1            out2_2       MyBuffer
X_and2_1      b1_1   _cin     out2_3       AND2
X_nor2_1      out2_2 out2_3   out2_2_1     NOR2
X_xor2_2      out2_1 out2_2_1 sum2         XOR2

* output for sum3
X_adderckt1_3 b3     a3    b3_1  a3_1            AdderCkt1
X_adderckt2_3 b3_1   a3_1        out3_1          AdderCkt2
X_mybuffer2   a2_1               out3_2          MyBuffer
X_and2_2      a1_1   b2_1        out3_3          AND2
X_and3_1      b2_1   b1_1  _cin  out3_4          AND3
X_nor3_1      out3_2 out3_3      out3_4 out3_3_1 NOR3
X_xor2_3      out3_1 out3_3_1    sum3            XOR2

* output for sum4
X_adderckt1_4 b4 a4  b4_1    a4_1                     AdderCkt1
X_adderckt2_4 b4_1   a4_1              out4_1         AdderCkt2
X_mybuffer3   a3_1                     out4_2         MyBuffer
X_and2_3      a2_1   b3_1              out4_3         AND2
X_and3_2      a1_1   b3_1    b2_1      out4_4         AND3
X_and4_1      b3_1   b2_1    b1_1 _cin out4_5         AND4
X_nor4_1      out4_2 out4_3  out4_4 out4_5 out4_4_1   NOR4
X_xor2_4      out4_1 out4_4_1       sum4              XOR2

* output for cout
X_mybuffer4 a4_1                               out5_1 MyBuffer
X_and2_4    a3_1   b4_1                        out5_2 AND2
X_and3_3    a2_1   b4_1   b3_1                 out5_3 AND3
X_and4_2    a1_1   b4_1   b3_1   b2_1          out5_4 AND4
X_and5_1    b4_1   b3_1   b2_1   b1_1   _cin   out5_5 AND5
X_nor5_1    out5_1 out5_2 out5_3 out5_4 out5_5 cout   NOR5
.ends Adder4

.subckt Adder4_Revise cin a1 a2 a3 a4 b1 b2 b3 b4 sum1 sum2 sum3 sum4
X_inverter1 cin  _cin Inverter
X_inverter2 _cin cin1 Inverter

* output for sum1
X_adderckt1_1 b1   a1     b1_1 a1_1 AdderCkt1
X_adderckt2_1 b1_1 a1_1   out1      AdderCkt2
X_xor2_1      out1 cin1   sum1      XOR2

* output for sum2
X_adderckt1_2 b2     a2       b2_1  a2_1   AdderCkt1
X_adderckt2_2 b2_1   a2_1     out2_1       AdderCkt2
X_mybuffer1   a1_1            out2_2       MyBuffer
X_and2_1      b1_1   _cin     out2_3       AND2
X_nor2_1      out2_2 out2_3   out2_2_1     NOR2
X_xor2_2      out2_1 out2_2_1 sum2         XOR2

* output for sum3
X_adderckt1_3 b3     a3    b3_1  a3_1            AdderCkt1
X_adderckt2_3 b3_1   a3_1        out3_1          AdderCkt2
X_mybuffer2   a2_1               out3_2          MyBuffer
X_and2_2      a1_1   b2_1        out3_3          AND2
X_and3_1      b2_1   b1_1  _cin  out3_4          AND3
X_nor3_1      out3_2 out3_3      out3_4 out3_3_1 NOR3
X_xor2_3      out3_1 out3_3_1    sum3            XOR2

* output for sum4
X_adderckt1_4 b4 a4  b4_1    a4_1                     AdderCkt1
X_adderckt2_4 b4_1   a4_1              out4_1         AdderCkt2
X_mybuffer3   a3_1                     out4_2         MyBuffer
X_and2_3      a2_1   b3_1              out4_3         AND2
X_and3_2      a1_1   b3_1    b2_1      out4_4         AND3
X_and4_1      b3_1   b2_1    b1_1 _cin out4_5         AND4
X_nor4_1      out4_2 out4_3  out4_4 out4_5 out4_4_1   NOR4
X_xor2_4      out4_1 out4_4_1       sum4              XOR2
.ends Adder4_Revise


** 14 bit adder **
.subckt Adder14 a13 a12 a11 a10 a9 a8 a7 a6 a5 a4 a3 a2 a1 a0 
+               b13 b12 b11 b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0 
+               s13 s12 s11 s10 s9 s8 s7 s6 s5 s4 s3 s2 s1 s0 

X_ha1_1       a0              b0              s0              c0   HA1
X_fa1_1    c0 a1              b1              s1              c1   FA1
X_adder4_1 c1 a2  a3  a4  a5  b2  b3  b4  b5  s2  s3  s4  s5  c5   Adder4
X_adder4_2 c5 a6  a7  a8  a9  b6  b7  b8  b9  s6  s7  s8  s9  c9   Adder4
X_adder4_revise_1 c9 a10 a11 a12 a13 b10 b11 b12 b13 s10 s11 s12 s13 Adder4_Revise
.ends Adder14

** 4 bit comparator **

***************** subckt CapCKt1 ***************************
* .subckt CapCkt1 ina inb inc out                           $
* X_and2_1 ina  inb  out1 AND2                              $
* X_and2_2 inb  inc  out2 AND2                              $
* X_nor2_1 out1 out2 out  NOR2                              $
* .ends CapCkt1                                             $
                                                            $
.subckt CapCkt1 ina inb inc out Wmin=120n Lmin=40n f=1      $
X_Mp1 cm1 ina vdd! vdd! phvt11ll_ckt W='Wmin*4*f' L=Lmin    $
X_Mp2 out inc cm1  vdd! phvt11ll_ckt W='Wmin*4*f' L=Lmin    $
X_Mp3 out inb vdd! vdd! phvt11ll_ckt W='Wmin*2*f' L=Lmin    $
X_Mn1 out ina cm2  gnd! nhvt11ll_ckt W='Wmin*2*f' L=Lmin    $
X_Mn2 out inc cm2  gnd! nhvt11ll_ckt W='Wmin*2*f' L=Lmin    $
X_Mn3 cm2 inb gnd! gnd! nhvt11ll_ckt W='Wmin*2*f' L=Lmin    $
.ends CapCkt1                                               $
*     this latter one is better in power comsuption         $
***************** subckt CapCKt1 ***************************

.subckt CapCkt2 ina inb inc ind ine inf out
X_nor3_1 ina  inb  inc out1 NOR3
X_nor3_2 ind  ine  inf out2 NOR3
X_and2_1 out1 out2 out      AND2
.ends CapCkt2

.subckt CapCkt2_Revise ina inb inc ind out
X_nor3_1 ina  inb  out1 NOR2
X_nor3_2 inc  ind  out2 NOR2
X_and2_1 out1 out2 out  AND2
.ends CapCkt2_Revise

.subckt CapCkt2_Revise1 ina inb inc ind ine out
X_nor3_1 ina  inb  inc out1 NOR3
X_nor3_2 ind  ine      out2 NOR2
X_and2_1 out1 out2 out      AND2
.ends CapCkt2_Revise1

* x_1, input  A<B
* x0 , input  A=B
* x1 , input  A>B
* y_1, output A<B
* y0 , output A=B
* y1 , output A>B
.subckt Comparator4 x_1 x0 x1 a3 a2 a1 a0 b3 b2 b1 b0 y_1 y0 y1

* the 1st stage
X_nand2_1 a0 b0 out0_1 NAND2
X_nand2_2 a1 b1 out1_1 NAND2
X_nand2_3 a2 b2 out2_1 NAND2
X_nand2_4 a3 b3 out3_1 NAND2

* the 2nd stage
X_capckt1_1 a0 out0_1 b0 out0_2 CapCkt1
X_capckt1_2 a1 out1_1 b1 out1_2 CapCkt1
X_capckt1_3 a2 out2_1 b2 out2_2 CapCkt1
X_capckt1_4 a3 out3_1 b3 out3_2 CapCkt1

* the 3rd stage
X_and2_1 out3_1 a3                          3rdout1  AND2
X_and3_1 out3_2 out2_1 a2                   3rdout2  AND3
X_and4_1 out2_2 out3_2 out1_1 a1            3rdout3  AND4
X_and5_1 out1_2 out2_2 out3_2 out0_1 a0     3rdout4  AND5
X_and5_2 x1     out0_2 out2_2 out1_2 out3_2 3rdout5  AND5
X_and5_3 x0     out0_2 out1_2 out2_2 out3_2 3rdout6  AND5
X_and5_4 x0     out0_2 out1_2 out2_2 out3_2 3rdout7  AND5
X_and5_5 x_1    out0_2 out1_2 out2_2 out3_2 3rdout8  AND5
X_and5_6 out1_2 out2_2 out3_2 out0_1 b0     3rdout9  AND5
X_and4_2 out2_2 out3_2 out1_1 b1            3rdout10 AND4
X_and3_2 out3_2 out2_1 b2                   3rdout11 AND3
X_and2_2 out3_1 b3                          3rdout12 AND2

* the 4th stage 
X_capckt2_1 3rdout1 3rdout2 3rdout3 3rdout4  3rdout5  3rdout6  y_1 CapCkt2
X_and5_7    out0_2  out1_2  x0      out2_2   out3_2            y0  AND5
X_capckt2_2 3rdout7 3rdout8 3rdout9 3rdout10 3rdout11 3rdout12 y1  CapCkt2
.ends Comparator4

.subckt Comparator4_Revise a3 a2 a1 a0 b3 b2 b1 b0 y_1 y0 y1

* the 1st stage
X_nand2_1 a0 b0 out0_1 NAND2
X_nand2_2 a1 b1 out1_1 NAND2
X_nand2_3 a2 b2 out2_1 NAND2
X_nand2_4 a3 b3 out3_1 NAND2

* the 2nd stage
X_capckt1_1 a0 out0_1 b0 out0_2 CapCkt1
X_capckt1_2 a1 out1_1 b1 out1_2 CapCkt1
X_capckt1_3 a2 out2_1 b2 out2_2 CapCkt1
X_capckt1_4 a3 out3_1 b3 out3_2 CapCkt1

* the 3rd stage
X_and2_1 out3_1 a3                          3rdout1  AND2
X_and3_1 out3_2 out2_1 a2                   3rdout2  AND3
X_and4_1 out2_2 out3_2 out1_1 a1            3rdout3  AND4
X_and5_1 out1_2 out2_2 out3_2 out0_1 a0     3rdout4  AND5
* X_and5_2 x1     out0_2 out2_2 out1_2 out3_2 3rdout5  AND5
* X_and5_3 x0     out0_2 out1_2 out2_2 out3_2 3rdout6  AND5
* X_and5_4 x0     out0_2 out1_2 out2_2 out3_2 3rdout7  AND5
* X_and5_5 x_1    out0_2 out1_2 out2_2 out3_2 3rdout8  AND5
X_and5_6 out1_2 out2_2 out3_2 out0_1 b0     3rdout9  AND5
X_and4_2 out2_2 out3_2 out1_1 b1            3rdout10 AND4
X_and3_2 out3_2 out2_1 b2                   3rdout11 AND3
X_and2_2 out3_1 b3                          3rdout12 AND2

* the 4th stage 
X_capckt2_1 3rdout1 3rdout2 3rdout3 3rdout4   y_1 CapCkt2_Revise
* X_and5_7    out0_2  out1_2  x0      out2_2   out3_2            y0  AND5
V_gnd_y0  y0 gnd! 0
X_capckt2_2 3rdout9 3rdout10 3rdout11 3rdout12 y1 CapCkt2_Revise
.ends Comparator4_Revise

* 8 bit comparator *
.subckt  Comparator8
+             a7 a6 a5 a4 a3 a2 a1 a0
+             b7 b6 b5 b4 b3 b2 b1 b0
* +             y0 y1 y2
+             y2
* X_comparator4_1 gnd! gnd! gnd! a3 a2 a1 a0 b3 b2 b1 b0 z0 z1 z2 Comparator4
X_comparator4_1 a3 a2 a1 a0 b3 b2 b1 b0 z0 z1 z2 Comparator4_Revise

* the 1st stage
X_nand2_1 a4 b4 out0_1 NAND2
X_nand2_2 a5 b5 out1_1 NAND2
X_nand2_3 a6 b6 out2_1 NAND2
X_nand2_4 a7 b7 out3_1 NAND2

* the 2nd stage
X_capckt1_1 a4 out0_1 b4 out0_2 CapCkt1
X_capckt1_2 a5 out1_1 b5 out1_2 CapCkt1
X_capckt1_3 a6 out2_1 b6 out2_2 CapCkt1
X_capckt1_4 a7 out3_1 b7 out3_2 CapCkt1

* the 3rd stage
* X_and2_1 out3_1 a7                          3rdout1  AND2
* X_and3_1 out3_2 out2_1 a6                   3rdout2  AND3
* X_and4_1 out2_2 out3_2 out1_1 a5            3rdout3  AND4
* X_and5_1 out1_2 out2_2 out3_2 out0_1 a4     3rdout4  AND5
* X_and5_2 z2     out0_2 out2_2 out1_2 out3_2 3rdout5  AND5
* X_and5_3 z1     out0_2 out1_2 out2_2 out3_2 3rdout6  AND5
* X_and5_4 z1     out0_2 out1_2 out2_2 out3_2 3rdout7  AND5
X_and5_5 z0     out0_2 out1_2 out2_2 out3_2 3rdout8  AND5
X_and5_6 out1_2 out2_2 out3_2 out0_1 b4     3rdout9  AND5
X_and4_2 out2_2 out3_2 out1_1 b5            3rdout10 AND4
X_and3_2 out3_2 out2_1 b6                   3rdout11 AND3
X_and2_2 out3_1 b7                          3rdout12 AND2

* the 4th stage 
* X_capckt2_1 3rdout1 3rdout2 3rdout3 3rdout4  3rdout5  3rdout6  y0  CapCkt2
* X_and5_7    out0_2  out1_2  x0      out2_2   out3_2            y1  AND5
* v_gnd1 y0 gnd! 0
* v_gnd2 y1 gnd! 0
X_capckt2_2 3rdout8 3rdout9 3rdout10 3rdout11 3rdout12 y2  CapCkt2_Revise1


* X_comparator4_2 z0   z1   z2   a7 a6 a5 a4 b7 b6 b5 b4 y0 y1 y2 Comparator4
.ends Comparator8

** numerous varity of multiplexers **

* 2 to 1 multiplexer
* .subckt MUX2to1 sel a b y
* X_inverter1  sel  _sel      Inverter
* X_inverter2  _sel sel1      Inverter
* X_inverter3  a    _a        Inverter
* X_inverter4  b    _b        Inverter
* X_transgate1 sel1 _sel _a x TransGate
* X_transgate2 _sel sel1 _b x TransGate
* X_inverter5  x    y         Inverter
* .ends MUX2to1

.subckt MUX2to1 sel a b out
X_inverter1  sel  _sel      Inverter
X_transgate1 sel  _sel a y  TransGate
X_transgate2 _sel sel  b y  TransGate
X_mybuffer1  y    out       MyBuffer
.ends MUX2to1

* 8 to 4 multiplexer
.subckt MUX8to4 sel a3 a2 a1 a0 b3 b2 b1 b0 y3 y2 y1 y0 
X_mux2to1_1 sel a3 b3 y3 MUX2to1
X_mux2to1_2 sel a2 b2 y2 MUX2to1
X_mux2to1_3 sel a1 b1 y1 MUX2to1
X_mux2to1_4 sel a0 b0 y0 MUX2to1
.ends MUX8to4

* 16 to 8 multiplexer
.subckt MUX16to8 sel a7 a6 a5 a4 a3 a2 a1 a0
+                    b7 b6 b5 b4 b3 b2 b1 b0
+                    y7 y6 y5 y4 y3 y2 y1 y0
X_mux8to4_1 sel a7 a6 a5 a4 b7 b6 b5 b4 y7 y6 y5 y4 MUX8to4
X_mux8to4_2 sel a3 a2 a1 a0 b3 b2 b1 b0 y3 y2 y1 y0 MUX8to4
.ends MUX16to8

* 28 to 14 multiplexer
.subckt MUX28to14 sel a13 a12 a11 a10 a9 a8 a7 a6 a5 a4 a3 a2 a1 a0
+                     b13 b12 b11 b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
+                     y13 y12 y11 y10 y9 y8 y7 y6 y5 y4 y3 y2 y1 y0
X_mux2to1_1  sel a13 b13 y13 MUX2to1
X_mux2to1_2  sel a12 b12 y12 MUX2to1
X_mux8to4_1  sel a11 a10 a9 a8 b11 b10 b9 b8 y11 y10 y9 y8 MUX8to4
X_mux16to8_1 sel a7 a6 a5 a4 a3 a2 a1 a0
+                b7 b6 b5 b4 b3 b2 b1 b0
+                y7 y6 y5 y4 y3 y2 y1 y0                   MUX16to8
.ends MUX28to14
