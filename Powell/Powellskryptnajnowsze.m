% Dowolny punkt wej�ciowy

%x=input('Wprowadz punkt wej�ciowey x0 = ');
x = [0 5];
disp(x)
%Tworzenie bazy wyj�ciowej z wzajemnie ortogonalnych wektor�w
%n=input('Wprowadz liczb� zmiennych niezale�nych n = ');   % wielko�c prostok�tnego uk�adu wsp�rz�dnych 
n =2;

e = eye(n)
% Okre�l dok�adno�� warto�ci funkcji
%efun=input('Wprowadz dok�adno�� efun = ');
efun = 0.01;
% Okre�l dok�adno�� wsp�czynnika d�ugo�ci kroku
%elambda=input('Wprowadz dok�adno�� elambda = ');
elambda = 1;
% Okre�l maskymaln� ilo�� iteracji
%N=input('Wprowadz maksymaln� liczb� iteracji = ');
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
disp ('warto�� funkcji:  ')
disp (fun(x))
xmin=x;

while (k<N)
    xb=x;   %zapami�tuje punkt pocz�tkowy cyklu do kierunku sprzezonego
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
    	disp ('warto�� funkcji:  ')
        disp (fun(xmin))
        plot (xmin(1,1),xmin(1,2),'b*');
        x=xmin; %zmienia mi punkt startowy do bazowych krok�w
    end
    if (abs(fun(xb)-fun(xmin)>efun))
        % zmienianie bazy kierunk�w
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