function ruchoma(h)
load fsgrzbiet
x=abs(fsgrzbiet(:,2));
N=length(x);
ile_okien=N/h;
for  i=1:(ile_okien-h+1)
    a=(i-1).*h;
    if i==1, a=1;
    end
    b=i.*h;
    sr(i)=mean(x(a:b));
    war(i)=var(x(a:b));
end
plot(x);
plot(x'*')
end
