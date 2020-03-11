function n=blad_pojedynczy(w)
global uczacy;
[y, x] = size(uczacy);
for i=1:y
    klasy(i)=klasyfikator(uczacy(i,:),w); % dopisuje pokolei klasy (wektor poziomy )
end
n=sum((klasy' - uczacy(:, x)).^2); %kolumna
end