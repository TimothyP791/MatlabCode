ax = [25, 30, 35, 40, 45];
ay = [5, 260, 480, 745, 1100];



plot(ax,ay, 'b')

xlabel('Samples')
ylabel('Amplitude')


hold on

bx = [2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 7, 8, 9, 10];
by = [1500, 1220, 1050, 915, 810, 745, 690, 620, 520, 480, 410, 390];
plot(bx,by, 'r')


hold on

cx = [550, 600, 650, 700, 750];
cy = [41.2, 18.62, 8.62, 3.92, 1.86];
plot(cx,cy,'g')
hold on
grid on
legend('A','B','C')