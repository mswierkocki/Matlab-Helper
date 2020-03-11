function y=gaussa(A, b)
n = length(A);
for k=1:n-1;
    for i=k+1:n;
        l=A(i,k)/A(k,k);
        b(i)=b(i)-l*b(k);
        for j=k:n;
            A(i,j)=A(i,j)-l*A(k,j);
        end
    end
end
for k=1:n-1;
    for i=k+1:n;
        l=A(n+1-i,n+1-k)/A(n+1-k,n+1-k);
        b(n+1-i)=b(n+1-i)-l*b(n+1-k);
        for j=k:n;
            A(n+1-i,n+1-j)=A(n+1-i,n+1-j)-l*A(n+1-k,n+1-j);
        end
    end
end
for i=1:n;
    b(i)=b(i)/A(i,i);
end
y=b;
end