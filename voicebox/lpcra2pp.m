function pp=lpcra2pp(ra)
%LPCAR2PP LPC: Convert ar filter autocorrelation to power spectrum polynomial in cos(w) PP=(RA)
% pp is a polynomial such that |polyval(ra,e^jw)| = polyval(pp,cos(w))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

persistent tp;
[nf,p1]=size(ra);
% we check here if p is the same as before and reuse the tp matrix
if size(tp,1)~=p1
   p=p1-1;
   % chebyshev polynomials up to order p
   tp=zeros(p1,p1);
   tp(1,p1)=2;
   tp(2,p)=2;
   for i=3:p1
      tp(i,p+2-i:p)=2*tp(i-1,p+3-i:p1)-tp(i-2,p+2-i:p);
      tp(i,p1)=-tp(i-2,p1);
   end
   tp(1,p1)=1;
end
pp=ra*tp;
