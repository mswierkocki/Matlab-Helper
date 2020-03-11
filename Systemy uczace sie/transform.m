function [A] = transform(file)
class = classification(file);
fid = fopen(file);
a = fgetl(fid);
while ~strcmpi(a, '@data')
    a = fgetl(fid);
end
i=1;
while ~feof(fid)
    a = fgetl(fid);
    line = readword(a);
    A(i, :) = classif(class, line);
    i=i+1;
end
