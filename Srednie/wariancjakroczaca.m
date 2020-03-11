function wariancja = wariancjakroczaca(emg, h) %emg - sygna³, h - szerokoœæ przedzia³u
a = sredniakroczaca(emg, h); %pod a podstawiam œredni¹ krocz¹c¹ z sygna³u emg o przedziale h
n = length(emg);
wariancja(1) = 0; % dla jednego elementyu wariancja jest równa 0
for i=2:h   %dlatego zaczynam od 2
    wariancja(i) = sum((emg(1:i)-a(i)).^2)/(i-1); %od ka¿dego elementu na przedziale 1:i odejmujê it¹ œredni¹ krocz¹c¹
end                                     % wszystkie elementy podnoszê do kwadratu i sumujê, a nastêpnie sumê dziele przez i-1
for i=h+1:n
    wariancja(i) = sum((emg(i-h+1:i)-a(i)).^2)/(h-1); %to samo co na górze na przedziale i-h+1:i
end
end