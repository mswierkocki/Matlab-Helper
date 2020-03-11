clc
clear all
%Dane

N=input('WprowadŸ liczbê próbek N :');

OdchylA = input('Wprowadza odchylenie dla A: ');
OdchylZ = input('Wprowadza odchylenie dla Z: ');
sredniaA = input('Wprowadza œredni¹ dla A: ');
sredniaZ = input('Wprowadza œredni¹ dla Z: ');
z=random('Normal',sredniaZ,OdchylZ,1,N);
a=random('Normal',sredniaA,OdchylA,1,1);
for i=1:N
x(1,i)=a+z(1,i);
end
% Pierwsza funkcja

for i=1:N 

    for j=1:i
s1(1,j)=x(1,i);
    end
   a1(1,i)= (sum(s1)/(1+i));
end


%Druga funckja 


for i=1:N 

    for j=1:i
s2(1,j)=(x(1,j)-sredniaZ);
    end
   a2(1,i)= (((OdchylA.^2).*sum(s2) +(sredniaA.*(OdchylZ.^2)))/((OdchylZ.^2) + (((OdchylA.^2).*i))));
end

% Jak bardzo estymacja ró¿ni siê od naszego parametru na wejœciu
'Jak bardzo estymacja ró¿ni siê od naszego parametru na wejœciu'
for i=1:N
r1(1,i)=(a-a1(1,i)).^2;
r2(1,i)=(a-a2(1,i)).^2;
end


% Wykresy

for i=1:N
aa(1,i)=a;
end
hold on
for i=1:N
plot(i,aa(1,i),'ro');
% plot(i,a1(1,i),'b*');
plot(i,a2(1,i),'k*');
%plot(i,x(1,i),'mx');
end
hold off