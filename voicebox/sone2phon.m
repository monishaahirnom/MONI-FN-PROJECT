function p=sone2phon(s)
%PHON2SONE convert SONE loudness values to PHONs p=(s)
%Inputs:    s is a matrix of sone values
%
%Outputs:   p is a matrix, the same size as s, of phon values
%
% The phon scale measures perceived loudness in dB; at 1 kHz it is identical to dB SPL
% relative to 20e-6 Pa sound pressure. The sone scale is proportional to apparent loudness
% and, by definition, equals 1 at 40 phon. The form of the loudness curve is taken from [1].
% The hearing threshold at 1 kHz for 18 to 25 year olds with normal hearing is taken from [2].
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent a b d
if isempty(a)
    b=1/(log(10)*0.1*0.27); % 0.27 is the exponent from [1] and [2]
    d=exp(2.4/b); % 2.4 dB is teh hearing threshold from [2]
    a=exp(40/b)-d; % scale factor to make p=40 give s=1
end
if nargout>0

    p=b*log(a*s+d);
else
    if nargin<1 || isempty(s)
        pp=linspace(5,90,100)'; % phon values
        ss=phon2sone(pp);
    else
        ss=s;
    end
    semilogx(ss,sone2phon(ss));
    axisenlarge(-1);
    xticksi;
    ylabel('phon = dB SPL @ 1 kHz');
    xlabel('sone');
end
