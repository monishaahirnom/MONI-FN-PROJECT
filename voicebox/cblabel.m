function c=cblabel(l,h)
% h is the handle of the colorbar, axis or figure
%CBLABEL add a label to a colorbar c=(l,h)
%
% Inputs:
%
%     L        Label string for colorbar
%     H        Handle of the colorbar, axis or figure [default = current figure]
%
% Outputs:
%
%     C        Handle of the colorbar

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<2
    h=gcf;
end
switch get(h,'Type')
    case 'axes'
        if get(h,'Tag')=='Colorbar'
            c=h;
        else
            while get(h,'Type')~='figure'
                h=get(h,'Parent');      % find parent figure
                if h==0
                    error('cannot find parent figure');
                end
            end
            c=findobj(h,'tag','Colorbar');
            if isempty(c)
                error('There is no colour bar on this figure')
            end
            % we could look for the nearest colorbar to the selected axes
            c=c(1);      % for now use the most recently added colorbar
        end
    case 'figure'
        c=findobj(h,'tag','Colorbar');
        if isempty(c)
            error('There is no colour bar on this figure')
        end
        c=c(1);      % use the most recently added colorbar
    otherwise
        error('h argument must be colorbar, axis or figure handle');
end
set(get(c,'ylabel'),'string',l);