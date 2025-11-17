function dl=lpcaa2dl(aa)
%LPCAA2DL LPC: Convert area coefficients to dct of log area DL=(AA)

% note: we do not correct for sinc distortion; perhaps we should multiply by
% k=1:p-1;s=[sqrt(0.5)/p 2*sin(pi*k/(2*p))./(pi*k)];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p2]=size(aa);
dl=rdct(log(aa(:,2:p2-1)./aa(:,p2*ones(1,p2-2))).').';


