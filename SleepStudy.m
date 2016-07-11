function [pxxT, fT, pxxF, fF] = SleepStudy(ID,frequency,window,overlap,fname1,fname2,channel,polarity)

str = horzcat('Patient: ',ID,' - ','Channel: ',num2str(channel));

[hdr1, data1] = edfread(fname1);
[hdr2, data2] = edfread(fname2);

% length1 = length(data1);
% length2 = length(data2);

% cutTime = 15*60*200; % 15 minutes 
% 
ChannelData1 = data1(channel,:);
ChannelData2 = data2(channel,:);

% ChannelData1 = data1(channel,1:end-cutTime);
% ChannelData2 = data2(channel,1:end-cutTime);

[S1,f1] = pwelch(ChannelData1,window,overlap,[],frequency);
[S2,f2] = pwelch(ChannelData2,window,overlap,[],frequency);

if polarity
    plot(f1,10*log10(S1))
    hold on
    plot(f2,10*log10(S2))
    pxxT = S1;
    fT = f1;
    pxxF = S2;
    fF = f2;    
else
    plot(f2,10*log10(S2))
    hold on
    plot(f1,10*log10(S1))
    pxxT = S2;
    fT = f2;
    pxxF = S1;
    fF = f1;     
end

xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title(str)
legend('Experimental','Control')

