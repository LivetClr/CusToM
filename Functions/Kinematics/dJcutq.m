function [Jcutq] = dJcutq(Jcutcut,Jcutq)
% Computation of the Jacobian matrix Jcutq
%
%   INPUT
%   - Jcutcut: evaluation of the partial Jacobian matrix Jcutcut
%   - Jcutq: evaluation of the partial Jacobian matrix Jcutq
%   OUTPUT
%   - Jcutq: evaluation of the Jacobian matrix Jcutq
%________________________________________________________
%
% Licence
% Toolbox distributed under 3-Clause BSD License
%________________________________________________________

for i=2:size(Jcutcut,1)
    Jcutq(i,:) = Jcutq(i,:) + Jcutcut(i,1:i-1)*Jcutq(1:i-1,:);
end

end