function [resX] = seidelSolve(H, g, amountOfSteps)

sz = size(H);
n = sz(1);

x = g;

for j = 2:amountOfSteps
    for i = 1:n
        x(i) = dot(H(i,:),x)+g(i);
    end;
end;

resX = x;

end