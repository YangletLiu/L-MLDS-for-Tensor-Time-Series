
function A = ten2mat(T)

I = size(T);
M = numel(I);
if mod(M,2) == 1
  M = M + 1;
  I(M) = 1;
end
A = zeros(prod(I(1:(M/2))), prod(I([1:(M/2)]+(M/2))));
A(:) = T(:);
