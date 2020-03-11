
hold on;

a= 0;
b= 4;
xx = a:0.5:b;
yy=f(xx);
plot(xx,yy,'r*');

n = 10;
[t, L] = interpolacjaL(n,a,b);
plot (t,L,'k')

n = 7;
[t, L] = interpolacjaL(n,a,b);
plot (t,L,'r')
n = 5;
[t, L] = interpolacjaL(n,a,b);
plot (t,L,'b')
n = 3;
[t, L] = interpolacjaL(n,a,b);
plot (t,L,'y')
xlabel('x');
ylabel('y');
legend('punkty wejœciowe','n=10','n=7','n=5','n=3');