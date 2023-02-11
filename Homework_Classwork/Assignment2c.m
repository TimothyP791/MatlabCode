%% original plot NOTE og is ym NOTE FOR PART C USE COS WAVE WITH W0 < 10PI
t = 0:0.001:10; % time

ym = cos((2*pi)/3);

grid on
plot(t,ym)
%% part(c) AM
t = 0:0.001:10; % time
A0 = 5;
w0 =10*pi;
phi = pi/2;

ym = cos((2*pi)/3);
A = A0+ym;

yc = A.*sin(w0*t + phi);
grid on
plot(t,yc)
%% part(c) FM
t = 0:0.001:10; % time
A0 = 5;
w0 =10*pi;
k = 20;
phi = pi/2;

ym = cos((2*pi)/3);
A = A0+ym;
w1 = w0+k*ym;

yc = A.*sin((w0+k*ym) + phi);
grid on
plot(t,yc)
%% part(c) PM
t = 0:0.001:10; % time
A0 = 5;
w0 =10*pi;
k = .5;
phi = pi;

ym = cos((2*pi)/3);
A = A0+ym;
phi1 = phi+k*ym;

yc = A.*sin(w0*t + phi1);
grid on
plot(t,yc)