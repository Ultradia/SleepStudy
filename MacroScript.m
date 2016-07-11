names1 = {'Chrona_NapEnt001sess1.edf','Chrona_NapEnt002sess1.edf','Chrona_NapEnt003sess1.edf','Chrona_NapEnt004sess1.edf','Chrona_NapEnt005sess1.edf','Chrona_NapEnt006sess1.edf','Chrona_NapEnt007sess1.edf','Chrona_NapEnt008sess1.edf','Chrona_NapEnt009sess1.edf','Chrona_NapEnt010sess1.edf','Chrona_NapEnt011sess1.edf'};
names2 = {'Chrona_NapEnt001sess2.edf','Chrona_NapEnt002sess2.edf','Chrona_NapEnt003sess2.edf','Chrona_NapEnt004sess2.edf','Chrona_NapEnt005sess2.edf','Chrona_NapEnt006sess2.edf','Chrona_NapEnt007sess2.edf','Chrona_NapEnt008sess2.edf','Chrona_NapEnt009sess2.edf','Chrona_NapEnt010sess2.edf','Chrona_NapEnt011sess2.edf'};
% Matching arrays with index entries corresponding to the same patient

channelList = [4,5,6,7,8,9];
% Channels we care about

truthTable = [0,1,1,0,0,0,1,1,0,1,1,0,1,0,0,0,1,0,1,1,1,1,0];
% Polarity of every entry

powerTableTrue = zeros(length(names1),length(channelList),4);
powerTableFalse = zeros(length(names1),length(channelList),4);
% Arrays to hold the bandpowers

bands = [0.5, 4; 5, 7; 8, 13; 14, 25];

for i = 1:length(names1)
    
    figure(i)
    
    if (~(i == 1) && ~(i == 5) && ~(i == 6))
        
        for j = channelList
            
            subplot(2,3,j-3)
            
            [pxxT,fT,pxxF,fF] = SleepStudy(names1{i}(14:16),200,1000,500,names1{i},names2{i},j,truthTable(i));
            for k = 1:4
                powerTableTrue(i,j,k) = bandpower(pxxT,fT,bands(k,:),'psd');
                powerTableFalse(i,j,k) = bandpower(pxxF,fF,bands(k,:),'psd');                
            end
            
        end
        
    end
    
end