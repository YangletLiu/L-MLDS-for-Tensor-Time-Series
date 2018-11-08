function Y=transpos(X)
    I=size(X{1});
    N=numel(X);
    for n=1:N
        for i=1:I(3)
            Y{n}(:,:,i)=X{n}(:,:,i)';
        end
    end
end