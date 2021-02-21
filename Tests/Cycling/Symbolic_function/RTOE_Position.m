function out1 = RTOE_Position(in1,in2,in3)
%RTOE_POSITION
%    OUT1 = RTOE_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    20-Feb-2021 23:04:03

R3cut1_1 = in3(19);
R3cut1_2 = in3(22);
R3cut1_3 = in3(25);
R3cut2_1 = in3(20);
R3cut2_2 = in3(23);
R3cut2_3 = in3(26);
R3cut3_1 = in3(21);
R3cut3_2 = in3(24);
R3cut3_3 = in3(27);
p3cut1 = in2(7);
p3cut2 = in2(8);
p3cut3 = in2(9);
q22 = in1(22,:);
t2 = cos(q22);
t3 = sin(q22);
out1 = [R3cut1_1.*2.039668682655275e-1+p3cut1-R3cut1_2.*t2.*5.208831313232559e-2-R3cut1_2.*t3.*5.48298032971848e-3+R3cut1_3.*t2.*5.48298032971848e-3-R3cut1_3.*t3.*5.208831313232559e-2;R3cut2_1.*2.039668682655275e-1+p3cut2-R3cut2_2.*t2.*5.208831313232559e-2-R3cut2_2.*t3.*5.48298032971848e-3+R3cut2_3.*t2.*5.48298032971848e-3-R3cut2_3.*t3.*5.208831313232559e-2;R3cut3_1.*2.039668682655275e-1+p3cut3-R3cut3_2.*t2.*5.208831313232559e-2-R3cut3_2.*t3.*5.48298032971848e-3+R3cut3_3.*t2.*5.48298032971848e-3-R3cut3_3.*t3.*5.208831313232559e-2];
