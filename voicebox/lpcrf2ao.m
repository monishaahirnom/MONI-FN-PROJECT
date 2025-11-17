function ao=lpcrf2ao(rf)
%LPCRF2AO Convert reflection coefficients to area ratios AO=(RF)
% ao(k) is the ratio between the k'th and the (k+1)'th segment


% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ao =(1-rf)./(1+rf);

