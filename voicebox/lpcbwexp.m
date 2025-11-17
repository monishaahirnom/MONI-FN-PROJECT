function arx=lpcbwexp(ar,bw)
%LPCBWEXP expand formant bandwidths of LPC filter ARX=(AR,BW)
%minimum bandwidth will be BW*fs where fs is the sampling frequency
%the radius of each pole will be multiplied by R=exp(-BW*pi)
% To set the maximum pole radius to R use BW=-log(R)/PI.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(ar);
k=exp(-pi*(0:p1-1)*bw);
arx=ar.*k(ones(nf,1),:);
