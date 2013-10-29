function [Lambda, V, iterCounter] = spEig(A, Y)

eps = 1e-6; % эпсилон
extraIters = 0; % дополнительные итерации
iterCounter = 1;

[yp, p] = max(abs(Y));

Y = Y/yp; 
Y1 = A*Y;
prevVal = dot(Y1,Y)/dot(Y,Y); %Lambda_0
Y = Y1/Y1(p); 
Y1 = A*Y;
nextVal = dot(Y1,Y)/dot(Y,Y); %Lambda_1
Y = Y1/Y1(p);

while (abs(nextVal - prevVal) > eps)||(extraIters > 0)
    % для увеличения точности прокрутим несколько дополнительных итераций
    if (abs(nextVal - prevVal) < eps) 
        extraIters = extraIters - 1;
    end;
    prevVal = nextVal;
    Y1 = A*Y;
    nextVal = dot(Y1,Y)/dot(Y,Y);
    Y = Y1/Y1(p);
    iterCounter = iterCounter + 1;
end;

Lambda = nextVal; %возвращаем с.ч.
V = Y/norm(Y); %возвращаем единичный с.в. 

end