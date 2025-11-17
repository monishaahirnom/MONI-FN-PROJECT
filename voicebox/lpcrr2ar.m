function [ar,e]=lpcrr2ar(rr);
%LPCRR2AR convert autocorrelation coefs to ar coefs [AR,E]=(RR)
%E is the residual energy

% could test e each time and remove rows when it gets small


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(rr);
p=p1-1;
ar=ones(nf,p1);
ar(:,2) = -rr(:,2)./rr(:,1);
e = rr(:,1).*(ar(:,2).^2-1);
for n = 2:p
   k = (rr(:,n+1)+sum(rr(:,n:-1:2).*ar(:,2:n),2)) ./ e;
   ar(:,2:n) = ar(:,2:n)+k(:,ones(1,n-1)).*ar(:,n:-1:2);
   ar(:,n+1) = k;
   e = e.*(1-k.^2);
end
e=-e;
