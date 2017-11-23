clear all;close all;clc

acorde = zeros(1,13);

for n = 1:200
    
    acorde = zeros(1,13);
    filename = sprintf('d-minor-test-%d.wav',n);
    
    [y,Fs] = audioread(filename);
    tempofim = length(y);
    [pks,locs] = getFreqs(filename,1,tempofim);
    
    pks = pks/norm(pks);
    pksDecibels = mag2db(pks);
    
    [notasDoAudio,locs] = getNota(locs);
    
    for i = 1: length(locs)
        
        index = locs(i);
        
        indexNota = find(notasDoAudio == index,1);
        
        magnitudeDB = pksDecibels(indexNota);
        magnitude = pks(indexNota);
        
        
        acorde(index)= magnitudeDB;
        
        
        
        
        
    end
    
    %MUDAR ROTULO DO ACORDE
    acorde(13) =9;
    dlmwrite('../test.csv',acorde,'-append','precision','%0.1f');
    %dlmwrite('../dataset.csv',acorde,'-append')
    %acorde
    
end

