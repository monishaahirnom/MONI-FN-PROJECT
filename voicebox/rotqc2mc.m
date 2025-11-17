function mc=rotqc2mc(qc)
%ROTQC2MC converts a matrix of complex quaternion vectors to quaternion matrices
% Inputs: 
%
%     QC(2m,n,...)   array of complex quaternion vectors (each 2x1)
%
% Outputs: 
%
%     MC(2m,2n,...)   array of complex quaternion matrices (each 2x2)
%
% Each quarternion, r+ai+bj+ck is a 2x1 complex vector in the input array of the
% form [ r+bi ; a+ci ]. In the output array, this becomes a 2x2 complex matrix
% of the form [ r+bi -a+ci ; a+ci r-bi ].
% 
% In matrix form, quaternions can be multiplied and added using normal matrix 
% arithmetic. The complex matrix form has 4 complex elements while the real
% matrix form has 16 real elements.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=size(qc);
m=s(1);
qa=reshape(qc,m,[]);
n=2*size(qa,2);
mc=zeros(m,n);
ix=1:2:m;
jx=2:2:n;
mc(:,jx-1)=qa;
mc(ix,jx)=-conj(qa(ix+1,:));
mc(ix+1,jx)=conj(qa(ix,:));
s(2)=2*s(2);
mc=reshape(mc,s);