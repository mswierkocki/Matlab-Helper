function ret = readword(a)
n = length(a);
i=1;
k=1;
while i <= n && (a(i) == ',' || a(i) == '.' || a(i) == ' ' || a(i) == '}' || a(i) == '{')
    i=i+1;
end
while i<=n
    j=1;
    temp = ' ';
    while i<=n && a(i) ~= ',' && a(i) ~= '.' &&  a(i) ~= ' ' && a(i) ~= '}' && a(i) ~= '{'
        temp(j) = a(i);
        j=j+1;
        i=i+1;
    end
    while i <= n && (a(i) == ',' || a(i) == '.' || a(i) == ' ' || a(i) == '}' || a(i) == '{')
        i=i+1;
    end
    ret(k) = cellstr(temp);
    k=k+1;
end