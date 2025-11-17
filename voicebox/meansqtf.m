function d=meansqtf(b,a)
%AVEPSPEC calculates the mean square transfer function for a filter D=(B,A)
%
% Inputs: B,A         Numerator and denominator filter coefficients.
%
% Output: D           The mean square transfer function of the filter B/A. This equals
%                     the average otuput power when the filter is fed with unit variance
%                     white noise.
%
%                     D may be obtained approximately by:
%                         N=1024; D=sum(filter(B,A,[1 zeros(1,N)]).^2)

% Since the power spectrum is the fourier transform of the autocorrelation, we can calculate
% the average value of pb/pa by taking the 0'th order term of the convolution of the autocorrelation
% functions associated with b and 1/a. Since b is an FIR filter, this convolution is
% a finite sum even though the autocorrelation function of 1/a is infinite in extent.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if length(a)==1
   d=(b(:)')*b(:);
else
   m=lpcar2ra(b(:)');
   m(1)=m(1)*0.5;
   d=2*lpcar2rr(a(:)',length(m)-1)*m';
end
