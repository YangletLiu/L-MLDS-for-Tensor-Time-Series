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
