function p=mintrace(x)
%MINTRACE find row permutation to minimize the trace p=(x)
%Inputs:    x(n,n)  is a square real-valued matrix
%
%Outputs:   p(n,1)  is the row permutation that minimizes the trace
%                   so that trace(x(p,:)) is as small as possible

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=size(x,1);    % input x must be square
p=permutes(n);  % try all permutations
c=0:n:n^2-1;    % convert olumns to single indexing
[v,i]=min(sum(x(p+c(ones(length(p),1),:)),2));
p=p(i,:)';

