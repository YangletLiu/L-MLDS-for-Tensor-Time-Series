function Y=ten_form(X,V)
    I=size(X{1});
    J=size(V);
    for i=1:J(2)
        Y{i}=reshape(V(:,i),I);
    end
end