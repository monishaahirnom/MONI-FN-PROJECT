function [b,a]=potsband(fs)
%POTSBAND Design filter for 300-3400 telephone bandwidth [B,A]=(FS)
%
%Input: FS=sample frequency in Hz
%
%Output: B/A is a discrete time bandpass filter with a passband gain of 1
%
%The filter meets the specifications of G.151 for any sample frequency
%and has a gain of -3dB at the passband edges.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

szp=[0.19892796195357i; -0.48623571568937+0.86535995266875i]; 
szp=[[0; -0.97247143137874] szp conj(szp)];
% s-plane zeros and poles of high pass 3'rd order chebychev2 filter with -3dB at w=1
zl=2./(1-szp*tan(300*pi/fs))-1;
al=real(poly(zl(2,:)));
bl=real(poly(zl(1,:)));
sw=[1;-1;1;-1];
bl=bl*(al*sw)/(bl*sw);
zh=2./(szp/tan(3400*pi/fs)-1)+1;
ah=real(poly(zh(2,:)));
bh=real(poly(zh(1,:)));
bh=bh*sum(ah)/sum(bh);
b=conv(bh,bl);
a=conv(ah,al);