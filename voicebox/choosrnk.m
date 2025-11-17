function x=choosrnk(n,k)
%CHOOSRNK All choices of K elements taken from 1:N with replacement. [X]=(N,K)
% The output X is a matrix of size ((N+K-1)!/(K!*(N-1)!),K) where each row
% contains a choice of K elements taken from 1:N with duplications allowed.
% The rows of X are in lexically sorted order.
%
% To choose from the elements of an arbitrary vector V use
% V(CHOOSRNK(LENGTH(V),K)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=choosenk(n+k-1,k);
x=x-repmat(0:k-1,size(x,1),1);