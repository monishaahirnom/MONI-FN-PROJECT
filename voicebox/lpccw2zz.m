function zz=lpccw2zz(cw)
%LPCPZ2ZZ LPC: Power spectrum roots to LPC poles ZZ=(CW)
% pz are the roots of the power spectrum polynomial pp(cos(w))

%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

zs=sqrt(cw.^2-1);
zz=cw-sign(real(conj(cw).*zs)).*zs;
