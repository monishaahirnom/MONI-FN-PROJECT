function cc=lpczz2cc(zz,np)
%LPCZZ2CC Convert poles to "complex" cepstrum CC=(ZZ,NP)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p]=size(zz);
if (nargin < 2) np=p; end
cc=zeros(nf,np);
yy=zz.';
if p<2			% special case 'cos sum() is weird
  cc(:,1)=real(zz);
  for k=2:np
    yy=yy.*zz.';
    cc(:,k)=real(yy).'/k;
  end
else
  cc(:,1)=sum(real(yy)).';
  for k=2:np
    yy=yy.*zz.';
    cc(:,k)=sum(real(yy)).'/k;
  end
end
