function x=rsfft(y,n)
%RSFFT    fft of a real symmetric spectrum X=(Y,N)
% Y is the "first half" of a symmetric real input signal and X is the
% "first half" of the symmetric real fourier transform.
% If the length, N, of the full signal is even, then the "first half"
% contains 1+N/2 elements (the first and last are excluded from the reflection).
% If N is odd, the "first half" conatins 0.5+N/2 elements and only the first
% is excluded from the reflection.
% If N is specified explicitly, then Y will be truncated of zero-padded accordingly.
% If N is omitted it will be taken to be 2*(length(Y)-1) and is always even.
%
% If Y is a matrix, the transform is performed along each column
%
% The inverse function is y=rsfft(x,n)/n

% Could be made faster for even n by using symmetry

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ~isreal(y) error('RSFFT: Input must be real'); end
fl=size(y,1)==1;
if fl y=y(:); end
[m,k]=size(y);
if nargin<2 n=2*m-2;
else
    mm=1+fix(n/2);
    if mm>m y=[y; zeros(mm-m,k)];
    elseif mm<m y(mm+1:m,:)=[];
    end
    m=mm;
end
x=real(fft([y;y(n-m+1:-1:2,:)]));
x(m+1:end,:)=[];
if fl x=x.'; end
