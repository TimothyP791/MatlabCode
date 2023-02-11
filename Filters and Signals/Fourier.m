%Fourier
x = -5:0.01:5;
N = input('Enter n:');

A = 4;
L = 2;

fx1 = zeros(N,length(x));


for n = 1:N
    fx1(n,:) = fx1(n,:) + ((A/2).*(-4/pi*n)*(cos(3*pi*n/4) - cos(pi*n/2) - sin(pi*n*x/2)-.5*sin(pi*n*x/2))).*(sin(2*pi*n*x/L));
end
fx2 = sum(fx1,1);

plot(x, fx2)
xlabel('x')
ylabel('Reconstituted Signal')
grid on

