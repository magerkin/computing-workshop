function [Hseid, gSeid, spectRad] = seidelSpectralRadius(H, g)

sz = size(H);
n = sz(1);

HL = zeros(n);
HR = zeros(n);

for i = 1:n
    for j = 1:n
        if (i<j)
            HL(i,j) = H(i,j);
        else
            HR(i,j) = H(i,j);
        end;
    end;
end;

E = eye(n);
InvExt = E/(E - HL);
Hseid = InvExt * HR;
gSeid = InvExt * g;
spectRad = max(eig(abs(Hseid)));

end