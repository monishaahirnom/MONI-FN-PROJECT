function y=rotqrvec(q,x)
%ROTQRVEC applies a quaternion rotation ot a vector array y=[q,x]
%
% Inputs:   q(4,1)    quaternion rotation (possibly unnormalized)
%           x(3n,...) array of 3D column vectors
%
% Outputs:  y(3n,...) array of 3D column vectors

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=size(x);
y=reshape(rotqr2ro(q)*reshape(x,3,[]),s);