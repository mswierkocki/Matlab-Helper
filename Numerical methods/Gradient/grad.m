function [ output_args ] = grad(N,ef,el )
hold on;
%GRAD Summary of this function goes here
%   Detailed explanation goes here
xstart = [-0.5 1];
f=inline('2.5.*(X.^2 - Y).^2 + (1 - X).^2');
%px=inline(diff(fun(X,Y),1));
%py=inline(diff(fun(X,Y),2));
[X,Y] = meshgrid(-5:.2:5,-5:.2:5);
Z = f(X,Y);
surface(X,Y,Z);
syms x y

fun=2.5.*(x.^2 - y).^2 + (1 - x).^2;
%px=inline(diff(fun(X,Y),1));
%py=inline(diff(fun(X,Y),2));

xnew = xstart;
xold = xstart;

px = (diff(fun,'x'))
py = (diff(fun,'y'))
px=inline(px);
py=inline(py);
[X,Y] = meshgrid(-5:.2:5,-5:.2:5);

%Z = (fun(X,Y));
%surface(X,Y,Z);
plot (xstart(1,1),xstart(1,2),'ro');
i = 1;
while i<N
    a = [px(xold(1),xold(2)) py(xold(1),xold(2))];
    xnew = xold-el.*a;
    if abs(f(xnew(1),xnew(2))-f(xold(1),xold(2))<=ef)
        display(i);
        display(f(xnew(1),xnew(2)));
        display(f(xold(1),xold(2)));
        break;
   % elseif abs(fun(baza(1),baza(2))-fun(xmin(1),xmin(2))<ef)
   %    break;
    end
    if f(xnew(1),xnew(2)) >= f(xold(1),xold(2))
        el=el/10;
        display('dafck');
        i=i-1;
    end
    i=i+1;
    plot(xnew,f(xnew(1),xnew(2)),'g*');
end
display(xnew);
display(f(xnew(1),xnew(2)));
hold off;
end

