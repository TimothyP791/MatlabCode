
syms a b c

eqn1 = 0.12*a+2.25*b+2.22*c == 10;

eqn2 = 5.66*a+1.23*b+0.22*c == 11;

eqn3 = 44.21*a+1.245*b+6.54*c == 12;

[A,B] = equationsToMatrix([eqn1,eqn2,eqn3],[a,b,c]);

