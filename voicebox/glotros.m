function u=glotros(d,t,p)
%GLOTROS  Rosenberg glottal model U=(D,T,P)
% d is derivative of flow waveform
% t is in fractions of a cycle
% p has parameters
%	p(1)=closure time
%	p(2)=+ve/-ve slope ratio


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 2
  tt=(0:99)'/100;
else
  tt=mod(t,1);
end
u=zeros(size(tt));
de=[0.6 0.5]';
if nargin < 3
  p=de;
elseif length(p)<2
  p=[p(:); de(length(p)+1:2)];
end
pp=p(1)/(1+p(2));
ta=tt<pp;
tb=tt<p(1) & ~ta;
wa=pi/pp;
wb=0.5*pi/(p(1)-pp);
fb=wb*pp;
if d==0
  u(ta)=0.5*(1-cos(wa*tt(ta)));
  u(tb)=cos(wb*tt(tb)-fb);
elseif d==1
  u(ta)=0.5*wa*sin(wa*tt(ta));
  u(tb)=-wb*sin(wb*tt(tb)-fb);
elseif d==2
  u(ta)=0.5*wa^2.*cos(wa*tt(ta));
  u(tb)=-wb^2*cos(wb*tt(tb)-fb);
else
  error('Derivative must be 0,1 or 2');
end

