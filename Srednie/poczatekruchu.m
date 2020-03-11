function start = poczatekruchu(emg, h, d)   %emg - sygna³, h - dlugosc przedzia³u, d - minimalna iloœæ elementów wiekszych ni¿ œrednia sygna³u
a = srkroczaca(emg, h);                        %pod a podstawiam œredni¹ krocz¹c¹ z parametrami emg i h
sr = mean(emg);                             %sr sredni sygnal
n = length(emg);
l_elementow = 0;                        %program zlicza liczbê elementów w œredniej krocz¹cej wiêkszych od œredniej ca³ego sygna³u, zaczynam zliczanie od 0
i = 1;                                   %przechodze po kolei po wszystkich elementach a od 1 do n
while l_elementow < d && i < n      %warunek na znalezienie pocz¹tku ruchu jest osi¹gniêcie przez licznik wartoœci wiêkszej ni¿ d podawane w argumencie funkcji
    if a(i) > sr                 %przyrownywanie kolejnych wartoœci a do œredniej sygna³u
        l_elementow = l_elementow + 1;  %je¿eli a(i) jest wiêksze od sr, to licznik zwiêksza siê o 1
    else l_elementow = 0;       % je¿eli a(i) opadnie poni¿ej sr, to licznik siê zeruje - to eliminuje zak³ócenia w sygnale
    end
    i = i + 1;
end
plot(a) 
hold on
plot(i, a(i), '^r')
start = i;
hold off
end