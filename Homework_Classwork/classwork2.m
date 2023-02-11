%% classwork 2 02/04/20

%plot y(t) = cos(t^2)

clc;

syms x y z
y = x^2;
z = diff(y);

figure(1)
subplot(211)
fplot(y,[0,5])
grid on
hold on
subplot(212)
fplot(z,[0,5])
grid on
hold 

%%
syms x y z
Ts = 0.1;
x1 = 0:Ts:2*pi;
y1 = cos(x1.^2);
z1 = diff(y1)./diff(y1);
figure(1)
subplot(211)
stem(x1,y1,'k')
subplot(212)
stem(t1(1:length(y1)-1), z1,'k')
legend('Derivative', 'Difference')
hold off