% m-masa
m=30;
N=input('Wprowadz N: ');

v=abs(randn(1,N));
f=(m.*v.*v)/2;

for i=1:N
s1(1,i)=f(1,i);
end
sums1=sum(s1);

for i=1:N
s2(1,i)=v(1,i);
end
sums2=sum(s2);


for i=1:N
   s3(1,i)=((N.*f(1,i).*v(1,i))-(v(1,i).*sums1));
end

sums3=sum(s3);

for i=1:N
   s4(1,i)=((N.*v(1,i).*v(1,i))-(v(1,i).*sums2));
end

sums4=sum(s4);

a=sums3./sums4;

for i=1:N
s5(1,i)=((f(1,i)-(a.*(v(1,i)))));
end

sums5=sum(s5);

b= sums5/N;

f2=a.*v +b;
hold on
plot(v,f,'bx');
plot(v,f2,'r*');
hold off


% B³ad1 z œredniej arytmetycznej


r=f-f2;

blad1=sum(abs(r))./N