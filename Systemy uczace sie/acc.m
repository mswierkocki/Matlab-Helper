function [x] = acc(X, zasada) %X - zbiór danych, zasada -zasada do przetestowania, dzia³a tak samp jak supp, poza ostatnimi linijkami

[n, m] = size(X);
x = zeros(1, length(unique(X(:, m)))); 
for i=1:n
    q = 1;
    for j=1:m-1
        q = q * sum(X(i, j) == zasada(:, j));  
    end
    if q
        x(X(i, m)) = x(X(i, m)) + 1;            
    end
end
x = x/sum(x);
x = x(zasada(1, m));                      
end