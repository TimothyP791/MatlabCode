t = 0:0.001:10; % time
A0 = 5;
w0 =10*pi;
phi = pi/2;

ym = ASSIGNMENT2b(t,3) - ASSIGNMENT2b(t,4) + ASSIGNMENT2b(t,8);
A = A0+ym;

yc = A.*sin(w0*t + phi);
grid on
plot(t,yc)