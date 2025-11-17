function p=stoi2prob(s,m)
%STOI2PROB convert STOI to probability
%
%  Inputs:  S(M,N)       matrix containing STOI values
%           M            mapping: 'i' IEEE sentences [default]
%                                 'd' Dantale corpus
%
% Outputs:  P(M,N)       Corresponding probability values
%
% STOI is an intelligibility metric described in [1]. The
% mapping from STOI to intelligibilty is corpus-dependent:
% this functions implements two mappings given in [1].
%
% [
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<2 || ~numel(m) || m(1)=='i'
    a=-17.4906;
    b=9.6921;
    if ~nargin
        s=[];
    end
else
    a=-14.5435;
    b=7.0792;
end
p=1./(1+exp(a*s+b));
if ~nargout
    if ~nargin
        s=linspace(0,1,100);
    end
    plot(s,stoi2prob(s,'d'),':k',s,stoi2prob(s,'i'),'-k')
    xlabel('STOI');
    ylabel('Intelligibility');
    legend('Dantale corpus','IEEE sentences','location','best');
end