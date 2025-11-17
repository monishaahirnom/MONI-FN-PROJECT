function im=lpcar2im(ar,np)
%LPCAR2IM Convert AR coefs to impulse response IM=(AR,NP)


%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(ar);
if nargin<2 np=p1-1; end
im=zeros(nf,np+1);
x=[1 zeros(1,np)];
for k=1:nf
  im(k,:)=filter(1,ar(k,:),x);
end
