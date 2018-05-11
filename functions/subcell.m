
function subC = subcell(C, I)

subC = cell(size(I));
for i = 1:numel(I)
  subC{i} = C{I(i)};
end
