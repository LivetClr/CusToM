function out1 = RWRB_Position(in1,in2,in3)
%RWRB_POSITION
%    OUT1 = RWRB_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    21-Feb-2021 14:41:11

R6cut1_1 = in3(46);
R6cut1_2 = in3(49);
R6cut1_3 = in3(52);
R6cut2_1 = in3(47);
R6cut2_2 = in3(50);
R6cut2_3 = in3(53);
R6cut3_1 = in3(48);
R6cut3_2 = in3(51);
R6cut3_3 = in3(54);
p6cut1 = in2(16);
p6cut2 = in2(17);
p6cut3 = in2(18);
q31 = in1(31,:);
q32 = in1(32,:);
q33 = in1(33,:);
t2 = cos(q31);
t3 = cos(q32);
t4 = cos(q33);
t5 = sin(q31);
t6 = sin(q32);
t7 = sin(q33);
t8 = R6cut1_1.*t2;
t9 = R6cut2_1.*t2;
t10 = R6cut3_1.*t2;
t11 = R6cut1_3.*t5;
t12 = R6cut2_3.*t5;
t13 = R6cut3_3.*t5;
t14 = -t11;
t15 = -t12;
t16 = -t13;
t17 = t8+t14;
t18 = t9+t15;
t19 = t10+t16;
out1 = [R6cut1_2.*(-3.426138338063752e-1)+p6cut1-R6cut1_2.*t3.*2.740548604219724e-1+t6.*t17.*2.740548604219724e-1-t4.*(R6cut1_3.*t2+R6cut1_1.*t5).*3.086902217118315e-2-t7.*(R6cut1_2.*t6+t3.*t17).*3.086902217118315e-2;R6cut2_2.*(-3.426138338063752e-1)+p6cut2-R6cut2_2.*t3.*2.740548604219724e-1+t6.*t18.*2.740548604219724e-1-t4.*(R6cut2_3.*t2+R6cut2_1.*t5).*3.086902217118315e-2-t7.*(R6cut2_2.*t6+t3.*t18).*3.086902217118315e-2;R6cut3_2.*(-3.426138338063752e-1)+p6cut3-R6cut3_2.*t3.*2.740548604219724e-1+t6.*t19.*2.740548604219724e-1-t4.*(R6cut3_3.*t2+R6cut3_1.*t5).*3.086902217118315e-2-t7.*(R6cut3_2.*t6+t3.*t19).*3.086902217118315e-2];
