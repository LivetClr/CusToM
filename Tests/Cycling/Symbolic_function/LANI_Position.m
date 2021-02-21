function out1 = LANI_Position(in1,in2,in3)
%LANI_POSITION
%    OUT1 = LANI_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    20-Feb-2021 23:04:14

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
t3 = cos(q23);
t4 = cos(q24);
t5 = cos(q25);
t6 = cos(q26);
t7 = sin(q1);
t8 = sin(q23);
t9 = sin(q24);
t10 = sin(q25);
t11 = sin(q26);
t12 = R1cut1_1.*t2;
t13 = R1cut1_2.*t2;
t14 = R1cut2_1.*t2;
t15 = R1cut2_2.*t2;
t16 = R1cut3_1.*t2;
t17 = R1cut3_2.*t2;
t18 = R1cut1_3.*t4;
t19 = R1cut2_3.*t4;
t20 = R1cut3_3.*t4;
t21 = R1cut1_1.*t7;
t22 = R1cut1_2.*t7;
t23 = R1cut2_1.*t7;
t24 = R1cut2_2.*t7;
t25 = R1cut3_1.*t7;
t26 = R1cut3_2.*t7;
t27 = R1cut1_3.*t9;
t28 = R1cut2_3.*t9;
t29 = R1cut3_3.*t9;
t30 = -t18;
t31 = -t19;
t32 = -t20;
t33 = -t21;
t34 = -t23;
t35 = -t25;
t36 = t12+t22;
t37 = t14+t24;
t38 = t16+t26;
t39 = t13+t33;
t40 = t15+t34;
t41 = t17+t35;
t42 = t3.*t36;
t43 = t3.*t37;
t44 = t3.*t38;
t45 = t8.*t36;
t46 = t8.*t37;
t47 = t8.*t38;
t48 = t3.*t39;
t49 = t3.*t40;
t50 = t3.*t41;
t51 = t8.*t39;
t52 = -t45;
t53 = t8.*t40;
t54 = -t46;
t55 = t8.*t41;
t56 = -t47;
t57 = t42+t51;
t58 = t43+t53;
t59 = t44+t55;
t60 = t48+t52;
t61 = t49+t54;
t62 = t50+t56;
t66 = -t4.*(t45-t48);
t67 = -t4.*(t46-t49);
t68 = -t4.*(t47-t50);
t69 = -t9.*(t45-t48);
t70 = -t9.*(t46-t49);
t71 = -t9.*(t47-t50);
t78 = -t10.*(t18+t9.*(t45-t48));
t79 = -t10.*(t19+t9.*(t46-t49));
t80 = -t10.*(t20+t9.*(t47-t50));
t63 = t5.*t57;
t64 = t5.*t58;
t65 = t5.*t59;
t72 = t27+t66;
t73 = t28+t67;
t74 = t29+t68;
t75 = t30+t69;
t76 = t31+t70;
t77 = t32+t71;
t81 = t63+t78;
t82 = t64+t79;
t83 = t65+t80;
out1 = [R1cut1_3.*(-8.914883632593582e-2)+p1cut1-t12.*8.914883632593582e-3-t13.*5.571802270370989e-2+t21.*5.571802270370989e-2-t22.*8.914883632593582e-3-t27.*4.779935749202965e-1-t63.*2.626338323737893e-2+t5.*(t18+t9.*(t45-t48)).*2.801646746350892e-2+t10.*(t18+t9.*(t45-t48)).*2.626338323737893e-2+t10.*t57.*2.801646746350892e-2-t6.*t72.*4.315599579570328e-1+t11.*t72.*1.926091037923024e-2+t6.*t81.*1.926091037923024e-2+t11.*t81.*4.315599579570328e-1+t4.*(t45-t48).*4.779935749202965e-1;R1cut2_3.*(-8.914883632593582e-2)+p1cut2-t14.*8.914883632593582e-3-t15.*5.571802270370989e-2+t23.*5.571802270370989e-2-t24.*8.914883632593582e-3-t28.*4.779935749202965e-1-t64.*2.626338323737893e-2+t5.*(t19+t9.*(t46-t49)).*2.801646746350892e-2+t10.*(t19+t9.*(t46-t49)).*2.626338323737893e-2+t10.*t58.*2.801646746350892e-2-t6.*t73.*4.315599579570328e-1+t11.*t73.*1.926091037923024e-2+t6.*t82.*1.926091037923024e-2+t11.*t82.*4.315599579570328e-1+t4.*(t46-t49).*4.779935749202965e-1;R1cut3_3.*(-8.914883632593582e-2)+p1cut3-t16.*8.914883632593582e-3-t17.*5.571802270370989e-2+t25.*5.571802270370989e-2-t26.*8.914883632593582e-3-t29.*4.779935749202965e-1-t65.*2.626338323737893e-2+t5.*(t20+t9.*(t47-t50)).*2.801646746350892e-2+t10.*(t20+t9.*(t47-t50)).*2.626338323737893e-2+t10.*t59.*2.801646746350892e-2-t6.*t74.*4.315599579570328e-1+t11.*t74.*1.926091037923024e-2+t6.*t83.*1.926091037923024e-2+t11.*t83.*4.315599579570328e-1+t4.*(t47-t50).*4.779935749202965e-1];
