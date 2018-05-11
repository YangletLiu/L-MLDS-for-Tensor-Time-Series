
function D = err(X, Ntrain, model)

N = numel(X);
I = size(X{1});
J = size(model.mu0);
p = prod(I);
M = numel(I);
if I(M) == 1
  M = M - 1;
  I = I(1:M);
end
J = J(1:M);
q = prod(J);
X = ten2vec(X);
Ntest = N - Ntrain;
model = ten2vec(model);
Xtrain = X(:,1:Ntrain);
Xtest = X(:,[1:Ntest]+Ntrain);

% estimate
[mu V P ] = forward(Xtrain, model);
[Ez Ezz Ez1z] = backward(mu, V, P, model);
model.mu0 = model.A*Ez{Ntrain};
[ZEst ZZEst P] = forward(Xtest, model);
XEst = zeros(p,Ntest);
for i = 1:Ntest
  XEst(:,i) = model.C*ZEst{i};
end

% error
D = zeros(Ntest,1);
for i = 1:Ntest
  D(i) = norm(X(:,i+Ntrain)-XEst(:,i),'fro')/norm(X(:,i+Ntrain),'fro');
end
