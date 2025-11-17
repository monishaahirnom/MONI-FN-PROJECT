function fig2emf(h,s,p)
%FIG2EMF save a figure in windows metafile format (H,S,P)
% Usage:  (1) fig2emf      % save current figure in current folder
%         (2) emf=1;                        % set emf=1 to print
%             figsize=[500 300];            % default size
%             figdir='../figs/<m>-<n>';     % default destination
%             ...
%             plot (...);
%             figbolden(figsize);
%             if emf, fig2emf(figdir), end
%
% Inputs: h   figure handle [use [] or omit for the current figure]
%         s   optional file name which can include <m> for the top level
%                 mfile name and <n> for figure number [if empty or missing: '<m>_<n>']
%                 '.' suppresses the save, if s ends in '/' or '\', then '<m>_<n>' is appended
%         p   call figbolden(p) before printing the figure
%
% Bugs:
%    (1) MATLAB does not print the figure correctly when running under
%        remote desktop; it seems to pick up the screen resolution incorrectly.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch nargin
    case 0
        h=[];
        s='';
        p=[];
    case 1
        if ischar(h) || ~numel(h)   % fig2emf(s)
            s=h;
            h=[];
        else
            s='';
        end
        p=[];
    case 2
        if ischar(h) || ~numel(h)   % fig2emf(s,p)
            p=s;
            s=h;
            h=[];
        else                        % fig2emf(h,s)
            p=[];
        end
end
if ~numel(h)
    h=gcf;
else
    figure(h);
end
if ~numel(s)
    s='<m>_<n>';
elseif s(end)=='/' || s(end)=='\'
    s=[s '<m>_<n>'];
end
[st,sti]=dbstack;
if numel(st)>1
    mfn=st(end).name;  % ancestor mfile name
else
    mfn='Figure';
end
if isreal(h)
    fn=num2str(round(h)); % get figure number
else
    fn=num2str(get(h,'number'));  % in new versions of matlab use this method
end
ix=strfind(s,'<m>');
while numel(ix)>0
    s=[s(1:ix-1) mfn s(ix+3:end)];
    ix=strfind(s,'<m>');
end
ix=strfind(s,'<n>');
while numel(ix)>0
    s=[s(1:ix-1) fn s(ix+3:end)];
    ix=strfind(s,'<n>');
end
if numel(p)>0
    if numel(p)==1 && p==0
        figbolden;
    else
        figbolden(p)
    end
end
set(gcf,'paperpositionmode','auto');  % preserve screen shape
if ~strcmp(s,'.')
    %     eval(['print -dmeta ' s]); % previous version
    print('-dmeta',s);
end