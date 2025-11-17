function tilefigs
%TILEFIGS tile current figures
%
% Possible future options:
%   (1) define screen region to place tiles
%   (2) include/exclude window titles (except optionally first row)
%   (3) preserve sizes and/or aspect ratios
%   (4) place disparate sizes in the most efficient way
%   (5) cascade instead of tile
%   (6) superimpose instead of tile
%   (7) cope with dual screens

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

starth=65; % height for start bar
tith=74; % height for window title
winb=4; % width of window border
figl=get(0,'Children');
nf=length(figl);
if isnumeric(figl)  % old versions of MATLAB have numeric figure handles
    figl=sort(figl);
else
    fign=zeros(1,nf);
    for i=1:nf
        fign(i)=figl(i).Number;
    end
    [fign,figj]=sort(fign);
    figl=figl(figj);
end
scr=get(0,'Screensize');
nfh=ceil(sqrt(nf));
nfv=ceil(nf/nfh);
hpix=floor((scr(3)-scr(1)+1)/nfh); % horizontal pixels available incl border
vpix=floor((scr(4)-scr(2)+1-starth)/nfv); % vertical pixels available incl border
for i=nf:-1:1
    figure(figl(i));
    row=1+floor((i-1)/nfh);
    col=i-(row-1)*nfh;
    %     [i hpix*(col-1)+1 scr(4)-vpix*row+1 hpix*col scr(4)-vpix*(row-1)]
    set(figl(i),'position',[hpix*(col-1)+1+winb scr(4)-vpix*row+1+winb hpix-2*winb vpix-2*winb-tith]);
end