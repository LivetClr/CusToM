function out1 = C7_Position(in1,in2,in3)
%C7_POSITION
%    OUT1 = C7_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    20-Feb-2021 23:03:38

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
t2 = cos(q7);
t3 = sin(q7);
out1 = [R4cut1_2.*2.938608282149759e-1+p4cut1-R4cut1_1.*t2.*4.544669815534535e-2+R4cut1_3.*t3.*4.544669815534535e-2;R4cut2_2.*2.938608282149759e-1+p4cut2-R4cut2_1.*t2.*4.544669815534535e-2+R4cut2_3.*t3.*4.544669815534535e-2;R4cut3_2.*2.938608282149759e-1+p4cut3-R4cut3_1.*t2.*4.544669815534535e-2+R4cut3_3.*t3.*4.544669815534535e-2];
