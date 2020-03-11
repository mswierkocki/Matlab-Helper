function y=aproksymacja2(a, b, n)
x=tabelka(a, b, n);
Y = x(2, :);
X = x(1, :);
plot(X, Y,'*')
hold on
A=ones(n, 2);
A(:,1)=X;
y=inv(A'*A)*A'*Y';
x=-10:1:10;
plot(x,y(1)*x+y(2))
hold off
end



