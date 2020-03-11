function kalman_dc(duration, step, U, unoise) 
%Funkcja  kalman_dc(duration, T) 
%duration - czas trwania symulacj [s] 
%step - krok symulacji [s] 
%U - wartosc napi&#234;cia [V] 
%unoise - wspolczynnik zaszumienia napiecia 
  
T = step; 
  
%Ustawienie wartosci dla macierzy Q i R 
Q = 0.0001;     %Kowariancja szumu procesu 
R = 0.09;          %Kowariancja szumu pomiaru  
  
%Inicjalizacja zmiennych 
x = U;          
P = Q;      
  
%Miejsce na dane 
vol = [];      
volmeas = []; 
volpred = []; 
  
for t=0:T:duration,
    %Symulacja pomiaru zaszumionego napiecia 
    z = U + unoise * randn; 
    %Faza predykcji 
    P = P + Q; 
    %Faza korekcji 
    K = P * inv(P + R); 
    x = x + K * (z - x); 
    P = ( 1 - K ) * P; 
    %Uaktualnienie zmiennych 
    vol = [ vol; U ]; 
    volmeas = [ volmeas; z ]; 
    volpred = [ volpred; x ]; 
end; 
  
close all; 
t = 0:T:duration; 
  
figure; 
plot(t, vol, t, volmeas, t, volpred); 
grid; 
ylabel('Napiecie [V]'); 
xlabel('Czas [s]'); 
legend('Napiecie rzeczywiste', 'Napiecie mierzone ( wej. )', 'Napiecie estymowane ( wyj. )'); 
title('Filtr Kalmana - Zaszumione napiecie');