function [Lambda, V, iterCounter] = powEig(A, Y)

iterCounter =  1;
eps = 1e-3; % �������
extraIters = 0; % �������������� ��������

[yp, p] = max(abs(Y));

prevVal = Y(p);
Y = Y/yp;
Y = A*Y;
nextVal = Y(p);
Y = Y/Y(p);

while (abs(nextVal - prevVal) > eps)||(extraIters > 0)
    % ��� ���������� �������� ��������� ��������� �������������� ��������
    if (abs(nextVal - prevVal) < eps) 
        extraIters = extraIters - 1;
    end;
    prevVal = nextVal;
    Y = A*Y;
    nextVal = Y(p);
    Y = Y/Y(p);
    iterCounter = iterCounter + 1;
end;

Lambda = nextVal; %���������� �.�.
V = Y/norm(Y); %���������� ��������� �.�. 

end