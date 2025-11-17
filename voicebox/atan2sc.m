function [s,c,r,t]=atan2sc(y,x)
%ATAN2SC    sin and cosine of atan(y/x) [S,C,R,T]=(Y,X)
%
% Outputs:
%    s    sin(t) where tan(t) = y/x
%    C    cos(t) where tan(t) = y/x
%    r    sqrt(x^2 + y^2)
%    t    arctan of y/x

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


t=NaN;
if y == 0
    t=(x<0);
    c=1-2*t;
    s=0;
    r=abs(x);
    t=t*pi;
elseif x == 0
    s=2*(y>=0)-1;
    c=0;
    r=abs(y);
    t=s*0.5*pi;
elseif (abs(y) > abs(x))
    q = x/y;
    u = sqrt(1+q^2)*(2*(y>=0)-1);
    s = 1/u;
    c = s*q;
    r = y*u;
else
    q = y/x;
    u = sqrt(1+q^2)*(2*(x>=0)-1);
    c = 1/u;
    s = c*q;
    r = x*u;
end
if nargout>3 && isnan(t)
    t=atan2(s,c);
end