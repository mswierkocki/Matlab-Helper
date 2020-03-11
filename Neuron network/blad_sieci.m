function n=blad_sieci(w)
global uczacy;
[y, x] = size(uczacy);
klasy=siec(uczacy,w);
n=sum((klasy' - uczacy(:, x)).^2); %kolumna
end