function [L1, V1, powDiscrepancy, Counter1, L2, V2, spDiscrepancy, Counter2, ...
    L1_opp, V1_opp, oppPowDiscrepancy, oppCounter1, LW, VW, wilDiscrepancy, wilCounter] = partProblem(A, Y, L0, oppY)

% степенной метод
[L1, V1, Counter1] = powEig(A, Y);
powDiscrepancy = A*V1 - V1*L1;


% метод скалярных произведений
[L2, V2, Counter2] = spEig(A, Y);
spDiscrepancy = A*V2 - V2*L2;

% обратный конец спектра степенным методом
B = A - L1*eye(3);
[L1_opp, V1_opp, oppCounter1] = powEig(B, oppY);
oppPowDiscrepancy = B*V1_opp - V1_opp*L1_opp;
L1_opp = L1 + L1_opp;

% Виландт
[LW, VW, wilCounter] = wilandt(A, L0, Y);
wilDiscrepancy = A*VW - LW*VW;


end