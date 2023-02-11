% Clear Workspace
clear;
close all;
clc;
% Sampling Freq (Hz)
Fs = 8000;
%Sine Table 
sine_table= [1,0.707, 0, -0.707, -1, -0.707, 0, 0.707];
T = length(sine_table);    % Length of sine table
C = 512;                                 % # of cycles
M = C*T;                              % # of samps to output
 
% Create Scopes
TimeScope=   dsp.TimeScope( ...
'SampleRate',Fs, ...
'TimeSpan',C*(T/Fs), ...
'BufferLength',4*Fs, ...
'YLimits',[  -5,5], ...
'TimeSpanOverrunAction','Scroll'); 

SpectrumAnalyzer=   dsp.SpectrumAnalyzer( ...
'SpectrumType','RMS', ...
'SampleRate',Fs, ...
'PlotAsTwoSidedSpectrum',false, ...
'YLimits',[-0.1 1], ...
'SpectralAverages',10, ...
'ShowLegend',true);
% Buffer M samples
sine_table_ind= 1;
for cycle_ind=1:M
    sig(cycle_ind,1) = sine_table(sine_table_ind);
    out = awgn(sig,1);
    % Update/Wrap Index
    sine_table_ind  = mod((sine_table_ind + 1),(T+1));
    if( sine_table_ind== 0)
        sine_table_ind= 1;
    end
end
% Display Time Scope
TimeScope(sig);
TimeScope(out);

% Display Spectral Analyzer
SpectrumAnalyzer(sig);
  