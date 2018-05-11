function result = dft_mlds(X,J_lmlds,Ntrain,Type)
    I=size(X{1});
    N=numel(X);
    for k=1:N
        for p=1:I(1)
            A{k}(p,:)=fft(X{k}(p,:));
        end
    end
    Ntest=N-Ntrain;
    for l=1:prod(I)/I(1)
        Q1{l}=cell(I(1),1);
        Q2{l}=cell(I(1),1);
    end
    for l=1:prod(I)/I(1)
        for k=1:N
            Q1{l}{k}=real(A{k}(:,l));
            Q2{l}{k}=imag(A{k}(:,l));
        end
    end
    fprintf('Fitting the the parameters for dft-MLDS...\n\n')
    for l=1:prod(I)/I(1)
         fprintf('\n The %d-th subsystem \n',l)
        [model_dft1{l}] = learn_mlds(subcell(Q1{l}, 1:Ntrain),Type, 'J',J_lmlds );
        %[model_dft2{l}] = learn_mlds(subcell(Q2{l}, 1:Ntrain), 'J',J_lmlds );
        A1_lds{l} = Generator(Q1{l}, Ntrain, model_dft1{l});
        A2_lds{l} = Generator(Q2{l}, Ntrain, model_dft1{l});
    end
    for j=1:Ntest
        for l=1:prod(I)/I(1)
            result1{j}(:,l)=A1_lds{l}(:,j);
            result2{j}(:,l)=A2_lds{l}(:,j);
            result{j}(:,l)=result1{j}(:,l)+i*result2{j}(:,l)
        end 
        for p=1:I(1)
            result{j}(p,:)=ifft(result{j}(p,:));
        end
    end 
 end

