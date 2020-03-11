function ret = classif(class, line)
ncl = str2num(char(class(:, 1)));
for i=1:length(line)
    if ncl(i) ~= 0
        for j=1:ncl(1)
            if strcmpi(line(i), class(i, j+1))
                ret(i) = j;
            end
        end
    else
        ret(i) = str2num(char(line(i)));
    end
end
end