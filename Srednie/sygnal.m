function y=sygnal(h)
load fsgrzbiet
x=abs(fsgrzbiet(:,2));
N=length(x);
ile_okien=N/h;
for  i=1:ile_okien
    a=(i-1).*h;
    if i==1, a=1;
    end
    b=i.*h;
    sr(i)=mean(x(a:b));
    war(i)=var(x(a:b));
end
subplot(3,1,1)
plot(x)
subplot(3,1,2)
bar(sr)
a=0;
b=0;
subplot(3,1,3);
bar(war)
end



