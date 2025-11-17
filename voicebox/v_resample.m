function [y,h]=v_resample(x,p,q,n,b)
%V_RESAMPLE Resample and remove end transients [y,h]=(x,p,q,n,b)
%
% This multiplies the sample rate of x by p/q. It is identical to resample()
% except that the initial and final filter transients are removed.
% The number of ouput samples will be length(x)*ceil(p/q) - 2*ceil(n*max(p/q,1))
% where the filter length n has a default value of 10.
%
% Inputs:  x    input signal (or multiple signals with one per column)
%          p,q  sampling rate is multiplied by p/q (p and q must be +ve integers)
%          n    length of filter [default: 10]
%          b    Kaiser window parameter beta [default: 5]
%
% Outputs: y    resampled output signal
%          h    filter used (at a rate of p times the input sample rate)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if p==q
    y=x;
    h=1;
else
    if nargin < 5,  b = 5;  end   % design parameter for Kaiser window LPF
    if nargin < 4,   n = 10;   end
    [y,h]=resample(x,p,q,n,b);
    m=ceil(n*max(p/q,1));
    if size(x,1)==1 % x is a row vector
        y=y(m+1:end-m);
    else
        y=y(m+1:end-m,:);
    end
end