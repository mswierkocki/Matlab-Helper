function [z] = splajne(x,y,G);
n=length(x);
plot(y,G,'+')
hold on

for i=1:n-1
 h(i)=x(i+1)-x(i);
 qy(i)=(1/h(i))*(y(i+1)-y(i));
 qg(i)=(1/h(i))*(G(i+1)-G(i));
end

u=0;
v=0;
for i=2:n-1
    u(i)=2*(h(1,i-1)+h(1,i));
    vy(i)=6*(qy(1,i)-qy(1,i-1));
    vg(i)=6*(qg(1,i)-qg(1,i-1))
end
vy(n)=0;
vg(n)=0;

dodatkowa = zeros(n);
dodatkowa(1,1) = 1;
dodatkowa(n,n) = 1;
for i=2:n-1
    dodatkowa(i,i-1)=h(i-1);
    dodatkowa(i,i)=u(i);
    dodatkowa(i,i+1)=h(i);
end
zy=gaussa(dodatkowa,vy);
zg=gaussa(dodatkowa,vg);
for i=1:n-1
 Ay(i)=((1/6/h(i))*(zy(i+1)-zy(i)));
 By(i)=(zy(i)/2);
 Cy(i)=((-1)*(h(i)/3)*zy(i))-(h(i)/6)*(zy(i+1))+(1/h(1,i))*(y(i+1)-y(i));
 Dy(i)=y(1,i);
 
 Ag(i)=((1/6/h(i))*(zg(i+1)-zg(i)));
 Bg(i)=(zg(i)/2);
 Cg(i)=((-1)*(h(i)/3)*zg(i))-(h(i)/6)*(zg(i+1))+(1/h(i))*(G(i+1)-G(i));
 Dg(i)=G(i);
end

for i=1:n-1
 X = min(x(1,i),x(1,i+1)):0.01:max(x(1,i),x(1,i+1));
 Y = Ay(i)*(X-x(i)).^3 + By(i)*(X-x(i)).^2 + Cy(i)*(X-x(i)) + Dy(i);
 g = Ag(i)*(X-x(i)).^3 + Bg(i)*(X-x(i)).^2 + Cg(i)*(X-x(i)) + Dg(i);
 plot(Y,g)
end
hold off;
end