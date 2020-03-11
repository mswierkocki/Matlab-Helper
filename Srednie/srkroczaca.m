function sr = srkroczaca(emg, h); %emg - sygna³, h - szerokoœæ przedzia³u
n = length(emg);
for i=1:h
    sr(i) = mean(emg(1:i)); %z ka¿dym obrotem pêtli zakres do œredniej zwiêksza sie o 1 a¿ do osiagniêæia za³o¿onego rozmiaru przedzia³u
end                             %pêtla koñczy siê na przedziale od 1 do h
for i=h+1:n
    sr(i) = mean(emg(i-h+1:i)); %pêtla zaczyna siê na przedziale od 2 do h+1, a konczy na n-h+1 do n
end
end
