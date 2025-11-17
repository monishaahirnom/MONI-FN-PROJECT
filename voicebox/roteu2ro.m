function r=roteu2ro(m,t)
%ROTEU2QR converts a sequence of Euler angles to a real unit quaternion
% Inputs:
%
%     M(1,n)   a string of n characters from the set {'x','y','z'}
%              or, equivalently, a vector whose elements are 1, 2, or 3
%     T(n,1)   n rotation angles. A positive rotation is clockwise if
%              looking along the axis away from the origin.
%
% Outputs:
%
%     R(3,3)   Input rotation matrix
%              Plots a diagram if no output specified
%
% The string M specifies the axes about which the rotations are performed.
% You cannot have the same axis in adjacent positions and so there are 12
% possibilities. Common ones are "ZXZ" and "ZYX". A positive rotation is clockwise
% if looking along the axis away from the origin; thus a rotation of +pi/2
% around Z rotates [1 0 0]' to [0 1 0]'.
% 
% Inverse conversion: If m has length 3 with adjacent characters distinct,
%                     then rotro2eu(m,roteu2ro(m,t))=t.
%
% Inverse rotation:   roteu2ro(m,t)*roteu2ro(fliplr(m),-fliplr(t))=eye(3)

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=rotqr2ro(roteu2qr(m,t));