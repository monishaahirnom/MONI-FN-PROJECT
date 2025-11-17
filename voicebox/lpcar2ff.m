function [ff,f]=lpcar2ff(ar,np)
%LPCAR2FF LPC: Convert AR coefs to complex spectrum FF=(AR,NP)
%
%  Inputs: ar(nf,n)     AR coefficients, one frame per row
%          np           Size of output spectrum is np+1 [n]
%
% Outputs: ff(nf,np+1)  Complex spectrum from DC to Nyquist
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
ff=(rfft(ar.',2*np).').^(-1);
f=(0:np)/(2*np);
if ~nargout
    subplot(2,1,2);
    plot(f,unwrap(angle(ff)));
    xlabel('Normalized frequency f/f_s');
    ylabel('Phase (rad)');
    subplot(2,1,1);
    plot(f,db(abs(ff)));
    xlabel('Normalized frequency f/f_s');
    ylabel('Gain (dB)');
    title('LPC Spectrum');
end

