function u=gramaschmidta(v)
n=length(v);
u=zeros(size(v));
for i=1:n
      u(:,i)=v(:,i);
      for j=1:i-1
        u(:,i)=v(:,i)-proj(u(:,j),v(:,i));
      end
      u(:,i)=u(:,i)/sqrt(dot(u(:, i), u(:, i)));
end
for i=1:n
    for j=i:n
        dot(u(:, i), u(:, j))
    end
end
axis([-1 3 -1 3])
    if n == 2
axis ([-10 10 -10 10])
hold on
plot ([0 v(1, 1)], [0 v(2, 1)], 'Color', 'red')
plot ([0 v(2, 1)], [0 v(2, 2)], 'Color', 'red' )
plot ([0 u(1, 1)], [0 u(2, 1)])
plot ([0 u(1, 2)], [0 u(2, 2)])
    end
end
