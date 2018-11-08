function D = err(X, Ntrain, XEst)
    Ntest=numel(X)-Ntrain;
    X=ten2vec(X);
    for i = 1:Ntest
        D(i) = norm(X(:,i+Ntrain)-XEst(:,i),'fro')/norm(X(:,i+Ntrain),'fro');
    end
end
