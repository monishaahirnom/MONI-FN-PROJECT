function qc=rotqr2qc(qr)
%ROTQR2QC converts a matrix of real quaternion vectors into complex form
%
% Inputs: 
%
%     QR(4m,...)   array of real-valued quaternions
%
% Outputs: 
%
%     QC(2m,...)   array of complex-valued quaternions
%
% The real-valued quaternion [r a b c]' becomes [r+j*b  a+j*c]'

% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent a b
if isempty(a)
    a=[1 3 2 4];
    b=[1 1i];
end
s=size(qr);
qq=reshape(qr,4,[]);
s(1)=s(1)/2;
qc=reshape(b*reshape(qq(a,:),2,[]),s);