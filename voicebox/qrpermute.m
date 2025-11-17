function y=qrpermute(x,p)
%QRPERMUTE transpose or permute a quaternion array y=[x,p]
%
% Inputs:   x(4m,...)  Real quaternions array
%           p          new order of dimensions [default [2 1 ...]
%
% Outputs:  y(4n,...)  output real quaternion array

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=size(x);
if nargin<2
    p=[2 1 3:length(s)];
end
s(1)=s(1)/4;
t=s(p);
t(1)=4*t(1);
y=reshape(permute(reshape(x,[4 s]),[1 p+1]),t);