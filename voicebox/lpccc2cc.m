function c=lpccc2cc(cc,np)
%LPCCC2PF Extrapolate complex cepstrum C=(CC)

%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p=size(cc,2);
if nargin<2 np=p; end
if np<=p
   c=cc(:,1:np);
else
   c=lpcar2cc(lpccc2ar(cc),np);
end


