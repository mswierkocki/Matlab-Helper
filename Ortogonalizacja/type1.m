N  = 5;
%E = 1*10.^-10;
E = 5;
o = zeros(N);
for i=1:N
    for j=1:N
        if(i==j) 
           o(i,j) = E;
        end
    end
   o(i,1) = 1
end

o