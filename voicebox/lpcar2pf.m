function [pf,f]=lpcar2pf(ar,np)
%LPCAR2PF Convert AR coefs to power spectrum PF=(AR,NP)
%
%  Inputs: ar(nf,n)     AR coefficients, one frame per row
%          np           Size of output spectrum is np+1 [n]
%
% Outputs: pf(nf,np+1)  Power spectrum from DC to Nyquist
%          f(1,np+1)    Normalized frequencies (0 to 0.5)
%
% For high speed make np equal to a power of 2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(ar);
if nargin<2
    if nargout
        np=p1-1;
    else
        np=128;
    end
end
pf=abs(rfft(ar.',2*np).').^(-2);
f=(0:np)/(2*np);
if ~nargout
        plot(f,pf.');
        xlabel('Normalized frequency f/f_s');
        ylabel('LPC Power Spectrum');
end

