%% MATLAB code for Fourier Series of Square wave

x = 0:0.01:4; % L

N = input('Enter n: ');

A = 1;
L = 4;

fx = zeros(N,length(x));
coeffs = zeros(N,1);

for n = 1:N
    fx(n,:) = fx(n,:) + 1/(pi*n)*[1-2*cos(pi*n)+cos(2*pi*n)]*sin(pi*n*x/2);
    coeffs(n,1) = 1/(pi*n)*[1-2*cos(pi*n)+cos(2*pi*n)];
end

fx2 =sum(fx,1);

figure(1)
stem([1:n],coeffs)
xlabel('n')
ylabel('Coefficients')

figure(2)
plot(x,fx)
xlabel('x')
grid on

figure(3)
plot(x, fx2)
xlabel('x')
ylabel('Reconstituted Signal')
grid on