function [estimation] = aprioriEst(H, g, amountOfSteps)

normH = norm(H, Inf);

estimation = normH.^amountOfSteps / (1-normH) * norm(g, Inf);

end