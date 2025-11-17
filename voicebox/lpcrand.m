function ar=lpcrand(p,n,bw)
% generate n random stable polynomials of order p with a minimum pole
% bandwidth of bw*fs where fs is the sampling fequency.
% To limit the pole radius to r set bw=-log(r)/pi
% bw may be a vector specifying a different max bandwidth for each row

%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 3
   bw=0;
   if nargin < 2
      n=1;
   end
end 
if p
   if ~bw
      ar=lpcrf2ar(2*rand(n,p+1)-1);
   else
      k=exp(-pi*bw(:)*(0:p));
      if size(k,1)==1
         ar=lpcrf2ar(2*rand(n,p+1)-1).*k(ones(n,1),:);
      else
         ar=lpcrf2ar(2*rand(n,p+1)-1).*k;
      end
   end
else
   ar=ones(n,1);
end
