function y=rhartley(x,n)
%RHARTLEY Calculate the Hartley transform of real data Y=(X,N)
% Data is truncated/padded to length N if specified.
% The inverse transformation is x=hartley(y,n)/n

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 2
  y=fft(real(x));
else
  y=fft(real(x),n);
end
y=real(y)-imag(y);
