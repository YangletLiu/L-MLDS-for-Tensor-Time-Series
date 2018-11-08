
function T = vec2ten(v, varargin)

switch class(v)
case {'double' 'logical'}
  I = varargin{1};
  if numel(v) == prod(I)
    T = zeros([I 1]);
    T(:) = v;
  else
    N = size(v,2);
    T = cell(N,1);
    for n = 1:N
      T{n} = vec2ten(v(:,n), I);
    end
  end
case 'struct'
  switch class(v.cellA)
  case 'double'
    I = size(v.cellC,1);
    J = size(v.cellC,2);
  case 'cell'
    M = numel(v.cellA);
    I = zeros(1,M);
    J = zeros(1,M);
    for m = 1:M
      I(m) = size(v.cellC{m},1);
      J(m) = size(v.cellC{m},2);
    end
  end
  T.mu0 = vec2ten(v.mu0, J);
  T.Q0 = mat2ten(v.Q0, [J J]);
  T.Q = mat2ten(v.Q, [J J]);
  T.R = mat2ten(v.R, [I I]);
  T.A = v.cellA;
  T.C = v.cellC;
end
