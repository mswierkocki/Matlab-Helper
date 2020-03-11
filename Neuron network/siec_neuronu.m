function n=siec_neuronu(uczacy,w2) %wagi
[y,x] = size(uczacy);
for i=1:y
    wiersz=uczacy(i,:);
    wiersz2(1)=klasyfikator(wiersz,w2(1:3)); % wyjœcie pierwszego neuronu, 3 wagi
    wiersz2(2)=klasyfikator(wiersz,w2(4:6));
    wiersz2(3)=1; %jedno wejœcie zawsze jest aktywne
    n(i)=klasyfikator(wiersz2,w2(7:9));
end
end
 %wyrzuca klase