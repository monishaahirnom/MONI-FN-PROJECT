function ra=lpcar2ra(ar)
%LPCAR2RA Convert ar filter to inverse filter autocorrelation coefs. RA=(AR)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(ar);
ra=zeros(nf,p1);
for i=1:p1
   ra(:,i)=sum(ar(:,1:p1+1-i).*ar(:,i:p1),2);
end

