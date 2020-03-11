% Implementacja filtru Kalmana

% Opis filtru Kalmana

% Filtr Kalmana to algorytm rekurencyjnego wyznaczania minimalno-wariancyjnej
%estymaty wektora stanu modelu liniowego dyskretnego uk�adu dynamicznego na
%podstawie pomiar�w wyj�cia oraz wej�cia tego uk�adu. Przyjmuje si� za�o�enie,
%�e zar�wno pomiar, jak i proces przetwarzania wewn�trz uk�adu jest 
%obarczony b��dem o rozk�adzie gaussowskim.

czasTrwania=input('Wprowadza czas trwania symulacji: ');
dlugoscKroku=input('Wprowadz d�ugo�� kroku symulacji: ');
BadanyParametr=input('Wprowadz warto�� badanego parametru: ');
zaszumieniePomiaru=input('Wprowadza wsp�czynnik zaszumienia pomiaru: ');
zaszumienieProcesu=rand;
beta=rand;
gamma=rand;
%Ustawienie warto�ci dla macierzy Q i R
Q=zaszumienieProcesu;            %Kowiariancja szumu procesu

R= zaszumieniePomiaru^2;             %Kowariancja szumu pomiaru-odchylenie
                                     % standardowe z pomiaru
A = [1];         %Macierz przejscia stanu poprzedniego do obecnego                   

% Inicjalizacj zmiennych 
x=BadanyParametr;
P=Q;

% Miejsca na dane
parametrRzeczywisty=[];
parametrMierzony=[];
parametrEstymowany=[];

% Rozpocz�cie symulacji
for i=0:dlugoscKroku:czasTrwania

    %symulacja naszego systemu liniowego dodajemy szum procesu
    
    x=A*x+beta*(10-x);
    
   %Symulacja pomiaru zaszumienia parametru

z = x+zaszumieniePomiaru*randn;

% Faza predykcji


% Estymacja macierzy kowariancji b��du 
P=A*P*A'+Q;

% Faza korekcji

% Obliczenie wzmocnienia filtru Kalmana
K=P*inv(P+R); % inv stosujemy do odw�rcenia macierzy 

% Wyznaczenie estymaty wektora stanu
x = x + K * (z - x); 

%Obliczenie macierzy kowariancji b��du estymaty
P=(1-K)*P;

% Uaktualnienie zmiennych
parametrRzeczywisty=[parametrRzeczywisty;BadanyParametr];
parametrMierzony=[parametrMierzony;z];
parametrEstymowany=[parametrEstymowany;x];


x=x+gamma*(10-x);
end


close all;
i=0:dlugoscKroku:czasTrwania;

figure;
plot(i,parametrRzeczywisty,i,parametrMierzony,i,parametrEstymowany);
grid;

yLabel('Warto�� parametru');
xLabel('CzasSymulacji');
legend('Parametr rzeczywisty', 'Parametr mierzony ( wej. )', 'ParametrEstymowany ( wyj. )'); 
title('Filtr Kalmana - Zaszumionienie parametru');