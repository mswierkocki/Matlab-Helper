function y = df(x, dx)
x1 = x;
x1(dx) = x1(dx)+0.001;
y = (f(x1) - f(x))./(0.001);
end
function [ output_args ] = grad(fun, N,ef,el )
hold on;
%GRAD Summary of this function goes here
%   Detailed explanation goes here
xstart = [-0.5 1];
%syms x y
%[X,Y] = meshgrid(-5:.2:5,-5:.2:5);
%fun=2.5.*(x.^2 - y).^2 + (1 - x).^2;
%px=inline(diff(fun(X,Y),1));
%py=inline(diff(fun(X,Y),2));

xnew = xstart;
xold = xstart;

px = (diff(fun,'x'))
py = (diff(fun,'y'))
px=inline(px);
py=inline(py);
[X,Y] = meshgrid(-5:.2:5,-5:.2:5);
fun([1,2]);
Z = (fun(X,Y));
surface(X,Y,Z);
plot (xstart(1,1),xstart(1,2),'ro');
i = 1;
while i<N
    a = [px(xold(1)) py(xold(2))];
    xnew = xold-el.*a;
    if abs(fun(xnew(1),xnew(2))-fun(xold(1),old(2))<ef)
       break;
   % elseif abs(fun(baza(1),baza(2))-fun(xmin(1),xmin(2))<ef)
   %    break;
    end
    if fun(xnew(1),xnew(2)) >= fun(xold(1),xold(2))
        el=el/10;
        i=i-1;
    end
    i=i+1;
    plot(xnew,fun(xnew(1),xnew(2)),'g*');
end
display(xnew);
display(fun(xnew(1),xnew(2)));
hold off;
end

