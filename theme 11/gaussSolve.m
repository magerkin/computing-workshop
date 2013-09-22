function [xans] = gaussSolve(A, b)

sz = size(A);
n = sz(1);
eps = 0.000001;
ord = 1: n;

for k = 1:(n-1)
    [A, b, ord] = swap(A, b, n, ord, k);
end;

A = [A, b]; 

for k = 1:n
    tmp = A(k, k);
    
    if abs(tmp)<eps
        fprintf('%s %d %c %d %s %.9f %s %.9f \n', 'warning: element A[', k, ';', k, '] =', A(1,1), '< e =', eps);
    end;
    
    for j = (k+1):(n+1)
        A(k, j) = A(k, j)/tmp;
    end;
    
    for i = (k+1):n
        tmp = A(i, k);
        for j = (k+1):(n+1)
            A(i, j) = A(i, j) - A(k, j)*tmp;
        end;
    end;
end;    

x = zeros(n, 1);
y = zeros(n, 1);

for i = n: -1.0: 1
    prom = 0;
    for j = (i+1):n
        prom = prom + A(i,j)*x(j);
    end;
    x(i) = A(i,n+1) - prom;
end;

for i = 1:n
    y(ord(i)) = x(i);
end;

xans = y;
end