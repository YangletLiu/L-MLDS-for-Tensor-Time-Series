function p = number_of_parameters(I, J, Type)
M = numel(I);
  I = reshape(I,1,M);
  J = reshape(J,1,M);
  prodI = prod(I);
  prodJ = prod(J);
  p = count_covariance_parameters(J, Type.Q0) ...
    + count_covariance_parameters(J, Type.Q) ...
    + count_covariance_parameters(I, Type.R) ...
    + sum(J .* J) + sum(I .* J);
end



function p = count_covariance_parameters(I, Type)
  p = 0;
  switch Type
  case 'Isotropic'
    p = p + 1;
  case 'Diag'
    p = p + prod(I);
  case 'Full'
    p = p + prod(I)^2;
  end
end
