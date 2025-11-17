function [m,c]=cep2pow(u,v,mode)
%CEP2POW convert cepstral means and variances to the power domain
% Inputs:
%    u: vector giving the cepstral means with u(1) the 0'th cepstral coefficient
%    v: cepstral covariance matrix or else a vector containing the diagonal elements 
% mode: 'c'  pow=exp(irdct(cep))    [default]
%       'f'  pow=exp(rsfft(cep)/n)  [fft length even]
%       'fo' pow=exp(rsfft(cep)/n)  [fft length odd]
%       'i'  pow=exp(cep)           [ no transformation ]
%
% Outputs:
%    m: row vector giving means in the power domain
%    c: covariance matrix in the power domain

%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<3 mode='c'; end
if min(size(v))==1
   v=diag(v);
end
u=u(:)';    % force u to be a row vector
if any(mode=='f')
   n=2*length(u)-2;
   if any(mode=='o')
      n=n+1;
   end
   p=rsfft(u',n)/n;
   q=rsfft(rsfft(v,n)',n)/n^2;
elseif any(mode=='i')
    p=u';
    q=v';
else
   p=irdct(u');
   q=irdct(irdct(v)');
end
m=exp(p+0.5*diag(q))';
c=(m'*m).*(exp(q)-1);