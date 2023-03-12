clear all
close all
clc


%%
%step odziv sistema
s = tf('s');
sys = ((-0.05*s+0.0075)/((s+0.05)^2))* (exp(-3.6*s));
figure
step(sys)

%%
%kriticni parametri

Kkr=1.54;
Tkr=53.177;
Kp = 0.6*Kkr;
Ti = 0.5*Tkr;
Td = Tkr/8;
Ki = 1/Ti;

%%
%parametri P fazi kontrolera
u_max=1.2;
r_max=2;
Ku_P=u_max;
Kp_P = Kp/Ku_P


%%
% parametri PD fazi kontrolera
u_max=1.2;
r_max=2;
sel = 2;
c
Ki_fazi = 0;

%%
%parametri PID kontrolera

Kp_PID = 1/0.8
Ku_PID = Kp/Kp_PID
Kd_PID= Td*Kp/Ku_PID
Ki_PID = Kp/(Ku_PID*Ti)


