%% Classwork 1

%% sin wave

x = -5:0.001:5;
A = 2;

y = cos(x);
x = cos(2*pi*t);

plot(x,y,'r');

y3 = .5*(y + y1); %% even
plot(x,y3, 'g');
xlabel('Time');
ylabel('y');
title('exponential');
grid on;

y4 = .5*(y - y1); %% odd
plot(x,y4, 'b');
hold

