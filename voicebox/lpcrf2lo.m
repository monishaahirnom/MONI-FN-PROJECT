function lo=lpcrf2lo(rf)
%LPCRF2LO Convert reflection coefficients to log area ratios LO=(RF)
%the output values are limited to about +-14.5


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=max(min(rf,1-1E-6),1E-6-1);
lo=log((1-r)./(1+r));

