function p=lin2pcmu(x,s)
%LIN2PCMU Convert linear to Mu-law PCM P=(X,S)
%	pcmu = lin2pcmu(lin) where lin contains a vector
%	or matrix of signal values within a range determined by
%	the scale factor s (see table below).
%	Values outside this range will be clipped.
%	The input values will be converted to integer
%	Mu-law pcm vlues in the range 0 to 255.
%	
%	Input values are multiplied by the scale factor s:
%
%		   s		Input Range
%
%		   1		+-8159
%		4004.189931	+-2.03761563 (default)
%		8159		+-1
%
%	The default input scaling factor 4004.189931 is equal to
%	sqrt((2207^2 + 5215^2)/2) and follows ITU standard G.711.
%	The sine wave with PCM-Mu values [158 139 139 158 30 11 11 30]
%	has a mean square value of unity corresponding to 0 dBm0.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 2 s=4004.189931; end
y=x*s;
y=(abs(y+8031)-abs(y-8031))/2;
q=floor((y+8032)/8032);
[m,e]=log2(abs(y)+33);
p=175+128*q-8*(e+abs(e-6))-floor(32*m-16);
