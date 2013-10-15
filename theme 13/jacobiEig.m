function [eigValues, eigVectors] = jacobiEig(A)

% эпсилон-ноль
eps = 1e-6;

% размерность
sz = size(A);
n = sz(1);

% будущая матрица из с.в.
X = eye(n);

[maxInColumns,I] = max(abs(A - tril(A)));
[maximum, j_k] = max(maxInColumns);
i_k = I(j_k);

while (abs(A(i_k, j_k))>eps)
    d = sqrt( (A(i_k, i_k) - A(j_k, j_k)).^2 + 4*A(i_k, j_k).^2 );
    cos = sqrt( 0.5 * (1 + abs(A(i_k, i_k) - A(j_k, j_k))/d));
    sg = sign( A(i_k, j_k)*(A(i_k, i_k) - A(j_k, j_k)));
    if sg == 0
        sg = 1;
    end;
    sin = sg * sqrt( 0.5 * (1 - abs(A(i_k, i_k) - A(j_k, j_k))/d));
    
    for i = 1:n

        if (i~=i_k)&&(i~=j_k)
            tmp_i = A(i, i_k);
            tmp_j = A(i, j_k);
            A(i, i_k) = cos*tmp_i + sin*tmp_j;
            A(i_k, i) = A(i, i_k);
            A(i, j_k) = -sin*tmp_i + cos*tmp_j;
            A(j_k, i) = A(i, j_k);
        end;
        
        xtmp_i = X(i, i_k);
        xtmp_j = X(i, j_k);
        X(i, i_k) = cos*xtmp_i + sin*xtmp_j;
        X(i, j_k) = -sin*xtmp_i + cos*xtmp_j;
        
    end;  
    
    tmp_i = A(i_k, i_k);
    tmp_j = A(j_k, j_k);
    tmp_ij = A(i_k, j_k);
    A(i_k, i_k) = cos.^2*tmp_i + 2*cos*sin*tmp_ij + sin.^2*tmp_j;
    A(j_k, j_k) = sin.^2*tmp_i - 2*cos*sin*tmp_ij + cos.^2*tmp_j;
    A(i_k, j_k) = (cos.^2-sin.^2)*tmp_ij + cos*sin*(tmp_j - tmp_i);
    A(j_k, i_k) = A(i_k, j_k);
        
    [maxInColumns,I] = max(abs(A - tril(A)));
    [maximum, j_k] = max(maxInColumns);
    i_k = I(j_k);
    
end;

eigValues = diag(A);
eigVectors = X;

end