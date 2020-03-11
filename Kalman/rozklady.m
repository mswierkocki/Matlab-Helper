function ret=rozklady(rozkld,n,w,s,o)

if(nargin<1)
N = 50 ; % Liczba probek
h= 0.8; % Wygladzanie
mean= 30; % srednia dla rozkladu
odstd= 3; %odchylenie
rozkld = 1;
elseif(nargin<2)
    N = 50;
    h = 0.8;
    mean=50;
    odstd = 3;
elseif(nargin<3)
    N = n;
    h = 0.8;
    mean=50;
    odstd = 3;
elseif(nargin<4)
    N = n;
    h = w;
    mean=50;
    odstd = 3;
elseif(nargin<5)
    N = n;
    h = w;
    mean=s;
    odstd = 3;
elseif(nargin<6)
    N = n;
    h = w;
    mean=s;
    odstd = o;
end

disp('Wybrales');
switch rozkld
    case 1 
disp('Rozk³ad jednostajny');
    case 2
disp('Rozk³ad Gaussa');
    case 3
disp('Rozk³ad trygonometryczny');
    case 4
disp('Rozk³ad trójk¹tny');
    otherwise
disp('Wybierz od 1 do 4');
    return
end
disp('');


X=random('Normal',mean,odstd,1,N);
Xp=random('Normal',mean,odstd,1,N);

%Wiliczanie jadra
for i=1:N
for j=1:N
   
    p=(X(1,i)-Xp(1,j))./h;
switch rozkld
    
    case 1
        if(abs(p)<= 1)
            k=1/2;
        else
            k=0;
        end
    case 2
      
       k=(1./sqrt(2.*pi)).*exp(-((p.^2)./2));
    case 3
        k=(1./(2.*pi)).*((sin(p/2)/(p/2)).^2);
          
    case 4
          if(abs(p)<=1)
          k=(1-abs(p));
          else
              k=0;
          end
end
suma(1,j)=k;
end
y(1,i)=(1/(h*N))*(sum(suma));
end

%rozklady wyestymowany
%metoda maxymalnej wiarygodnosci

for i=1:N
    %Jednostajny
    if(X(1,i)<(mean-(sqrt(3).*odstd)))
        jednostajny(1,i)=0;
    elseif((mean-(sqrt(3).*odstd))<=(X(1,i))&&((X(1,i))<=(mean+(sqrt(3).*odstd))))
        jednostajny(1,i)=1./(2.*sqrt(3).*odstd);
    else
            jednostajny(1,i)=0;
    end
    %Gausa
    gauss(1,i)=(1./(odstd.*sqrt(2.*pi))).*(exp(-((X(1,i)-mean).^2/(2.*(odstd.^2)))));
    % Trojkatny
    if(X(1,i)<(mean-(sqrt(6).*odstd)))
        trojkatny(1,i)=0;
    elseif((mean-(sqrt(6).*odstd))<=(X(1,i))&&((X(1,i))<=(mean)))
        trojkatny(1,i)=((X(1,i)-mean)./(6.*odstd.^2))+(1./(sqrt(6).*odstd));
    elseif(((mean)<=X(1,i))&&(X(1,i)<=(mean+(sqrt(6).*odstd))))
         trojkatny(1,i)=(-((X(1,i)-mean)./(6.*odstd.^2)))+(1./(sqrt(6).*odstd));
    else
            trojkatny(1,i)=0;
    end
end




for i=1:N % Bledy sredniokwadratowe
bladJednostany(1,i)=(jednostajny(1,i)-y(1,i)).^2;
bladGauss(1,i)=(gauss(1,i)-y(1,i)).^2;
bladTrojkatny(1,i)=(trojkatny(1,i)-y(1,i)).^2;
end

hold on
plot(X,y,'g*');
plot(X,jednostajny,'r*');
plot(X,gauss,'y*');
plot(X,trojkatny,'b*');

xlabel('X');
ylabel('Gestosc');
legend('probki','jednostajny','gauss','trojkatny');
hold off

end

