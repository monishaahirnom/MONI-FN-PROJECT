function la=lpcrf2la(rf)
%LPCRF2LA Convert reflection coefficients to log areas LA=(RF)
% areas are normalised to give la(p+2)=0, the log area of the free space beyond lips


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=max(min(rf,1-1E-6),1E-6-1);
lo=log((1-r)./(1+r));
la=fliplr([zeros(size(rf,1),1) cumsum(fliplr(log((1-r)./(1+r))).').']);

