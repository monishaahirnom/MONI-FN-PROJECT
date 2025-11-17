function ar=lpccc2ar(cc)
%LPCCC2AR Convert complex cepstrum to ar coefficients AR=(CC)
%
% MATLAB5 version


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p]=size(cc);
rp=-(1:p);
cc = cc .* rp(ones(nf,1),:);
if p<2
  ar = [ones(nf,1) cc(:,1)];
else
 ar=zeros(nf,p+1);
 ar(:,1:3) = [ones(nf,1) cc(:,1) (cc(:,2)+cc(:,1).^2)/2];
  for k=3:p
    ar(:,k+1) = (cc(:,k) + sum(cc(:,1:k-1).*ar(:,k:-1:2),2))/k;
  end
end

