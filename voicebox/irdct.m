function x=irdct(y,n,a,b)
%IRDCT    Inverse discrete cosine transform of real data X=(Y,N) 
% Data is truncated/padded to length N.
%
% This routine is equivalent to multiplying by the matrix
%
%    irdct(eye(n)) = cos((0.5:n)'*(0:n-1)*pi/n)*diag([sqrt(0.5)*a/b repmat(a,1,n-1)])/n
%
%
% Default values of the scaling factors are A=sqrt(2N) and B=1 which
% results in an orthogonal matrix. Other common values are A=1 or N and/or B=1 or sqrt(2). 
% If b~=1 then the columns are no longer orthogonal.
% See also RCDT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fl=size(y,1)==1;
if fl y=y(:); end
[m,k]=size(y);
if nargin<4 b=1;
    if nargin<3 a=sqrt(2*m);
        if nargin<2 n=m;
        end
    end
end
if n>m y=[y; zeros(n-m,k)];
elseif n<m y(n+1:m,:)=[];
end

x=zeros(n,k);
w=ones(1,k);
m=fix((n+1)/2);
p=n-m;
z=0.5*exp((0.5i*pi/n)*(1:p)).';
u=(y(2:p+1,:)-1i*y(n:-1:m+1,:)).*z(:,w)*a;
y=[y(1,:)*sqrt(0.5)*a/b; u(1:m-1,:)];
if m==p
    z=-0.5i*exp((2i*pi/n)*(0:m-1)).';
    y=(z(:,w)+0.5).*(conj(flipud(u))-y)+y;
    z=ifft(y,[],1);
    u=real(z);
    y=imag(z);
    q=m/2;
    h=rem(m,2)/2;
    x(1:4:n,:)=u(1:q+h,:);
    x(2:4:n,:)=y(m:-1:q+1-h,:);
    x(3:4:n,:)=y(1:q-h,:);
    x(4:4:n,:)=u(m:-1:q+1+h,:);
else
    z=real(ifft([y; conj(flipud(u))]));
    x(1:2:n,:)=z(1:m,:);
    x(2:2:n,:)=z(n:-1:m+1,:);
end

if fl x=x.'; end
