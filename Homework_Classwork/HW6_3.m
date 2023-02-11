%% Clear Command Window and Close Figures
close all;
clc;
% Create I/O Objects
% Sampling Freq (Hz)
Fs = 8000;  % Sampling Frequency

N   = 4;     % Order
Fc1 = 1000;  % First Cutoff Frequency
Fc2 = 2500;  % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter', 'FilterStructure', 'df1sos');
% Gen Noise
% Min/max peak of noise
min = -1;
max = 1;
% 25 sec of noise
sig = min + (max-min)*rand(25*Fs,1);T = length(sig);
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

