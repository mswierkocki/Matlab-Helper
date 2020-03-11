function class = classification(file)
fid = fopen(file);
a = fgetl(fid);
a = fgetl(fid);
a = fgetl(fid);
h=0;
while ~strcmpi(a, '')
    h=h+1;
    i=1;
    while i<length(a) && a(i)~= '{'
        i=i+1;
    end
    k=1;
    if i<length(a)
        temp = readword(a(i:length(a)));
        n = length(temp);
        class(h, 1) = cellstr(num2str(n));
        class(h, 2:n+1) = temp;
    else
        class(h, 1) = cellstr('0');
    end
    a = fgetl(fid);
end
fclose(fid);
end
    