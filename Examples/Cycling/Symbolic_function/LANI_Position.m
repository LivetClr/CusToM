function out1 = LANI_Position(in1,in2,in3)
%LANI_POSITION
%    OUT1 = LANI_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    26-Jun-2018 11:26:23

R1cut1_1 = in3(1);
R1cut1_2 = in3(4);
R1cut1_3 = in3(7);
R1cut2_1 = in3(2);
R1cut2_2 = in3(5);
R1cut2_3 = in3(8);
R1cut3_1 = in3(3);
R1cut3_2 = in3(6);
R1cut3_3 = in3(9);
p1cut1 = in2(1);
p1cut2 = in2(2);
p1cut3 = in2(3);
q1 = in1(1,:);
q23 = in1(23,:);
q24 = in1(24,:);
q25 = in1(25,:);
q26 = in1(26,:);
t2 = cos(q1);
t3 = sin(q1);
t4 = cos(q23);
t5 = R1cut1_1.*t2;
t6 = R1cut1_2.*t3;
t7 = t5+t6;
t8 = sin(q23);
t9 = R1cut1_1.*t3;
t12 = R1cut1_2.*t2;
t10 = t9-t12;
t11 = t4.*t7;
t26 = t8.*t10;
t13 = t11-t26;
t14 = cos(q25);
t15 = t4.*t10;
t16 = t7.*t8;
t17 = t15+t16;
t18 = cos(q24);
t19 = sin(q24);
t20 = sin(q25);
t21 = t17.*t19;
t22 = R1cut1_3.*t18;
t23 = R1cut1_3.*t19;
t24 = t23-t17.*t18;
t25 = cos(q26);
t27 = t21+t22;
t28 = sin(q26);
t29 = t13.*t14;
t30 = t29-t20.*t27;
t31 = R1cut2_1.*t2;
t32 = R1cut2_2.*t3;
t33 = t31+t32;
t34 = R1cut2_1.*t3;
t37 = R1cut2_2.*t2;
t35 = t34-t37;
t36 = t4.*t33;
t46 = t8.*t35;
t38 = t36-t46;
t39 = t4.*t35;
t40 = t8.*t33;
t41 = t39+t40;
t42 = t19.*t41;
t43 = R1cut2_3.*t18;
t44 = R1cut2_3.*t19;
t45 = t44-t18.*t41;
t47 = t42+t43;
t48 = t14.*t38;
t49 = t48-t20.*t47;
t50 = R1cut3_1.*t2;
t51 = R1cut3_2.*t3;
t52 = t50+t51;
t53 = R1cut3_1.*t3;
t56 = R1cut3_2.*t2;
t54 = t53-t56;
t55 = t4.*t52;
t65 = t8.*t54;
t57 = t55-t65;
t58 = t4.*t54;
t59 = t8.*t52;
t60 = t58+t59;
t61 = t19.*t60;
t62 = R1cut3_3.*t18;
t63 = R1cut3_3.*t19;
t64 = t63-t18.*t60;
t66 = t61+t62;
t67 = t14.*t57;
t68 = t67-t20.*t66;
out1 = [R1cut1_3.*(-8.920245470885257e-2)+p1cut1-R1cut1_1.*t2.*8.920245470885258e-3+R1cut1_1.*t3.*5.575153419303286e-2-R1cut1_2.*t2.*5.575153419303286e-2-R1cut1_2.*t3.*8.920245470885258e-3-R1cut1_3.*t19.*4.776561375564409e-1-t13.*t14.*2.624484272288137e-2+t13.*t20.*2.805142838363271e-2+t17.*t18.*4.776561375564409e-1+t14.*t27.*2.805142838363271e-2+t20.*t27.*2.624484272288137e-2-t24.*t25.*4.318685413916132e-1+t24.*t28.*1.927468273639263e-2+t25.*t30.*1.927468273639263e-2+t28.*t30.*4.318685413916132e-1;R1cut2_3.*(-8.920245470885257e-2)+p1cut2-R1cut2_1.*t2.*8.920245470885258e-3+R1cut2_1.*t3.*5.575153419303286e-2-R1cut2_2.*t2.*5.575153419303286e-2-R1cut2_2.*t3.*8.920245470885258e-3-R1cut2_3.*t19.*4.776561375564409e-1-t14.*t38.*2.624484272288137e-2+t20.*t38.*2.805142838363271e-2+t18.*t41.*4.776561375564409e-1+t14.*t47.*2.805142838363271e-2+t20.*t47.*2.624484272288137e-2-t25.*t45.*4.318685413916132e-1+t28.*t45.*1.927468273639263e-2+t25.*t49.*1.927468273639263e-2+t28.*t49.*4.318685413916132e-1;R1cut3_3.*(-8.920245470885257e-2)+p1cut3-R1cut3_1.*t2.*8.920245470885258e-3+R1cut3_1.*t3.*5.575153419303286e-2-R1cut3_2.*t2.*5.575153419303286e-2-R1cut3_2.*t3.*8.920245470885258e-3-R1cut3_3.*t19.*4.776561375564409e-1-t14.*t57.*2.624484272288137e-2+t20.*t57.*2.805142838363271e-2+t18.*t60.*4.776561375564409e-1+t14.*t66.*2.805142838363271e-2+t20.*t66.*2.624484272288137e-2-t25.*t64.*4.318685413916132e-1+t28.*t64.*1.927468273639263e-2+t25.*t68.*1.927468273639263e-2+t28.*t68.*4.318685413916132e-1];
