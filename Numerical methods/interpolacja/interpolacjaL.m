function [t,L] = interpolacjaL(n,a,b);


t=a:(b-a)/100:b;
X=ones(size(t));
wezel=a:(b-a)/n:b;
l=ones(length(t),n);
L=zeros(size(l(:,1)));
for i=1:n;
    for j=1:i-1;
        x1=wezel(j);x2=wezel(i);
        l(:,i)=l(:,i).*(t'-x1*X')/(x2-x1);
    end
    for k=i+1:n;
        x1=wezel(k);x2=wezel(i);
        l(:,i)=l(:,i).*(t'-X'*x1)/(x2-x1);
    end
    L=L+l(:,i)*f(wezel(i));
end

%plot(t,L);


end