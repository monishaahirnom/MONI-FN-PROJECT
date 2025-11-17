function qr=rotmr2qr(mr)
%ROTMR2QR converts a matrix of real quaternion matrices to quaternion vectors
% Inputs: 
%
%     MR(4m,4n)   mxn matrix of real quaternion matrices (each 4x4)
%
% Outputs: 
%
%     QR(4m,n)   mxn matrix of real quaternion vectors (each 4x1)
%
% In matrix form, quaternions can be multiplied and added using normal matrix 
% arithmetic. Each element of an mxn matrix of quaternions is itself a 4x4 block
% so the total dimension of MR is 4m x 4n.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qr=mr(:,1:4:end);