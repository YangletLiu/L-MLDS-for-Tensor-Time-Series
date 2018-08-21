function [Est] = Estimate(X, model, varargin)

N = size(X, 2);
M = size(X, 1);
H = size(model.A, 1); %dimension of hidden variable
Ih = eye(H, H);
Est=zeros(size(X));

%predicted mean for hidden variable z
mu = cell(1, N);
V = cell(1, N);
P = cell(1, N);

% initialize
mu{1} = model.mu0;
V{1} = model.Q0;

FAST = false;
a = strcmp('Fast', varargin);
if (any(a))
    FAST = true;
    invR = inv(model.R);
    invRC = invR * model.C;
    invCRC = model.C' * invRC;
end

for i = 1:N
  if (i == 1)
    KP = model.Q0;    
    mu{i} =  model.mu0;
  else 
    P{i-1} = model.A * V{i-1} * model.A' + model.Q;
    KP = P{i-1};
    mu{i} =  model.A * mu{i-1};
  end
  if (FAST)
    invSig = invR - invRC / (inv(KP) + invCRC) * invRC';    
%     invSig = invR - invRC * ((inv(KP) + invCRC) \ invRC');    
  else
    sigma_c = model.C * KP * model.C' + model.R;
    invSig = pinv(sigma_c);
    %invSig = inv(sigma_c);
  end
  K = KP * model.C' * invSig;
  Est(:,i)= model.C * mu{i};
  delta = X(:, i) - Est(:,i);
  mu{i} = mu{i} + K * delta;
  V{i} = (Ih - K * model.C) * KP; 
end
