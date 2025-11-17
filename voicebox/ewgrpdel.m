function [y,mm]=ewgrpdel(x,w,m)
%EWGRPDEL calculates the energy weighted group delay waveform Y=(X,W,M)
% For each sample, x(n), this routine calculates the energy-weighted average
% group delay over frequency using a window centred on x(n). This is equal to
% the delay from the window centre to the centre of gravity of energy in the window.
%
% Inputs: x    is the input signal
%         w    is the window (or just the length of a Hamming window)
%         m    is the sample of w to use as the centre [default=(length(w)+1)/2]
%
%         mm   the actual value of m used. Output point y(i) is based on x(i+m-w:i+m-1).
%
% If w is odd and m has its default value, then an impulse at x(i) will
% result in a negative-going zero crossing at y(i). More generally, if the
% window is symmetrical it will result in a negative-going zero crossing at
% y(i+m-(w+1)/2).

% Example: x=zeros(1000,1); x(100:100:900)=1; ewgrpdel(x,99);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 2
   w=hamming(length(x));
elseif  length(w)==1
   w=hamming(w);
end
w=w.^2;
lw=length(w);
if nargin < 3
   m=(1+lw)/2;
end
m=max(round(m),1);
mm=m;
wn=w(:).*(m-(1:lw))';
x2=[x(:); zeros(m-1,1)].^2;
yn=filter(wn,1,x2);
yd=filter(w,1,x2);
yd(yd<eps)=1;
y=yn(m:end)./yd(m:end);
if nargout==0
   plot(y);
   hold on;
   plot(x,'r');
   hold off;
end
