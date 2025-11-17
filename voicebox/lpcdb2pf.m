function pf=lpcdb2pf(db)
%LPCDB2PF Convert decibel power spectrum to power spectrum PF=(DB)


%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pf=exp(db*log(10)/10);

