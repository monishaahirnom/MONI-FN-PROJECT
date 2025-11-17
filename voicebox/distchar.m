function d=distchar(ar1,ar2,mode)
%DISTCHAR calculates the cosh spectral distance between AR coefficients D=(AR1,AR2,MODE)
%
% Inputs: AR1,AR2     AR coefficient sets to be compared. Each row contains a set of coefficients.
%                     AR1 and AR2 must have the same number of columns.
%
%         MODE        Character string selecting the following options:
%                         'x'  Calculate the full distance matrix from every row of AR1 to every row of AR2
%                         'd'  Calculate only the distance between corresponding rows of AR1 and AR2
%                              The default is 'd' if AR1 and AR2 have the same number of rows otherwise 'x'.
%           
% Output: D           If MODE='d' then D is a column vector with the same number of rows as the shorter of AR1 and AR2.
%                     If MODE='x' then D is a matrix with the same number of rows as AR1 and the same number of columns as AR2'.
%
% The COSH spectral distance is the average over +ve and -ve frequency of 
%
%                     cosh(log(p1/p2))-1   =   (p1-p2)^2/(2p1*p2)   =   (p1/p2 + p2/p1)/2 - 1
%
% Where p1 and p2 are the power spectra corresponding to the AR coefficient sets AR1 and AR2.
% The COSH distance is a symmetrical version of the Itakura-Saito distance: distchar(x,y)=(distisar(x,y)+distisar(y,x))/2

% Since the power spectrum is the fourier transform of the autocorrelation, we can calculate
% the average value of p1/p2 by taking the 0'th order term of the convolution of the autocorrelation
% functions associated with p1 and 1/p2. Since 1/p2 corresponds to an FIR filter, this convolution is
% a finite sum even though the autocorrelation function of p1 is infinite in extent.

% The Cosh distance can also be calculated directly from the power spectra; providing np is large
% enough, the values of d0 and d1 in the following will be very similar:
%
%         np=255; d0=distchar(ar1,ar2); d1=distchpf(lpcar2pf(ar1,np),lpcar2pf(ar2,np))
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf1,p1]=size(ar1);
nf2=size(ar2,1);
p2=p1+1;
m1=zeros(nf1,2*p1);
m2=zeros(nf2,2*p1);
m1(:,1:p1)=lpcar2rr(ar1);
m1(:,p2:end)=lpcar2ra(ar1);
m1(:,1)=m1(:,1)*0.5;
m1(:,p2)=m1(:,p1+1)*0.5;
m2(:,p2:end)=lpcar2rr(ar2);
m2(:,1:p1)=lpcar2ra(ar2);

if nargin<3 | isempty(mode) mode='0'; end
if any(mode=='d') | (mode~='x' & nf1==nf2)
   nx=min(nf1,nf2);
   d=sum(m1(1:nx,:).*m2(1:nx,:),2)-1;
else
   d=m1*m2'-1;
end
