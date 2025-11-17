function axisenlarge(f,h)
%AXISENLARGE - enlarge the axes of a figure (f,h)
%
% Usage:  (1) axisenlarge(1.05)    % enlarge axes by 5% in each direction
%         (2) axisenlarge(-1.05)   % shrink to fit content before enlarging
%
% Inputs:
%    f      enlarge axis by a factor f relative to current size or
%           by -f relative to the graph content. For separate factors
%           in each direction use [fx fy] or [fleft fright fbottom ftop] 
%    h      axis handle [default = gca]

%	  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fix=[1 1 1 1; 1 1 2 2; 1 2 3 3; 1 2 3 4];
if nargin<2 || ~numel(h)
    h=gca;
end
if nargin<1 || ~numel(f)
    f=-1.02;
end
nf=min(numel(f),4);
f=f(fix(nf,:));  % expand f to dimension 4
if any(f>=0)
    ax0=[get(h,'XLim') get(h,'YLim')];
else
    ax0=zeros(1,4);
end
if any(f<0)
    axis(h,'tight');
    ax1=[get(h,'XLim') get(h,'YLim')];
    ax0(f<0)=ax1(f<0);
    f=abs(f);
end
ax1=ax0.*f+ax0([2 1 4 3]).*(1-f);
set(h,'XLim',ax1(1:2),'YLim',ax1(3:4));
