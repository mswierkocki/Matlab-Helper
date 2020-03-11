function y=aproksymacja(X,Y)

N=length(X);
x=X';
y=Y';

Z=ones(N);
Z=Z(:,1);

A=[x Z];

Wynikynik=inv(A'*A)*A'*y;
x=(X(1)-1):0.1:(X(length(X))+1);
a=Wynikynik(1,1);

hold on;
%Punkty
for i=1:N
    plot(X(i),y(i),'r*');
end
plot(x,a.*x+Wynikynik(2,1));
hold off;
end