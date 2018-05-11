
function v = ten2vec(T)

switch class(T)
case 'double'
  v = vec(T);
case 'cell'
  p = prod(size(T{1}));
  N = numel(T);
  v = zeros(p, N);
  for n = 1:N
    v(:, n) = ten2vec(T{n});
  end
case 'struct'
  v.mu0 = ten2vec(T.mu0);
  v.Q0 = ten2mat(T.Q0);
  v.Q = ten2mat(T.Q);
  v.R = ten2mat(T.R);
  v.cellA = T.A;
  v.cellC = T.C;
  v.A = mkron(T.A);
  v.C = mkron(T.C);
end
