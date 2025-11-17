function s=sprintcpx(z,f)
%SPRINTCPX  format a complex number for printing S=(Z,F)
%
% Usage: fprintf('%s',sprintcpx(z));
%
%  Inputs: z   a complex number to print
%          f   optional formatting string as in fprintf e.g. '0.2f' [default: 'g']
%              may also include 'i' or 'j' [default] to control sqrt(-1) symbol.
%
% Outputs: s   formatted output string

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<2 || ~numel(f)
    f='g';
end
if any(f=='i')
    ij='i';
else
    ij='j';
end
f((f=='i')|(f=='j'))=[]; % remove i and j specifiers
if ~numel(f)
    f='g';
end
if any(f=='+')
    pl='';
else
    pl='+';
end
f=['%' f];
a=real(z);
b=imag(z);
jx=[1 3 2 4 3 4 1 3 2];
ix=jx(3*sign(a)+sign(b)+5);
switch(ix)
    case 1
        s=sprintf([f f ij],a,b);
    case 2
        s=sprintf([f pl f ij],a,b);
    case 3
        s=sprintf(f,a);
    case 4
        s=sprintf([f ij],b);
end
