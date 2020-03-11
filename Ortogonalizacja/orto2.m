function [ out ] = orto2( A )

n=size(A)
n = n(1)

for i=1:n
    for j=1:(i-1)
        suma=dot(A(i,:),A(j,:));
        A(i,:)=A(i,:)-suma*A(j,:);
    end
    A(i,:)=A(i,:)/norm(A(i,:));
end

out=A;

end

