%% Clear Workspace
clear;
close all;
clc;
%% Gen Sweep
Fs = 233e3;
frameSize = 20e3;
chirp = dsp.Chirp('SampleRate',Fs,... 
    'SamplesPerFrame',frameSize,...
    'InitialFrequency',11e3,...  
    'TargetFrequency',11e3+55e3);
%% Create ScopesSpectrumAnalyzer = dsp.SpectrumAnalyzer( ...    'ViewType','Spectrogram', ...    'SampleRate',Fs, ...    'RBWSource','Property', ...    'RBW',500, ...    'TimeSpanSource','Property', ...    'TimeSpan',2, ...    'PlotAsTwoSidedSpectrum',false);for idx = 1:50  y = chirp()+ 0.05*randn(frameSize,1);  SpectrumAnalyzer(y);endrelease(SpectrumAnalyzer);