t = -1:0.01:3;
y1 = cos(3*pi*t);
subplot(311)
plot(t,y1)
grid on

u_step = -unit(t,2.5)+unit(t,.5);
subplot(312)
plot(t,u_step)
grid on

y_f = y1.*u_step;
subplot(313)
plot(t,y_f)
grid on

%size(y1)
%length(y1)

