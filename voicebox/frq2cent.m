function [c,cr] = frq2cent(frq)
%FRQ2ERB  Convert Hertz to Cents frequency scale [C,CR]=(FRQ)
%	[c,cr] = frq2mel(frq) converts a vector of frequencies (in Hz)
%	to the corresponding values on the logarithmic cents scale.
%   100 cents corresponds to one semitone and 440Hz corresponds to 5700
%   cents.
%   The optional cr output gives the gradient in Hz/cent.
%
%	The relationship between cents and frq is given by:
%
%	c = 1200 * log2(f/(440*(2^((3/12)-5)))
%
%	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent p q
if isempty(p)
    p=1200/log(2);
    q=5700-p*log(440);
end
af=abs(frq);
% c = 1200*sign(frq).*log2(frq/(440*2^((3/12)-5)));
c=sign(frq).*(p*log(af)+q);
cr=af/p;
if ~nargout
    plot(frq,c,'-x');
    xlabel(['Frequency (' xticksi 'Hz)']);
    ylabel(['Frequency (' yticksi 'Cents)']);
end
