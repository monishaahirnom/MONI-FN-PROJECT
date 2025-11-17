function zz=lpcar2zz(ar)
%LPCAR2ZZ Convert ar filter to z-plane poles ZZ=(AR)


%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(ar);
zz=zeros(nf,p1-1);
for k=1:nf
  zz(k,:)=roots(ar(k,:)).';
end

