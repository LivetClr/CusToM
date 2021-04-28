function out1 = RKNI_Position(in1,in2,in3)
%RKNI_POSITION
%    OUT1 = RKNI_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    25-Jan-2021 15:52:18

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
q17 = in1(17,:);
q18 = in1(18,:);
q19 = in1(19,:);
q20 = in1(20,:);
t2 = cos(q1);
t3 = cos(q17);
t4 = cos(q18);
t5 = cos(q19);
t6 = cos(q20);
t7 = sin(q1);
t8 = sin(q17);
t9 = sin(q18);
t10 = sin(q19);
t11 = sin(q20);
t12 = R1cut1_1.*t2;
t13 = R1cut1_2.*t2;
t14 = R1cut2_1.*t2;
t15 = R1cut2_2.*t2;
t16 = R1cut1_3.*t4;
t17 = R1cut3_1.*t2;
t18 = R1cut3_2.*t2;
t19 = R1cut2_3.*t4;
t20 = R1cut3_3.*t4;
t21 = R1cut1_1.*t7;
t22 = R1cut1_2.*t7;
t23 = R1cut2_1.*t7;
t24 = R1cut2_2.*t7;
t25 = R1cut3_1.*t7;
t26 = R1cut3_2.*t7;
t27 = -t16;
t28 = -t19;
t29 = -t20;
t30 = -t21;
t31 = -t23;
t32 = -t25;
t33 = t12+t22;
t34 = t14+t24;
t35 = t17+t26;
t36 = t13+t30;
t37 = t15+t31;
t38 = t18+t32;
t39 = t3.*t33;
t40 = t3.*t34;
t41 = t3.*t35;
t42 = t8.*t33;
t43 = t8.*t34;
t44 = t8.*t35;
t45 = t3.*t36;
t46 = t3.*t37;
t47 = t3.*t38;
t48 = t8.*t36;
t49 = -t42;
t50 = t8.*t37;
t51 = -t43;
t52 = t8.*t38;
t53 = -t44;
t54 = t39+t48;
t55 = t40+t50;
t56 = t41+t52;
t57 = t45+t49;
t58 = t46+t51;
t59 = t47+t53;
t60 = -t9.*(t42-t45);
t61 = -t9.*(t43-t46);
t62 = -t9.*(t44-t47);
t63 = t27+t60;
t64 = t28+t61;
t65 = t29+t62;
out1 = [R1cut1_3.*8.272596700332262e-2+p1cut1-t12.*8.272596700332266e-3-t13.*5.170372937707664e-2+t21.*5.170372937707664e-2-t22.*8.272596700332266e-3-t5.*(t16+t9.*(t42-t45)).*5.021857011903458e-2+t10.*(t16+t9.*(t42-t45)).*2.488339860246292e-2-R1cut1_3.*t9.*4.528778545648252e-1-t5.*t54.*2.488339860246292e-2-t10.*t54.*5.021857011903458e-2+t4.*(t42-t45).*4.528778545648252e-1-t11.*(t10.*(t16+t9.*(t42-t45))-t5.*t54).*2.025068495251947e-2-t6.*(R1cut1_3.*t9-t4.*(t42-t45)).*2.025068495251947e-2;R1cut2_3.*8.272596700332262e-2+p1cut2-t14.*8.272596700332266e-3-t15.*5.170372937707664e-2+t23.*5.170372937707664e-2-t24.*8.272596700332266e-3-t5.*(t19+t9.*(t43-t46)).*5.021857011903458e-2+t10.*(t19+t9.*(t43-t46)).*2.488339860246292e-2-R1cut2_3.*t9.*4.528778545648252e-1-t5.*t55.*2.488339860246292e-2-t10.*t55.*5.021857011903458e-2+t4.*(t43-t46).*4.528778545648252e-1-t11.*(t10.*(t19+t9.*(t43-t46))-t5.*t55).*2.025068495251947e-2-t6.*(R1cut2_3.*t9-t4.*(t43-t46)).*2.025068495251947e-2;R1cut3_3.*8.272596700332262e-2+p1cut3-t17.*8.272596700332266e-3-t18.*5.170372937707664e-2+t25.*5.170372937707664e-2-t26.*8.272596700332266e-3-t5.*(t20+t9.*(t44-t47)).*5.021857011903458e-2+t10.*(t20+t9.*(t44-t47)).*2.488339860246292e-2-R1cut3_3.*t9.*4.528778545648252e-1-t5.*t56.*2.488339860246292e-2-t10.*t56.*5.021857011903458e-2+t4.*(t44-t47).*4.528778545648252e-1-t11.*(t10.*(t20+t9.*(t44-t47))-t5.*t56).*2.025068495251947e-2-t6.*(R1cut3_3.*t9-t4.*(t44-t47)).*2.025068495251947e-2];
