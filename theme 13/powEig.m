function [Lambda, V, iterCounter] = powEig(A, Y)

iterCounter =  1;
eps = 1e-3; % эпсилон
extraIters = 0; % дополнительные итерации

[yp, p] = max(abs(Y));

prevVal = Y(p);
Y = Y/yp;
Y = A*Y;
nextVal = Y(p);
Y = Y/Y(p);

while (abs(nextVal - prevVal) > eps)||(extraIters > 0)
    % для увеличения точности прокрутим несколько дополнительных итераций
    if (abs(nextVal - prevVal) < eps) 
        extraIters = extraIters - 1;
    end;
    prevVal = nextVal;
    Y = A*Y;
    nextVal = Y(p);
    Y = Y/Y(p);
    iterCounter = iterCounter + 1;
end;

Lambda = nextVal; %возвращаем с.ч.
V = Y/norm(Y); %возвращаем единичный с.в. 

end