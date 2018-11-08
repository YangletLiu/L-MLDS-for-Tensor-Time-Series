# L-MLDS-for-Tensor-Time-Series
L-MDS modeling;  Tensor time series prediction

The folder named 'data' contains the datasets.

The folder named 'functions' contains all functions we need.

%----------------------------------------------------------

Running the files named-

	sst_diag,
	
	sst_full,
	
	Video_diag, 
	
	Video_full,
	
	nasdaq100_diag, 
	
	nasdaq100_full,
	
	Tesla_diag, 
	
	Tesla_full
	
to verify the results in paper.

All the experiment parameters are set as described in the paper.

%----------------------------------------------------------

Experimental results are shown as prediction errors and prediction values.

The prediction errors are shown in figure 1.

The prediction values are shown in figure 2.

The prediction values for all datasets are saved as:

    Result_lds.mat---------by LDS
	Result_mlds.mat--------by MLDS
	result_dct.mat---------by dct-MLDS
	result_dft.mat---------by dft-MLDS
	result_dwt.mat---------by dwt-MLDS
	
for checking.

%-----------------------------------------------------------

How to check a specific value in prediction result?

Ans: If one wants to check a specific value in the output tensor series, please modify the tensor subscript in the following program (which is used to draw the prediction trend in each matlab file described above):

%% Prediction value------------------------------------------------------------

figure(2)

real_lds=zeros(1,Ntest);

real_mlds=zeros(1,Ntest);

real_dct=zeros(1,Ntest);

real_dwt=zeros(1,Ntest);

real_dft=zeros(1,Ntest);

real=zeros(1,Ntest);

for i=1:Ntest

    real_lds(i)  = Result_lds{i}(1,2);               % modify the subscript here
    real_mlds(i) = Result_mlds{i}(1,2);              % modify the subscript here
    real_dct(i)  = result_dct{i}(1,2);               % modify the subscript here
    real_dwt(i)  = result_dwt{i}(1,2);               % modify the subscript here
    real_dft(i)  = result_dft{i}(1,2);               % modify the subscript here
    real(i)      = X{i+Ntrain}(1,2);                 % modify the subscript here
end

%% ------------------------------------------------------------------------------

We provide the 4D L-MLDS model with discrete cosine transform.

Run test_4D.m to check the prediction results.

The results are shown as prediction trends in Figure(1), to check different stocks please do as described above.
