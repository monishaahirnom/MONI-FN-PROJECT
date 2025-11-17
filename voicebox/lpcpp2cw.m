function cw=lpcpp2cw(pp)
%LPCPP2PZ LPC: Convert power spectrum polynomial in cos(w) to power spectrum zeros CW=(RP)
% pp is a polynomial such that |polyval(ra,e^jw)| = polyval(pp,cos(w))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(pp);
cw=zeros(nf,p1-1);
for k=1:nf
   cw(k,:)=roots(pp(k,:)).';
end

