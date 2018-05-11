
function model = initialize_parameters(I, J)


  M = numel(J);
  I = reshape(I,1,M);
  J = reshape(J,1,M);
  prodI = prod(I);
  prodJ = prod(J);
  ItimesJ = I .* J;
  
  model.mu0 = vec2ten(randn(prodJ,1), J);
  	
  model.Q0 = mat2ten(eye(prodJ), [J J]);
  model.Q = mat2ten(eye(prodJ), [J J]);
  model.R = mat2ten(eye(prodI), [I I]);
  model.A = initialize_multilinear_operator(J,J);
  model.C = initialize_multilinear_operator(I,J);
end

%-----------------------------------------------------
function C = initialize_multilinear_operator(I, J)
  prodI = prod(I);
  prodJ = prod(J);
  M = numel(I);
  C = cell(M,1);
  for m = 1:M
    rC = randn(I(m));
    while rank(rC) < I(m)
      rC = randn(I(m));
    end
    [U S V] = svd(rC);
    C{m} = U(:,1:J(m));
  end
  if M == 1
    C = C{1};
  end
end
