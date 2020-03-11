function ret = filtr_kalmana2(t,l,p,sz,szp)
if(nargin<1)
Tsymulacji=100;
step=2;
param=3;
szum=4;
szumproces = 2;   
elseif(narign<2)
Tsymulacji=t;
step=1;
param=0.7;
szum=0.8;
szumproces = 2;   
elseif(narign<3)
Tsymulacji=t;
step=l;
param=0.7;
szum=0.8;
szumproces = 2;   
elseif(narign<4)
Tsymulacji=t;
step=l;
param=p;
szum=0.8;
szumproces = 2;   
elseif(narign<5)
Tsymulacji=t;
step=l;
param=p;
szum=sz;
szumproces = 2;   
elseif(nargin<6)
Tsymulacji=t;
step=l;
param=p;
szum=sz;
szumproces = szp;   
end

%Ustawienie wartoœci dla macierzy Q i R
Q=szumproces;            %Kowiariancja szumu procesu

R= szum^2;             %Kowariancja szumu pomiaru-odchylenie
                                     % standardowe z pomiaru
A = [1];         %Macierz przejscia stanu poprzedniego do obecnego                   


x=param;
P=Q;
parametrRzeczywisty=[];
parametrMierzony=[];
parametrEstymowany=[];

for i=0:step:Tsymulacji
    x=A*x+szumproces; % dodawanie szumu do procesu
    z = x+szum*randn; % sumulacja pomiaru
    P=A*P*A'+Q;% estymacja macierzy kowariancji b³êdu 
    K=P*inv(P+R); % obliczenie wzmocnienia 
    x = x + K * (z - x); % Wyznaczenie estymaty wektora stanu
    P=(1-K)*P; %Obliczenie macierzy kowariancji b³êdu estymaty
parametrRzeczywisty=[parametrRzeczywisty;param];
parametrMierzony=[parametrMierzony;z];
parametrEstymowany=[parametrEstymowany;x];


end

i=0:step:Tsymulacji;

figure;
plot(i,parametrRzeczywisty,i,parametrMierzony,i,parametrEstymowany);
grid;

ylabel('Wartoœæ parametru');
xlabel('CzasSymulacji');
legend('Parametr rzeczywisty', 'Parametr mierzony ( wej. )', 'ParametrEstymowany ( wyj. )'); 

end