function ao=lpcaa2ao(aa)
%LPCAA2AO LPC: Convert area function to area ratios AO=(AA)



%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p1=size(aa,2);
ao=aa(:,1:p1-1)./aa(:,2:p1);
