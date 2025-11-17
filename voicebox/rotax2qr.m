function q=rotax2qr(a,t)
%ROTQR2AX converts a rotation axis and angle to the corresponding real quaternion
% Inputs:
%
%     A(3,1)   Vector in the direction of the rotation axis.
%     T        Rotation angle in radians
%
% Output: 
%
%     Q(4,1)   normalized real-valued quaternion
%
% In the quaternion representation of a rotation, and q(1) = cos(t/2) 
% where t is the angle of rotation and q(2:4)/sin(t/2) is a unit vector
% lying along the axis of rotation.
% A positive rotation about [0 0 1] takes the X axis towards the Y axis.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if all(a==0)
    a=[1;0;0];
end
m=sqrt(a(:)'*a(:));
q=[cos(0.5*t); sin(0.5*t)*a(:)/m];
    