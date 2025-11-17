function ss=lpczz2ss(zz)
%LPCZZ2SS Convert z-place poles to s-plane poles SS=(ZZ)
%the s-plane is in units of Normalized Hz and so the imaginary part
% of each ss() value is in the range +-0.5
%
% If you multiply ss by the sample frequency, a formant with
% frequency f and bandwidth b will give an s-plane pole-pair
% of approximately -b/2 +- j f


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ss=log(max(zz,1e-8))*0.5/pi;
