function [pks,locs] = getFreqs(filename,inicio,fim) 
  
sinalOut = 'sinalOut.wav';

%amostra o sinal e cria uma saida de audio em uma janela de tempo
samples = [inicio,fim];
[y,Fs] = audioread(filename,samples);
audiowrite(sinalOut,y,Fs);



[Y,f] = getFFTAudioFile(sinalOut);


%determinacao dos picos e frequencias presentes no audio
Peak = max(Y)/5;
%[pks,locs] = findpeaks(Y,f,'MinPeakDistance',1,'Npeaks',10,'MinPeakHeight',Peak,'SortStr','descend');
[pks,locs] = findpeaks(Y,f,'MinPeakDistance',1,'Npeaks',10,'MinPeakHeight',Peak);



end