addpath('functions');
% data
load tesla5_7
N = numel(X);
Ntrain =150;

% Setting the type of noise-----------------------------------------------

Type = struct('Q0','Full','Q','Full','R','Full');
I = size(X{1});
J = [4 2 3];
M = numel(I);
Ntest = N - Ntrain;

%preprocess the dataset to fit L-MLDS well--------------------------------
XX=transpos(X);
%compute J----------------------------------------------------------------
for i = 1:I(2)
  sizes(i) = L_number_of_parameters(XX,I(2), i,Type);
end
J_lmlds = find(sizes >= number_of_parameters(I, J,Type),1);
if isempty(J_lmlds)
    J_lmlds=I(2);
end
%dct-MLDS-----------------------------------------------------------------
result_dct= dct_mlds(XX,J_lmlds,Ntrain,Type);


% MLDS--------------------------------------------------------------------

disp('Fitting MLDS with matching number of parameters...')
J_mlds = prod(J);
model_mlds = learn_mlds(subcell(X, 1:Ntrain),Type, 'J', J);
Result_mlds=ten_form(X,result_mlds);



% plot results------------------------------------------------------------
disp('Plotting results...')


%% Prediction value
figure(1)

real_mlds=zeros(1,Ntest);
real_dct=zeros(1,Ntest);
real=zeros(1,Ntest);

for i=1:Ntest
    real_dct(i)  = result_dct{i}(1,6,3);
    real(i)      = X{i+Ntrain}(6,1,3); 
end
subplot(1,1,1);
hold on;
T = [1:Ntest]+Ntrain; 

plot(T, real_mlds, 'Color', 'black');
plot(T, real_dct, 'Color', 'red');
plot(T, real, 'Color', 'cyan');
hold off;
legend('MLDS','dct-MLDS','real');
xlim([1 Ntest] + Ntrain);
xlabel('Time slice');
ylabel('Price');
