function y=aproksymacja1
x=[0.1:0.1:10]';
[m,n]=size(x);
for i=1:m
    y(i,1)=i*0.1*rand(1,1);
end
plot(x,y,'*');
a=x/y;
plot(x,y,x,a*x);
end
