function z = fun(x)
z=2.5.*(x(1).^2 - x(2)).^2 + (1 - x(1)).^2;
%z = 4.*(x(1)-5).^2 + 2.*x(1).*x(2) + 4.*(x(2)+5).^2 + 3.*x(1);
%z = -(cos((x(1)-2)/10).^2 + cos((x(2)+2)/10).^2).^2;
end