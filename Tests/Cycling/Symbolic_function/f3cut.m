function [R3cut,p3cut] = f3cut(in1,in2,in3)
%F3CUT
%    [R3CUT,P3CUT] = F3CUT(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    20-Feb-2021 19:26:29

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
q21 = in1(21,:);
t2 = cos(q1);
t3 = cos(q17);
t4 = cos(q18);
t5 = cos(q19);
t6 = cos(q20);
t7 = cos(q21);
t8 = sin(q1);
t9 = sin(q17);
t10 = sin(q18);
t11 = sin(q19);
t12 = sin(q20);
t13 = sin(q21);
t14 = R1cut1_1.*t2;
t15 = R1cut1_2.*t2;
t16 = R1cut2_1.*t2;
t17 = R1cut2_2.*t2;
t18 = R1cut1_3.*t4;
t19 = R1cut3_1.*t2;
t20 = R1cut3_2.*t2;
t21 = R1cut2_3.*t4;
t22 = R1cut3_3.*t4;
t23 = R1cut1_1.*t8;
t24 = R1cut1_2.*t8;
t25 = R1cut2_1.*t8;
t26 = R1cut2_2.*t8;
t27 = R1cut1_3.*t10;
t28 = R1cut3_1.*t8;
t29 = R1cut3_2.*t8;
t30 = R1cut2_3.*t10;
t31 = R1cut3_3.*t10;
t32 = -t18;
t33 = -t21;
t34 = -t22;
t35 = -t23;
t36 = -t25;
t37 = -t28;
t38 = t14+t24;
t39 = t16+t26;
t40 = t19+t29;
t41 = t15+t35;
t42 = t17+t36;
t43 = t20+t37;
t44 = t3.*t38;
t45 = t3.*t39;
t46 = t3.*t40;
t47 = t9.*t38;
t48 = t9.*t39;
t49 = t9.*t40;
t50 = t3.*t41;
t51 = t3.*t42;
t52 = t3.*t43;
t53 = t9.*t41;
t54 = -t47;
t55 = t9.*t42;
t56 = -t48;
t57 = t9.*t43;
t58 = -t49;
t59 = t44+t53;
t60 = t45+t55;
t61 = t46+t57;
t62 = t50+t54;
t63 = t51+t56;
t64 = t52+t58;
t68 = -t4.*(t47-t50);
t69 = -t4.*(t48-t51);
t70 = -t4.*(t49-t52);
t71 = -t10.*(t47-t50);
t72 = -t10.*(t48-t51);
t73 = -t10.*(t49-t52);
t86 = -t11.*(t18+t10.*(t47-t50));
t87 = -t11.*(t21+t10.*(t48-t51));
t88 = -t11.*(t22+t10.*(t49-t52));
t65 = t5.*t59;
t66 = t5.*t60;
t67 = t5.*t61;
t74 = t27+t68;
t75 = t30+t69;
t76 = t31+t70;
t77 = t32+t71;
t78 = t33+t72;
t79 = t34+t73;
t80 = t6.*t74;
t81 = t6.*t75;
t82 = t6.*t76;
t83 = t12.*t74;
t84 = t12.*t75;
t85 = t12.*t76;
t89 = t65+t86;
t90 = t66+t87;
t91 = t67+t88;
t92 = t6.*t89;
t93 = t6.*t90;
t94 = t6.*t91;
t95 = t12.*t89;
t96 = t12.*t90;
t97 = t12.*t91;
t98 = -t95;
t99 = -t96;
t100 = -t97;
t101 = t83+t92;
t102 = t84+t93;
t103 = t85+t94;
t104 = t80+t98;
t105 = t81+t99;
t106 = t82+t100;
R3cut = reshape([t7.*t101+t13.*t104,t7.*t102+t13.*t105,t7.*t103+t13.*t106,t7.*t104-t13.*t101,t7.*t105-t13.*t102,t7.*t106-t13.*t103,t5.*(t18+t10.*(t47-t50))+t11.*t59,t5.*(t21+t10.*(t48-t51))+t11.*t60,t5.*(t22+t10.*(t49-t52))+t11.*t61],[3,3]);
if nargout > 1
    p3cut = [R1cut1_3.*8.914883632593582e-2+p1cut1-t14.*8.914883632593582e-3-t15.*5.571802270370989e-2+t23.*5.571802270370989e-2-t24.*8.914883632593582e-3-t27.*4.803082033434819e-1-t65.*2.639056062326824e-2-t80.*4.420835651115356e-1+t95.*4.420835651115356e-1+t5.*(t18+t10.*(t47-t50)).*1.055622424930729e-2+t11.*(t18+t10.*(t47-t50)).*2.639056062326824e-2+t11.*t59.*1.055622424930729e-2+t4.*(t47-t50).*4.803082033434819e-1;R1cut2_3.*8.914883632593582e-2+p1cut2-t16.*8.914883632593582e-3-t17.*5.571802270370989e-2+t25.*5.571802270370989e-2-t26.*8.914883632593582e-3-t30.*4.803082033434819e-1-t66.*2.639056062326824e-2-t81.*4.420835651115356e-1+t96.*4.420835651115356e-1+t5.*(t21+t10.*(t48-t51)).*1.055622424930729e-2+t11.*(t21+t10.*(t48-t51)).*2.639056062326824e-2+t11.*t60.*1.055622424930729e-2+t4.*(t48-t51).*4.803082033434819e-1;R1cut3_3.*8.914883632593582e-2+p1cut3-t19.*8.914883632593582e-3-t20.*5.571802270370989e-2+t28.*5.571802270370989e-2-t29.*8.914883632593582e-3-t31.*4.803082033434819e-1-t67.*2.639056062326824e-2-t82.*4.420835651115356e-1+t97.*4.420835651115356e-1+t5.*(t22+t10.*(t49-t52)).*1.055622424930729e-2+t11.*(t22+t10.*(t49-t52)).*2.639056062326824e-2+t11.*t61.*1.055622424930729e-2+t4.*(t49-t52).*4.803082033434819e-1];
end
