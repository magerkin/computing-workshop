function [result, actualError] = extSeid(H,g, gaussResult, amountOfSteps)

result = iterSolve(H, g, amountOfSteps);

actualError = norm(gaussResult - result, Inf);

end