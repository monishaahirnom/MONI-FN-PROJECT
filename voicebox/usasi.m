function x=usasi(n,fs)
%USASI generates N samples of USASI noise at sample frequency FS X=(N,FS)

% This routine is based on the USASI noise defined in [1] which was later
% reissued as [2]. USASI noise is intended to simulate the long-term average
% of typical audio program material. The routine does not currently implement
% the pulsation at 2.5Hz 12.5% duty cycle that is recommended by the standard.
% Also it should probably be scaled to a well-defined power.
%
%  [1] NRSC AM Reemphasis, Deemphasize, and Broadcast Audio Transmission Bandwidth Specifications,
%      EIA-549 Standard, Electronics Industries Association , July 1988.
%  [2] NRSC AM Reemphasis, Deemphasize, and Broadcast Audio Transmission Bandwidth Specifications,
%      NRSC-1-A Standard, Sept 2007, Online: http://www.nrscstandards.org/SG/NRSC-1-A.pdf 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<2 fs=8000; end
b=[1 0 -1];
a=poly(exp(-[100 320]*2*pi/fs));

x=randfilt(b,a,n);