function q=qrmult(q1,q2)
%QRMULT multiplies together two real quaternions matrices q=[q1,q2]
%
% Inputs:   q1(4m,n)  Two real quaternions arrays. Either array can
%           q2(4n,r)  also be a scalar quaternion.
%
% Outputs:   q(4m,r)  Matrix product of q1 and q2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1=size(q1);
s2=size(q2);
if isequal(s1,[4 1])
    q=qrdotmult(repmat(q1,s2(1)/4,s2(2)),q2);
elseif isequal(s2,[4 1])
    q=qrdotmult(q1,repmat(q2,s1(1)/4,s1(2)));
else
    q=rotqr2mr(q1)*q2;
end
