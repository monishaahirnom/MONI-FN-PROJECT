function rf=lpcla2rf(la)
%LPCLA2RF Convert log areas to reflection coefficients RF=(LA)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p2]=size(la);
rf=-tanh((la(:,1:p2-1)-la(:,2:p2))/2);

