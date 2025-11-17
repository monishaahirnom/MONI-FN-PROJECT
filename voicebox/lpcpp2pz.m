function pz=lpcpp2pz(pp)
%LPCPP2PZ LPC: Convert power spectrum polynomial in cos(w) to power spectrum zeros PZ=(RP)
% pp is a polynomial such that |polyval(ra,e^jw)| = polyval(pp,cos(w))

%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pz=roots(pp);
