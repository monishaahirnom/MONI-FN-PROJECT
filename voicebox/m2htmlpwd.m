%M2HTMLPWD - create html documentation of files in current directory
%
% M2HTML must be on the matlab path
% available from http://www.mathworks.com/matlabcentral/fileexchange/loadFile.do?objectId=4039&objectType=FILE

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pd=pwd;
tl=pd(max([find(pd=='\') find(pd=='/')])+1:end);
cd('..');
m2html('mfiles',tl,'htmldir',[tl '\doc']);
cd(pd);
winopen(['doc\' tl '\index.html']);
