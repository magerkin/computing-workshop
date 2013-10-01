function [resX, lusternikX, posterioriEst] = iterSolve(H, g, amountOfSteps)

% предполагаетс€, что начальное приближение x0 = 0
x = g;

for i = 2:amountOfSteps
    prevX = x;
    x = H*x + g;
end;

spectralRadius = max(abs(eig(H)));

resX = x;
lusternikX = prevX + 1 / (1 - spectralRadius) * (x - prevX);
normH = norm(H, Inf);
posterioriEst = normH / (1 - normH) * norm(x-prevX, Inf);

end