function y=czyb(n)
x=-10:0.1:10;
T0=1;
T(1)=x;
T(n)=2*x*T(n-1)-T(n-2);
plot(y,'color','red','*')
end