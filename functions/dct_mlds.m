function [result,model_dct] = dct_mlds(Y,J_lmlds,Ntrain,Type)
    I=size(Y{1});
    N=numel(Y);
    for k=1:N
        for p=1:I(1)
            A{k}(p,:)=dct(Y{k}(p,:));
        end    
    end
    Ntest=N-Ntrain;
    for l=1:prod(I)/I(1)
        Q{l}=cell(I(1),1);
    end
    for l=1:prod(I)/I(1)
        for k=1:N
            Q{l}{k}=A{k}(:,l);
        end
    end
    fprintf('Fitting the the parameters for dct-MLDS...\n\n')
    for l=1:prod(I)/I(1)
        fprintf('\n The %d-th subsystem \n',l)
        [model_dct{l}] = learn_mlds(subcell(Q{l}, 1:Ntrain),Type, 'J',J_lmlds );
        A_lds{l} = Generator(Q{l}, Ntrain, model_dct{l});
    end
    for j=1:Ntest
        for l=1:prod(I)/I(1)
            result{j}(:,l)=A_lds{l}(:,j);
        end       
        for p=1:I(1)
            result{j}(p,:)=idct(result{j}(p,:));
        end
    end 
 end

