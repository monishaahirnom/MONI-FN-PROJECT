function rf=lpcar2rf(ar)
%LPCAR2RF Convert autoregressive coefficients to reflection coefficients AR=(RF)
%
% Input:   ar(:,p+1)  Autoregressive coefficients
% Output:  rf(:,p+1)  Reflection coefficients with rf(:,1)=1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1] = size(ar);
if p1==1
   rf=ones(nf,1);
else
   if any(ar(:,1)~=1)
      ar=ar./ar(:,ones(1,p1));
   end
   rf = ar;
   w=ones(nf,1);
   for j = p1-1:-1:2
      k = rf(:,j+1);
      d = (1-k.^2).^(-1);
      wj=ones(1,j-1);
      rf(:,2:j) = (rf(:,2:j)-k(:,wj).*rf(:,j:-1:2)).*d(:,wj);
   end
end

