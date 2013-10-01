function  theme12(A,b, amountOfSteps)
%[gaussResult, H, g, normH, aprioriEstimation, iterResX, actualIterError, posterioriEst, lusternikX, ]
gaussResult = gaussSolve(A,b)

[H, g] = systemTransformation(A,b)

normH = norm(H, Inf)

aprioriEstimation = aprioriEst(H, g, amountOfSteps)

[iterResX, lusternikX, posterioriEst] = iterSolve(H, g, amountOfSteps);

iterResX
actualIterError = norm(gaussResult - iterResX, Inf)
posterioriEst

lusternikX
actualLusternikError = norm(gaussResult - lusternikX, Inf)

seidelResX = seidelSolve(H, g, amountOfSteps)
seidelActualError = norm(seidelResX - gaussResult, Inf)
[Hseid, gSeid, seidelSpectRadius] = seidelSpectralRadius(H, g)
[extSeidRes, extSeidActualError] = extSeid(Hseid, gSeid, gaussResult, amountOfSteps)

end
