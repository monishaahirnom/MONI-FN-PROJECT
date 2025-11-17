function [xc,ec,tc,xy0]=polygonxline(p,l)
%POLYGONXLINE Find where a line crosses a polygon [xc,ec,tc,xy0]=(p,l)
% Inputs
% P(n,2) gives the polygon vertices
% L(1,3) gives the line in the form L*[X; Y; 1]=0
%
% Outputs
% xc(k,2) gives (x,y) coordinates of crossing points
% the crossings are between vertex pairs ec(k,1) and ec(k,1)+1
% tc(k,1) gives parametric position of crossing points (x,y)=(x0,y0)+tc(-l(2),l(1))
% xy0(1,2) gives the starting point, (x0,y0) of the parametric line

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=size(p,1);
q=ones(n+1,3);
q(1:n,1:2)=p;
q(end,:)=q(1,:);        % duplicate the final point
cdist=q*l';
cside=cdist>0;           % find which side each vertex lies
cside(end)=cside(1);        % just in case
ec=find(cside(2:end)~=cside(1:n)); % sides of boundary that are crossed
nc=numel(ec);
if ~nc
    xc=[];
    tc=[];
    ec=[];
    xy0=[];
else
    l2=l(1:2);
    l2m=l2*l2';
    l3=l(3);
    a=[-l(2) l(1)];
    xy0=-l3/(l2*l2')*l2;                % point on line closest to origin
    tn=(q(:,1:2)-repmat(xy0,n+1,1))*a'/l2m;
    tc=(cdist(ec+1).*tn(ec)-cdist(ec).*tn(ec+1))./(cdist(ec+1)-cdist(ec));
    [tc,ix]=sort(tc);
    ec=ec(ix);
    tm=tc(2:end)==tc(1:end-1); % check for duplicated points
    tm=[0;tm]|[tm;0];
    tc(tm)=[];                  % remove duplicate pairs
    ec(tm)=[];
    nc=numel(ec);
    xc=repmat(xy0,nc,1)+tc*a;
end
if ~nargout && nc>0
    plot(q(:,1),q(:,2),'-r',xc(:,1),xc(:,2),'-xb',xc(1,1),xc(1,2),'ob')
end