function [nota,acorde] = getNota(frequencia)

N = 0:131;
freqFund = 16.351597;
frequencias = freqFund*2.^(N/12);

notas = char(['C ';'C#';'D ';'D#';'E ';'F ';'F#';'G ';'G#';'A ';'A#';'B ']);
nota = char(1,length(frequencia));


for i = 1:length(frequencia)
    
    freqDesejada = frequencia(i);
    x = find((abs(frequencias-freqDesejada)<1),1);
    
    if(~isempty(x))       
        
        indice = mod(x+12,12);
        
        if(indice == 0)
            indice = 12;
        end 
        
        nota(i,[1 2]) = notas(indice,[1 2]);
    end
    
     
    
end


acorde = cellstr(nota);
acorde = acorde(~cellfun('isempty', acorde));
acorde = unique(acorde,'stable');


end



