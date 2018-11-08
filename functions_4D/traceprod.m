
function y = traceprod(A, B, option)

  if strcmp(option, 'Isotropic')
    y = A*trace(B);
  elseif strcmp(option, 'Diag')
    y = A'*diag(B);
  elseif strcmp(option, 'Full')
    y = trace(A*B);
  end
end
