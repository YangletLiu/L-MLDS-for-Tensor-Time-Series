
function mkronA = mkron(A)

if ~strcmp(class(A),'cell')
  mkronA = A;
elseif numel(A) == 1
  mkronA = A{1};
else
  M = numel(A);
  mkronA = kron(A{M}, mkron(subcell(A,1:M-1)));
end
