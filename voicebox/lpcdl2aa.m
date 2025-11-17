function aa=lpcdl2aa(dl)
%LPCDL2AA dct of log area to area coefficients AA=(DL)

% we do not correct for sinc errors


%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p]=size(dl);
aa=[zeros(nf,1) exp(irdct(dl.').') ones(nf,1)];

