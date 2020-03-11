function sr = srkroczaca(emg, h); %emg - sygna�, h - szeroko�� przedzia�u
n = length(emg);
for i=1:h
    sr(i) = mean(emg(1:i)); %z ka�dym obrotem p�tli zakres do �redniej zwi�ksza sie o 1 a� do osiagni��ia za�o�onego rozmiaru przedzia�u
end                             %p�tla ko�czy si� na przedziale od 1 do h
for i=h+1:n
    sr(i) = mean(emg(i-h+1:i)); %p�tla zaczyna si� na przedziale od 2 do h+1, a konczy na n-h+1 do n
end
end
