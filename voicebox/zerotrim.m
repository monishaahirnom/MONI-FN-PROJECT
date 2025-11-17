function z=zerotrim(x)
%ZEROTRIM Remove zero trailing rows and columns Z=(X)
% returns a null matrix if x is all zero.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c=max(find(any(x,1)));
r=max(find(any(x,2)));
z=x(1:r,1:c);