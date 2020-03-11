function [ punkt,wartosc ] = powella( N, efun,elambda )
% Dowolny punkt wejœciowy
hold on
%x=input('Wprowadz punkt wejœciowey x0 = ');
x = [-0.5 1];
disp(x)
%Tworzenie bazy wyjœciowej z wzajemnie ortogonalnych wektorów
%n=input('Wprowadz liczbê zmiennych niezale¿nych n = ');   % wielkoœc prostok¹tnego uk³adu wspó³rzêdnych 
n =2;

e = eye(n)
% Okreœl dok³adnoœæ wartoœci funkcji
%efun=input('Wprowadz dok³adnoœæ efun = ');
%efun = 0.01;
% Okreœl dok³adnoœæ wspó³czynnika d³ugoœci kroku
%elambda=input('Wprowadz dok³adnoœæ elambda = ');
%elambda = 0.01;
% Okreœl maskymaln¹ iloœæ iteracji
%N=input('Wprowadz maksymaln¹ liczbê iteracji = ');
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

