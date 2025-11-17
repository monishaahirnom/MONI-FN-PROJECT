function m = rnsubset(k,n)
%RNSUBSET choose k distinct random integers from 1:n M=(K,N)
%
%  Inputs:
%
%    K is number of disinct integers required from the range 1:N
%    N specifies the range - we must have K<=N
%
%  Outputs:
%
%    M(1,K) contains the output numbers

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if k>n
    error('rnsubset: k must be <= n');
end
% We use two algorithms according to the values of k and n
[f,e]=log2(n);
if k>0.03*n*(e-1)
[v,m]=sort(rand(1,n)); % for large k, just do a random permutation
else
    v=ceil(rand(1,k).*(n:-1:n-k+1));
    m=1:n;
    for i=1:k
        j=v(i)+i-1;
        x=m(i);
        m(i)=m(j);
        m(j)=x;
    end
end
m=m(1:k);
