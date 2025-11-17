function ar=lpczz2ar(zz)
%LPCZZ2AR Convert z-place poles to ar coefficients AR=(ZZ)
% The complex poles must occur in complex conjugate pairs
% but the order is unimportant.


%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p]=size(zz);
ar=zeros(nf,p+1);
for k=1:nf
  ar(k,:)=real(poly(zz(k,:)));
end

