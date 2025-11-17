function zz=lpcpz2zz(pz)
%LPCPZ2ZZ LPC: Power spectrum roots to LPC poles ZZ=(PZ)
% pz are the roots of the power spectrum polynomial pp(cos(w))

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

zs=sqrt(pz.^2-1);
zz=pz-sign(real(conj(pz).*zs)).*zs;
