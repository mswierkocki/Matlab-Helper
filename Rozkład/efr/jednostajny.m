clc
clear all

% Generacja paramter�w wej�ciowych z rozk�adu jednostajnego
lambda = input('Wprowadz lambda: ');
N=input('Wprowadz ilo�� pr�bek N: ');
y=rand(1,N);

% dla rozk�adu wyk�adniczego og�lnego

for i=1:N

x(1,i)=log(1-y(1,i))./(-lambda);

end

%Dla rozk�adu geometryczngo
p = input('Wprowadz parametr p: ');


k(1,1)=1;
for i=2:N
   
k(1,i)=k(1,i-1) +1;
end

for j=1:N
    i=1;
while (y(1,j)> (1-(1-p)^(k(1,i))))
i=i+1;
end
xg(1,j)=k(1,i);
end


%-----------------------------------


%Dla rozk�adu tr�jk�tengo
a = input('Wprowadz parametr a: ');
b = input('Wprowadz parametr b gdzie b>a: ');
c = input('Wprowadz parametr c gdzie ,a<=c<=b: ');

fc=(c-a)/(b-a);

for i=1:N
if(y(1,i)<fc)
xt(1,i) = sqrt(y(1,i)*(b-a)*(c-a))+a;

else
   xt(1,i) = b- sqrt((1-y(1,i))*(b-a)*(b-c));
end
end


%-----------------------------------


%WYKRESY ROZK�AD�W

figure(1)
plot(x,y,'k*');
figure(2)
plot(xg,y,'b*');
figure(3)
plot(xt,y,'r*');
