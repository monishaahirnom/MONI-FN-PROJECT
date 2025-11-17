function [frq,cr] = cent2frq(c)
%FRQ2ERB  Convert Hertz to Cents frequency scale [C,CR]=(FRQ)
%	frq = frq2mel(c) converts a vector of frequencies in cents
%	to the corresponding values in Hertz.
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
% c = 1200*sign(frq).*log2(frq/(440*2^((3/12)-5)));
af=(exp((abs(c)-q)/p));
frq=sign(c).*af;
cr=af/p;
if ~nargout
    plot(c,frq,'-x');
    ylabel(['Frequency (' yticksi 'Hz)']);
    xlabel(['Frequency (' xticksi 'Cents)']);
end
