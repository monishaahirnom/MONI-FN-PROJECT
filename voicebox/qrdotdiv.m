function q=qrdotdiv(x,y)
%QRDOTDIV divides two real quaternions arrays elementwise q=[x,y]
%
% Inputs:  x(4n,...)
%          y(4n,...)   Two real quaternion arrays of equal size
%
% Outputs: q(4n,...)    The Hadamard quaotient (i.e. ./) of the input arrays
%                       If y is omitted then q = x^(-1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent a b c
if isempty(a)
    a=[1 2 3 4 2 1 4 3 3 4 1 2 4 3 2 1];
    b=[1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4];
    c=[6 8 10 11 15 16];
end
s=size(x);
x=reshape(x,4,[]);
if nargin<2 % one argument - just invert x
    m=sum(x.^2,1);
    x=x./m(ones(4,1),:);
    x(2:4,:)=-x(2:4,:);
    q=reshape(x,s);
else  % multiply by conjugate of y and then divide by |y|^2
    y=reshape(y,4,[]);
    m=sum(y.^2,1);
    q=x(a,:).*y(b,:);
    q(c,:)=-q(c,:);
    q=reshape(sum(reshape(q,4,[]),1),s)./m(ones(4,1),:);;
end
