% m-masa
m=30;
N=input('Wprowadz N: ');
v=abs(randn(1,N));
% v2=abs(expnd(1,N));

f=(m.*v.*v)/2;

for i=1:N
   s(1,i)=(f(1,i).*v(1,i).*v(1,i)); 
end

l=sum(s);
for i=1:N
    k(1,i)=(v(1,i).*v(1,i).*v(1,i).*v(1,i));
end

m=sum(k);

a=l./m;

f2=(a.*(v).^2);
hold on
plot(v,f,'bo');
plot(v,f2,'r*');
hold off

% B³ad1 z œredniej arytmetycznej


r=f-f2;

blad1=sum(abs(r))./N

