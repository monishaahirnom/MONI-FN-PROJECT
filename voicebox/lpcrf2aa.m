function aa=lpcrf2aa(rf)
%LPCRF2AA Convert reflection coefficients to area function AA=(RF)
%The areas are normalised so that aa(p+2)=1: the effective area of the free air beyond the lips.
% aa(1) is the area of the glottis. This will be zero if rf(:,1)=1.


%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aa = fliplr(cumprod([ones(1,size(rf,1)); fliplr((1-rf)./(1+rf)).']).');

