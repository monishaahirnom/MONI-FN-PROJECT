function a=polygonarea(p)
%POLYGONAREA Calculate the area of a polygon
%
% Inputs:
%    P(n,2) is the polygon vertices
%
% Outputs:
%    A is teh area of teh polygon
%
% The area is positive if the vertices go anti-clockwise around the polygon.
%

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p(end+1,:)=p(1,:);      % append an extra point
a=0.5*sum((p(1:end-1,1)-p(2:end,1)).*(p(1:end-1,2)+p(2:end,2)),1);
if ~nargout
    plot(p(:,1),p(:,2),'b-');
    mnx=[1.05 -0.05;-0.05 1.05]*[min(p);max(p)];
    set(gca,'xlim',mnx(:,1)','ylim',mnx(:,2)');
    title(sprintf('Area = %.2g',a));
end
