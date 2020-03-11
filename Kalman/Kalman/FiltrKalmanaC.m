% Implementacja filtru Kalmana

% Opis filtru Kalmana

% Filtr Kalmana to algorytm rekurencyjnego wyznaczania minimalno-wariancyjnej
%estymaty wektora stanu modelu liniowego dyskretnego uk³adu dynamicznego na
%podstawie pomiarów wyjœcia oraz wejœcia tego uk³adu. Przyjmuje siê za³o¿enie,
%¿e zarówno pomiar, jak i proces przetwarzania wewn¹trz uk³adu jest 
%obarczony b³êdem o rozk³adzie gaussowskim.

czasTrwania=input('Wprowadza czas trwania symulacji: ');
dlugoscKroku=input('Wprowadz d³ugoœæ kroku symulacji: ');
BadanyParametr=input('Wprowadz wartoœæ badanego parametru: ');
zaszumieniePomiaru=input('Wprowadza wspó³czynnik zaszumienia pomiaru: ');
zaszumienieProcesu=rand;
beta=rand;
gamma=rand;
%Ustawienie wartoœci dla macierzy Q i R
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

% Rozpoczêcie symulacji
for i=0:dlugoscKroku:czasTrwania

    %symulacja naszego systemu liniowego dodajemy szum procesu
    
    x=A*x+beta*(10-x);
    
   %Symulacja pomiaru zaszumienia parametru

z = x+zaszumieniePomiaru*randn;

% Faza predykcji


% Estymacja macierzy kowariancji b³êdu 
P=A*P*A'+Q;

% Faza korekcji

% Obliczenie wzmocnienia filtru Kalmana
K=P*inv(P+R); % inv stosujemy do odwórcenia macierzy 

% Wyznaczenie estymaty wektora stanu
x = x + K * (z - x); 

%Obliczenie macierzy kowariancji b³êdu estymaty
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

yLabel('Wartoœæ parametru');
xLabel('CzasSymulacji');
legend('Parametr rzeczywisty', 'Parametr mierzony ( wej. )', 'ParametrEstymowany ( wyj. )'); 
title('Filtr Kalmana - Zaszumionienie parametru');