function [x] = supp(X, zasada) %X - zbi�r danych, reg - zasada
%zasada ma nast�puj�c� posta�: zasada uniwersalna dla 2 argument�w i 3
%warto�ci dla ka�dego argumentu - [1 1;2 2;3 3]
%1 1
%2 2
%3 3
%
[n, m] = size(X); %rozmiar danych

x = zeros(1, length(unique(X(:, m)))); %tworzenie zmiennej zwracanej, funkcja unique zwraca wszystkie unikalne warto�ci
for i=1:n
    q = 1;
    for j=1:m-1
        q = q * sum(X(i, j) == zasada(:, j));   %przyr�wnanie tworzy wektor 1 i 0 zale�nie od r�wno�ci zmiennych, 
                                                %je�eli kt�rakolwiek
                                                %zmienna z zasady jest
                                                %r�wna zmiennej z danych,
                                                %suma jest niezerowa,
                                                %dlatego w przypadku braku
                                                %zgodno�ci zasady z danymi
                                                %nast�puje mno�enie przez 0
    end
    if q
        x(X(i, m)) = x(X(i, m)) + 1;            %je�eli poprzednik zosta� spe�niony, zwi�kszam licznik w odpowiedniej klasie decyzyjnej w wyniku
    end
end
for i=1:length(unique((X(:, m))))
    x(i) = x(i)/sum(X(:, m) == i);              %dziel� liczbe wynik�w spe�nionego poprzednika przez spe�nione nast�pnik
end
x = x(zasada(1, m));                            %wybieram konkretny wynik przypisany do odpowiedniej warto�ci klasy decyzyjnej
end