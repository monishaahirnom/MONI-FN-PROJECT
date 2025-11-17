function q=qrdotmult(q1,q2)
%QRDOTMULT multiplies together two real quaternions arrays q=[q1,q2]
%
% Inputs:  q1(4n,...)
%          q2(4n,...)   Two real quaternion arrays of equal size
%
% Outputs: q(4n,...)    The Hadamard product (i.e. .*) of the input arrays

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent a b c
if isempty(a)
    a=[1 2 3 4 2 1 4 3 3 4 1 2 4 3 2 1];
    b=[1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4];
    c=[2 3 4 7 12 14];
end
s=size(q1);
qa=reshape(q1,4,[]);
qb=reshape(q2,4,[]);
q=qa(a,:).*qb(b,:);
q(c,:)=-q(c,:);
q=reshape(sum(reshape(q,4,[]),1),s);
