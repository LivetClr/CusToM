function out1 = LBHD_Position(in1,in2,in3)
%LBHD_POSITION
%    OUT1 = LBHD_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    20-Feb-2021 19:24:22

R4cut1_1 = in3(28);
R4cut1_2 = in3(31);
R4cut1_3 = in3(34);
R4cut2_1 = in3(29);
R4cut2_2 = in3(32);
R4cut2_3 = in3(35);
R4cut3_1 = in3(30);
R4cut3_2 = in3(33);
R4cut3_3 = in3(36);
p4cut1 = in2(10);
p4cut2 = in2(11);
p4cut3 = in2(12);
q7 = in1(7,:);
q14 = in1(14,:);
q15 = in1(15,:);
q16 = in1(16,:);
t2 = cos(q7);
t3 = cos(q14);
t4 = cos(q15);
t5 = cos(q16);
t6 = sin(q7);
t7 = sin(q14);
t8 = sin(q15);
t9 = sin(q16);
t10 = R4cut1_1.*t2;
t11 = R4cut1_3.*t2;
t12 = R4cut1_2.*t3;
t13 = R4cut2_1.*t2;
t14 = R4cut2_3.*t2;
t15 = R4cut2_2.*t3;
t16 = R4cut3_1.*t2;
t17 = R4cut3_3.*t2;
t18 = R4cut3_2.*t3;
t19 = R4cut1_1.*t6;
t20 = R4cut1_3.*t6;
t21 = R4cut1_2.*t7;
t22 = R4cut2_1.*t6;
t23 = R4cut2_3.*t6;
t24 = R4cut2_2.*t7;
t25 = R4cut3_1.*t6;
t26 = R4cut3_3.*t6;
t27 = R4cut3_2.*t7;
t28 = -t20;
t29 = -t23;
t30 = -t26;
t31 = t11+t19;
t32 = t14+t22;
t33 = t17+t25;
t34 = t10+t28;
t35 = t13+t29;
t36 = t16+t30;
t37 = t4.*t31;
t38 = t4.*t32;
t39 = t4.*t33;
t40 = t3.*t34;
t41 = t3.*t35;
t42 = t3.*t36;
t43 = t7.*t34;
t44 = t7.*t35;
t45 = t7.*t36;
t46 = -t43;
t47 = -t44;
t48 = -t45;
t49 = t21+t40;
t50 = t24+t41;
t51 = t27+t42;
t52 = t12+t46;
t53 = t15+t47;
t54 = t18+t48;
t55 = t8.*t52;
t56 = t8.*t53;
t57 = t8.*t54;
t58 = -t55;
t59 = -t56;
t60 = -t57;
t61 = t37+t58;
t62 = t38+t59;
t63 = t39+t60;
out1 = [R4cut1_2.*4.284783682349351e-1+p4cut1+t10.*3.842855320492688e-3-t20.*3.842855320492688e-3+t8.*t31.*3.024476346368123e-2-t5.*t49.*6.690867305932634e-2+t4.*t52.*3.024476346368123e-2-t9.*t49.*3.870724355072032e-2-t5.*t61.*3.870724355072032e-2+t9.*t61.*6.690867305932634e-2;R4cut2_2.*4.284783682349351e-1+p4cut2+t13.*3.842855320492688e-3-t23.*3.842855320492688e-3+t8.*t32.*3.024476346368123e-2-t5.*t50.*6.690867305932634e-2+t4.*t53.*3.024476346368123e-2-t9.*t50.*3.870724355072032e-2-t5.*t62.*3.870724355072032e-2+t9.*t62.*6.690867305932634e-2;R4cut3_2.*4.284783682349351e-1+p4cut3+t16.*3.842855320492688e-3-t26.*3.842855320492688e-3+t8.*t33.*3.024476346368123e-2-t5.*t51.*6.690867305932634e-2+t4.*t54.*3.024476346368123e-2-t9.*t51.*3.870724355072032e-2-t5.*t63.*3.870724355072032e-2+t9.*t63.*6.690867305932634e-2];
