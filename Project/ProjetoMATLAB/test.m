clear all;close all;clc

locs = zeros(1,13);
for n = 1:200
    
    filename = sprintf('c%d.wav',n);
    
    [y,Fs] = audioread(filename);
    tempofim = length(y);
    [pks,locs] = getFreqs(filename,1,tempofim);
    
    pks = pks/norm(pks);
    
%     %Exibicao dos graficos
%     bar(locs,pks);
%     xlabel('Frequencia (Hz)')
%     ylabel('Amplitude')
%     title('FFT'); grid on
    
    %mudar label para cada acorde
    locs(13) = 1;
    dlmwrite('../dataset.csv',locs,'-append','precision','%.6f')
    
end




% [notasDoAudio,notasDoAcorde] = getNota(locs);
%
% notasDoAcorde
% acorde = reconheceAcorde(notasDoAcorde)




