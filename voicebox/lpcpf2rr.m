function rr=lpcpf2rr(pf,p)
%LPCPF2RR convert power spectrum to autocorrelation coefs RR=(PF,P)
% Note that these will only be accurate if the power spectrum is much longer than p


%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p2]=size(pf);
if nargin<2 p=p2-2; end;
ir=irfft(pf,[],2);
if p>p2-2
  rr=[ir(:,1:p2-1) zeros(nf,p+2-p2)];
else
  rr=ir(:,1:p+1);
end
