function y=aproksymacja
x=[0.1:0.1:10]';
[m,n]=size(x);
for i=1:m
    y(i,1)=(sin(0.05*i)+2*cos(0.08*i))*rand(1,1);
end
d=1;
for N=1:d:5
    figure(N)
    a=polyfit(x,y,N);
    ya(:,N/d)=polyval(a,x);
    plot(x,y,'*',x,ya);
end
end