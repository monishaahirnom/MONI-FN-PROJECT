function rr=lpcar2rr(ar,p)
%LPCAR2RR Convert autoregressive coefficients to autocorrelation coefficients RR=(AR,P)
% The routine calculated the autocorrelation coefficients of the signal
% that results from feeding unit-variance, zero-mean noise into the all-pole filter
% Input:   ar(:,n+1)  Autoregressive coefficients including 0'th coefficient
% Output:  rr(:,p+1)    Autocorrelation coefficients including 0'th order coefficient
% If p is not specified it is taken to be n


%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k=ar(:,1).^(-2);
if size(ar,2)==1
   rr=k;
else
   if nargin>1
      rr=lpcrf2rr(lpcar2rf(ar),p).*k(:,ones(1,p+1));
   else
      rr=lpcrf2rr(lpcar2rf(ar)).*k(:,ones(1,size(ar,2)));
   end
end
