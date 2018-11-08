function D = dwt_mlds( X,J_lmlds,Ntrain,Type)
    N=numel(X);
    A = Mydwt(X);
%%
    I=size(A{1});
    N=numel(A);
    Ntest=N-Ntrain;
    for l=1:prod(I)/I(1)
        Q{l}=cell(I(1),1);
    end
    for l=1:prod(I)/I(1)
        for k=1:N
            Q{l}{k}=A{k}(:,l);
        end
    end
    fprintf('Fitting the the parameters for dwt-MLDS...\n\n')
    for l=1:prod(I)/I(1)
         fprintf('\n The %d-th subsystem \n',l)
        [model_dwt{l}] = learn_mlds(subcell(Q{l}, 1:Ntrain),Type, 'J',J_lmlds );
        A_lds{l} = Generator(Q{l}, Ntrain, model_dwt{l});
    end
    for j=1:Ntest
        for l=1:prod(I)/I(1)
            result{j}(:,l)=A_lds{l}(:,j);
        end   
    end 
%%
    C=inv_Mydwt(result);
    I=size(X{1});
    for i = 1:Ntest
        for j=1:I(2)
            D{i}(:,j)=C{i}(:,j);
        end
    end
end

