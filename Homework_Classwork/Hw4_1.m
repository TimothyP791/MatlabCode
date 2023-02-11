b = [1 0.6 0.03];
a = [1 -1.5 0.6];

[h,w] = freqz(b,a,'whole',2001);

plot(w/pi,20*log10(abs(h)))
ax = gca;
ax.YLim = [-20 50];
ax.XTICK = 0:.5:2;
xlabel('Normalized Frequency')
ylabel('Magnitude (dB)')