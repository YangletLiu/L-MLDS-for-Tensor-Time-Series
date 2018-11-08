function [model] = learn_mlds(X,type, varargin)
I = size(X{1});
N = numel(X);
X = ten2vec(X);
M = numel(I);
if I(M) == 1
  M = M - 1;
  I = I(1:M);
end
J = set_optional_argument('J', I, varargin);
 fprintf('%d\n',J);
W = ten2vec(set_optional_argument('W', vec2ten(zeros(prod(I), N), I), varargin));
maxiter = set_optional_argument('MaxIter', 10, varargin);
epsilon = set_optional_argument('Epsilon', 1e-5, varargin);
Type = set_optional_argument('Type', type, varargin);
model = ten2vec(set_optional_argument('Model', initialize_parameters(I, J), varargin));

iter=0;
while ((iter < maxiter) && (~(isTiny(model.Q0) || isTiny(model.Q) || isTiny(model.R))))
  fprintf('The %d-th iteration...\n',iter+1)
  oldmodel = model;
  iter = iter + 1;
  elapsed_time = tic;
  [mu, V, P] = forward(X, model);
  [Ez, Ezz, Ez1z] = backward(mu, V, P, model);
  model = MLE_mlds(X, Ez, Ezz, Ez1z, model, Type);
end
model = vec2ten(model);
end

function [t] = isTiny(sigma)
  t = (norm(sigma, 1) < eps) || (any(diag(sigma) < eps));
end 
