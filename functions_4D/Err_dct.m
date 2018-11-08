function error_dct = Err_dct( X,A,Ntrain)
     N=numel(X);
      for i = 1:(N-Ntrain)
        error_dct(i) =norm(X{Ntrain+i}-A{i},'fro')/norm(X{Ntrain+i},'fro');
      end
end

