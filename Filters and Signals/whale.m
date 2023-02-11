whaleFile = 'bluewhale.au';
[x,fs] = audioread(whaleFile);
whaleMoan = x(2.45e4:3.10e4);
t = 10*(0:1/fs:(length(whaleMoan)-1)/fs);

plot(t,whaleMoan)
xlabel('Time (seconds)')
ylabel('Amplitude')
xlim([0 t(end)])

m = length(whaleMoan); 
n = pow2(nextpow2(m));
y = fft(whaleMoan,n);  

f = (0:n-1)*(fs/n)/10; % frequency vector
power = abs(y).^2/n;   % power spectrum      
plot(f(1:floor(n/2)),power(1:floor(n/2)))
xlabel('Frequency')
ylabel('Power')
xlim([0 100])