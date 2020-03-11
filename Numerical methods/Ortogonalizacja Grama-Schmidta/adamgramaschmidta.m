function u=adamgramaschmidta(v)
n=length(v);
u=zeros(size(v));
for i=1:n
      u(:,i)=v(:,i);
      for j=1:i-1
        u(:,i)=u(:,i)-proj(u(:,j),v(:,i));
      end
      u(:,i)=u(:,i)/sqrt(dot(u(:, i), u(:, i)));
end
end