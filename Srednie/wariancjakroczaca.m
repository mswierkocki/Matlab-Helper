function wariancja = wariancjakroczaca(emg, h) %emg - sygna�, h - szeroko�� przedzia�u
a = sredniakroczaca(emg, h); %pod a podstawiam �redni� krocz�c� z sygna�u emg o przedziale h
n = length(emg);
wariancja(1) = 0; % dla jednego elementyu wariancja jest r�wna 0
for i=2:h   %dlatego zaczynam od 2
    wariancja(i) = sum((emg(1:i)-a(i)).^2)/(i-1); %od ka�dego elementu na przedziale 1:i odejmuj� it� �redni� krocz�c�
end                                     % wszystkie elementy podnosz� do kwadratu i sumuj�, a nast�pnie sum� dziele przez i-1
for i=h+1:n
    wariancja(i) = sum((emg(i-h+1:i)-a(i)).^2)/(h-1); %to samo co na g�rze na przedziale i-h+1:i
end
end