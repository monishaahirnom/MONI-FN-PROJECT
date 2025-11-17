function pf=lpcff2pf(ff)
%LPCFF2PF Convert complex spectrum to power spectrum PF=(FF)


%   .
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pf=abs(ff).^2;
