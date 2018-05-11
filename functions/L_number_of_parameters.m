function p =L_number_of_parameters(X,I, J,Type)

  M = numel(I);
  I = reshape(I,1,M);
  J = reshape(J,1,M);
   p = count_covariance_parameters(X,J, Type.Q0) ...
    + count_covariance_parameters(X,J, Type.Q) ...
    + count_covariance_parameters(X,I, Type.R) ...
    + prod(size(X{1}))*sum(J .* J)/prod(size(X{1}(:,1))) + prod(size(X{1}))*sum(I .* J)/prod(size(X{1}(:,1)));
end

function p = count_covariance_parameters(X,I, Type)
  p = 0;
 switch Type
     case 'Diag' 
         p = p+prod(I);
     case 'Isotropic'
         p = p+1;
     case 'Full'
         p = prod(size(X{1}))*sum(I .* I)/prod(size(X{1}(:,1)));
 end
end