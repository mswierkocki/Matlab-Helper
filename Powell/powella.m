function [ punkt,wartosc ] = powella( N, efun,elambda )
% Dowolny punkt wej�ciowy
hold on
%x=input('Wprowadz punkt wej�ciowey x0 = ');
x = [-0.5 1];
disp(x)
%Tworzenie bazy wyj�ciowej z wzajemnie ortogonalnych wektor�w
%n=input('Wprowadz liczb� zmiennych niezale�nych n = ');   % wielko�c prostok�tnego uk�adu wsp�rz�dnych 
n =2;

e = eye(n)
% Okre�l dok�adno�� warto�ci funkcji
%efun=input('Wprowadz dok�adno�� efun = ');
%efun = 0.01;
% Okre�l dok�adno�� wsp�czynnika d�ugo�ci kroku
%elambda=input('Wprowadz dok�adno�� elambda = ');
%elambda = 0.01;
% Okre�l maskymaln� ilo�� iteracji
%N=input('Wprowadz maksymaln� liczb� iteracji = ');
%N = 25;
% wykres funkcji z punktem bazowym
[X,Y] = meshgrid(-5:.2:5,-5:.2:5);
fun=inline('2.5.*(X.^2 - Y).^2 + (1 - X).^2');
Z = fun(X,Y);
surface(X,Y,Z);

plot (x(1,1),x(1,2),'ro');
i=1;
k=0;

xmin=x;

while (k<N)
    baza=x;   
    while i<n+1
        for lambda=-5:elambda:5
            xnew= x + lambda.*e(i,:);
            if (fun(xnew(1),xnew(2))<fun(xmin(1),xmin(2)))
            xmin=xnew;
            end
        end
        i=i+1;
        k=k+1;
        plot (xmin(1,1),xmin(1,2),'g*');
        x=xmin; 
    end
    if (abs(fun(baza(1),baza(2))-fun(xmin(1),xmin(2))>efun))
        
        sprzezony = xmin - baza;
        for i=1:n-1
        e(i,:)=e(i+1,:);
        end
        e(n,:)=sprzezony;
    else
        k=N;   
    end
    i=1;
end

punkt = [xmin(1),xmin(2)]
wartosc = fun(xmin(1),xmin(2))
plot (xmin(1,1),xmin(1,2),'rx');
hold off;
end

