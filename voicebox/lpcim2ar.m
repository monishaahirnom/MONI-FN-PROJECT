function ar=lpcim2ar(im)
%LPCIM2AR Convert impulse response to AR coefs AR=(IM)


%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(im);
ar=zeros(nf,p1);
wz=[1 zeros(1,p1-1)];
for k=1:nf
  ar(k,:)=wz/toeplitz(wz,im(k,:)/im(k,1));
end
