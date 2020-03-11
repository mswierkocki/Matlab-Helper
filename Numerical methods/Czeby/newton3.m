function T = newton3(X, Y)
plot(X, Y, '*')
hold on
n = length(X);
a = zeros(n);
a(:, 1) = Y';
for i=2:n
    for j=i:n
        a(j, i) = (a(j, i-1) - a(j-1, i-1))/(X(j) - X(j-i+1));
    end
end
x = min(X):0.1:max(X);
T = a(1, 1);
b = x-X(1);
for i=2:n
    T = T + b*a(i, i);
    b = b.*(x-X(i));
end
plot(x, T)
end