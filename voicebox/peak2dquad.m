function [v,xy,t,m]=peak2dquad(z)
%PEAK2DQUAD find quadratically-interpolated peak in a 2D array
%
% Note: This routine has been superceeded by quadpeak
%
%  Inputs:  Z(m,n)   is the input array
%
% Outputs:  V        is the peak value
%           XY(2,1)  is the position of the peak (in fractional subscript values)
%           T        is -1, 0, +1 for maximum, saddle point or minimum
%           M        defines the fitted quadratic: z = [x y 1]*M*[x y 1]'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[v,xy,t,m]=quadpeak(z);