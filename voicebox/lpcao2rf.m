function rf=lpcao2rf(ao)
%LPCAO2RF LPC: Convert area ratios to reflection coefficients RF=(AO)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rf = (1-ao)./(1+ao);
