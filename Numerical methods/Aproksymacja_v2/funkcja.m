%function [ y ] = funkcja( x )
%n = length(x);

%for i=1:n
%    y(i) = 3.*(x(i).^2)+x(i).*2 +2;
%end

%end

function [ y ] = funkcja( x )
n = length(x);

for i=1:n
    y(i) = 4.*(x(i).^3)+2.*(x(i).^2)+x(i).*5 +3;
end

end



