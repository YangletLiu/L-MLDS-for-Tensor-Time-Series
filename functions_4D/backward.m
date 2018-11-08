function [Ez, Ezz, Ez1z] = backward(mu, V, P, model)

N = length(mu);
Ez = cell(1, N);
Ezz = cell(1, N);
Ez1z = cell(1, N);
Ez{N} = mu{N};
Vhat = V{N};
Ezz{N} = Vhat + Ez{N} * Ez{N}';

for i = (N-1): (-1) : 1
    J = V{i} * model.A' / P{i};
    Ez{i} = mu{i} + J * (Ez{i+1} - model.A * mu{i});
    Ez1z{i} = Vhat * J' + Ez{i+1} * Ez{i}';
    Vhat = V{i} + J * (Vhat - P{i}) * J';
    Ezz{i} = Vhat + Ez{i} * Ez{i}';
end

