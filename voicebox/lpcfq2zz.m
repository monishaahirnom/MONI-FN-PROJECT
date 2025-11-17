function zz=lpcfq2zz(f,q)
%LPCFQ2ZZ Convert frequencies and q factors to z-plane poles ZZ=(F,Q)
%all input values are in normalized Hz
% roots are at exp(2*pi*f*(-1/(2q) +- j)
% if f has more columns than q, remaining columns are real roots at -f

%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,pf]=size(f);
if nargin < 2
   pq=0;
else
   pq=size(q,2);
end;
zz=zeros(nf,pf+pq);
if pq
   ii=1:pq;
   zz(:,2*ii-1)=exp(pi*f(:,ii).*(2i-q.^(-1)));
   zz(:,2*ii)=conj(zz(:,2*ii-1));
end
if pf>pq
   ii=1+pq:pf;
   zz(:,ii+pq)= exp(-2*pi*f(:,ii));
end
