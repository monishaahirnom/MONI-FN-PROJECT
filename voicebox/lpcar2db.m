function [db,f]=lpcar2db(ar,np)
%LPCAR2DB LPC: Convert AR coefs to power spectrum in dB DB=(AR)
%
%  Inputs: ar(nf,n)     AR coefficients, one frame per row
%          np           Size of output spectrum is np+1 [n]
%
% Outputs: db(nf,np+1)  Power spectrum in dB from DC to Nyquist
%          f(1,np+1)    Normalized frequencies (0 to 0.5)
%
% For high speed make np equal to a power of 2


% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(ar);
if nargin<2
    if nargout
        np=p1-1;
    else
        np=128;
    end
end
ff=rfft(ar.',2*np).';
db=-10*log10(real(ff.*conj(ff)));
f=(0:np)/(2*np);
if ~nargout
        plot(f,db.');
        xlabel('Normalized frequency f/f_s');
        ylabel('LPC Power Spectrum (dB)');
end

