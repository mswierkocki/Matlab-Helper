function y=aproksymacja2
y=tabelka(a,b);
plot(x,y,'*')
k=0;
for  i=1:n
    y=sum(c(k)*g(k))*(x(i));
    plot(y,'+','color','red')
end
T0=1;
T1=x;
T(k)=2*x*T(k-1)-T(k-2);
plot(T(k),'*','color','green')
end


