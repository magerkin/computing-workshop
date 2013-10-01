function [H, g] = systemTransformation(A,b)

sz = size(A);
n = sz(1);

invD = eye(n);
for i = 1:n
    invD(i,i)=1/A(i,i);
end;

H = eye(n) - invD*A;
g = invD*b;

end
