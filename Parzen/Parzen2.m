clc
clear all
N = input('Wprowadz iloœæ próbek: ');
h= input('Wprowadz parametr wyg³adzenia h: ');
srednia=input('Wprowadz wartoœæ œredniej dla rozk³adu: ');
odchylenieStandardowe=input('Wprowadz wartoœæ odchylenia standardowego: ');

disp('Menu');
disp('1.Rozk³ad jednostajny');
disp('2.Rozk³ad Gaussa');
disp('3.Rozk³ad trójk¹tny');
disp('4.Rozk³ad trygonometryczny');
disp('');

mynumber = input('Wybierz rozk³ad który bêdzie postaci¹ j¹dra: ');

% Rozk³ad z jakiego generujemy próbki

       XD=random('Normal',srednia,odchylenieStandardowe,1,N);
       XM=random('Normal',srednia,odchylenieStandardowe,1,N);

for i=1:N
for j=1:N
   
    p=(XD(1,i)-XM(1,j))./h;
switch mynumber
    
    case 1
        if(abs(p)<= 1)
            k=1/2;
        else
            k=0;
        end
    case 2
      
       k=(1./sqrt(2.*pi)).*exp(-((p.^2)./2));
    case 3
          if(abs(p)<=1)
          k=(1-abs(p));
          else
              k=0;
          end
    case 4
          k=(1./(2.*pi)).*((sin(p/2)/(p/2)).^2);
end
doSumowania(1,j)=k;
end
y(1,i)=(1/(h*N))*(sum(doSumowania));
end

%ROZK£ADY GESTOŒCI PRAWDOPODOBIEÑSTWA

%Rozk³ad jednostany
for i=1:N
    if(XD(1,i)<(srednia-(sqrt(3).*odchylenieStandardowe)))
        jednostajny(1,i)=0;
    elseif((srednia-(sqrt(3).*odchylenieStandardowe))<=(XD(1,i))&&((XD(1,i))<=(srednia+(sqrt(3).*odchylenieStandardowe))))
        jednostajny(1,i)=1./(2.*sqrt(3).*odchylenieStandardowe);
    else
            jednostajny(1,i)=0;
    end
end
    %Rozk³ad Gausa
for i=1:N
    gauss(1,i)=(1./(odchylenieStandardowe.*sqrt(2.*pi))).*(exp(-((XD(1,i)-srednia).^2/(2.*(odchylenieStandardowe.^2)))));
end

% Rozk³ad Trójk¹tny
for i=1:N
    if(XD(1,i)<(srednia-(sqrt(6).*odchylenieStandardowe)))
        trojkatny(1,i)=0;
    elseif((srednia-(sqrt(6).*odchylenieStandardowe))<=(XD(1,i))&&((XD(1,i))<=(srednia)))
        trojkatny(1,i)=((XD(1,i)-srednia)./(6.*odchylenieStandardowe.^2))+(1./(sqrt(6).*odchylenieStandardowe));
    elseif(((srednia)<=XD(1,i))&&(XD(1,i)<=(srednia+(sqrt(6).*odchylenieStandardowe))))
         trojkatny(1,i)=(-((XD(1,i)-srednia)./(6.*odchylenieStandardowe.^2)))+(1./(sqrt(6).*odchylenieStandardowe));
    else
            trojkatny(1,i)=0;
    end
end

%Obliczanie b³edów œrednioKwadratowych

%Porównianie z rozk³adem jednostanym
for i=1:N
bladJednostany(1,i)=(jednostajny(1,i)-y(1,i)).^2;
end

% Porównianie z rozk³adem Gaussa
 for i=1:N
bladGauss(1,i)=(gauss(1,i)-y(1,i)).^2;
end
%Porównianie z rozk³adem trojk¹tnym
for i=1:N
bladTrojkatny(1,i)=(trojkatny(1,i)-y(1,i)).^2;
end


figure(1)
hold on
        plot(XD,y,'b*');
      plot(XD,jednostajny,'r*');
      legend('Rozk³ad po estymacji','Rozk³ad jednostany');
      xlabel('Próbki wygenerowane z rozk³adu normalnego');
      ylabel('Wartoœæ gêstoœci prawdopodobieñstwa');
      hold off
figure(2)
hold on
        plot(XD,y,'b*');
      plot(XD,gauss,'r*');
      legend('Rozk³ad po estymacji','Rozk³ad Gaussa');
      xlabel('Próbki wygenerowane z rozk³adu normalnego');
      ylabel('Wartoœæ gêstoœci prawdopodobieñstwa');
      hold off
figure(3)
hold on
      plot(XD,y,'b*');
      plot(XD,trojkatny,'r*');
      legend('Rozk³ad po estymacji','Rozk³ad trójkatny');
      xlabel('Próbki wygenerowane z rozk³adu normalnego');
      ylabel('Wartoœæ gêstoœci prawdopodobieñstwa');
      hold off
figure(4)
      plot(XD,bladJednostany,'kx');
      legend('funkcja b³êdu-jakoœci Estymacji');
      xlabel('Próbki wygenerowane z rozk³adu normalnego');
      ylabel('Wartoœæ b³êdu');
figure(5)
      plot(XD,bladGauss,'kx');
      legend('funkcja b³êdu-jakoœci Estymacji');
      xlabel('Próbki wygenerowane z rozk³adu normalnego');
      ylabel('Wartoœæ b³êdu');
figure(6)
      plot(XD,bladTrojkatny,'kx');
      legend('funkcja b³êdu-jakoœci Estymacji');
      xlabel('Próbki wygenerowane z rozk³adu normalnego');
      ylabel('Wartoœæ b³êdu');


