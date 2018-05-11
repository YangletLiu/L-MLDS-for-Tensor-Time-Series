function X = inv_Mydwt( C )
    N=numel(C);
    I=size(C{1});
for n=1:N  
    for i=1:I(1)
        X{n}(i,:)=idwt(C{n}(i,1:I(2)/2),C{n}(i,I(2)/2+1:I(2)),'haar');
    end    
end
