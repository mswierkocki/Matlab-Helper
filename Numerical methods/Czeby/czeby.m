function T=czeby(n)
x=(-1:0.01:1);
T=ones(1,length(x));
plot(x,T(1, :))
pause
hold on
T(2, :)=x;
plot(x,T(2, :))
pause
for k=3:n
T(k, :)=2*x.*T(k-1, :)-T(k-2, :);
plot(x,T(k,:))
pause
end
hold off