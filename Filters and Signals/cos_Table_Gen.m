
clear;
close all;
clc;

Fs = 8000;
Ts = 1/Fs;
F = 666.66;
T = 1/F;
N = T/Ts;

Vp = 1;
step = 2*pi/N;
n = 0:step:(2*pi-step);
sine_table = Vp*cos(n);

t = linspace(0,N/Fs,N);
plot(t,sine_table);
hold on;
plot(t,sine_table,'ro');
xlabel('Time [sec]');
ylabel('Amplitude');