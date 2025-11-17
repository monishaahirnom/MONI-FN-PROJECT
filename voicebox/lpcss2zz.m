function zz=lpcss2zz(ss)
%LPCSS2ZZ Convert s-place poles to z-plane poles ZZ=(SS)
%the s-plane is in units of Normalized Hz and so the imaginary part
% of each ss() value is in the range +-0.5
%
% If you multiply ss by the sample frequency, a formant with
% frequency f and bandwidth b will give an s-plane pole-pair
% of approximately -b/2 +- j f


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

zz=exp(2*pi*ss);
