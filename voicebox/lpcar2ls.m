function ls=lpcar2ls(ar)
%LPCAR2LS convert ar polynomial to line spectrum pair frequencies LS=(AR)
% output vector elements will be in range 0 to 0.5
% the returned vector will be of length p

% This routine is nowhere near as efficient as it might be


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p1]=size(ar);
p = p1-1;
p2 = fix(p/2);
d=0.5/pi;

if rem(p,2)		% odd order
  for k=1:nf
    aa=[ar(k,:) 0];
    r = aa + fliplr(aa);
    q = aa - fliplr(aa);
    fr = sort(angle(roots(r)));
    fq = [sort(angle(roots(deconv(q,[1 0 -1])))); 0];
    f = [fr(p2+2:p+1).' ; fq(p2+1:p).'];
    f(p+1) = [];
    ls(k,:) = d*f(:).';
  end
else
  for k=1:nf
    aa=[ar(k,:) 0];
    r = aa + fliplr(aa);
    q = aa - fliplr(aa);
    fr = sort(angle(roots(deconv(r,[1 1]))));
    fq = sort(angle(roots(deconv(q,[1 -1]))));
    f = [fr(p2+1:p).' ; fq(p2+1:p).'];
    ls(k,:) = d*f(:).';
  end
end
