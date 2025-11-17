function qr=rotqc2qr(qc)
%ROTQC2QR converts a matrix of complex quaternion row vectors into real form
%
% Inputs: 
%
%     QC(2m,n)   mxn matrix of complex-valued quaternions
%
% Outputs: 
%
%     QR(4m,n)   mxn matrix of real-valued quaternions
%
% The complex-valued quaternion [r+j*b  a+j*c] becomes [r a b c]

% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(qc);
i=(1:2:2*m)-mod(0:m-1,2);
qr=zeros(2*m,n);
qr(i,:)=real(qc);
qr(i+2,:)=imag(qc);