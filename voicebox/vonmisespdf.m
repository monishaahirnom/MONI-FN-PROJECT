function p=vonmisespdf(x,m,k)
%VONMISESPDF Von Mises probability distribution P=(x,m,k)
%
%  Inputs:  X         matrix of input values (in radians)
%           M         mean angle of distribution (in radians)
%           K         concentration parameter
%
% Outputs:  P         matrix of probability density values (same size as X)
%                     (with no output argument, the function will plot a graph)
%
% The von Mises distribution describes the pdf of an angle over the range [0,2pi). 
% For large K, the distribution approximates a Gaussian with mean M and
% variance 1/K. For small K, the distribution is uniform.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargout>0
    p=exp(k*cos(x-m))/(2*pi*besseli(0,k));
else
    if nargin<1 || isempty(x)
        x=linspace(-pi,pi,181);
    end
    if nargin<2 || isempty(m)
        m=0;
    end
    if nargin<3 || isempty(k)
        k=[0 pow2(-1:3)];
    end
    nm=length(m);
    nk=length(k);
    np=max(nm,nk);
    pp=zeros(length(x),np);
    pl=cell(np,1);
    for i=1:np
        mi=m(1+rem(i-1,nm));
        ki=k(1+rem(i-1,nk));
        pp(:,i)=vonmisespdf(x(:),mi,ki);
        pl{i}=sprintf('\\mu=%.1f, \\kappa=%.1f',mi,ki);
    end
    plot(x,pp);
    axisenlarge([-1 -1.05]);
    legend(pl,'location','northeast');
end

