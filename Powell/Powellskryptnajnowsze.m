% Dowolny punkt wejœciowy

%x=input('Wprowadz punkt wejœciowey x0 = ');
x = [0 5];
disp(x)
%Tworzenie bazy wyjœciowej z wzajemnie ortogonalnych wektorów
%n=input('Wprowadz liczbê zmiennych niezale¿nych n = ');   % wielkoœc prostok¹tnego uk³adu wspó³rzêdnych 
n =2;

e = eye(n)
% Okreœl dok³adnoœæ wartoœci funkcji
%efun=input('Wprowadz dok³adnoœæ efun = ');
efun = 0.01;
% Okreœl dok³adnoœæ wspó³czynnika d³ugoœci kroku
%elambda=input('Wprowadz dok³adnoœæ elambda = ');
elambda = 1;
% Okreœl maskymaln¹ iloœæ iteracji
%N=input('Wprowadz maksymaln¹ liczbê iteracji = ');
N = 25;
% wykres funkcji z punktem bazowym
[X,Y] = meshgrid(-5:.2:5,-5:.2:5);
Z = 2.5.*(X.^2 - Y).^2 + (1 - X).^2;
contour(X,Y,Z,20);
hold on
plot (x(1,1),x(1,2),'r*');
i=1;
k=0;
disp ('krok:  ')
disp (k)
disp ('wartoœæ funkcji:  ')
disp (fun(x))
xmin=x;

while (k<N)
    xb=x;   %zapamiêtuje punkt pocz¹tkowy cyklu do kierunku sprzezonego
    % kroki po bazowych kierunkach
    while i<n+1
        for lambda=-5:elambda:5
            xpom= x + lambda.*e(i,:);
            if (fun(xpom)<fun(xmin))
            xmin=xpom;
            end
        end
        i=i+1;
        k=k+1;
        disp ('krok:  ')
        disp (k)
        disp ('zmienne: ')
        disp (xmin)
    	disp ('wartoœæ funkcji:  ')
        disp (fun(xmin))
        plot (xmin(1,1),xmin(1,2),'b*');
        x=xmin; %zmienia mi punkt startowy do bazowych kroków
    end
    if (abs(fun(xb)-fun(xmin)>efun))
        % zmienianie bazy kierunków
        sprzezony = xmin - xb;
        for i=1:n-1
        e(i,:)=e(i+1,:);
        end
        e(n,:)=sprzezony;
    else
        k=N;   %traktowac jako break
    end
    i=1;
end
disp ('znalezione minimum:  ')
disp (fun(xmin))
plot (xmin(1,1),xmin(1,2),'g*');
hold off;