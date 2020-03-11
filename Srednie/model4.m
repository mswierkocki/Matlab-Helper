% m-masa
m=30;
N=input('Wprowadz N: ');
switch choice
    case 1
        'Rozk�ad Naturalny'
v=abs(randn(1,N));
    case 2
'Rozk�ad wyk�adniczy'
v=abs(random('exp',1:N,1,N));
    case 3
'Rozk�ad geometryczny'
v=abs(random('geo',1:N,1,N));
end
f=(m.*v.*v)/2;

for i=1:N
   s(1,i)=f(1,i).*v(1,i); 
end

l=sum(s);
for i=1:N
    k(1,i)=v(1,i).*v(1,i);
end

m=sum(k);

a=l./m;

f2=a.*v;
hold on
plot(v,f,'bx');
plot(v,f2,'r*');
hold off

% B�ad1 z �redniej arytmetycznej


r=f-f2;

blad1=sum(abs(r))./N