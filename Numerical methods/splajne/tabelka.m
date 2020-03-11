function y = tabelka(a,b,n)
y(1, :)=rand(1, n)*20-10;
y(1, :)=sort(y(1, :));
y(2, :)=a*y(1, :)+rand(1, n)*20-10+b;

end