%% original plot NOTE FOR PART C USE COS WAVE WITH W0 < 10PI
t = 0:0.001:10; % time
A0 = 2;
w0 =10*pi;
phi = pi/4;

ym = exp(-t);
A = A0+ym;

yc = A.*sin(w0*t + phi);
grid on
plot(t,yc)

%% part(a) AM
t = 0:0.001:10; % time
A0 = 5;
w0 =10*pi;
phi = pi/2;

ym = exp(-t);
A = A0+ym;

yc = A.*sin(w0*t + phi);
grid on
plot(t,yc)

%% part(a) FM
t = 0:0.001:10; % time
A0 = 5;
w0 =10*pi;
phi = pi/2;

ym = exp(-t);
A = A0+ym;

yc = A.*sin(w0*t + phi);
grid on
plot(t,yc)




