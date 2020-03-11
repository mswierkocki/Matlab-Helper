function [ out ] = orto( U )
s=size(U);
wynik=zeros(s);
wynik(1,:)=U(1,:);

for i=1:s
    wynik(i,:)=U(i,:);
    for j=1:(i-1)
        wynik(i,:)=wynik(i,:)-proj(U(i,:),wynik(j,:));
    end
    
end

for i=1:s
out(i,:) = wynik(i,:)/norm(wynik(i,:))
end

end

function wekt=proj(U,B)
wekt=(dot(U,B)/dot(B,B))*B;
end


