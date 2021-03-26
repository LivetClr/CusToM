function [R3cut,p3cut] = f3cut(in1,in2,in3)
%F3CUT
%    [R3CUT,P3CUT] = F3CUT(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    26-Mar-2021 11:57:45

R2cut1_1 = in3(10);
R2cut1_2 = in3(13);
R2cut1_3 = in3(16);
R2cut2_1 = in3(11);
R2cut2_2 = in3(14);
R2cut2_3 = in3(17);
R2cut3_1 = in3(12);
R2cut3_2 = in3(15);
R2cut3_3 = in3(18);
p2cut1 = in2(4);
p2cut2 = in2(5);
p2cut3 = in2(6);
q7 = in1(7,:);
q30 = in1(24,:);
q31 = in1(25,:);
t2 = cos(q7);
t3 = cos(q30);
t4 = cos(q31);
t5 = sin(q7);
t6 = sin(q30);
t7 = sin(q31);
t8 = R2cut1_1.*t2;
t9 = R2cut1_3.*t2;
t10 = R2cut2_1.*t2;
t11 = R2cut2_3.*t2;
t12 = R2cut3_1.*t2;
t13 = R2cut3_3.*t2;
t14 = R2cut1_1.*t5;
t15 = R2cut1_3.*t5;
t16 = R2cut2_1.*t5;
t17 = R2cut2_3.*t5;
t18 = R2cut3_1.*t5;
t19 = R2cut3_3.*t5;
t20 = R2cut1_2.*t6;
t21 = R2cut2_2.*t6;
t22 = R2cut3_2.*t6;
t26 = t7.*(7.0./1.0e+2);
t23 = -t15;
t24 = -t17;
t25 = -t19;
t27 = t9+t14;
t28 = t11+t16;
t29 = t13+t18;
t39 = t26+7.71e-2;
t30 = t8+t23;
t31 = t10+t24;
t32 = t12+t25;
t33 = t3.*t27;
t34 = t3.*t28;
t35 = t3.*t29;
t36 = -t33;
t37 = -t34;
t38 = -t35;
t40 = t20+t36;
t41 = t21+t37;
t42 = t22+t38;
R3cut = reshape([t4.*t30+t7.*t40,t4.*t31+t7.*t41,t4.*t32+t7.*t42,R2cut1_2.*t3+t6.*t27,R2cut2_2.*t3+t6.*t28,R2cut3_2.*t3+t6.*t29,t7.*t30-t4.*t40,t7.*t31-t4.*t41,t7.*t32-t4.*t42],[3,3]);
if nargout > 1
    p3cut = [R2cut1_2.*2.803e-1+p2cut1-t9.*6.910358823529411e-2-t14.*6.910358823529411e-2-t4.*t20.*(3.0./2.0e+1)-t4.*t33.*7.942941176470587e-2+t30.*t39;R2cut2_2.*2.803e-1+p2cut2-t11.*6.910358823529411e-2-t16.*6.910358823529411e-2-t4.*t21.*(3.0./2.0e+1)-t4.*t34.*7.942941176470587e-2+t31.*t39;R2cut3_2.*2.803e-1+p2cut3-t13.*6.910358823529411e-2-t18.*6.910358823529411e-2-t4.*t22.*(3.0./2.0e+1)-t4.*t35.*7.942941176470587e-2+t32.*t39];
end
