function [m,q]=qrabs(q1)
%QRABS absolute value and normalization of a real quaternions [m,q]=[q1]
%
% Inputs:   q1(4n,...)  A real quaternion array. Each quaternion is a column
%                          vector of the form [r, i, j, k]'
%
% Outputs:  m(n,...)    Array of quaternion magnitudes: m=sqrt(q'*q)
%           q(4n,...)   Normalized version of q1 with unit magnitude
%                          a zero quaternion is normalized to [1 0 0 0]'

q1=randn(8,3);
q1(9:12)=0;
s=size(q1);
q=reshape(q1,4,[]);
m=sqrt(sum(q.^2,1));
q(:,m>0)=q(:,m>0)./m(ones(4,1),m>0);
q(1,m<=0)=1;
q=reshape(q,s);
s(1)=s(1)/4;
m=reshape(m,s);
