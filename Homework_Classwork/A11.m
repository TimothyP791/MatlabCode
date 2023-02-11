Ts = .2;
t = 0:Ts:2;
y1 = exp(-2*t);

scatter(t,y1)

grid on
hold
%%
Ts = .01;
t = -2:Ts:2;
figure
y2 = exp(-2*t);
scatter(t,y2)
grid on
 