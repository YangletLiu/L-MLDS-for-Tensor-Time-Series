function C = Mydwt( X )
N=numel(X);
I=size(X{1});
for n=1:N
    for i=1:I(1)
        [a,b]=dwt(X{n}(i,:),'haar');
        C{n}(i,:)=[a,b];
    end
    
end

