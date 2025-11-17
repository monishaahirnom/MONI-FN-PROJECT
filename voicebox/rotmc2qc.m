function qc=rotmc2qc(mc)
%ROTMC2QC converts a matrix of complex quaternion matrices to a matrix of complex quaternion vectors
% Inputs: 
%
%     MC(2m,2n)   mxn matrix of real quaternion matrices (each 2x2)
%
% Outputs: 
%
%     QC(2m,n)   mxn matrix of real quaternion vectors (each 2x1)
%
% In matrix form, quaternions can be multiplied and added using normal matrix 
% arithmetic. Each element of an mxn matrix of quaternions is itself a 2x2 block
% so the total dimension of MC is 2m x 2n.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qc=mc(:,1:2:end);
