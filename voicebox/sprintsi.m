function s=sprintsi(x,d,w)
%SPRINTSI Print X with SI multiplier S=(X,D,W)
% D is number of decimal places (+ve) or significant digits (-ve) [default=-3]
% |W| is total width including multiplier
% if W<=0 then trailing 0's will be eliminated
%
% Example: sprintsi(2345,-2) gives '2.3 k'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<3 w=0; end;
if nargin<2 d=-3; end;
f='afpnum kMGT';
e=max(-18,min(12,floor(log10(abs(x)))));
k=floor(e/3);
dp=max([0 d 3*k-d-e-1]);
if w<=0 & dp
   w=abs(w);
   dp=max(find([1 mod(mod(round(x*10^(dp-3*k)),10^dp),10.^(dp:-1:1))]))-1;
end
if(k)
   s=sprintf(sprintf('%%%d.%df %c',max(w-2,0),dp,f(k+7)),x*1e-3^k);
else
   s=sprintf(sprintf('%%%d.%df ',max(w-1,0),dp),x*1e-3^k);
end
