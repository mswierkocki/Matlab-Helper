clc;
clear all;
T=input('Podaj iloœæ symulacji: ');
%Dane do zadania
% m-masa
m=input('Wprowadz mase m= : ');
N=input('Wprowadz iloœæ próbek w symulacji N: ');
for j=1:T
    
    %ROZK£AD WYK£ADNICZY
    
% Generacja paramterów wejœciowych z rozk³adu wyk³adniczy
parametr(j,1)=j/100;
vw=abs(random('exp',parametr(j,1),1,N));

% parametry wyjœciowe badanego zjawiska
fw=(m.*vw.*vw)/2;

%----------------------------

% Dla klasy 4f2=4a.*v;




for i=1:N
   s4(1,i)=fw(1,i).*vw(1,i); 
end

l4=sum(s4);
for i=1:N
    k4(1,i)=vw(1,i).*vw(1,i);
end

m4=sum(k4);

a4=l4./m4;

f24=a4.*vw;

% B³ad1 z œredniej arytmetycznej


r4=fw-f24;

blad4(j,1)=sqrt(sum((r4).^2)./N);


%--------------------------------
%Dla klasy
% 1f2=(1a.*(v).^2);

for i=1:N
   s11(1,i)=(fw(1,i).*vw(1,i).*vw(1,i)); 
end

l1=sum(s11);
for i=1:N
    k1(1,i)=(vw(1,i).*vw(1,i).*vw(1,i).*vw(1,i));
end

m1=sum(k1);


a1=l1./m1;
% klasy modelu
f21=(a1.*(vw).^2);


% B³ad1 


r1=fw-f21;

blad1(j,1)=sqrt(sum((r1).^2)./N);



%------------------

% Dla klasy
% 2f2=2a.*v +2b;

for i=1:N
s12(1,i)=fw(1,i);
end
sums12=sum(s12);

for i=1:N
s22(1,i)=vw(1,i);
end
sums22=sum(s22);


for i=1:N
   s32(1,i)=((N.*fw(1,i).*vw(1,i))-(vw(1,i).*sums12));
end

sums32=sum(s32);

for i=1:N
   s42(1,i)=((N.*vw(1,i).*vw(1,i))-(vw(1,i).*sums22));
end

sums42=sum(s42);

a2=sums32./sums42;

for i=1:N
s52(1,i)=((fw(1,i)-(a2.*(vw(1,i)))));
end

sums52=sum(s52);

b2= sums52/N;

f22=a2.*vw +b2;



% B³ad2 


r2=fw-f22;

blad2w(j,1)=sqrt(sum((r2).^2)./N);


%-------------------------



% TO SAMO DLA ROZK£ADU GEOMETRYCZNEGO

% Generacja paramterów wejœciowych z rozk³adu geometryczny
vg=abs(random('geo',parametr(j,1),1,N));
% parametry wyjœciowe badanego zjawiska
fg=(m.*vg.*vg)/2;

% Dla klasy 4f2=4a.*v;




for i=1:N
   s4(1,i)=fg(1,i).*vg(1,i); 
end

l4=sum(s4);
for i=1:N
    k4(1,i)=vg(1,i).*vg(1,i);
end

m4=sum(k4);

a4=l4./m4;

f24=a4.*vg;

% B³ad1 z œredniej arytmetycznej


r4=fg-f24;

blad4g(j,1)=sqrt(sum((r4).^2)./N);


%--------------------------------
%Dla klasy
% 1f2=(1a.*(v).^2);

for i=1:N
   s11(1,i)=(fg(1,i).*vg(1,i).*vg(1,i)); 
end

l1=sum(s11);
for i=1:N
    k1(1,i)=(vg(1,i).*vg(1,i).*vg(1,i).*vg(1,i));
end

m1=sum(k1);


a1=l1./m1;
% klasy modelu
f21=(a1.*(vg).^2);


% B³ad1 


r1=fg-f21;

blad1g(j,1)=sqrt(sum((r1).^2)./N);


%------------------

% Dla klasy
% 2f2=2a.*v +2b;

for i=1:N
s12(1,i)=fg(1,i);
end
sums12=sum(s12);

for i=1:N
s22(1,i)=vg(1,i);
end
sums22=sum(s22);


for i=1:N
   s32(1,i)=((N.*fg(1,i).*vg(1,i))-(vg(1,i).*sums12));
end

sums32=sum(s32);

for i=1:N
   s42(1,i)=((N.*vg(1,i).*vg(1,i))-(vg(1,i).*sums22));
end

sums42=sum(s42);

a2=sums32./sums42;

for i=1:N
s52(1,i)=((fg(1,i)-(a2.*(vg(1,i)))));
end

sums52=sum(s52);

b2= sums52/N;

f22=a2.*vg +b2;



% B³ad2 


r2=fg-f22;

blad2g(j,1)=sqrt(sum((r2).^2)./N);


%-------------------------




end
% wykresy zale¿noœci b³edów od dobieranych parametrów

% DLA ROZK£ADU WYK£ADNICZEGO
figure(1);
title('Dla klasy E=aV');
hold on
plot(parametr,blad4,'b');
xlabel('parametr');
ylabel('Wartoœæ b³êdu');
hold off

figure(2);
hold on
title('Dla klasy E=aV^2');
plot(parametr,blad1,'r');
xlabel('parametr');
ylabel('Wartoœæ b³êdu');
hold off

figure(3);

hold on
title('Dla klasy E=aV+b');
plot(parametr,blad2w,'k');
xlabel('parametr');
ylabel('Wartoœæ b³êdu');
hold off


% DLA ROZK£ADU GEOMETRYCZNEGO
figure(4);
hold on
title('Dla klasy E=aV');
plot(parametr,blad4g,'b');
xlabel('parametr');
ylabel('Wartoœæ b³êdu');
hold off

figure(5);
hold on
title('Dla klasy E=aV^2');
plot(parametr,blad1g,'r');
xlabel('parametr');
ylabel('Wartoœæ b³êdu');
hold off

figure(6);
hold on
title('Dla klasy E=aV+b');
plot(parametr,blad2g,'k');
xlabel('parametr');
ylabel('Wartoœæ b³êdu');
hold off


%--------------------------------
