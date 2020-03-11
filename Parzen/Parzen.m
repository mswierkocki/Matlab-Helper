clc
clear all
N = input('Wprowadz ilo�� pr�bek: ');
h= input('Wprowadz Parametr h: ');
Xd=[rand(1,N)*10-5];

% syms x;
% syms y;
N=length(X);
g=0;


disp('Menu');
disp('1.Rozk�ad jednostajny');
disp('2.Rozk�ad Gaussa');
disp('3.Rozk�ad tr�jk�tny');
disp('4.Rozk�ad trygonometryczny');
disp('');


mynumber = input('Wybierz rozk�ad: ');
for j=1:N
for i=1:N
switch mynumber
    
    case 1
        p=1/2;
    case 2
      
        p(1,i)=(1/sqrt(2*pi))*exp(-(X(1,i)^2)/2);
    case 3
          
         p=(1-abs(x));
    case 4
       
          p=(1/2*pi)*(sin(x/2)/(x/2))^2;
end
doSumowania(1,i)=(1./h).*p(1,i);
end
end


sigma=1;
srednia=0;

for i=1:N
    
    gauss(1,i)=(1/(sigma.*sqrt(2.*pi))).*(exp(-((X(1,i)-srednia).^2/(2.*sigma.^2))));
end

y=(1./N).*(sum(doSumowania));
hold on






switch mynumber
    
    case 1
        f=(1./N).*g;
        plot(X,f,'b');
    case 2
        plot(X,y,'b*');
      plot(X,gauss,'r*');
    case 3
          
    case 4
       
end


% for i=1:N
% plot(gauss(1,i),X(1,i),'r*');
% end

hold off

