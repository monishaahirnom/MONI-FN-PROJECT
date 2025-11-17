function rf=lpcaa2rf(aa)
%LPCAA2RF LPC: Convert vocal tract areas to reflection coefficients RF=(AA)

%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nf,p2]=size(aa);
rf = (aa(:,2:p2)-aa(:,1:p2-1))./(aa(:,2:p2)+aa(:,1:p2-1));