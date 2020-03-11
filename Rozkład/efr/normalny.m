clc
clear all
N=input('Wprowadz ilo�� pr�bek N: ');
M=input('Wprowadz ilo�� pr�bek M: ');
sigma=input('Wprowadz ilo�� pr�bek sigma: ');
srednia=input('Wprowadz ilo�� pr�bek srednia: ');
y=rand(1,N);

% funkcja efr^(-1)
for i=1:N
for k=1:M
    ds=zeros;
c(1,1)=1;
    for m=1:k
    ds(1,m)=((c(1,m).*c(1,k-(m-1)))./(((m-1+1).*(2.*(m-1)+1))));
    end
    
c(1,k+1)=sum(ds);

es(1,k)=((c(1,(k))./(2.*(k-1)+1)).*(((sqrt(pi)./2).*((2.*y(1,i))-1)).^((2.*(k-1))+1)));

end
erfdm= sum(es);

x(1,i)=((erfdm.*sqrt(2.*(sigma.^2))) + srednia);

end


plot(x,y,'r*');