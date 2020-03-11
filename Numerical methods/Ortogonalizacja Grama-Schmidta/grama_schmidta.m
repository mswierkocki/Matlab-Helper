function y=grama_schmidta(v)
n=length(v);
u=zeros(n);
u(:,1)=v(:,1);
for i=2:n
    u(:,i)=v(:,i);
    for j=1:i-1
        proj=(dot(u(:,j),v(:,i))/dot(u(:,j),u(:,j)))*u(:,j);
        u(:,i)= v(:,i)-proj;
    end
     u(:, i) = u(:, i)/sqrt(dot(u(:, i), u(:, i)));
end
if n==2
    plot([0 u(1, 1)], [0 u(2, 1)])
    hold on
    plot([0 u(1, 2)], [0 u(2, 2)])
    hold off
end
if n==3
    plot3([0 u(1, 1)], [0 u(2, 1)], [0 u(3, 1)])
    hold on
    plot3([0 u(1, 2)], [0 u(2, 2)], [0 u(3, 2)])
    plot3([0 u(1, 3)], [0 u(2, 3)], [0 u(3, 3)])
    hold off
end
for i=1:n
    for j=i:n
        dot(u(:, i), u(:, j))
    end
end
y=u;

end