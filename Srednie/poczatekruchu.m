function start = poczatekruchu(emg, h, d)   %emg - sygna�, h - dlugosc przedzia�u, d - minimalna ilo�� element�w wiekszych ni� �rednia sygna�u
a = srkroczaca(emg, h);                        %pod a podstawiam �redni� krocz�c� z parametrami emg i h
sr = mean(emg);                             %sr sredni sygnal
n = length(emg);
l_elementow = 0;                        %program zlicza liczb� element�w w �redniej krocz�cej wi�kszych od �redniej ca�ego sygna�u, zaczynam zliczanie od 0
i = 1;                                   %przechodze po kolei po wszystkich elementach a od 1 do n
while l_elementow < d && i < n      %warunek na znalezienie pocz�tku ruchu jest osi�gni�cie przez licznik warto�ci wi�kszej ni� d podawane w argumencie funkcji
    if a(i) > sr                 %przyrownywanie kolejnych warto�ci a do �redniej sygna�u
        l_elementow = l_elementow + 1;  %je�eli a(i) jest wi�ksze od sr, to licznik zwi�ksza si� o 1
    else l_elementow = 0;       % je�eli a(i) opadnie poni�ej sr, to licznik si� zeruje - to eliminuje zak��cenia w sygnale
    end
    i = i + 1;
end
plot(a) 
hold on
plot(i, a(i), '^r')
start = i;
hold off
end