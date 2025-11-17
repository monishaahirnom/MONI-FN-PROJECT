function [y,zf]=ditherq(x,m,zi)
%DITHERQ  add dither and quantize [Y,ZF]=(X,M,ZI)
%  Inputs:
%      x   is the input signal
%	   m   specifies the mode:
%          'w'  white dither (default)
%          'h'  high-pass dither (filtered by 1 - z^-1)
%          'l'  low pass filter  (filtered by 1 + z^-1)
%          'n'  no dither

%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s=size(x);
n=length(x);
if nargin<3 | ~length(zi)
    zi=rand(1);
end
    if nargin<2
        m='w';
    end
if any(m=='n')
    y=round(x);
elseif any(m=='h') | any(m=='l')
    v=rand(n+1,1);
    v(1)=zi;
    zf=v(end);
    if any(m=='h')
        y=round(x(:)+v(2:end)-v(1:end-1));
    else
        y=round(x(:)+v(2:end)+v(1:end-1)-1);
    end
else
    y=round(x(:)+rand(n,2)*[1;-1]);
    zf=rand(1);                         % output a random number anyway
end
if s(1)==1
    y=y.';
end