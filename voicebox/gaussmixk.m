function [d,klfg]=gaussmixk(mf,vf,wf,mg,vg,wg)
%GAUSSMIXK approximate Kullback-Leibler divergence between two GMMs + derivatives
%
% Inputs: with kf & kg mixtures, p data dimensions
%
%   mf(kf,p)                mixture means for GMM f
%   vf(kf,p) or vf(p,p,kf)  variances (diagonal or full) for GMM f
%   wf(kf,1)                weights for GMM f - must sum to 1
%   mg(kg,p)                mixture means for GMM g [g=f if mg,vg,wg omitted]
%   vg(kg,p) or vg(p,p,kg)  variances (diagonal or full) for GMM g
%   wg(kg,1)                weights for GMM g - must sum to 1
%
% Outputs:
%   d             the approximate KL divergence D(f||g)
%   klfg(kf,kg)   the exact KL divergence between the components of f and g
%
% The Kullback-Leibler (KL) divergence, D(f||g), between two distributions,
% f(x) and g(x) is also known as the "relative entropy" of f relative to g.
% It is defined as <log(f(x)) - log(g(x))> where <y(x)> denotes the
% expectation with respect to f(x), i.e. <y(x)> = Integral(f(x) y(x) dx).
% The KL divergence is always >=0 and equals 0 if and only if f(x)=g(x)
% almost everywhere. % It is not a distance because it is not symmetric
% between f and g and also does not satisfy the triangle inequality.
% It is normally appropriate for f(x) to be the "true" distribution and
% g(x) to be an approximation to it. See [1].
%
% This routine calculates the "variational approximation" to the KL divergence
% from [2] that is exact when f and g are single component gaussians and that is zero
% if f=g. However, the approximation may be negative if f and g are different.
%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[kf,p]=size(mf);
if isempty(wf)
    wf=repmat(1/kf,kf,1);
end
if isempty(vf)
    vf=ones(kf,p);
end
fvf=ndims(vf)>2 || size(vf,1)>kf;       % full covariance matrix vf is supplied

% First calculate vf covariance matrix determinants and precision matrices
% and then the individual KL divergences between the components of f

klff=zeros(kf,kf);      % space for intra-a KL negative divergence
ixdf=1:kf+1:kf*kf;      % indexes of diagonal elements in kf*kf matrix
ixdp=(1:p+1:p*p)';         % indexes of diagonal elements in p*p matrix
wkf=ones(kf,1);
if fvf                  % vf is a full matrix
    dvf=zeros(kf,1);    % space for log(det(vf))
    for i=1:kf
        dvf(i)=log(det(vf(:,:,i)));
    end
    for j=1:kf          % calculate KL divergence between all mixtures and mixture j
        pfj=inv(vf(:,:,j));
        mffj=mf-mf(j(wkf),:);
        pfjvf=reshape(pfj*reshape(vf,p,p*kf),p^2,kf);       % pf(:,:,j)* all the vf matices
        klff(:,j)=0.5*(dvf(j)-p-dvf+sum(pfjvf(ixdp,:),1)'+sum((mffj*pfj).*mffj,2));
    end
else                % vf is diagonal
    dvf=log(prod(vf,2));
    pf=1./vf;
    mf2p=mf.^2*pf';
    mf2pd=mf2p(ixdf);       % get diagonal elements
    klff=0.5*(dvf(:,wkf)'-dvf(:,wkf)+vf*pf'-p+mf2p+mf2pd(wkf,:)-2*mf*(mf.*pf)');
end
klff(ixdf)=0; % force the diagonal elements to exact zero
if nargin<4
    d=0;
    klfg=klff;
else
    [kg,pg]=size(mg);
    if pg~=p
        error('GMMs must have the same data dimension (%d versus %d)',p,pg);
    end
    if nargin<6 || isempty(wg)
        wg=repmat(1/kg,kg,1);
    end
    if nargin<5 || isempty(vg)
        vg=ones(kg,p);
    end
    fvb=ndims(vg)>2 || size(vg,1)>kg;       % full covariance matrix vg is supplied

    % Calculate vg covariance matrix determinants and precision matrices
    % and then the individual inter-component KL divergences between components of f and g

    klfg=zeros(kf,kg);      % space for inter-a-b KL negative divergence
    wkg=ones(kg,1);
    if fvb                  % vg is a full matrix
        dvg=zeros(kg,1);    % space for log(det(vg))
        pg=zeros(p,p,kg);   % space for inv(vg)
        for j=1:kg
            dvgj=log(det(vg(:,:,j)));
            dvg(j)=dvgj;
            pgj=inv(vg(:,:,j));
            pg(:,:,j)=pgj;
            mfgj=mf-mg(j(wkf),:);
            if fvf              % vf and vg are both full matrices
                pgjvf=reshape(pgj*reshape(vf,p,p*kf),p^2,kf); % pg(:,:,j)* all the vf matices
                klfg(:,j)=0.5*(dvgj-p-dvf+sum(pgjvf(ixdp,:),1)'+sum((mfgj*pgj).*mfgj,2));
            else                % vf diagonal but vg is full
                klfg(:,j)=0.5*(dvgj-p-dvf+vf*pgj(ixdp)+sum((mfgj*pgj).*mfgj,2));
            end
        end
    else                        % vg is diagonal
        dvg=log(prod(vg,2));    % log(det(vg))
        pg=1./vg;               % precision matrix pg = inv(vg)
        mg2p=sum(mg.^2.*pg,2)';
        if fvf                  % vf a full matrix, vg diagonal
            vav=reshape(vf,p^2,kf);
            klfg=0.5*(dvg(:,wkf)'-dvf(:,wkg)+vav(ixdp,:)'*pg'-p+mf.^2*pg'+mg2p(wkf,:)-2*mf*(mg.*pg)');
        else                    % vf and vg both diagonal
            klfg=0.5*(dvg(:,wkf)'-dvf(:,wkg)+vf*pg'-p+mf.^2*pg'+mg2p(wkf,:)-2*mf*(mg.*pg)');
        end
    end
    d=wf'*(logsum(-klff,2,wf)-logsum(-klfg,2,wg));
end


