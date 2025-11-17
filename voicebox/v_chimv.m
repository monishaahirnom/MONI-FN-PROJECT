function [m,v]=v_chimv(n,l,s)
%V_CHIMV approximate mean and variance of non-central chi distribution [m,v]=(n,l,s)
%
%  Inputs:	n = degrees of freedom
%           l = non-centrality parameter = sqrt(sum(mean^2)) [default 0]
%               (can be a vector or matrix to calculate many different values at once)
%           s = standard deviation of Gaussian [default 1]
%
% Outputs:  m = mean of chi distribution
%           v = variance of chi distribution
%
% If x=c+randn(n,1) is a column vector of Gaussian random numbers with mean vector c, then
% z=sqrt(x'*x) has a chi distributon with n degrees of freedom and non-centrality parameter
% l=sqrt(c'*c). The mean and variance of a chi distribution are given precisely by
%
%     m = sqrt(2)*exp(gammaln(0.5*n+0.5)-gammaln(0.5*n))*hypergeom(-0.5,0.5*n,-0.5*l^2)
%       = sqrt(pi/2) L(0.5,0.5*n-1,-0.5*l^2)
%     v = n+l^2-m^2
%
% where L(n,a,x) is the generalized Laguerre polynomial L_n^{(a)}(x) but this is very slow
% to calculate so this routine approximates these expressions.
%
% For n=1, the accuracy is high; for n>1, accuracy improves with increasing n.
% Accuracy is worst when the non-centrality parameter, l, is close to s*sqrt(n).
% Worst case errors as a function of n are:
%                       n:    1       2      3       5      10
%   worst case error in m:  1e-15   0.007  0.004  0.0015  0.0005

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent ab pp qq nab
if isempty(ab)
    nab=200; % cache a few low values of n
    pp=[ 0.595336298258636  -1.213013700592756  -0.018016200037799   1.999986150447582 0];
    qq=[ -0.161514114798972   0.368983655790737  -0.136992134476950  -0.499681107630725 2];
    ni=1./(1:nab);
    ab=[polyval(qq,ni);polyval(pp,ni)];
end
if nargin<3
    s=1;
    if nargin<2
        l=0;
    end
end
ls=l/s;
l2=(ls).^2;
s2=s^2;
if n<=nab
    if n==1
        m=l.*(1-2*normcdf(-ls))+2*s*normpdf(-ls);
    else
        m=sqrt(l2+n-1+(ab(1,n)+ab(2,n)*l2).^(-1))*s;
    end
else
    m=sqrt(l2+n-1+(polyval(qq,1/n)+polyval(pp,1/n)*l2).^(-1))*s;
end
v=(n+l2)*s2-m.^2;
