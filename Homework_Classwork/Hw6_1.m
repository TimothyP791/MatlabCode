%% Clear Command Window and Close Figures
close all;
clc;
% Create I/O Objects
% Sampling Freq (Hz)
Fs = 8000;
% Filter
% % All frequency values are in Hz.
N   = 4;     % Order
Fc1 = 1000;  % First Cutoff Frequency
% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass('N,F3dB', N, Fc1, Fs);
Hd = design(h, 'butter');
% Gen Noise
% Min/max peak of noise
min = -1;
max = 1;
% 50 sec of noise
sig = min + (max-min)*rand(50*Fs,1);T = length(sig);
% Create Scopes
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
y = filter(Hd,sig);
% Display Time Scope
TimeScope(y,sig); % channel 1 is filter channel 2 is original
% Display Spectral Analyzer
SpectrumAnalyzer([y,sig]); % channel 1 is filter channel 2 is original
