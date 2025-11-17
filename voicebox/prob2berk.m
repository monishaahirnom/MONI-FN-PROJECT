function [b,d]=prob2berk(p)
%PROB2BERK convert probability to Berksons
%
%  Inputs:  P(M,N)       matrix containing probability values
%
% Outputs:  P(M,N)       Corresponding Berkson values
%           D(M,N)       Corresponding derivatives dP/dB
%
% Berksons, or log-odds, are a nonlinear scale for measuring
% probability defined by B = log2(P./(1-P)).
% When Berksons are used to measure probability, a logistic
% psychometric function becomes linear.
%
% The inverse function is berk2prob()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b=log2(p./(1-p));
if nargout>1
    d=log(2)*p.*(1-p);
end
