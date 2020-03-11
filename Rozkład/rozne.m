clc;
clear all;

% Do zadania 4 do Sprawozdania

%Dane do zadania
% m-masa
m=3;
N=input('Wprowadz N: ');
% Generacja paramterów wejœciowych z rozk³adu jednostajnego
v=abs(rand(1,N));
% Generacja paramterów wejœciowych z rozk³adu normalny
vn=abs(random('norm',0,1,1,N));
% Generacja paramterów wejœciowych z rozk³adu wyk³adniczy
vw=abs(random('exp',0.8,1,N));
% Generacja paramterów wejœciowych z rozk³adu geometryczny
vg=abs(random('geo',0.5,1,N));
% parametry wyjœciowe badanego zjawiska
f=(m.*v.*v)/2;
fn=(m.*vn.*vn)/2;
fw=(m.*vw.*vw)/2;
fg=(m.*vg.*vg)/2;

%----------------------------

% Dla klasy 4f2=4a.*v;

%--------------------------------

% Dla rozk³adu jednostajnego


for i=1:N
   s4(1,i)=f(1,i).*v(1,i); 
end

l4=sum(s4);
for i=1:N
    k4(1,i)=v(1,i).*v(1,i);
end

m4=sum(k4);

a4=l4./m4;

f24=a4.*v;


% B³ad1 z œredniej arytmetycznej


r4=f-f24;

blad4=sum(abs(r4))./N;

%--------------------------------

% Dla rozk³adu normalnego

for i=1:N
   s4n(1,i)=fn(1,i).*vn(1,i); 
end

l4=sum(s4);
for i=1:N
    k4n(1,i)=vn(1,i).*vn(1,i);
end

m4n=sum(k4n);

a4n=l4./m4n;

f24n=a4n.*vn;


% B³ad1 z œredniej arytmetycznej


r4n=f-f24n;

blad4n=sum(abs(r4n))./N;

%--------------------------------

% Dla rozk³adu wyk³adniczego

for i=1:N
   s4w(1,i)=fw(1,i).*vw(1,i); 
end

l4w=sum(s4w);
for i=1:N
    k4w(1,i)=vw(1,i).*vw(1,i);
end

m4w=sum(k4w);

a4w=l4w./m4w;

f24w=a4w.*vw;


% B³ad1 z œredniej arytmetycznej


r4w=f-f24w;

blad4w=sum(abs(r4w))./N;

%--------------------------------

% Dla rozk³adu geometrycznego

for i=1:N
   s4g(1,i)=fg(1,i).*vg(1,i); 
end

l4g=sum(s4g);
for i=1:N
    k4g(1,i)=vg(1,i).*vg(1,i);
end

m4g=sum(k4g);

a4g=l4g./m4g;

f24g=a4g.*vg;


% Macierz b³êdów

r4g=f-f24g;

blad4g=sum(abs(r4g))./N;

% Wykresy jednej klasy dla ró¿nych rozk³adów
% Dla klasy 4f2=4a.*v;



hold on
%title('Wykresy klasy y=ax dla ró¿nych rozk³adów');

% plot(v,f,'bo');
%plot(v,f24,'r*');
%plot(vn,f24n,'b*');
plot(vw,f24w,'r*');
% plot(vg,f24g,'k*');

%legend('E=(mV^2)/2','E=aV^2','E=aV+b','E=aV','E=a(b^v)');



