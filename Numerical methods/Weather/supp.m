function [x] = supp(X, zasada) %X - zbiór danych, reg - zasada
%zasada ma nastêpuj¹c¹ postaæ: zasada uniwersalna dla 2 argumentów i 3
%wartoœci dla ka¿dego argumentu - [1 1;2 2;3 3]
%1 1
%2 2
%3 3
%
[n, m] = size(X); %rozmiar danych

x = zeros(1, length(unique(X(:, m)))); %tworzenie zmiennej zwracanej, funkcja unique zwraca wszystkie unikalne wartoœci
for i=1:n
    q = 1;
    for j=1:m-1
        q = q * sum(X(i, j) == zasada(:, j));   %przyrównanie tworzy wektor 1 i 0 zale¿nie od równoœci zmiennych, 
                                                %je¿eli którakolwiek
                                                %zmienna z zasady jest
                                                %równa zmiennej z danych,
                                                %suma jest niezerowa,
                                                %dlatego w przypadku braku
                                                %zgodnoœci zasady z danymi
                                                %nastêpuje mno¿enie przez 0
    end
    if q
        x(X(i, m)) = x(X(i, m)) + 1;            %je¿eli poprzednik zosta³ spe³niony, zwiêkszam licznik w odpowiedniej klasie decyzyjnej w wyniku
    end
end
for i=1:length(unique((X(:, m))))
    x(i) = x(i)/sum(X(:, m) == i);              %dzielê liczbe wyników spe³nionego poprzednika przez spe³nione nastêpnik
end
x = x(zasada(1, m));                            %wybieram konkretny wynik przypisany do odpowiedniej wartoœci klasy decyzyjnej
end