function pf=lpcra2pf(ra,np)
%LPCAR2PF Convert AR coefs to power spectrum PF=(RA,NP)
% The routine is faster if NP+1 is a power of 2
% For RA(:,p+1) the default value of np is p and the output is PF(:,p+2)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(ra);
if nargin<2 np=p1-1; end
pp=2*np+2;
if pp>=2*p1
   pf=abs(rfft([ra zeros(nf,pp-2*p1+1) ra(:,p1:-1:2)].').').^(-1);
else
   pf=abs(rfft([ra(:,1:np+2) ra(:,np+1:-1:2)].').').^(-1);
end   

