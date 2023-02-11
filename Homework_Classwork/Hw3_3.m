%% Clear
clear;
close all;
clc;
 
%% Create signal
N = 2^11;   % Signal length
fs = 1e3;   % Sampling freq (Hz)
T = 1/fs;   % Sampling rate (sec)
 
% Sinusoidal 1 params
a1 = 1;  % Amplitude
f1 = 100;   % Freq (Hz)
 
% Sinusoidal 2 params
a2 = 1;   % Amplitude
f2 = 600;   % Freq (Hz)
 
% Sum Sinusoidal
t = 0:1/fs:(N-1)/fs;
x = a1*cos(2*pi*f1*t) + a2*sin(2*pi*f2*t);
% FFT and plot spectrum (COMPLETE THIS PART)
Y = fft(x);
P2 = abs(Y/N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(N/2))/N;

plot(f,P1)
title('FFT plot spectrum')
xlabel('Frequency')
ylabel('Amplitude')
