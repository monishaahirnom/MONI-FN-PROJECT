function [a,t]=rotqr2ax(q)
%ROTQR2AX converts a real quaternion to the corresponding rotation axis and angle
% Inputs: 
%
%     Q(4,1)   real-valued quaternion (with magnitude = 1)
%
% Outputs:
%
%     A(3,1)   Unit vector in the direction of the rotation axis.
%     T        Rotation angle in radians (in range 0 to 2pi)
%
% In the quaternion representation of a rotation, and q(1) = cos(t/2) 
% where t is the angle of rotation in the range 0 to 2pi
% and q(2:4)/sin(t/2) is a unit vector lying along the axis of rotation
% a positive rotation about [0 0 1] takes the X axis towards the Y axis.
%
a=q(2:4);
m=sqrt(a'*a);
t=2*atan2(m,q(1));      % avoids problems if unnormalized
if m>0
    a=a/m;
else
    a=[0 0 1]';
end
    