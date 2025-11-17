function d=winenvar(n)
%WINENVAR get windows environment variable [D]=(N)
%
% Inputs: N  name of environment variable (e.g. 'temp')
%
% Outputs: D  value of variable or [] is non-existant
%
% Notes: (1) This is WINDOWS specific and needs to be fixed to work on UNIX
%        (2) The search is case insensitive (like most of WINDOWS).
%
% Examples: (1) Open a temporary text file:
%               d=winenar('temp'); fid=fopen(fullfile(d,'temp.txt'),'wt');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p=['%',n,'%'];
[s,d]=system(['echo ',p]);
while d(end)<=' ';
    d(end)=[];
end
if strcmp(d,p)
    d=[];
end