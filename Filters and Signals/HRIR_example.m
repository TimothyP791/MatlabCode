%% Clear Workspace
clear;
close all;
clc;
% Params
% Sampling Freq (Hz)
Fs = 48000;
% Gain (controls volume)
g = 10;
% Azimuth and elevation in degs
azim = -80:5:80;
elev = 0;
enable = 0; % controlling value to increment and decrement.
% Load HRIRs
load 'ReferenceHRTF.mat' hrtfData sourcePosition
hrtfData = permute(double(hrtfData),[2,3,1]);
sourcePosition = sourcePosition(:,[1,2]);
% Gen sig
cn = dsp.ColoredNoise('Color','pink', ...
    'NumChannels',1, ...    
    'BoundedOutput',true, ...
    'SamplesPerFrame',2^15);
% I/O
DeviceWriter = audioDeviceWriter('SampleRate',Fs);
% Main Loop
disp('Begin Main Loop...')
sl = stoploop('Click to Stop');

azim_ind = 1;
while(~sl.Stop())    
    % Gen noise    
    sig = cn();    
    % Desired pos    
    desiredPosition = [azim(azim_ind) elev];    
    % Interp HRIR    
    interpolatedIR  = interpolateHRTF(hrtfData,sourcePosition, ...
        desiredPosition, ... 
        'Algorithm','VBAP');

    hrir_left = squeeze(interpolatedIR(:,1,:))';    
    hrir_right = squeeze(interpolatedIR(:,2,:))';     
    % Filter    
    y(:,1) = g*filter(hrir_left,1,sig);   % Left
    y(:,2) = g*filter(hrir_right,1,sig); % Right   
    % Get next azimuth    
    if(azim_ind < length(azim) && enable == 0)
        azim_ind = azim_ind + 1;
    elseif (azim_ind == length(azim))     %checks if end of array is reached
        enable = 1;                       %enables reverse count
        azim_ind = azim_ind - 1;
    elseif (azim_ind > length(0) && enable == 1) %operates when reverse cound it active
        azim_ind = azim_ind - 1;
    elseif (azim_ind == length(0) && enable == 1) %checks if array returns to beginning
        enable = 0;                               %returns count to normal. 
    else        
        azim_ind = 1;    
    end
    % Output to soundcard    
    DeviceWriter(y);
end
disp('End Main Loop');
% Release I/O
release(DeviceWriter);