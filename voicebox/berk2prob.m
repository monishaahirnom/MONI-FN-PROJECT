function [p,d]=berk2prob(b)
%BERK2PROB convert Berksons to probability
%
%  Inputs:  B(M,N)       matrix containing Berkson values
%
% Outputs:  P(M,N)       Corresponding probability values
%           D(M,N)       Corresponding derivatives dP/dB
%
% Berksons, or log-odds, are a nonlinear scale for measuring
% probability defined by B = log2(P./(1-P)).
% When Berksons are used to measure probability, a logistic
% psychometric function becomes linear.
%
% The inverse function is berk2prob()

%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p=1-1./(1+pow2(b));
if nargout>1
    d=log(2)*p.*(1-p);
end