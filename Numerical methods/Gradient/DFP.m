function x = DFP(E, h)
%x = rand(2, 1)*20-10;
x = [-2.30761751261178; 1.65972765495348];
y = f(x);
x(:, 2) = x(:, 1) - h.*[df(x(:, 1), 1); df(x(:, 1), 2)];
y(2) = f(x(:, 2));
V = eye(2);
i=2;
while sum(abs(x(:, i) - x(:, i-1))) > E
    a = x(:, i) - x(:, i-1);
    s = [df(x(:, i), 1); df(x(:, i), 2)] - [df(x(:, i-1), 1); df(x(:, i-1), 2)];
    A = a*a'/(a'*s);
    B = -(V*s*s'*V)/(s'*V*s);
    V = V+A+B;
    d = -V*([df(x(:, i), 1); df(x(:, i), 2)]);
    x(:, i+1) = x(:, i) + h*d;
    i=i+1;
    y(i) = f(x(:, i));
end
q = x;
x = zeros(3, length(q));
x(1:2, :) = q;
x(3, :) = y;
end