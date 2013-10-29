function [Lambda, V, iterCounter] = wilandt(A, L0, Y0)

iterCounter = 1;

eps = 1e-3;

W = A - L0*eye(3);
Y = linsolve(W, Y0);
nextVal = Y(1)/Y0(1);
L = 1/nextVal + L0;

while (abs(L-L0)>eps)
    L0 = L;
    Y0 = Y;
    W = A - L0*eye(3);
    Y = linsolve(W, Y0);
    nextVal = Y(1)/Y0(1);
    L = 1/nextVal + L0;
    iterCounter = iterCounter + 1;
end

Lambda = L;
V = Y/norm(Y);

end