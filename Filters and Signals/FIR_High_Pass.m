%% Clear Command Window and Close Figures
close all;
clc;
% Create I/O Objects
% Sampling Freq (Hz)
 Fs = 8000;
% Filter
 N    = 64;       % Order
 Fc1  = 2500;     % Highpass Cutoff Frequency
 flag = 'scale';  % Sampling Flag
 Beta = 3.86;      % Window Parameter
 % % Create the window vector for the design algorithm.
 win = kaiser(N+1, Beta);
 % Calculate the coefficients using the FIR1 function.
 h  = fir1(N, Fc1/(Fs/2), 'high', win, flag);
 % Gen Noise
 % Min/max peak of noise
 min = -1;
 max = 1;
 % 30 sec of noise
 sig = min + (max-min)*rand(30*Fs,1);T = length(sig);
 %Create Scopes
 TimeScope = dsp.TimeScope( ...    
 'SampleRate',Fs, ...    
 'TimeSpan',T/Fs, ...    
 'BufferLength',4*Fs, ...    
 'YLimits',[-1,1], ...    
 'TimeSpanOverrunAction','Scroll'); 
 
 SpectrumAnalyzer = dsp.SpectrumAnalyzer( ...    
 'SpectrumType','RMS', ...    
 'SampleRate',Fs, ...    
 'PlotAsTwoSidedSpectrum',false, ...    
 'YLimits',[-0.1 1.1], ...    
 'SpectralAverages',10, ...    
 'ShowLegend',true);
 % Filter
 y = filter(h,1,sig);
 % Display Time Scope
 TimeScope(y);
 % Display Spectral Analyzer
 SpectrumAnalyzer(y);