function m=ccwarpf(f,n,s)
%CCWARPF  Warp cepstral coefficients M=(F,N,S) 
% f(1) is the original sample freq, f(2) is the new sample freq
% n(1) is the original number of coefficients, n(2) is the new number
% s is a string: s(1),s(2) =l for linear, m for mel frequency, use capitals if c0 included


%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<3
   s='ll';
end
if length(f)<2
   f(2)=1;
end
if length(n)<2
   n(2)=n(1);
end
z=s<'a';
s=s+32*z;
if all(s=='l')
   k=1:n(2)-z(2);
   ff=((1:n(1)).'-z(1))*f(2)/f(1);
   fa=2*sin(ff*pi).*ff/pi;
   fb=ff.^2;
   ka=1-2*rem(k,2);
   kb=k.^2;
   r1=ones(n(1),1);
   c1=ones(1,n(2)-z(2));
   a=fa(:,c1).*ka(r1,:);
   b=fb(:,c1)-kb(r1,:);
   f0=find(fix(ff)==ff);
   if length(f0)
      a(f0,:)=ff(f0,c1)==k(ones(length(f0),1),:);
      b(f0,:)=1;
   end
   m=a./b;
   if z(2)
      m=[[1; 0.5*fa(2:n(1))./fb(2:n(1))] m];
   end
end



