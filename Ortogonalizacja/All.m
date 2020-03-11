
A = rand(4,4).*10;

o2 = orto2(A);
o1 = orto(A);

Max1 = 0;
Max2 = 0;
for i = 1:size(A,2)
    Max1 = max(norm(o1(i,:)),Max1)
    Max2 = max(norm(o2(i,:)),Max2)
end