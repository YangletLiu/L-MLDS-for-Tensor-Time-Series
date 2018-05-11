function err = Err_dwt( X,J_lmlds,Ntrain,Type)
    N=numel(X);
    I=size(X{1});
    A = Mydwt( X );
    result = dwt_mlds(A,J_lmlds,Ntrain,Type);   
    C= inv_Mydwt( result );
    for i = 1:N-Ntrain
        for j=1:I(2)
            D{i}(:,j)=C{i}(:,j);
        end
        err(i) =norm(X{Ntrain+i}-D{i},'fro')/norm(X{Ntrain+i},'fro');
    end
end

