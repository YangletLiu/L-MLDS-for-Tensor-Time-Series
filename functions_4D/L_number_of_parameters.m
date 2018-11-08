function p =L_number_of_parameters(X,I, J,Type)

  M = numel(I);
  K=size(X{1});
  I = reshape(I,1,M);
  J = reshape(J,1,M);
   p = count_covariance_parameters(X,J, Type.Q0) ...
    + count_covariance_parameters(X,J, Type.Q) ...
    + count_covariance_parameters(X,I, Type.R) ...
    + prod(K)*sum(J .* J)/K(1) + prod(K)*sum(I .* J)/K(1);
end

function p = count_covariance_parameters(X,I, Type)
K=size(X{1});
  p = 0;
 switch Type
     case 'Diag' 
         p = p+prod(I);
     case 'Isotropic'
         p = p+1;
     case 'Full'
         p = prod(K)*sum(I .* I)/K(1);
 end
end