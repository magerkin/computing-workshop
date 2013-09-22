function [newA, newb, ordx] = swap(A, b, n, ord, k)


% поиск максимума    
Ak = A(k:n,k:n);
[maxFromColumns, indOfRows] = max(abs(Ak));
%indOfRows = indOfRows + (k-1);
[maxElement, indOfColumn] = max(maxFromColumns);
%indOfColumn = indOfColumn + (k-1);
ind = [indOfRows(indOfColumn), indOfColumn];
ind = ind + (k-1);

% перестановка строк
extRow = A(ind(1), :);
A(ind(1), :) = A(k, :);
A(k, :) = extRow;
extb = b(ind(1));
b(ind(1)) = b(k);
b(k) = extb;

% перестановка столбцов
extCol = A(:, ind(2));
A(:, ind(2)) = A(:, k);
A(:, k) = extCol;
extNum = ord(ind(2));
ord(ind(2)) = ord(k);
ord(k) = extNum;


newA = A;
ordx = ord;
newb = b;
    
end