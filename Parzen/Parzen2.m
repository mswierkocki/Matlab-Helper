clc
clear all
N = input('Wprowadz ilo�� pr�bek: ');
h= input('Wprowadz parametr wyg�adzenia h: ');
srednia=input('Wprowadz warto�� �redniej dla rozk�adu: ');
odchylenieStandardowe=input('Wprowadz warto�� odchylenia standardowego: ');

disp('Menu');
disp('1.Rozk�ad jednostajny');
disp('2.Rozk�ad Gaussa');
disp('3.Rozk�ad tr�jk�tny');
disp('4.Rozk�ad trygonometryczny');
disp('');

mynumber = input('Wybierz rozk�ad kt�ry b�dzie postaci� j�dra: ');

% Rozk�ad z jakiego generujemy pr�bki

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

%ROZK�ADY GESTO�CI PRAWDOPODOBIE�STWA

%Rozk�ad jednostany
for i=1:N
    if(XD(1,i)<(srednia-(sqrt(3).*odchylenieStandardowe)))
        jednostajny(1,i)=0;
    elseif((srednia-(sqrt(3).*odchylenieStandardowe))<=(XD(1,i))&&((XD(1,i))<=(srednia+(sqrt(3).*odchylenieStandardowe))))
        jednostajny(1,i)=1./(2.*sqrt(3).*odchylenieStandardowe);
    else
            jednostajny(1,i)=0;
    end
end
    %Rozk�ad Gausa
for i=1:N
    gauss(1,i)=(1./(odchylenieStandardowe.*sqrt(2.*pi))).*(exp(-((XD(1,i)-srednia).^2/(2.*(odchylenieStandardowe.^2)))));
end

% Rozk�ad Tr�jk�tny
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

%Obliczanie b�ed�w �rednioKwadratowych

%Por�wnianie z rozk�adem jednostanym
for i=1:N
bladJednostany(1,i)=(jednostajny(1,i)-y(1,i)).^2;
end

% Por�wnianie z rozk�adem Gaussa
 for i=1:N
bladGauss(1,i)=(gauss(1,i)-y(1,i)).^2;
end
%Por�wnianie z rozk�adem trojk�tnym
for i=1:N
bladTrojkatny(1,i)=(trojkatny(1,i)-y(1,i)).^2;
end


figure(1)
hold on
        plot(XD,y,'b*');
      plot(XD,jednostajny,'r*');
      legend('Rozk�ad po estymacji','Rozk�ad jednostany');
      xlabel('Pr�bki wygenerowane z rozk�adu normalnego');
      ylabel('Warto�� g�sto�ci prawdopodobie�stwa');
      hold off
figure(2)
hold on
        plot(XD,y,'b*');
      plot(XD,gauss,'r*');
      legend('Rozk�ad po estymacji','Rozk�ad Gaussa');
      xlabel('Pr�bki wygenerowane z rozk�adu normalnego');
      ylabel('Warto�� g�sto�ci prawdopodobie�stwa');
      hold off
figure(3)
hold on
      plot(XD,y,'b*');
      plot(XD,trojkatny,'r*');
      legend('Rozk�ad po estymacji','Rozk�ad tr�jkatny');
      xlabel('Pr�bki wygenerowane z rozk�adu normalnego');
      ylabel('Warto�� g�sto�ci prawdopodobie�stwa');
      hold off
figure(4)
      plot(XD,bladJednostany,'kx');
      legend('funkcja b��du-jako�ci Estymacji');
      xlabel('Pr�bki wygenerowane z rozk�adu normalnego');
      ylabel('Warto�� b��du');
figure(5)
      plot(XD,bladGauss,'kx');
      legend('funkcja b��du-jako�ci Estymacji');
      xlabel('Pr�bki wygenerowane z rozk�adu normalnego');
      ylabel('Warto�� b��du');
figure(6)
      plot(XD,bladTrojkatny,'kx');
      legend('funkcja b��du-jako�ci Estymacji');
      xlabel('Pr�bki wygenerowane z rozk�adu normalnego');
      ylabel('Warto�� b��du');


