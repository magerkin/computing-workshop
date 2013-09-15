function [xans] = jordanSolve(A, b)

sz = size(A);
n = sz(1);
A = [A, b];
eps = 0.000001;


for k = 1:n
    tmp = A(k, k);
    
    if abs(tmp)<eps
        fprintf('%s %d %c %d %s %.9f %s %.9f \n', 'warning: element A[', k, ';', k, '] =', A(1,1), '< e =', eps);
    end;
    
    for j = k:(n+1)
        A(k, j) = A(k, j)/tmp;
    end;
    
    for i = 1:n
        tmp = A(i, k);
        if  i ~= k
            for j = k:(n+1)
                A(i, j) = A(i, j) - A(k, j)*tmp;
            end;
        end;    
    end;
end;    

xans = A(:, n+1);
end