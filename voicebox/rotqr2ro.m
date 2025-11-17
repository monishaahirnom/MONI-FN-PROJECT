function r=rotqr2ro(q)
%ROTQR2RO converts a real quaternion to a 3x3 rotation matrix
% Inputs:
%
%     Q(4,1)   real-valued quaternion (possibly unnormalized)
%
% Outputs:
%
%     R(3,3)   Input rotation matrix
%              Plots a diagram if no output specified
%
% In the quaternion representation of a rotation, and q(1) = cos(t/2)
% where t is the angle of rotation in the range 0 to 2pi
% and q(2:4)/sin(t/2) is a unit vector lying along the axis of rotation
% a positive rotation about [0 0 1] takes the X axis towards the Y axis.
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

persistent a b c d e f g
if isempty(a)
    a=[1 5 9];
    b=[11 16 6];
    c=[16 6 11];
    d=[4 8 3];
    e=[10 15 14];
    f=[4 2 3];
    g=[2 6 7];
end
p=2*(q*q.')/(q.'*q);            % force normalized
r=zeros(3,3);
r(a)=1-p(b)-p(c);
r(d)=p(e)-p(f);
r(g)=p(e)+p(f);
if ~nargout
    % display rotated cube
    clf('reset'); % clear current axis
    %     vv=[0,0,0;1,0,0;0,1,0;0,0,1]*r';  % pyramid
    %     ff=[1 2 4; 2 1 3; 3 1 4; 4 2 3];
    %     cc=[0 1 0; 0 0 1; 1 0 0; 1 1 0];
    vv=[0,0,0;1,0,0;0,1,0;0,0,1;0 1 1; 1 0 1; 1 1 0; 1 1 1]*r';    % cube
    ff=[1 2 6 4; 2 7 8 6; 7 3 5 8; 4 5 3 1; 3 7 2 1; 6 8 5 4];
    %     cc=[0 1 0; 1 0 0; 0 1 0; 1 0 0; 0 0 1; 0 0 1];
    cc=[1 0 1 0 2 2]';
    pa=patch('Vertices',vv,'Faces',ff,'FaceVertexCData',cc,'FaceColor','Flat');
    colormap([1 0 0; 0 1 0; 0 0 1]);
    xlabel('x axis');
    ylabel('y axis');
    zlabel('z axis');
    title(sprintf('qr = [%.2f, %.2f, %.2f, %.2f]''    initial xyz=0 are rgb',q))
    axis([-1 1 -1 1 -1 1 0 1]*sqrt(3));
    grid on
    view(3);
    axis equal;
end

